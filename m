Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84354CCF9EA
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 09:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E8261294;
	Mon, 27 Oct 2025 09:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FY93EWUlmsaI; Mon, 27 Oct 2025 09:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE7AD61290
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE7AD61290;
	Mon, 27 Oct 2025 09:35:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 961A415F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 09:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B4914122E
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 09:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mchD7xv0pyJ8 for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 09:35:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c409::2;
 helo=ma0pr01cu012.outbound.protection.outlook.com;
 envelope-from=esakkiammal.murugan@iwave-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A21A41228
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A21A41228
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c409::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A21A41228
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 09:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbTAnjE/jrV7ajXJQ9+HgAWgEl7egsAoF7rT8TE6XEfxekh1BLpIWSbg7v6MYIKQ1//fyN50THoCzpFyP4EWQD5UskSokcVLIhapPF4ElRxJrjxk9iesyg7PnCtsENvBLjVYlU9+SnmEYKpZT8TscGXgFtgcSRGE3A2aqC/KDeJ0LH8owcs0qNoofaamXMkLKMNh0voMpNxoJcmF2JWZZ1aeKjfjPd/IfQqF9Cv+jPQ1vyeeCzjTfu28tgXDQKWxVAFQq3epQJQ1PqIWm8ED1hiE+OXSagR2MmAVmY6NmHf7Fo/o6SnOLBjc0b+4SDvqvBZ7dJrjM6USTD2+mJ67sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaKXDH0P/tBxDhGPHq/RFVhV49BCSgcJtw2PA9z3hUs=;
 b=MNV4rjpPdsXYvF+WVvfYi1FFxWAScjOWEaLWcfsX1PmDIrynaGg9NepW2Q0evaiUVTinzkD/J/1dB+tG34R8Qw5HFBFSq7x1lyZAzExiYKTJs84nLKUFbm1l8+j2zisSmSN0pGSVAEPPeG/497yJl9ZRB0Z8ecsA5kZQ9ros4Ou31C8ZtedKriS/2+gtxh/9minVVXBrmCgsMBxBXP2cwJzVq634EV/r2Lw1roqKGFzKrF3SYPcmsAC9RPpcKQGuiBCLCY7F1v0XP8jBeJRgXk7dv4/zuY20y4HwX7n+k+PKk+2frYtViOfnKGkFdNFV3LRanr/UArBg4JYoZGd3oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwave-global.com; dmarc=pass action=none
 header.from=iwave-global.com; dkim=pass header.d=iwave-global.com; arc=none
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:122::11)
 by MA0P287MB2103.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:102::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 09:35:00 +0000
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e]) by MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 09:35:00 +0000
Message-ID: <438a57da-d01d-41ee-8f11-0bb2ec522350@iwave-global.com>
Date: Mon, 27 Oct 2025 15:04:59 +0530
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
 <45b0422f-620c-4db5-9a35-423466de2db5@iwave-global.com>
 <584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de>
 <3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com>
 <5eb375f3-d026-4592-81f4-462548717d61@iwave-global.com>
 <a08cca53-7d11-4101-ac6f-b34de963d870@iwave-global.com>
 <68a237a6-6e79-42b9-a3b5-52194d42e782@iwave-global.com>
Content-Language: en-US
In-Reply-To: <68a237a6-6e79-42b9-a3b5-52194d42e782@iwave-global.com>
X-ClientProxiedBy: MA5PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::14) To MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:122::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2448:EE_|MA0P287MB2103:EE_
X-MS-Office365-Filtering-Correlation-Id: 9590de17-4a2f-4178-3af8-08de153c197d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzZBaW92RDU3YXdGSHp5NFpCYXMxc2xuMDUveEwybVVIRE13SjZYZ0xCYkJo?=
 =?utf-8?B?bGc3czJlSlFmQjNHQktFbTZud3pVWkwrVFZsZkp6cnhmekIwdGs0ZExyY0Zt?=
 =?utf-8?B?dHhaek1HVUc0bGRXaXJUc2JiaGdXRGtrZE12Zkx1SDJabm5xcGp6a0doVDVP?=
 =?utf-8?B?V0U0dTYwSVhEeUoxd0xiT2pjWkpjd3A4elk0bDN1SG9xaG5tSGFEc1lvUS9Z?=
 =?utf-8?B?LzFlcHpXbHFoVWt3Q2lTKzJQNElBUVJ4VjZRY1dwWkNzTzl6OENqR2N0b1Zl?=
 =?utf-8?B?ODlZbVViZVlzRHNDeThsVzRldXJlQ0c2Zy9qK3NTN3NrZ2ZzakVQeHN2ZjBK?=
 =?utf-8?B?R252UW9NcmRUV05zQ2VpMTkyaWswR0Y3L3duMHZaQXZIektFWkowcnFqL0pU?=
 =?utf-8?B?Sys0dzZMMzMxdVV5NFl0UGFMWVR2WnZjSzJJNllRcFgwNloyUStCcWExTzU2?=
 =?utf-8?B?a2tVeThJYlBMMzAyaTUrUVcycGhGRHNCdmxBRXBGTCszMDgzTkJqWVArR1NJ?=
 =?utf-8?B?eDUybHpxTVZOcVNyT1FrSFAwZUpOZGg5akZEY2RONlN1bDZxbWo1Yk1jbjgz?=
 =?utf-8?B?TnpvaVVSM2c3WmVZYUJQajFFcEN3QUMxaFZqdVpyOHU1aWV1YjdaU1Avd2hR?=
 =?utf-8?B?VVZrMFRPTWlaS2FxZ1lEZHRPMmlZMGpYWkdvSHllWW0zY21wRjNrVzU3R2xG?=
 =?utf-8?B?ME15WGx0aEtHK0JMRnk0Vm5LcFFQbzlSNVR0MkVDbTllcUdvM1JTTm1GemF6?=
 =?utf-8?B?eDB6a0FrRk9LTlRuN1N6d3dyUVI3R2JKMCt5Q2tXWmdkbFhONEg1ZlpVSHRv?=
 =?utf-8?B?QVJtNVRSY1RnLzJqcFdYNlk0Z2wyMG1oTEtORm1PcndXemZCd1J0a2thS2VS?=
 =?utf-8?B?a1Q2ZlF1ZVhJS2RhRGVweWg4WFRldGozYUJmaFltWFZUZEdSMHpudjQwNWc5?=
 =?utf-8?B?NTNaTStFbVFFTm1EWEhRbm9DS3YyZWFSTFV0WnI3NEk0RXdvYnZpYjEvWFZX?=
 =?utf-8?B?VmJYZWdUUDVSTmFUSUtDdVJzVmo3aCtObGQ0MlgvbTQ3aTZQUnJmVWRyQUFG?=
 =?utf-8?B?THZyNlUrblByb1d1ZTFrTEJsVEwvcXFKbXV3WnNvS2NKYjQwdUpPdSthTlNH?=
 =?utf-8?B?SzdkL0NaSDNGblRuUW9PaThDU1dlNW5DUWlIWUZTV1Q4SVlxWDVWUnozMHE5?=
 =?utf-8?B?S2RhS2RTUGxxM1JPVW5DNGJGT2RSWlk2RXZNcXd6aG44OFVLRHFzK2J2alJX?=
 =?utf-8?B?QXdBaGRKRUZoUlhOOUJUZUJ1dEIwcXZ4UmoyMUtycWI1Z0pGM1pTdzdtd0pH?=
 =?utf-8?B?Ym84OFJCS3VGTGpSRmZ0dmx3bzg4MHh6VjFtMHZZNm5JNVV1ZndhcExqZC9M?=
 =?utf-8?B?UHZYQ0h0czhPeTh3NTkzSmJDSjBLQlU4RjVSRmo4YTVYUks2OGFXTHR1T1I5?=
 =?utf-8?B?TG1zYjM0KzNXaVZkd3diR0hLY005TVdJVEk3LzhTRCtNMkNHa1BLRjNPUFo4?=
 =?utf-8?B?ZnJBVHVSVnYxM3hlR3RndkR2U3lZdzdrUlpFSmR4TXB3d0RPZVNpS1JSQWVT?=
 =?utf-8?B?UEE1S01aOWFoeFhSdHNFaGFrTmc4WEZNNDJFSzlaWUY5MGxScVdqYW1NYnk3?=
 =?utf-8?B?OEo4M0hsY1pqT1J5MURLenFTaDlxNVlOK2J6dDE2WjBMTXJkUWtDWEFmREt1?=
 =?utf-8?B?RVAyTENEaTVtcUpORms4WkpRdjBYMFV2d0tvd0tsazlVVzRlSVNHRlpwRWZB?=
 =?utf-8?B?ZTNKSml1eHNlSmVoYTBYVldLcFJPZXN4Y3NsWUxjTVN6QzFBUFdtMlE5VDNk?=
 =?utf-8?B?aEdVa25RbTd3dUVKSmhicFZodDVhTWJoOXhVbW8rQjI5ajJvekU1T2JSU2FV?=
 =?utf-8?B?akJIVThOYXEwZE5jMUtEczdyOHdyeFZsNkpnVlVoQlBkbXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0P287MB2448.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzUvaitNaEpoR0Y3dEUyRE5zYWVPZ1UyQ2R1NUFOZ0NQTkltblc2VEFsQ0Nw?=
 =?utf-8?B?b0NFbzdldUZFcmcrNEdhcldUazlVa1dQVlpoUkgzZXk0RDI0S0dwTndCRFo0?=
 =?utf-8?B?dWFQVG9qR1pPRHMwZTBlbmRwY3lNSW94L0h6QmpveVlIUytaenBxOExRTk0r?=
 =?utf-8?B?NDMwRmoxbDk1Tkt6L2ZSNmNaOUo4MGZpbG1XbytpQmE3bFdJcldvcWtYQjRp?=
 =?utf-8?B?Z2JaZTZtSVFLd2VycXhSaEZqa2xVSEVDV1ZhRnR1Uy9vV1NqRHNNNHNycnNm?=
 =?utf-8?B?Z1ArWUVOcTY1YlJ5RlZxSitPQnhzeU5hT3lIcUxDMDNaNi8vZ3BJMEE4dmgv?=
 =?utf-8?B?Y0dSb0hKUC8xLzFuam1VU0FEUVdLY043RDdMWU8xMWpIYUFaWnBqbEhWbkpi?=
 =?utf-8?B?YmhMVXB4Vjk1djg4QkE3L2JCdzE3NnN5QWFLVVZyTkRoWHB2VGFydlMxcmRh?=
 =?utf-8?B?SVVXcS8zSmdWbGtQYVoyVWJEbFNrSlhBdEx6SXBaTUpwT0JrRkRkU0pTd0ZC?=
 =?utf-8?B?Qmg5MWVvaVVraERTZWpMcjNkbE1oc09IYi9udkd1ZnpqbnRicXg0aENsbWlw?=
 =?utf-8?B?MS9aemRCazUwNjdmdUR3b3hlYlkwYitZYTZvaE56YmEveENGRm1jY2VYVmtF?=
 =?utf-8?B?b1RuSis4RlAwTWwzK3dqUytHdXdha0p6NmF1VzBQRlhYVThPM1NRTFNhZGFz?=
 =?utf-8?B?aFJxMnArS3VYTVI4Sy9kWmhDbU16Vmx0WmZmWDQxZktHbitrYjkwc0xFajJj?=
 =?utf-8?B?ZmpuYTE2V3Y2NjlGYkRNVjFJakVnL01DRW9UdTN6VWhyY0hoKzUzZ2c1VHJv?=
 =?utf-8?B?aU1zL2xHME9xS0JQN21OeVlKNFN0TTE1VHJ6cCtQNTBxRkJrT2QvK2Vrd2dm?=
 =?utf-8?B?ZW91NUR5OTkva3d1VTBHWm0wcTJQSFpNcWhzTFBucEw1VXJIMXoyNDE4ei9w?=
 =?utf-8?B?b29DR0tGa3h3MG92VEZiVEtNRlh2TzBsdTk3Y0cvSkcwak1KWjNkcTVrWXhk?=
 =?utf-8?B?NWRrTFR5TXNsVU9hWVM2MzlITEp5Q2ZSZDc3Y1loVm9FOTYvQTBsVFVkZjV3?=
 =?utf-8?B?Y2IvRVRwZnExSWhXVWpMUjRpNmtsOGZLK1llczRsTjB4V0w2SlJmT3VvL1V3?=
 =?utf-8?B?cnR3UWZYQTE0NnJVRUx3cXp2MklsWGtGNTdncGRDaEhMYVNWd2ZRaytnZjRI?=
 =?utf-8?B?QUJIdmtEM1BIWlpJT25wWVJXZWIrZmZsZWVOU3k1QVA1eGhiR05rQUdLSGRn?=
 =?utf-8?B?dkszaVk3RkhjSVNsTGphM3VPRTBpdjlIV1RyVStZOXNscEljMEdISExuRU5x?=
 =?utf-8?B?bHJNVWlmNXdoaElZSHZ5aTBZNjZEbjNOd3FFdjU4SHdIMlBLUGUxZVZFWU5B?=
 =?utf-8?B?a25Jb0pxZktEcFV0NFV3bUt3d21ob2UydS82R0Q3MlVrOXR2MGhMcy80U1N3?=
 =?utf-8?B?bWR2dGp3SUgvVVhXMDZVM2p6S2EvSFVyRVUwdHZkNE5jRDFPUE81SkEzRUcx?=
 =?utf-8?B?YjY4bXRWVEN1L29ESGpLVlp4cmJjY1F3U1pkSjdpWXVKWlpOMUFPcC80cVlC?=
 =?utf-8?B?L2JaR1AwMVZxekFCS0ZFZ09NWERCQzRSVmZYQWFBSGw5SXNDbjJuOVBRUlU0?=
 =?utf-8?B?SWZ1bjlQd01YTkZJalVVQy9DRnVXbWt0OGdhZ3hGMzZ3RmpPbWZqS1VCaVVE?=
 =?utf-8?B?akpOMnRjaDJnQmJMWWQxN2VRTG83TnFaaFhEaHQ2SXpIdk92SjlrTmIvak1U?=
 =?utf-8?B?S2x5NitPU09mT3dFNVozaVNJNHArMENldkN1MmtHWDhIdnRaaXFZcXVpV2FS?=
 =?utf-8?B?QTRjcS9jTno4NytRR2tXOXEzV3Y1bjZQcmMwdjVJQzZLSXVCMEJWMWxnSkww?=
 =?utf-8?B?aGdvK0Q5Nk1HMXkzVFNScWJNZkFIUVhIdDZTdmVuR3RjbTAyVjFxRUR5Qzll?=
 =?utf-8?B?UE5YaUpnU1lGajJyMEY1MmhCWU5WY05EWkljMHd1WDFuTVBJSlZrdWV2Znpr?=
 =?utf-8?B?YWw0d1EwR2FxV3dCNEt4TXQ3UkgvMnhHVHFwbm9nRTdzcW1hMXZHL1d2Q1JH?=
 =?utf-8?B?SEJXamp4QVJUemRKR0dabzZCMS8xSlJUOUdpbW4vcGNaTnBjT3JqeWw5ZFdn?=
 =?utf-8?B?Y0NLUWwrNVJZemE1eWRpZHpiRzdSZDJRQlF0ZzJMaldHeUZ2ZXRYc0tjcEVG?=
 =?utf-8?Q?ArMzflR6dgcnsbF8WHcYYAM=3D?=
X-OriginatorOrg: iwave-global.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9590de17-4a2f-4178-3af8-08de153c197d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 09:35:00.4633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 507ae903-cc48-4d6e-bdb6-35278120a345
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRRyDLAAemJbOaa1G65tV7I3Alxt8eeHdJCD+Bqk7pB2BZS3bRYfCsY0ZC4ms9PZ4ldj/RsNWo0Ws3VCb7HHVoPcgtgldK3uaDHJijiv5FwXeZLi2MFtdhZTkb6vAFSM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iwave-global.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaKXDH0P/tBxDhGPHq/RFVhV49BCSgcJtw2PA9z3hUs=;
 b=Mx4g8N346hWQ2TjLF5xG54nr6aYznzGT9JgNu4WMCJ+NjHYUCiOeAnBZN6d0p/evJkdKIkCOVVkwGPx44VT/RNqgi5BezCL1obZlWfbVAkQlOzRbCXU312Gre27K+XuiFFVg/eWMa57sXH1T/cgDX5vl3/5mv1OdwIoSqosLzoTJGjMvJWPZklFfw7tHqoc2r9TXkeBPPqHvqfILj9kYUqUny7dSqdVDuUfA+0EbT75BXYUXtR3X3QB+7vpfh1m7nJisLrry7kYLyDUwodrJGkuSfTZ2fmZdRSLKjnvdt6fV66HIs5AY4CgQ7jkq2+Om8yhgy5eRlqbCNxpFGmiCkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iwave-global.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=iwave-global.com header.i=@iwave-global.com
 header.a=rsa-sha256 header.s=selector1 header.b=Mx4g8N34
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iwave-global.com;
Subject: Re: [Buildroot] Implementation Procedure for i.MX93 Custom Board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Esakkiammal M via buildroot <buildroot@buildroot.org>
Reply-To: Esakkiammal M <esakkiammal.murugan@iwave-global.com>
Content-Type: multipart/mixed; boundary="===============1073893447586481201=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1073893447586481201==
Content-Type: multipart/alternative;
 boundary="------------IzRvWcc0qm0ZY00WSsb9lxFf"
Content-Language: en-US

--------------IzRvWcc0qm0ZY00WSsb9lxFf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

While validation camera ov5604 in build root kernel.

Please let us known the solution of below issue in build root.

# gst-launch-1.0 v4l2src device=/dev/video0 ! 
video/x-raw,width=1920,height=1080
  ! waylandsink
WARNING: erroneous pipeline: no element "waylandsink"

Thanks & Regards,

Esakkiammal M


------------------------------------------------------------------------


On 23/10/25 15:59, Esakkiammal M wrote:
>
> Hello,
>
> WiFi firmware issue is resolved but while validation open network like 
> without password it is connecting with password like WPA2 and WPA3 not 
> working.
>
> connmanctl> connect 
> wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_p
> Agent RequestInput 
> wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk
>   Passphrase = [ Type=psk, Requirement=mandatory ]
> Passphrase? 12345678
> Agent ReportError 
> wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk
>   invalid-key
>
> Kindly let us know the solution of this issue.
>
> Thanks & Regards,
>
> Esakkiammal M
>
> ------------------------------------------------------------------------
>
>
> On 23/10/25 10:59, Esakkiammal M wrote:
>>
>> Hello,
>>
>> Kindly tell me the solution for this issue in build root wifi porting.
>>
>> Thanks & Regards,
>>
>> Esakkiammal M
>>
>> ------------------------------------------------------------------------
>> On 16/10/25 11:07, Esakkiammal M wrote:
>>>
>>> Hello,
>>>
>>> I have enabled the MWIFIEX Wi-Fi driver in Buildroot for my 
>>> platform. During validation, I observed that the driver fails to 
>>> initialize the firmware properly. Please find the log details and 
>>> observations below.
>>>
>>>
>>> Steps Performed
>>>
>>> Enabled MWIFIEX configuration in Buildroot.
>>>
>>> Loaded the driver using the command:
>>>
>>>
>>> modprobe moal mod_para=nxp/wifi_mod_para.conf
>>>
>>>
>>> # modprobe moal mod_para=nxp/wifi_mod_para.conf
>>> [   28.293486] mlan: loading out-of-tree module taints kernel.
>>> [   28.332881] wlan: Loading MWLAN driver
>>> [   28.336987] wlan: Register to Bus Driver...
>>> [   28.341369] vendor=0x0471 device=0x0205 class=0 function=1
>>> [   28.346989] Attach moal handle ops, card interface type: 0x109
>>> [   28.352833] rps set to 0 from module param
>>> [   28.359963] SDIW612: init module param from usr cfg
>>> [   28.364906] card_type: SDIW612, config block: 0
>>> [   28.369439] cfg80211_wext=0xf
>>> [   28.372405] max_vir_bss=1
>>> [   28.375018] cal_data_cfg=none
>>> [   28.377984] ps_mode = 1
>>> [   28.380435] auto_ds = 1
>>> [   28.382879] host_mlme=enable
>>> [   28.385765] fw_name=nxp/sduart_nw61x_v1.bin.se
>>> [   28.390227] SDIO: max_segs=128 max_seg_size=65535
>>> [   28.394921] rx_work=1 cpu_num=2
>>> [   28.398063] Enable moal_recv_amsdu_packet
>>> [   28.402098] Attach mlan adapter operations.card_type is 0x109.
>>> [   28.408248] wlan: Enable TX SG mode
>>> [   28.411751] wlan: Enable RX SG mode
>>> [   28.416394] Request firmware: nxp/sduart_nw61x_v1.bin.se
>>> [   28.642440] Wlan: FW download over, firmwarelen=1065364 
>>> downloaded 953164
>>> [   34.648319] Fail to poll firmware status: firmwarestat=0x0
>>> [   34.653811] FW failed to be active in time!
>>> [   34.657996] wlan_dnld_fw fail ret=0xffffffff
>>> [   34.662266] WLAN: Fail download FW with nowwait: 0
>>> [   34.667216] SDIO Func0 (0x0-0x9): 43 03 02 02 03 00 00 02 03 00
>>> [   34.673318] SDIO Func1 (0x10-0x17): 00 00 00 00 00 00 00 00
>>> [   34.679151] SDIO Func1: (0x8) 00 (0x58) 00 (0x5c) 0d (0x5d) 00 
>>> (0x60) 01 (0x61) 00 (0x62) 00 (0x64) 10 (0x65) 01 (0x66) 00 (0x68) 
>>> 00 (0x69) 00 (0x6a) 00
>>> [   34.693708] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24 14 
>>> 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00
>>> [   34.803809] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24 14 
>>> 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00
>>> [   34.813727] woal_request_fw failed
>>> [   34.817132] Firmware Init Failed
>>> [   34.824576] Free module params
>>> [   34.827631] woal_add_card failed
>>> [   34.831003] wlan_sdio: probe of mmc2:0001:1 failed with error -1
>>> [   34.837160] wlan: Register to Bus Driver Done
>>> [   34.841535] wlan: Driver loaded successfully
>>> #
>>> # connmanctl
>>> Error getting VPN connections: The name net.connman.vpn was not 
>>> provided by any .service files
>>> connmanctl> [   62.608517] cfg80211: failed to load regulatory.db
>>> enable wifi
>>> wifi is not available
>>> connmanctl> exit
>>> # ls /lib/firmware/nxp/
>>> helper_uart_3000000.bin  sduart_nw61x_v1.bin.se uartuart_n61x_v1.bin.se
>>> sd_w61x_v1.bin.se        uartspi_n61x_v1.bin.se wifi_mod_para.conf
>>> #
>>>
>>> Could you please help me identify the reason for the firmware 
>>> activation failure and guide me on how to resolve it?
>>>
>>>
>>> Thanks & Regards,
>>>
>>> Esakkiammal M
>>>
>>>
>>> ------------------------------------------------------------------------
>>>
>>>
>>> On 15/10/25 16:38, Esakkiammal M wrote:
>>>>
>>>> Hello,
>>>>
>>>> My kernel and U-Boot are working fine under Yocto on this custom 
>>>> board. The hardware includes Wi-Fi 6, Bluetooth 5.3, and IEEE 802.15.4.
>>>>
>>>> I’m now testing the same setup in Buildroot, but when I try to load 
>>>> the Wi-Fi driver using:
>>>>
>>>> modprobe moal mod_para=nxp/wifi_mod_para.conf
>>>>
>>>> I get this error:
>>>>
>>>> modprobe: module moal not found in modules.dep
>>>>
>>>> It seems the NXP Wi-Fi driver (moal.ko) isn’t being built or 
>>>> included in my Buildroot image. Could you please suggest the 
>>>> recommended way to integrate the nxp-modwifi driver or any patches 
>>>> required to enable it in Buildroot?
>>>>
>>>>
>>>> Thanks & Regards,
>>>>
>>>> Esakkiammal M
>>>>
>>>> ------------------------------------------------------------------------
>>>>
>>>>
>>>> On 15/10/25 16:30, Fiona Klute wrote:
>>>>> Hi Esakkiammal!
>>>>> Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot:
>>>>>> Hello,
>>>>>>
>>>>>> I have implemented support for our i.MX93 custom board by 
>>>>>> referring to the i.MX93 EVK configuration.
>>>>>>
>>>>>> git clone https://github.com/buildroot/buildroot.git
>>>>>> git switch 2025.02.x
>>>>>>
>>>>>> make freescale_imx93evk_defconfig
>>>>>> make
>>>>>>
>>>>>> Can you tell how port WiFi and BT for imx93 custom board.
>>>>>
>>>>> It's impossible to give a definitive answer without knowing the 
>>>>> details of your board, but in general:
>>>>>
>>>>> 1. If you have a custom board, you may need a custom DTS that 
>>>>> correctly describes your board (instead of the default one) for 
>>>>> all hardware to be detected correctly.
>>>>>
>>>>> 2. Make sure the kernel drivers for any additional hardware are 
>>>>> enabled in the kernel config you use.
>>>>>
>>>>> 3. The defconfigs are intentionally minimal. You'll need to add 
>>>>> the target packages to support what you want to do with wifi and BT:
>>>>>
>>>>> * any firmware needed for the devices on your board
>>>>> * wpa_supplicant or iwd or hostapd, maybe NetworkManager too 
>>>>> (depending on how you want to use wifi)
>>>>> * bluez5-utils (probably) for BT
>>>>>
>>>>> Some of those packages have optional components that you may or 
>>>>> may not need.
>>>>>
>>>>> Best regards,
>>>>> Fiona
>>>>>
--------------IzRvWcc0qm0ZY00WSsb9lxFf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello,<br>
    </p>
    <p>While validation camera ov5604 in build root kernel.</p>
    <p>Please let us known the solution of below issue in build root.</p>
    <p># gst-launch-1.0 v4l2src device=/dev/video0 !
      video/x-raw,width=1920,height=1080<br>
      &nbsp;! waylandsink<br>
      WARNING: erroneous pipeline: no element &quot;waylandsink&quot;<br>
      <br>
    </p>
    <p><span data-teams="true"> Thanks &amp; Regards,<br>
      </span> </p>
    <p><span data-teams="true">Esakkiammal M</span></p>
    <p><br>
    </p>
    <hr width="100%" size="2">
    <p><br>
    </p>
    <p></p>
    <div class="moz-cite-prefix">On 23/10/25 15:59, Esakkiammal M wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:68a237a6-6e79-42b9-a3b5-52194d42e782@iwave-global.com">
      
      <p>Hello,<br>
        <br>
        WiFi firmware issue is resolved but while validation open
        network like without password it is connecting with password
        like WPA2 and WPA3 not working.<br>
        <br>
      </p>
      <p>connmanctl&gt; connect
        wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_p <br>
        Agent RequestInput
        wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk<br>
        &nbsp; Passphrase = [ Type=psk, Requirement=mandatory ]<br>
        Passphrase? 12345678<br>
        Agent ReportError
        wifi_10322c69d5fa_4e65686127732053323420556c747261_managed_psk<br>
        &nbsp; invalid-key<br>
      </p>
      <p>Kindly let us know the solution of this issue.<br>
      </p>
      <p><span data-teams="true"> Thanks &amp; Regards,<br>
        </span> </p>
      <p><span data-teams="true">Esakkiammal M</span></p>
      <p><span data-teams="true"></span></p>
      <hr width="100%" size="2">
      <p><span data-teams="true"><br>
        </span></p>
      <div class="moz-cite-prefix">On 23/10/25 10:59, Esakkiammal M
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:a08cca53-7d11-4101-ac6f-b34de963d870@iwave-global.com">
        <p>Hello,</p>
        <p>Kindly tell me the solution for this issue in build root wifi
          porting.<br>
          <br>
        </p>
        <p><span data-teams="true"> Thanks &amp; Regards,<br>
          </span> </p>
        <p><span data-teams="true">Esakkiammal M</span></p>
        <hr width="100%" size="2">
        <div class="moz-cite-prefix">On 16/10/25 11:07, Esakkiammal M
          wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:5eb375f3-d026-4592-81f4-462548717d61@iwave-global.com">
          <p>Hello,</p>
          <p>I have enabled the MWIFIEX Wi-Fi driver in Buildroot for my
            platform. During validation, I observed that the driver
            fails to initialize the firmware properly. Please find the
            log details and observations below.<br>
            <br>
            <br>
            Steps Performed<br>
            <br>
            Enabled MWIFIEX configuration in Buildroot.<br>
            <br>
            Loaded the driver using the command:<br>
            <br>
            <br>
            modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
            <br>
            <br>
            # modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
            [&nbsp;&nbsp; 28.293486] mlan: loading out-of-tree module taints
            kernel.<br>
            [&nbsp;&nbsp; 28.332881] wlan: Loading MWLAN driver<br>
            [&nbsp;&nbsp; 28.336987] wlan: Register to Bus Driver...<br>
            [&nbsp;&nbsp; 28.341369] vendor=0x0471 device=0x0205 class=0
            function=1<br>
            [&nbsp;&nbsp; 28.346989] Attach moal handle ops, card interface type:
            0x109<br>
            [&nbsp;&nbsp; 28.352833] rps set to 0 from module param<br>
            [&nbsp;&nbsp; 28.359963] SDIW612: init module param from usr cfg<br>
            [&nbsp;&nbsp; 28.364906] card_type: SDIW612, config block: 0<br>
            [&nbsp;&nbsp; 28.369439] cfg80211_wext=0xf<br>
            [&nbsp;&nbsp; 28.372405] max_vir_bss=1<br>
            [&nbsp;&nbsp; 28.375018] cal_data_cfg=none<br>
            [&nbsp;&nbsp; 28.377984] ps_mode = 1<br>
            [&nbsp;&nbsp; 28.380435] auto_ds = 1<br>
            [&nbsp;&nbsp; 28.382879] host_mlme=enable<br>
            [&nbsp;&nbsp; 28.385765] fw_name=nxp/sduart_nw61x_v1.bin.se<br>
            [&nbsp;&nbsp; 28.390227] SDIO: max_segs=128 max_seg_size=65535<br>
            [&nbsp;&nbsp; 28.394921] rx_work=1 cpu_num=2<br>
            [&nbsp;&nbsp; 28.398063] Enable moal_recv_amsdu_packet<br>
            [&nbsp;&nbsp; 28.402098] Attach mlan adapter operations.card_type is
            0x109.<br>
            [&nbsp;&nbsp; 28.408248] wlan: Enable TX SG mode<br>
            [&nbsp;&nbsp; 28.411751] wlan: Enable RX SG mode<br>
            [&nbsp;&nbsp; 28.416394] Request firmware: nxp/sduart_nw61x_v1.bin.se<br>
            [&nbsp;&nbsp; 28.642440] Wlan: FW download over, firmwarelen=1065364
            downloaded 953164<br>
            [&nbsp;&nbsp; 34.648319] Fail to poll firmware status:
            firmwarestat=0x0<br>
            [&nbsp;&nbsp; 34.653811] FW failed to be active in time!<br>
            [&nbsp;&nbsp; 34.657996] wlan_dnld_fw fail ret=0xffffffff<br>
            [&nbsp;&nbsp; 34.662266] WLAN: Fail download FW with nowwait: 0<br>
            [&nbsp;&nbsp; 34.667216] SDIO Func0 (0x0-0x9): 43 03 02 02 03 00 00 02
            03 00 <br>
            [&nbsp;&nbsp; 34.673318] SDIO Func1 (0x10-0x17): 00 00 00 00 00 00 00
            00 <br>
            [&nbsp;&nbsp; 34.679151] SDIO Func1: (0x8) 00 (0x58) 00 (0x5c) 0d
            (0x5d) 00 (0x60) 01 (0x61) 00 (0x62) 00 (0x64) 10 (0x65) 01
            (0x66) 00 (0x68) 00 (0x69) 00 (0x6a) 00 <br>
            [&nbsp;&nbsp; 34.693708] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e
            00 24 14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00 <br>
            [&nbsp;&nbsp; 34.803809] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e
            00 24 14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00 <br>
            [&nbsp;&nbsp; 34.813727] woal_request_fw failed<br>
            [&nbsp;&nbsp; 34.817132] Firmware Init Failed<br>
            [&nbsp;&nbsp; 34.824576] Free module params<br>
            [&nbsp;&nbsp; 34.827631] woal_add_card failed<br>
            [&nbsp;&nbsp; 34.831003] wlan_sdio: probe of mmc2:0001:1 failed with
            error -1<br>
            [&nbsp;&nbsp; 34.837160] wlan: Register to Bus Driver Done<br>
            [&nbsp;&nbsp; 34.841535] wlan: Driver loaded successfully<br>
            # <br>
            # connmanctl<br>
            Error getting VPN connections: The name net.connman.vpn was
            not provided by any .service files<br>
            connmanctl&gt; [&nbsp;&nbsp; 62.608517] cfg80211: failed to load
            regulatory.db<br>
            enable wifi<br>
            wifi is not available<br>
            connmanctl&gt; exit<br>
            # ls /lib/firmware/nxp/<br>
            helper_uart_3000000.bin&nbsp; sduart_nw61x_v1.bin.se&nbsp;&nbsp;
            uartuart_n61x_v1.bin.se<br>
            sd_w61x_v1.bin.se&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uartspi_n61x_v1.bin.se&nbsp;&nbsp;
            wifi_mod_para.conf<br>
            # <br>
            <br>
            Could you please help me identify the reason for the
            firmware activation failure and guide me on how to resolve
            it?<br>
            <br>
            <br>
          </p>
          <p><span data-teams="true"> Thanks &amp; Regards,<br>
            </span> </p>
          <p><span data-teams="true">Esakkiammal M</span></p>
          <p><br>
          </p>
          <hr width="100%" size="2">
          <p><br>
          </p>
          <div class="moz-cite-prefix">On 15/10/25 16:38, Esakkiammal M
            wrote:<br>
          </div>
          <blockquote type="cite" cite="mid:3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com">
            <p>Hello,</p>
            <p>My kernel and U-Boot are working fine under Yocto on this
              custom board. The hardware includes Wi-Fi 6, Bluetooth
              5.3, and IEEE 802.15.4.<br>
              <br>
              I’m now testing the same setup in Buildroot, but when I
              try to load the Wi-Fi driver using:<br>
              <br>
              modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
              <br>
              I get this error:<br>
              <br>
              modprobe: module moal not found in modules.dep<br>
              <br>
              It seems the NXP Wi-Fi driver (moal.ko) isn’t being built
              or included in my Buildroot image. Could you please
              suggest the recommended way to integrate the nxp-modwifi
              driver or any patches required to enable it in Buildroot?</p>
            <p>&nbsp;<br>
            </p>
            <p><span data-teams="true"> Thanks &amp; Regards,<br>
              </span> </p>
            <p><span data-teams="true">Esakkiammal M</span></p>
            <p><span data-teams="true"></span></p>
            <hr width="100%" size="2">
            <p><span data-teams="true"><br>
              </span></p>
            <div class="moz-cite-prefix">On 15/10/25 16:30, Fiona Klute
              wrote:<br>
            </div>
            <blockquote type="cite" cite="mid:584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de">Hi
              Esakkiammal! <br>
              Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot:
              <br>
              <blockquote type="cite">Hello, <br>
                <br>
                I have implemented support for our i.MX93 custom board
                by referring to the i.MX93 EVK configuration. <br>
                <br>
                git clone <a class="moz-txt-link-freetext" href="https://github.com/buildroot/buildroot.git" moz-do-not-send="true">https://github.com/buildroot/buildroot.git</a>
                <br>
                git switch 2025.02.x <br>
                <br>
                make freescale_imx93evk_defconfig <br>
                make <br>
                <br>
                Can you tell how port WiFi and BT for imx93 custom
                board. <br>
              </blockquote>
              <br>
              It's impossible to give a definitive answer without
              knowing the details of your board, but in general: <br>
              <br>
              1. If you have a custom board, you may need a custom DTS
              that correctly describes your board (instead of the
              default one) for all hardware to be detected correctly. <br>
              <br>
              2. Make sure the kernel drivers for any additional
              hardware are enabled in the kernel config you use. <br>
              <br>
              3. The defconfigs are intentionally minimal. You'll need
              to add the target packages to support what you want to do
              with wifi and BT: <br>
              <br>
              * any firmware needed for the devices on your board <br>
              * wpa_supplicant or iwd or hostapd, maybe NetworkManager
              too (depending on how you want to use wifi) <br>
              * bluez5-utils (probably) for BT <br>
              <br>
              Some of those packages have optional components that you
              may or may not need. <br>
              <br>
              Best regards, <br>
              Fiona <br>
              <br>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------IzRvWcc0qm0ZY00WSsb9lxFf--

--===============1073893447586481201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1073893447586481201==--
