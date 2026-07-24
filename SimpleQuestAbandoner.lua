local ADDON_NAME, SimpleQuestAbandoner = ...

local _G = _G
local GetQuestLogTitle = GetQuestLogTitle
local SelectQuestLogEntry = SelectQuestLogEntry
local SetAbandonQuest = SetAbandonQuest
local AbandonQuest = AbandonQuest
local IsControlKeyDown = IsControlKeyDown

-- Save the original OnClick function for quest titles
local OriginalQuestTitle_OnClick = QuestLogTitleButton_OnClick

-- Our new OnClick handler
function QuestLogTitleButton_OnClick(self, button, down)
    -- Ctrl + Right-click and not a header
    if button == "RightButton" and IsControlKeyDown() and not self.isHeader then
        local questIndex = self:GetID()
        if questIndex then
            SelectQuestLogEntry(questIndex)
            SetAbandonQuest()
            AbandonQuest()
        end
        return -- Don't run the original function for Ctrl + right-click
    end

    -- Otherwise run the original function
    OriginalQuestTitle_OnClick(self, button, down)
end

-- Notify user that addon is loaded
print("|cff00ff00Simple Quest Abandoner:|r Loaded! Hold Ctrl and right-click a quest to abandon.")