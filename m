Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7681B606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YRxj99xb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E92D60E1C;
	Fri, 20 Nov 2026 13:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGFEmWtLsUtu; Fri, 20 Nov 2026 13:58:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4A34860B8C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795183127;
	b=I6Jypzk8Hu41OC4mEzF7UEV1MIxnqv9KiJ+ZrYgQHl7ptCTazMKI0CgqAkFsth8ZFv5O
	 LojdZCbe7sOMBvvcqOkNeQ/DePmhKdGMG0tlm/T9xwPcG9PNnnDva81yfhuIgVl+isfXf
	 EZohdD9MLrYmP5Eb9xOcYngV9pVfra+N4Slaujy3FnJStUPRj5EyHMyZKu6ycPeCV849w
	 jFX1BYP2B9A1nOoAw0fzpwGEz3/QjlFBCZY2Uv0x6clqLGZ4lfQAZQAlp02lpaHQfHy9h
	 v7/fdT8IgRQmzHv+QtCG/Ll8e4EBRM1kxWNwvl7vXtRjh5bjPCpMuV7ZJKqiHG4+qfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795183127;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Message-ID:Date:User-Agent:To:Cc:References:Content-Language:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=F3lnStsEEvCIJU3+1Gzo/VIhZehWtPThZPS6gnwdvRg=;
	b=Ss6pYlqZN1n/m/q4qyTdP1DrwoxdfYZWEyemzgIh7Spws8MbQ9kgwCDQyow1OYIPESXU
	 l9gfrnTi+7hMyny5Zo8Hl1UqTPxrWDmv6YaGJRtu90JMILXHz5Vl12AWSfXJJWvnnDMWl
	 bofrUVoxdDL5zleR+7Q5MAso7z4L619cMVEVMqV7zTqRI3+1OVGru/UkLbJF51O9Zv6lJ
	 In9s7ut5Pe48aoGypng2vr4xflIQ1k7MP17qOU+tIFmGZ6dBNXDyuPhlOZsmrkgCrf/Sx
	 YaohW1xRjsMRMBWL9fekqBVADwZwUV81qjPqFUOoWWeJHp/g6EudL0TizyltZx6TXtg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795183127;
	bh=F3lnStsEEvCIJU3+1Gzo/VIhZehWtPThZPS6gnwdvRg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YRxj99xbgJTEJz94MpAarXaw5GQBaGKlI6QYHWx+KCxeSzHjobstrHhDdBSUJsaj2
	 JTQmsJu1ogGbVKBqeNZLIUL8NPwCCHTFzaBvDcDT1IhE8hE09vXPYKkofr3sPPhG7q
	 sCIu44RwWsH9odmJ9DL9/gP2Ci0RxYEVyMfcIzuoPLVlnM2irAJLRYykaPjVTvfLCd
	 16z2jSRO9zev1MK53X76GG0e3ZMY+Adc/TQtVF8gjnoWT1jEaGgpJ9brhP+Nz6fNKD
	 7mVtpJP6xbyrHKXABNZa7xU5MYTBARKZ2sRzKm91NhdWMrRftfI2W2PjZ85no41S2Y
	 ANd9F7l3CfDZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A34860B8C;
	Fri, 20 Nov 2026 13:58:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA5A1E7
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83C7740208
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSSG_DhQSDY6 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 13:58:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EDD35400CB
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c202::7;
 helo=gvxpr05cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c202::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDD35400CB
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:58:43 +0000 (UTC)
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AS8PR04MB7861.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 13:58:38 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 13:58:38 +0000
Message-ID: <d9853d12-d9a7-4b5b-b515-078e9f617c96@cherry.de>
Date: Fri, 20 Nov 2026 14:58:36 +0100
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, Heiko Stuebner <heiko@sntech.de>
Cc: buildroot@buildroot.org, Etienne Carriere <etienne.carriere@foss.st.com>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260318184110.2121178-3-heiko@sntech.de>
 <20261011141023.720881-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20261011141023.720881-1-thomas.perale@mind.be>
X-ClientProxiedBy: FR4P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::7) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AS8PR04MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 781bb3e9-acbb-4364-75a5-08df470e601e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|261022075727099003|56012099006|4143699003|11063799006|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261022105027099003|261026121527099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: qhKyRAyeZOfDzfIlSWha5hbUXkkopVfzh9nn9V70sb/Ww5+7foV7Il6854BI6F7iv5I/traozvIJdrN9soClkTTOJoQXIn24Tir8I92kP5TFBKgxDvYWyY+p/4ALV5+5jDG+NUKvNZLSTN4gV+QUJZpmGSe0ePs1e1wD8vLQ2w3CPEAVF2ZuBgXSskUw/OLsnrhkfxPyNoyyAymeu0LiOp5fhe0dih6d0MP6xaHkpwjLlx/qbjlbqxfVh2wFHBRozqQqSurGP5mf7UTG0kl4UIs4y3ATCyTcHdTZNsmqjw1quBJl5NHgTI7USahSflfWdxT4rqcMy/zEUa1i3WTxL9xo1bU9pZRvkXHOJUMkP86ely2Eirh74Svw9lPJXvsl6Qvx4XDrZtli8GYUKtgheZkQDZ70G0SHmrT/zSwbqSHJe4AUzOFJjx1jfzZ9QLsKLs9GDEhra2a7NspLQFjFpJUhdIAb5hg2DsK6Li5mdLpl+UYrfmNVtgTw7+ciSxdSeAaqwOAoTPEVMSulUF5/ytGWpccHKhsmfle/d6Iqtmu4Acbws02hKR4gFb/rXjfhbROhtrEvDJ0woqodkWyqFqwbhVQOXOm55ici5oTYi+C+6HxeMF7m56sb7uCRjb8Su76++Rv9F8C7De5CXV5KTkDqJHJUBuKxi444Pwn1i4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA3PR04MB11153.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(261022075727099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261022105027099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3owWlBqUUYzM0NXdktKc2l1OWdkZUQ0RC81N0haaUE5ZlB5OXBOclovb2w2?=
 =?utf-8?B?TTRCb0ZNL1J1MXdMdDcwNEJGcXpYMWlHSENVS0Y1dklVV3NUMXVnSWt1ZGwx?=
 =?utf-8?B?TVZPRXVzZElFejVXVVBOVlRUTXNyVXhPNEFhQkZsQUQ2NlR4WXZIZE5pUnBR?=
 =?utf-8?B?OW9VY2VJZFNRY09RV2xReTY4b3BvbW5wZGc2SlBHb2N3SW8vWVZWMnI4cUhN?=
 =?utf-8?B?ZnM4a0NmZzcwc21Sc3pPZlJGRGdRLy9rU0hNSERZYk1DVitsU0VGQURpRzZn?=
 =?utf-8?B?Tzh1MVlEV0hhRkhudmJGSStDY1NPV3NHYitPVTNWRjlYeHNGNThPQkR6empK?=
 =?utf-8?B?dnh2S2lFZ3EzT01xNjUwbms5QjVtY3ozOUN5YTRUMm01UTdOcmpvMEE5Z0w1?=
 =?utf-8?B?eEdmRU5Mclo5VFk1TjRicGFMcER2b3ZJMU9mUGhCcWJwK1JaSGFuNmY4bFlD?=
 =?utf-8?B?KzFqSVRDR0lxVlYvbUFjQnBIYm9vaWdPaHdVNFVMR0cvSk1PRnhZRVdJVHdC?=
 =?utf-8?B?N3BZbFJhdXR0ZktVM0dZak5OVHI3Y1hhZ0pBRFlOMnRybFBWNFBiRG93OHpz?=
 =?utf-8?B?Qy9oaDZyZElSWVZmaFZQZlZ1N3RtWnpZUHV6VW92MDFmeHludUJXZUE5R1lu?=
 =?utf-8?B?bytPclF5QkpQM2QvZ2FxWC9mYU5xbDdsZG1Qd1J0d3Z5Znpxa2JaeCt2MFVI?=
 =?utf-8?B?OWdSbjMwWS9TSEE0UHAwS3c5U1dOSmpUM2tlM1I1QWYvWWUwTGt4bHpseVJI?=
 =?utf-8?B?clE1SG1Va0RQL0RKTUFnM1FZRGtGR01vUlVQZFJqZXh1RStqODlhZnRHK1pV?=
 =?utf-8?B?UkVSYTJlVUpCdCtQL3VyQWJIOTczOER1K3h1QW4rUWptUWVTaGpKTUFGdjB6?=
 =?utf-8?B?aGdRblBCcFRabHhjTkZZczRtUEJPODE3UURsUVRLcENLM1dUeDh4aVVMRDl3?=
 =?utf-8?B?N3hWSnRZRTVZMlU0NkF3OEQxb1duN0c2V0hsWUdycjh3K1ZNUGF1b0NNMzRh?=
 =?utf-8?B?bmd2d2JKM2cwVEFZVHlrTElwbVRjbEY1SGx6RGZYbEMyYWlSazZWSXZ0Q20z?=
 =?utf-8?B?dEowWStCWkpOVTJtVlRqZnpOQzhQbmlWOXphY3laWGk1c2R1NEJQS1luR2Qr?=
 =?utf-8?B?OEhGUW9CMU1oTHpHY1IyOEJWd2NLTmg2Z1BvYURoVWUybklRSi9UUEhtQ21L?=
 =?utf-8?B?bXlRR2w4S0RmWnZDNUhkdTJzVHdwM3VOSnNRNkJVTTBlL1NQN2dXYkd3SVdr?=
 =?utf-8?B?V0MydGcyMHhOa1ZWdUp4eXIxc3VzVTllSG5UYmN2Z3JZREszQkxHNjZsV0NJ?=
 =?utf-8?B?NDBWOU5GckdvbENFaXp5SHlnVHZkTzZmTUhMcUFMSmhPWTEzTXJWdEtMVTZE?=
 =?utf-8?B?eGloMCt6aGlheFoyc1VnTFoxVXdETmVPaVcvdHVBbmxDM1FkaUJxMmt4MDBa?=
 =?utf-8?B?OTBsMW9yRUc0TEhRTndZMisweFVkYXJKNkxQWGIvRDBxRDJ1TlU1QWFraUQ4?=
 =?utf-8?B?T2VjS3liZGNqN3E2TWxZR0toSjNyRVY0TFVrNmowVXRPU2FuTHFITFUzMVR3?=
 =?utf-8?B?aS8xT25ob1IzVTJ1OHVHRlNvOWpPWWFQVHZ2dUo5TDF2eGZENzJPM1JIRmVU?=
 =?utf-8?B?Slc5Tjl2MjlVRHlmaFdNMVhJMG5paGprditxVHBnZzJRRWJlbnVaUXRpejcr?=
 =?utf-8?B?T25DQ0dPMWJ4OEhxbEpITUhrWFdxMkFsR1NicWJDQ1o1SzkvR3BBYVp6dnlR?=
 =?utf-8?B?YURON2x3L1VRRjkrZ05YZmtDOEFzQS9tMnhwU3YwZkFhSEdBMkt0SVFyTS9N?=
 =?utf-8?B?MmZXUEFjejFmb2p3eGdKN3U2U3lOSDJ0Tnd0djByWSt6VzRYZnBiWmxWNCtY?=
 =?utf-8?B?VjU1aE82YzI3ckdPekhjbGZDVis5WmZBR1RHdWtzaFBLWGt0RElqVHgrMHpW?=
 =?utf-8?B?N2EzSUJPMm5NMG04VkE4U0lKTUU1ZVhOaWE4VjJOeFZnWmVQU3E5SkMyWi9s?=
 =?utf-8?B?a01ZK1l0QitTZDlYeGJkcVdqTVpVU0tURUlmNFJGcjZRVzNORS9SdGo0RTBo?=
 =?utf-8?B?OUttN1VNcW92U1c5ZHBJaVZ2bzZHeTgzakozL1YzTTNVbjdiMFF4ZlpDTkNJ?=
 =?utf-8?B?c0hua2NQVWdCN1YzTlNDL011QXhxb3Z6bHI0bS9BcjhPZmo4a0NGbXR6eGVj?=
 =?utf-8?B?RVg4R1ppSW1BaTFxNXNPenJoNTR0VUprMm1kNVlTRHVTdGhKVndPa1JNNWgy?=
 =?utf-8?B?TkNvWEx0bG9hMmNlNlh6VkRVamo4bjN0UlpyZzl0OC9YNmZ4cXp3cTM4V3Rk?=
 =?utf-8?B?TW1RRWUzYnZlb2NmMHRwZTVLaEFDNHpuaFdIWW5qZGJoTE5ScmNTdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 781bb3e9-acbb-4364-75a5-08df470e601e
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:58:38.0831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZGCCemz+vh0PCI7sFIZh7eyNBmaLLrkCsD2QzXCxZ99IRc9HODkndBnCLYa7svfWDqNYBEbiR15tKD+ioxwZDlHz2lu1/c3pO8cRHdBnu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7861
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/uboot: add option to override
 the CPE_ID_VERSION
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas, Heiko,

On 10/11/26 4:10 PM, Thomas Perale wrote:
> Hello Heiko,
> 
> A general comment to your series.
> 
> If your custom version is based on 'git' instead of a git commit hash you can
> use 'git describe' to have a something that should be parsable by tools that
> read CPE ids
> 

I'm not sure to understand what you're suggesting here? Is there 
something Buildroot can do here to avoid what's in this patch?

> Otherwise I have the following comment:
> 
> In reply of:
>> CPE_ID_VERSION defaults to {pkg}_VERSION by default.
>>
>> When using custom tarballs or repo-revisions, this VERSION will contain
>> either "custom" or the repository revision as its value.
>>
>> This prevents tooling like CVE checkers, etc that use the show-info
>> output to know what base version to check against.
>>
>> To solve this add a config option to (optionally) allow overriding the
>> CPE_ID_VERSION if needed.
>>
>> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
>> ---
>>   boot/uboot/Config.in | 11 +++++++++++
>>   boot/uboot/uboot.mk  |  3 +++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
>> index 3331b81e8c..410ad60e9c 100644
>> --- a/boot/uboot/Config.in
>> +++ b/boot/uboot/Config.in
>> @@ -83,6 +83,17 @@ config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
>>   
>>   endif
>>   
>> +config BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION
>> +	string "Set custom U-Boot CPE_VERSION"
> 
> Here instead you can default to
> 
> ```
> default BR2_TARGET_UBOOT_VERSION
> ```
> 
>> +	depends on BR2_TARGET_UBOOT_CUSTOM_TARBALL || BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
>> +	help
>> +	  CPE_ID_VERSION defaults to the package version, but when using
>> +	  custom tarballs or custom repository revisions, the version of
>> +	  that software is unknown and set to custom or the revision.
>> +
>> +	  Allow to set a separate CPE_ID_VERSION, that will generate
>> +	  more accurate CPE entries for the software-version used.
>> +
>>   config BR2_TARGET_UBOOT_VERSION
>>   	string
>>   	default "2026.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>> index 5b3f46ac74..795bfd6c00 100644
>> --- a/boot/uboot/uboot.mk
>> +++ b/boot/uboot/uboot.mk
>> @@ -11,6 +11,9 @@ UBOOT_LICENSE = GPL-2.0+
>>   UBOOT_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_LICENSE_FILES))
>>   UBOOT_CPE_ID_VENDOR = denx
>>   UBOOT_CPE_ID_PRODUCT = u-boot
>> +ifneq ($(BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION),)
>> +UBOOT_CPE_ID_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION))
>> +endif
> 
> This would allow to instead just do the following unconditionally:
> 
> UBOOT_CPE_ID_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_CPE_ID_VERSION))
> 

I like this a lot. Maybe we should even remove CUSTOM_ from the symbol name?

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
