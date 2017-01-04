@api
Feature: Field group module integration
  In order to be able tu use patterns as field groups templates
  As a developer
  I want to be able to make sure the ui_patterns_field_group module works properly.

  @javascript
  Scenario: I can create field groups using the Patterns plugin.

    Given I am logged in as a user with the "administrator" role
    And I visit "/admin/structure/types/manage/article"
    And I click "Manage display"
    Then I should see the link "Add group"

    When I click "Add group"
    Then I should have the following options for "Add a new group":
      | option  |
      | Pattern |
    And I select "Pattern" from "Add a new group"
    And I wait "2" seconds
    And I fill in "Label" with "My field group"
    And I wait "2" seconds
    And I press the "Save and continue" button

    Then I should have the following options for "Pattern":
      | option               |
      | Pattern 1            |
      | Pattern 2            |
      | Custom theme pattern |
    And I should see the field "Title pattern 1"
    And I should not see the field "Title pattern 2"

    When I select "Pattern 2" from "Pattern"
    And I wait "2" seconds
    Then I should not see the field "Title pattern 1"
    And I should see the field "Title pattern 2"