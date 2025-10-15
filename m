Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB6CCCD18E
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 11:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB328135D;
	Wed, 15 Oct 2025 11:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQyOysHo7UeU; Wed, 15 Oct 2025 11:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A00D840BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A00D840BD;
	Wed, 15 Oct 2025 11:08:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1321D1BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 104B38135D
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvGl_U2ytMyM for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 11:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c409::2;
 helo=ma0pr01cu012.outbound.protection.outlook.com;
 envelope-from=esakkiammal.murugan@iwave-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44DEC840BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44DEC840BD
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c409::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44DEC840BD
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJiS5HAY/sf2jLNNXeiQBlcO6NsabffnkTK//sCaEkRGr/kuL1CKaVYpxL0li2fjLsj0OP6nb325j0cvwNsYxhHMZa7VvvaQeIuUsyoOiV4V3pvSxuO7zsoThCGR+tR4+1gsdaeoqXohsEr3Aejf1ons99lFrs65kB62hyB1ujy05Ze89m0TqjQd1KLaIX9KAQTFEBA9ssVDHRETYnL5tNKvEO6E3/ppgRtuofpLw6YB+dT9DCaa7g9stPHEu/zbBWcnyzS4M7+mko0OSBliA/uXPs4BcS26ttV9jY3/B9oplYA9C9mK5jvXPmMlT9kvyOgqVz0HKTwl08ih5UDX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4z6XdTMaPwb1b/Y+R3T0ldKXmq/XzPUcrquh53u5W98=;
 b=A4kDiz/M6TGmT8WoZQg2K6ykRf/2P52lp9BvRMHvoVthh+J2L9rLaTnhg6Y+Dp22VM7OWg9tcUa/+8UVAM6XQ4UB+e2tPT++2qV8gZfdbnbJw7n7Cjyp7qIFo7ScKU5hO5v15dFGXyT1m7DRN+Gwzd+MkoHnLxHKKkmX0M8oGRnFyamkLFWpj867sPuFn1Bro3YcnT5Cd+HzNiUvn2qhVON/bsWnmx3cv5o5+nhbXvI9IY9gSxTfmKwg5LRNhMTycIf+Qz+C7rC2MnWYqtECoDT1WECBTtivGMHBUS1a5Azt1mue+iA57w/yPxjitMfzhdId37e7N5TpzDjqbzdnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwave-global.com; dmarc=pass action=none
 header.from=iwave-global.com; dkim=pass header.d=iwave-global.com; arc=none
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:122::11)
 by PN2PPFD97E53E0A.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::150)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 11:08:42 +0000
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e]) by MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 11:08:42 +0000
Message-ID: <3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com>
Date: Wed, 15 Oct 2025 16:38:41 +0530
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
 <45b0422f-620c-4db5-9a35-423466de2db5@iwave-global.com>
 <584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de>
Content-Language: en-US
In-Reply-To: <584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de>
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:122::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2448:EE_|PN2PPFD97E53E0A:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d06117-8807-46ef-0a37-08de0bdb336e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFh0UUcrTnJmTjY3TW5RMXBLTFNuQmEwMElkUUpFcDhCTTJqYkNQR2VvazVi?=
 =?utf-8?B?Z2t5bnc0ak9TSmxMOWFGaDBMT0VOK3cra0tRQjlRdUpBV1VpQklueDU4K1Qz?=
 =?utf-8?B?ams0aFhDOUsxVjZMKzJhbHVLSnhGdjF0UkhFMXZGRUsxZXUrVXBsTWJYNm1L?=
 =?utf-8?B?eGE3ZW8ybWVtckxNbnhaajZ0azBsNXBQazlUWXNwWDZ3aURoaytJRnBzUFBP?=
 =?utf-8?B?L3JGUHBjRzhYbm5HTjdUT0pNRHJpWmxrRWZHdnBNS2lWalZ0OU9Tdk45NFFG?=
 =?utf-8?B?cXVxRTBUcXhzNktCblZFZVdpd2NvL1lleitKdjRmSmtzSHdWc0ZyL05kcFRi?=
 =?utf-8?B?MEw0MFQrY2NTbEROdmxFQjN2dFRTS3ViV05DUmNyWUpwNkVLNzVacTJhUEVE?=
 =?utf-8?B?VjFCRCtLTGNtWVgxLzYvYzRYam9kU1YrOXdEc3VoM3Z6dEN4T295V1BvMEw1?=
 =?utf-8?B?R1gzcnJ6RitqSGsxaU1STkRqdE05dGNOQlNJL3ZYQjVub1YwYWxiVUg4eFlC?=
 =?utf-8?B?NVVpeE94NnQvaFEvOHdIQXliQmhWU3ZIOU5nUEtsVXEvUVZPMFFjUERPRDhj?=
 =?utf-8?B?ZlFJSDR4Yk50N0h3QTZ6ejFYdENQOEhONHBVbUQyRXVSaXdrYjQxdUtueTFk?=
 =?utf-8?B?NlNxWEw2c05jNlNmaVMwWngzUFJkTXdJdGJIaHE2YUcxVnFEcnk3NkFqb1Ru?=
 =?utf-8?B?czRJMnlrT2JURUprRkw0NStjNjNrbTRQMngwVTM4bUd1b09OUjlXempvQVZF?=
 =?utf-8?B?UGZ0YTBPTUo2d1Jlb2RFNm9CeHROVlYycENiTGpyQ0JDa2FTWGpQUTRjR28v?=
 =?utf-8?B?eVB2UFR0M3FudVNlV2lxNHlETnZmMXBpQVRGODRGMkZtZXFEV3E5V1lPMFA5?=
 =?utf-8?B?cXovTGZtYUVId0xSUnZOaTY1QUxNdnJaN3poT28rQTVUKzY4eFJPT002UXZj?=
 =?utf-8?B?M2NwaSswYzh3Lzl6VTFPL2tFSFRGZ1VHSUU4RTFsQ0lXclR2WDk2ZG1DLytX?=
 =?utf-8?B?L3Bkc0VGVnJGc0VweU53YzlpMDZPMFlNWE5QYmp2V2pZaGlzRjBGVWJrbkl5?=
 =?utf-8?B?bW9PSFMyNHZrTU1Qd1A3cTg0TWtDemMwZHBOby9wTEdzeW1xSzFNc1ZiV28x?=
 =?utf-8?B?eWlCSDZLZ3FudzRCVXMrZ1EvNk00dkNGZ1pEOWZqazkvbG5jWWF5Vy9oVzc0?=
 =?utf-8?B?bHlxSjF6SEZRK25PTFVVYVpaRS9HeUg5TTExNnNBYmtZMFJuaTA4YUcrZXR1?=
 =?utf-8?B?SUIyQnpWUndmU3NPNzBGL0NCZkt6WkVtb2ZKWVNBN0RyMHhYK2JFTVR1cFpC?=
 =?utf-8?B?d0NEL2Z4bXdONldKWndNNVVaWkVmQXJwemxkRzFIZ242UzhuYU5uRU5HSm92?=
 =?utf-8?B?VlZxQVFQNFNobGw4dUl0SU1pbEQydGRyNXZVSk5hSWVxOE9ZZzloMkNHWlRE?=
 =?utf-8?B?MCs2UE9nK0pvZWFNL0VOOHVyNW5TbHEvOWN3TFA0aEtTcFdJMWE3dkRINm80?=
 =?utf-8?B?UmdOZENsSE1GRzlGWVdPbXg2bkZ1Mnp5dUF1QVdJVU5iVTlBM2p6WGZNQ1Bs?=
 =?utf-8?B?RmZnblVOckQzcGFCdFJKZzl3Qms4T0VMeVRDSFhBaVV2V0lPdUc2NVU1MEZT?=
 =?utf-8?B?WWYwdC9iaCs4UUJRNUJ1VDFxZ0FtRGQ3WXJjdnU3TVR6Sy90a0N3enp4eXd6?=
 =?utf-8?B?bXRFcFA0VjY4bkZCblJvMFEzK0N0bUxJOEJMbDZnNy9iWVlEckdIN3hpTmRo?=
 =?utf-8?B?UUhBbnl4L0VyakZvYUVGcTB0OEhLdmxDcXpNV1gwN3N2dUVvQUFKenFYMHdt?=
 =?utf-8?B?RE5QQW9tZjBKYVdITUg0RmNVWlhSUmdheStIdWpvYjQxdkQrRk1JYkFJQk41?=
 =?utf-8?B?WE1iUTBwd3lOZUlYMzFaTzVVZWxHelluenFpdWdWM1RPekJZeDRZMlQyQTZs?=
 =?utf-8?Q?8XT5ztc5Ey0aUkYwN2Lesid9XB+Lrsmf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0P287MB2448.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFNlWURlZHdyTVphL1BRMmU4SlQ0R1BVeXA0WFNhN2krNnhVaUcxaXhHL3lG?=
 =?utf-8?B?Y0hYQzFwZ1FtZmh3b3JIYUdWQVA0ZnppWHJlQ0NYR1RlSDJpSW1rMWVXZktl?=
 =?utf-8?B?dFlOY0FySE9uNC95Y1ZMRWcvVEVTTWdzUHk2d01tOGNZbGNqcDQxSjJ2a0dr?=
 =?utf-8?B?dmhwVW02WldWZXVDMXZRcU5vRFB1YmFicE1GWVNNRStHQVBjVjVoeWV4UDBR?=
 =?utf-8?B?YldxeWJPb1JkMmlNQ3hkdm9QdCtpQ3ZIUk51K0IwZkMvZnhEYVlXNG1oaHMz?=
 =?utf-8?B?Y1hkWE0vS1NiY0xuL01uOGhTWUtDOTF6NEZLRVcvZGxrS3ErdFhzWnpIVVNY?=
 =?utf-8?B?aXcrNTAxT1pOREN0Q2R2NmhKQWF6TGNCd0xaOGRkRUg0SU5vT2NSVFpzQWM5?=
 =?utf-8?B?U2dBZUc5NjhEQ1ZjWnlqUjNlblNISEJQQlhQcUVmOFhZQ3cwbE1GUWVVSzJo?=
 =?utf-8?B?a0Z4enR5RVppeHJEM2cwdmRsdzZuQnZzZUswV1pUVERaUTVNRUFWc3VlWHVo?=
 =?utf-8?B?V1hJS3AySWt2UStRbW15QWFPWFU0N2dDMktyZG4yTkpOSEh2eWpxTHJtUGVL?=
 =?utf-8?B?UzR5ZUZRUkVMMTNEdFJaQTdYVEtVL05VbmQzRlNGVndHWUVkMGlXTXRySUtE?=
 =?utf-8?B?QmhaYzRWdlREYkoyekJ6WU0vYzBwWFp5NUp1SHBteG14cC9pVUZYMGZ6NDJI?=
 =?utf-8?B?bFgwZUxQNXczQTNtVHFoL0dvN2sxUk5mVjU1dWdDM2pqOWFXR0J2ZjNhNElQ?=
 =?utf-8?B?V2s5RWNzdTBLdG9NSWdPZDhNaFNkSWZvKzIrRWpJOXFwY1IzVXZNRlNHK1Nn?=
 =?utf-8?B?ZTAwS2U2UmdyRzZDUlFnS1FNVmw5ZkhiNk8vZUxVc1RJTVROa0ZvY0t0b3Y0?=
 =?utf-8?B?T21BdGp4Wld3WEdKTjltTTArZmpJNzBoTm5ZdCtleW5GTWVmalR3M1hOZ3lm?=
 =?utf-8?B?Skp3U2RHUWJmamdHUk9iR2M0Q1lGT3lIZG4vdFVPSXh0ZFdmczZvTjk2dWNv?=
 =?utf-8?B?S09ra3Uzc1owS3lJSXlJc1hvYWsyeFJEVHpReDJWb3dkaGFnMlJZalgyK3ZM?=
 =?utf-8?B?dkhRUndvcnNFNkNOS3p2WUtQc09zM3FXVVpjd1NFdmFEV3NHai9rYndpdWxj?=
 =?utf-8?B?SWU1b005TW5kcVhIY2ozMjdoYldiajB0YzhQbEg4UiszNC93VFBHTkliWjBy?=
 =?utf-8?B?bG5mcktVcUxIeXJIRU00WnFKalRaalhVRmdFRmp1WmZBaCtQeUtZcUIyU3Zk?=
 =?utf-8?B?T0F2NWNZTkRiNGZNQUM4K2VXejdvOGp5T1F6a1VCc0pmbGxxMjhPUGU2QTZh?=
 =?utf-8?B?RkRoM01OUGR2bWcrajdiVzRWb2U4L3lFU1pleXdQT0hrZ3ptdnJUZ1pPeDlE?=
 =?utf-8?B?bldvKzVaSjM0Q2hoVjRxTnhDblpaYkk4VVJrSklLY3lOM2paM3BTSXlzekJX?=
 =?utf-8?B?T0I2U0JFTDhCbExhdHBlKzdOcjl4bU5TbTVlYUJMNWxqU0RkZnRZUmUvU1Np?=
 =?utf-8?B?MXFucHlSR3U4VzlONUlWVHl5K0lRQ0RYMlZxS3RlWGVXcGxXSEJSYSt5N2lZ?=
 =?utf-8?B?a1FwUDVseGk0V2ZKZi9IV1FTWWZPbVk2VlRCOE5qNUF3WUZEa09ENG1vaDlC?=
 =?utf-8?B?YWE3TTcrUEMvMDB3bkE1c3FYZWZ1KzJ6MUhPU2RjWXpFVGg2ZWVoM2Z2UHh0?=
 =?utf-8?B?SXB3MTd1V0taTzQzYi9GK0h3NGtkQm1BN1JST2ZsanRtRklBSWJPVlViZWFm?=
 =?utf-8?B?cXIrV0gvcmZVR2dkay8zOUcrN0pGVDMyV2VHR0JDbkFxTVVWLzNsVW8wdXZL?=
 =?utf-8?B?SDZ3MmV0YXhkUGdieEhNOVRldGdHRDNNcjYwc1Y2YUtoNmJJRkhnWEJwVVRX?=
 =?utf-8?B?S3g5ZHhoelh6VkVBZi91YTNkOE9ISlllMnNmRm9GZjRIRkNQc1JwRkUxZWFN?=
 =?utf-8?B?Ym1wRER1L0x6R3Z0LzVWZTQzWmg4NHpqUlZ2bm44aUxsaDhGYXI5b3dJVlJ1?=
 =?utf-8?B?ZFJWTWRWdlo1SEYvZWI5SlFHWDQvTURFNVVyakhsM1VHTDFuOUtVM2Zwd2lB?=
 =?utf-8?B?emZrU0cwZG8xalFDbEtIaU9LZVJZWW9zeUxERG0zbmpscGVsOFpxWmJJcUFk?=
 =?utf-8?B?Y25qZGU2amZWRWpOamw4clUrcHdEeGNjbGRJa1dsbVpkUkZSWEQzK2NCZTZ2?=
 =?utf-8?Q?q7oHdrWCsLJa8TKIWaK/n00=3D?=
X-OriginatorOrg: iwave-global.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d06117-8807-46ef-0a37-08de0bdb336e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 11:08:42.2906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 507ae903-cc48-4d6e-bdb6-35278120a345
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVmNxFY0K3iNMITZ3nIccLCGpmWV+HXrM7fTaLDfILKHIcXB40cH0lJjyKCWte+BxuB5R3jQYosili/PrwZhDBvYq8gRmRjFPgCCsBoNtaudebtx/aLQAu9bjyiL60Ol
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFD97E53E0A
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iwave-global.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z6XdTMaPwb1b/Y+R3T0ldKXmq/XzPUcrquh53u5W98=;
 b=M4lZ8zD7YU8a/oBNIyuYbmCRkviX2QidJ2AsHFNKHlRpuuDKIaDTTh7FUk0MjLiy30lH+9hzYnXYJeXpo9eZHBG1n2G7Weu+PJrjdcx7f5YN84moLe4ioUadB4ufKsSatf9INn6DaMyx+nXiGs2edzH2FO9iQmMwxCNe6FkzOPy0wgTiTKyvXN0Bt+1mCArK7qbsL91mk3IQjIegquuIM2G512+GZH2YsAVy2ZZZfcPod4IxdIWuSTW1imTDUTA3qLzv3+oMDYaSmq0XXSXBAmHyZ9Zq7frGKPtRUho0d18Us6s8xZIsVKM9LNuvgtIxO+XcwgYMcPc+g/7v2ZR0/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iwave-global.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=iwave-global.com header.i=@iwave-global.com
 header.a=rsa-sha256 header.s=selector1 header.b=M4lZ8zD7
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
Content-Type: multipart/mixed; boundary="===============8367030003710429830=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8367030003710429830==
Content-Type: multipart/alternative;
 boundary="------------AP8T0rA7iNhVvwNmpB9E9B8t"
Content-Language: en-US

--------------AP8T0rA7iNhVvwNmpB9E9B8t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

My kernel and U-Boot are working fine under Yocto on this custom board. 
The hardware includes Wi-Fi 6, Bluetooth 5.3, and IEEE 802.15.4.

I’m now testing the same setup in Buildroot, but when I try to load the 
Wi-Fi driver using:

modprobe moal mod_para=nxp/wifi_mod_para.conf

I get this error:

modprobe: module moal not found in modules.dep

It seems the NXP Wi-Fi driver (moal.ko) isn’t being built or included in 
my Buildroot image. Could you please suggest the recommended way to 
integrate the nxp-modwifi driver or any patches required to enable it in 
Buildroot?


Thanks & Regards,

Esakkiammal M

------------------------------------------------------------------------


On 15/10/25 16:30, Fiona Klute wrote:
> Hi Esakkiammal!
> Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot:
>> Hello,
>>
>> I have implemented support for our i.MX93 custom board by referring 
>> to the i.MX93 EVK configuration.
>>
>> git clone https://github.com/buildroot/buildroot.git
>> git switch 2025.02.x
>>
>> make freescale_imx93evk_defconfig
>> make
>>
>> Can you tell how port WiFi and BT for imx93 custom board.
>
> It's impossible to give a definitive answer without knowing the 
> details of your board, but in general:
>
> 1. If you have a custom board, you may need a custom DTS that 
> correctly describes your board (instead of the default one) for all 
> hardware to be detected correctly.
>
> 2. Make sure the kernel drivers for any additional hardware are 
> enabled in the kernel config you use.
>
> 3. The defconfigs are intentionally minimal. You'll need to add the 
> target packages to support what you want to do with wifi and BT:
>
> * any firmware needed for the devices on your board
> * wpa_supplicant or iwd or hostapd, maybe NetworkManager too 
> (depending on how you want to use wifi)
> * bluez5-utils (probably) for BT
>
> Some of those packages have optional components that you may or may 
> not need.
>
> Best regards,
> Fiona
>
--------------AP8T0rA7iNhVvwNmpB9E9B8t
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello,</p>
    <p>My kernel and U-Boot are working fine under Yocto on this custom
      board. The hardware includes Wi-Fi 6, Bluetooth 5.3, and IEEE
      802.15.4.<br>
      <br>
      I’m now testing the same setup in Buildroot, but when I try to
      load the Wi-Fi driver using:<br>
      <br>
      modprobe moal mod_para=nxp/wifi_mod_para.conf<br>
      <br>
      I get this error:<br>
      <br>
      modprobe: module moal not found in modules.dep<br>
      <br>
      It seems the NXP Wi-Fi driver (moal.ko) isn’t being built or
      included in my Buildroot image. Could you please suggest the
      recommended way to integrate the nxp-modwifi driver or any patches
      required to enable it in Buildroot?</p>
    <p>&nbsp;<br>
    </p>
    <p><span data-teams="true"> Thanks &amp; Regards,<br>
      </span> </p>
    <p><span data-teams="true">Esakkiammal M</span></p>
    <p><span data-teams="true"></span></p>
    <hr width="100%" size="2">
    <p><span data-teams="true"><br>
      </span></p>
    <div class="moz-cite-prefix">On 15/10/25 16:30, Fiona Klute wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de">Hi
      Esakkiammal!
      <br>
      Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot:
      <br>
      <blockquote type="cite">Hello,
        <br>
        <br>
        I have implemented support for our i.MX93 custom board by
        referring to the i.MX93 EVK configuration.
        <br>
        <br>
        git clone <a class="moz-txt-link-freetext" href="https://github.com/buildroot/buildroot.git">https://github.com/buildroot/buildroot.git</a>
        <br>
        git switch 2025.02.x
        <br>
        <br>
        make freescale_imx93evk_defconfig
        <br>
        make
        <br>
        <br>
        Can you tell how port WiFi and BT for imx93 custom board.
        <br>
      </blockquote>
      <br>
      It's impossible to give a definitive answer without knowing the
      details of your board, but in general:
      <br>
      <br>
      1. If you have a custom board, you may need a custom DTS that
      correctly describes your board (instead of the default one) for
      all hardware to be detected correctly.
      <br>
      <br>
      2. Make sure the kernel drivers for any additional hardware are
      enabled in the kernel config you use.
      <br>
      <br>
      3. The defconfigs are intentionally minimal. You'll need to add
      the target packages to support what you want to do with wifi and
      BT:
      <br>
      <br>
      * any firmware needed for the devices on your board
      <br>
      * wpa_supplicant or iwd or hostapd, maybe NetworkManager too
      (depending on how you want to use wifi)
      <br>
      * bluez5-utils (probably) for BT
      <br>
      <br>
      Some of those packages have optional components that you may or
      may not need.
      <br>
      <br>
      Best regards,
      <br>
      Fiona
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------AP8T0rA7iNhVvwNmpB9E9B8t--

--===============8367030003710429830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8367030003710429830==--
