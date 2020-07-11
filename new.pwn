#include <a_samp>

#define PLAYER_DATA_DONATE					gPlayerData[playerid][gPlayerDonate]		// ���������� � ������ ������
#define PLAYER_DATA_MONEY					gPlayerData[playerid][gPlayerMoney]			// ���������� � ��������
#define PLAYER_DATA_EXP						gPlayerData[playerid][gPlayerExp]			// ���������� � ������
#define PLAYER_DATA_ADMIN					gPlayerData[playerid][gPlayerAdmin]			// ���������� � ������� �������
			
#define NEEDED_ADMIN_LEVEL					10											// ����������� ������� ��� �������� ���������

#define MAX_DONATE							1000										// ������������ ���������� ������
#define MAX_MONEY							500000										// ������������ ���������� �����
#define MAX_EXP  							10											// ������������ ���������� exp

#define DIALOG_ID_CREATE_PROMO_CODE			10000
#define DIALOG_ID_CREATE_PROMO_DONATE		10001
#define DIALOG_ID_CREATE_PROMO_MONEY		10002
#define DIALOG_ID_CREATE_PROMO_EXP			10003
#define DIALOG_ID_CREATE_PROMO_INPUT		10004
#define DIALOG_ID_DELETE_PROMO_CODE			10005

enum E_PLAYER_DATA
{
	gPlayerDonate,
	gPlayerMoney,
	gPlayerExp,
	gPlayerAdmin
}

new gPlayerData[MAX_PLAYERS][E_PLAYER_DATA];

new DB:dbHandle; // ��� ���� ������

new promoStatus[MAX_PLAYERS]; // ����������� �� ��������

main(){}

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);

	if((dbHandle = db_open("promo.db")) == DB:0) print("�� ������� ����� ���� ������ � �����������");
	else 
	{
		print("������������� ����������...");
		db_free_result(db_query(dbHandle, "CREATE TABLE IF NOT EXISTS `promos` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, \
			`code` TEXT, \
			`donate` INTEGER, \
			`money` INTEGER, \
			`exp` INTEGER, \
			`status` INTEGER DEFAULT 1)"
		));
		print("��������� �����������������");
	}
	return 1;
}

public OnGameModeExit()
{
	if(dbHandle) db_close(dbHandle);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	gPlayerData[playerid][gPlayerAdmin] = 10;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/createpromo", cmdtext, true) == 0)
	{
		if(PLAYER_DATA_ADMIN < NEEDED_ADMIN_LEVEL) 
			return SendClientMessage(playerid, -1, "��� ��������� ������������ ������� ����������������� ��� �������� ����������");
		ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_CODE, DIALOG_STYLE_INPUT, "�������� ���������", "������� ��������:", "�����", "������");
		return 1;
	}
	if (strcmp("/deletepromo", cmdtext, true) == 0)
	{
		if(PLAYER_DATA_ADMIN < NEEDED_ADMIN_LEVEL) 
			return SendClientMessage(playerid, -1, "��� ��������� ������������ ������� ����������������� ��� �������� ����������");
		ShowPlayerDialog(playerid, DIALOG_ID_DELETE_PROMO_CODE, DIALOG_STYLE_INPUT, "�������� ���������", "������� ��������:", "�����", "������");
		return 1;
	}
	if (strcmp("/usepromo", cmdtext, true) == 0)
	{
		if(promoStatus[playerid]) return SendClientMessage(playerid, -1, "�� ��� ������������ ��������");
		ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_INPUT, DIALOG_STYLE_INPUT, "��������� ���������", "������� ��������:", "������������", "������");
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_ID_CREATE_PROMO_CODE:
		{
			// �������� �� ������ inputtext (��� SA:MP)
			if(strlen(inputtext) == 39 && strval(inputtext) == 0) 
				return ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_CODE, DIALOG_STYLE_INPUT, "�������� ���������", "������� ��������:", "�����", "������");

			if(strlen(inputtext) > 32) 
				return 	ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_CODE, DIALOG_STYLE_INPUT, 
						"�������� ���������", "������� �������� (����. 32 �������):", "�����", "������");

			new query[49 + 32];
			format(query, sizeof query, "SELECT * FROM `promos` WHERE `code` = '%q'", inputtext);

			new DBResult:dbResult;
			dbResult = db_query(dbHandle, query);

			if(db_num_rows(dbResult)) return SendClientMessage(playerid, -1, "����� �������� ��� ����������");

			SetPVarString(playerid, "promoCodeCode", inputtext); // ������� ��������

			ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_DONATE, DIALOG_STYLE_INPUT, "�������� ���������", 
				"������� ���������� �����-�����\n������� ����� ������ ������", "�����", "������");
		}
		case DIALOG_ID_CREATE_PROMO_DONATE:
		{
			// �������� �� ������ inputtext (��� SA:MP)
			if(strlen(inputtext) == 39 && strval(inputtext) == 0) 
				return ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_DONATE, DIALOG_STYLE_INPUT, "�������� ���������", 
				"������� ���������� �����-�����\n������� ����� ������ ������", "�����", "������");

			new donateMoneyCount = strval(inputtext);

			if(donateMoneyCount < 1 || donateMoneyCount > MAX_DONATE)
			{
				new maxDonateCountMessage[53 + 12];
				format(maxDonateCountMessage, sizeof maxDonateCountMessage, "�� ��������� ������������ ���������� �����-����� (%i)", MAX_DONATE);
				return ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_DONATE, DIALOG_STYLE_INPUT, "�������� ���������", 
				maxDonateCountMessage, "�����", "������");
			}

			SetPVarInt(playerid, "promoCodeDonate", donateMoneyCount);
			ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_MONEY, DIALOG_STYLE_INPUT, "�������� ���������", 
				"������� ���������� �����\n������� ����� ������ ������", "�����", "������");
		}
		case DIALOG_ID_CREATE_PROMO_MONEY:
		{
			// �������� �� ������ inputtext (��� SA:MP)
			if(strlen(inputtext) == 39 && strval(inputtext) == 0) 
				return ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_MONEY, DIALOG_STYLE_INPUT, "�������� ���������", 
				"������� ���������� �����\n������� ����� ������ ������", "�����", "������");

			new moneyCount = strval(inputtext);

			if(moneyCount < 1 || moneyCount > MAX_MONEY)
			{
				new maxMoneyMessage[47 + 12];
				format(maxMoneyMessage, sizeof maxMoneyMessage, "�� ��������� ������������ ���������� ����� (%i)", MAX_MONEY);
				return ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_MONEY, DIALOG_STYLE_INPUT, "�������� ���������", maxMoneyMessage, "�����", "������");
			}

			SetPVarInt(playerid, "promoCodeMoney", moneyCount);
			ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_EXP, DIALOG_STYLE_INPUT, "�������� ���������", 
				"������� ���������� exp\n������� ����� ������ ������", "�����", "������");
		}
		case DIALOG_ID_CREATE_PROMO_EXP:
		{
			// �������� �� ������ inputtext (��� SA:MP)
			if(strlen(inputtext) == 39 && strval(inputtext) == 0) 
				return ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_EXP, DIALOG_STYLE_INPUT, "�������� ���������", 
				"������� ���������� exp\n������� ����� ������ ������", "�����", "������");

			new expCount = strval(inputtext); 


			if(expCount < 1 || expCount > MAX_EXP)
			{
				new maxExpMessage[45 + 8];
				format(maxExpMessage, sizeof maxExpMessage, "�� ��������� ������������ ���������� exp (%i)", MAX_EXP);
				return ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_EXP, DIALOG_STYLE_INPUT, "�������� ���������", maxExpMessage, "�����", "������");
			}

			new promoCode[32 + 1];
			GetPVarString(playerid, "promoCodeCode", promoCode, sizeof promoCode);

			new donateCount = GetPVarInt(playerid, "promoCodeDonate");
			new moneyCount = GetPVarInt(playerid, "promoCodeMoney");

			DeletePVar(playerid, "promoCodeCode");
			DeletePVar(playerid, "promoCodeDonate");
			DeletePVar(playerid, "promoCodeMoney");

			new query[81 + 32 + 12 + 12 + 8];
			format(query, sizeof query, "INSERT INTO `promos` (`code`, `donate`, `money`, `exp`) VALUES ('%q', %i, %i, %i)",
				promoCode,
				donateCount,
				moneyCount,
				expCount
			);

			db_free_result(db_query(dbHandle, query));
		}
		case DIALOG_ID_CREATE_PROMO_INPUT:
		{
			// �������� �� ������ inputtext (��� SA:MP)
			if(strlen(inputtext) == 39 && strval(inputtext) == 0) 
				return ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_INPUT, DIALOG_STYLE_INPUT, "��������� ���������", "������� ��������:", "������������", "������");
			if(strlen(inputtext) > 32) 
				return 	ShowPlayerDialog(playerid, DIALOG_ID_CREATE_PROMO_INPUT, DIALOG_STYLE_INPUT, "��������� ���������", 
						"������� �������� (����. 32 �������):", "������������", "������");

			new query[49 + 32];
			format(query, sizeof query, "SELECT * FROM `promos` WHERE `code` = '%q'", inputtext);

			new DBResult:dbResult;
			dbResult = db_query(dbHandle, query);

			if(db_num_rows(dbResult))
			{
				new promoCodeStatus = db_get_field_assoc_int(dbResult, "status");
				if(!promoCodeStatus) return SendClientMessage(playerid, -1, "�������� �� ������������");

				promoStatus[playerid] = 1; // �� �������� ��������� � ����� ��

				new donateCount, moneyCount, expCount;
				donateCount = db_get_field_assoc_int(dbResult, "donate");
				moneyCount = db_get_field_assoc_int(dbResult, "money");
				expCount = db_get_field_assoc_int(dbResult, "exp");

				PLAYER_DATA_DONATE += donateCount;
				PLAYER_DATA_MONEY += moneyCount;
				PLAYER_DATA_EXP += expCount;

				new message[60 + 12 + 12 + 8];
				format(message, sizeof message, "�� ��������� ��������� �� ��������� %i ������, $%i � %i exp!", donateCount, moneyCount, expCount);
				SendClientMessage(playerid, -1, message);
			}
			else SendClientMessage(playerid, -1, "�������� �� ������");
			db_free_result(dbResult);
		}
		case DIALOG_ID_DELETE_PROMO_CODE:
		{
			// �������� �� ������ inputtext (��� SA:MP)
			if(strlen(inputtext) == 39 && strval(inputtext) == 0) 
				return ShowPlayerDialog(playerid, DIALOG_ID_DELETE_PROMO_CODE, DIALOG_STYLE_INPUT, "�������� ���������", "������� ��������:", "�����", "������");

			new query[49 + 32];
			format(query, sizeof query, "SELECT * FROM `promos` WHERE `code` = '%q'", inputtext);

			new DBResult:dbResult;
			dbResult = db_query(dbHandle, query);

			if(db_num_rows(dbResult))
			{
				new promoCodeStatus = db_get_field_assoc_int(dbResult, "status");
				if(!promoCodeStatus) return SendClientMessage(playerid, -1, "�������� ��� �� ������������");
				new updateQuery[50 + 32];
				format(updateQuery, sizeof updateQuery, "UPDATE `promos` SET status = 0 WHERE `code` = '%q'", inputtext);
				db_free_result(db_query(dbHandle, updateQuery));
				SendClientMessage(playerid, -1, "�������� ������");
			}
			else SendClientMessage(playerid, -1, "�������� �� ������");
			db_free_result(dbResult);		
		}	
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
