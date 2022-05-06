// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Migrations {
    address public owner;
    uint public lastCompletedMirgration;
    
    constructor() public {
        owner = msg.sender;
    }

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    function setCompleted(uint completed) public restricted {
        lastCompletedMirgration = completed;
    }

    function update(address newAddress) public restricted {
        Migrations upgraded = Migrations(newAddress);
        upgraded.setCompleted(lastCompletedMirgration);
    }
}



