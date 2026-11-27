Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88529606A31E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LmeiD1cj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=oyF+Cmn8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E3C9812A9;
	Fri, 27 Nov 2026 15:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-U_DmCP-nMv; Fri, 27 Nov 2026 15:16:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5BC698129D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792574;
	b=YoplMyo0cphiLKMoABQTjpR8b3QWeabTQ6PUm/SejfD35n83FkXYbcjX9X8GqxZEFlnY
	 pQKtjhMGG3MtYKU1PPLTIw/L7L8+/oslKl0y16v2mvi8la0h6Oes9pGOqFTb1DLy84bue
	 1bMqawsTj329XJ3JSqKyyRopMqftCtKiPOlz/uwSbwtdwpc9xe/fENe7Z2fZmBYSY0hFX
	 qNa9JEhnIlowuJgpcQuB0UShMxs+8wwKE2Bq9PxzGP1fnio0f9KeveBYmQH9D2OMZNi+b
	 oUkj3TXOR49U4sif0bKVmFbtasY7WJaiDYMnL67AYn5Ij77xnfDB6SWw4AL8KkPcSLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tjohVZHfkkDWOJiOZ5UC3FgaV+mSTy5Ye5SKU4azOgg=;
	b=LcgXI2aip/prN76YlZ9ptygaMKYZkMutvyNEqivemoH/WbhhXCrqVOL/Rjjkh4ko7zJQ
	 2HFa8k41YSRzB9RbOR/5skcmCjpfn1irZj6OnmoaLRBJIZCXK5e8Dk7LMpCmeSvli9j6k
	 sniOBJkMF5wwctC0cUwrKYWozXOWWBWJayUESfoB3WTX8lKfebwT0e9mE5BKwfpNU6Fid
	 tFK3W+XQ+0zp3/K05pfSVQkPPqcKv1J+ucP2YkU/RluZXydW5amLwdFSvK23qRNR0TI00
	 066N1iIPwELag+gkadkZSgXdhhXCI//XB/3hOS/E9VdXs1oM0Q3TuB5DgoOoJ5tQI1g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792574;
	bh=tjohVZHfkkDWOJiOZ5UC3FgaV+mSTy5Ye5SKU4azOgg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LmeiD1cjeEDR/4A6+JW3mgqI/5POdtX3ifMT2/Xn/zoSI05R0THBF53UJarMIffYu
	 vf6Ndro1iIOvHfxH+wQVD3/E6D69X4XMh4cme4ZmFXXBWVfnC7Ypd6t00Vfe4oYkVG
	 ARa7GIYJiNcU1Os2heY8bJ3L5ZvihMtwfJEKe75uoz4G8eKaUmPfMk6wNL9imN3jJv
	 wDbcJk7NggUeWW+3JiJNO0MDzQg+aoY7zah+QwyTwedJXuKuOcTXLdUh0Sr5WM6fjF
	 IvLQXO+tus+pNCVHprZa4LMXQ/F/aU16cAo54o8okTuuWahlefJVNHD7RZeITVJgwE
	 5XuG93xTlYJeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BC698129D;
	Fri, 27 Nov 2026 15:16:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E620373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30A8F409A0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2u9YqUjBAFJ2 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:16:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 003B74091F
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=oyF+Cmn8
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 003B74091F
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6VWZ8A+lweuuweihCTheEbahRc342Z+9mvQkOnGiIg=;
 b=oyF+Cmn83TLpfh4YtkW+SwqBH+C/HC9ow5DtftnoMHO2OX0R18WUk7/vHEymeQHO20KUj6eV9Q1VHbOebP3ye6bWA/XHSI9yW9xqI+xgDOGIa+4IA6HFHtCjEUc7v0DgaOcATWDapIyntAdopxTeVd5YDl9l9uJx6IRn0kHopLPxi3nUqeQOpX+N+jv1Dge9rS9BNyOKbfz6rAv5CyBe1zyZplFziN/uq8KjT/Uxl2VyZordM5MHxASfRqWouSUpezcjznqbrcCmjJIJNj3V+brgU6v2u73j4etE8fQlY037kiicsjjxzOgYILu/KNz5DG/uozoFNndBh/3Tir/6ng==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:16:02 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:16:02 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:09 +0800
Message-ID: <MEUP300MB0045E63785D203821E90245CB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6720; i=tfx2001@outlook.com;
 h=from:subject; bh=qva2mmQA75BHhdmfxWhPjDMXBiNuROBHy55ktZpiAwU=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ4+0VB5NEKabDRSkDJ6d2Y+AwFJ3V8hbk5O1
 5N7kky1HXKJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmePgAKCRAcD62l0/wL
 2j7FD/sHGe1ecyvBIZ4bYYhghbTXCSPB1MKyPH809nffHC9FS1+SsopTlCplxTp/rJpVgb08cX+
 7TQNSjkssQBPn5PSggTjA6ScntVGjtg8Yv97uBrDANrmUQLFmOqt8QSNkCpsfA0X0ri7WEjVROZ
 8gYlP6KlllKMwaH6QF6ysm9YDq7RkjaFxETH2GptXkB1QSeJZo++o7blL+62VJ0b/iq87ZMirrb
 dmBE/WIR7qyD9BuVIuxD6ZD0EcxrMKq6MxZQefABzLQQHcndQR0KF4xhaO+EC7yw3xtqHUo+Vdy
 3frtD+YmDdfpHgAaLPZiCQqgIRimt9Skg40n/p2U0TxoGC/JAIsnZIDcZQKY99Sz/u0acs7eZKN
 Ys6Uqo2pd/v92yV8/SlnXt+RPwLU2Z5qJzcMdFzfVkT277T/GKLpWAMojGviMhRuidB/UtsrlSj
 JyqAkdfQve649jCYnknHi+upvHYKe0kTV3liFAPihdkI6Zp6C7sZnwnFSJn9uqEStbHcQQdSskZ
 taoEs/PtfvC7dxnddkXkvDw8DLGy+pcPmX5Qm23IEob/WsXzQjQpgO8vUrJMrwzt15VyWxyV1za
 tCVbzEX4Da2TvIUDbIlpwoJ73nP9e5xUz5xNHadwI/1yfTTV4SWGQgBnMdcItAJTIm11MafT2QI
 qN2WRgkwHgURjmQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-23-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: 520fdb5c-2dab-44de-33c6-08df4c995983
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|16051099003|8060799015|19110799012|25010399006|260925184616899003|51005399006|6090799003|15080799012|23021999003|41001999006|5072599009|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U295bXJjOW41MzJJMWxnNHZwMzNZcEhIK0J5MnBaK3dhL3dDbS82L3NPTGpq?=
 =?utf-8?B?alhTUUtIRWo2VHhQcHZVa2UrYTgwS3NEWm9sMTVjM3ZmWVdoYkc5a3pSOUY2?=
 =?utf-8?B?NHl4UU4vY09JWFZRbzUxamtZdHFlVFlCM3FyVCtwQmpJY0RUSUs1Q3lkMmtZ?=
 =?utf-8?B?MjhoL0JwMVo0am94YjVJZ3BCcFF1UkRSb2F4RkxCaGhNbWFlWHdRdUlYTXMr?=
 =?utf-8?B?QW9Vd1ErbzdZRWVZcXdUOXcrTFpXZGF3UVdteG5lcU4wWVZEaENFeHZkc2ZV?=
 =?utf-8?B?RzFRQllZenFxM0NKK0VySWZDd0VNYnQ1S2wwRmdEcnUvd1RtOXloSVU5c0g0?=
 =?utf-8?B?cnBpb2Fna29UOVA2YjEyRGhDZHFXODRMT1hQb1BhRklOMklFN2REdTUwbDVp?=
 =?utf-8?B?UEpmdzlGL2p3WisvSG9weFc0eURPUWFoaU14V1ZpVld1UVFrSUdTOU5VOUFz?=
 =?utf-8?B?aHB0N1VMYUVha002Ky9SSTJqS0lwZDlURFEyYlpSSVBqb09ZcjZ2U3ZiVjNF?=
 =?utf-8?B?dWZZcEgrVlh3RmlLM2JuRXZuRnB1UnM1WVF0V0tGNTZXSWs0UzdwVDlTUEdi?=
 =?utf-8?B?V2cyR0xvQzJSZGlOaU5NV1FTTlpsQTFZQnlmUTdxN0RBdDRHRHl4V3V6Rmpo?=
 =?utf-8?B?aWFKeUtxLzVaVzZQNDE1SVVzNE1NOG1MeDdQWjdmT042RjNKUGo4eWdwRTVu?=
 =?utf-8?B?WjhTeVBWanR3RTFCTkFKRGRKOG9YOGhITEIwVmx0UnRjZGNWd09NZlcvZW9F?=
 =?utf-8?B?eTlxRG1ZcEkvc1dWSHlqcFQ5ZVRVNVF4d2FxSjR1clEwbStBL3V6RjgxVHdZ?=
 =?utf-8?B?eDR5R3FWUEo3dEIwNmhlV2hDYXg1TTNwa0tmQ2RSSXo3eXdGRzdSbFgycHNW?=
 =?utf-8?B?UzRYa2FJMmp3TnhUTmcwQlovS1I5ckREbmZvRGVjMlFjbjhtMWt3eXNEd2ZE?=
 =?utf-8?B?MGtWSFh1UTRFNllMTzE2UTR1c1FCU003bGtiUk9mYWpld3k2OWpHbmZ6eDRO?=
 =?utf-8?B?NnQ1WDdRbWN5U2UyL25HL0J6S2gwL3dERnRHNExiZHBESUYyenE3MWcvdzlD?=
 =?utf-8?B?UzdaZjRxWndYeWhGay83U0pydEpNdVRvSnpZRFRTbVBmTzU5Y1JjeG40b1lR?=
 =?utf-8?B?S2RkNFZaS3BTcGdteEdmbEhVemxWOVE3QVcyc2RVcTJhODdxbVkzdzcwQTd2?=
 =?utf-8?B?ZTJ2Y29DajU2SGRreHNUanE2WVZrcEtOUlJjWFNtV1NTb3M1Vmp3QXZMUS96?=
 =?utf-8?B?T3IwYnJqNEQyUGZFYm9oMmc2R1NJUS9NS1RmeGRXaGRKMEtLem5POUNsSDlo?=
 =?utf-8?B?dmg3UjM3akd3bXUrd0krSmRFQndyN29yUzY2S25UVldLQzUrQnNpQ0FKUGxw?=
 =?utf-8?B?bEZrTll3UEdBUzE5cENxczVWTkpjaFh0ZzJ4ck16b2g4RXFGWStta054a2Fk?=
 =?utf-8?B?b2NRRGgxNWFENjZId0RHZnFYZ240cWRYSldSMmVDZ0JxbUUwQStIMS9YZ3BE?=
 =?utf-8?Q?BPXB3k=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3VGLzV0NVU5TTN6akxVMHJpK2JQZHNFT3ZaU0dxbHpwVklBMzNGV1dETVA0?=
 =?utf-8?B?TlFmWDc1TVpneTY5NjRCa1loRC9USXhDT1BWSDlTRzlYS2EzdEMzZmxvNXNL?=
 =?utf-8?B?T0YwaWFKeTlHNFdSVVlNSjg1LytxNnE2amI4QXkwQnRzcEpqcEZ5TWZHMWFn?=
 =?utf-8?B?WExIdDlkMUNzZEQ4cGhjQURmSVZRbEhKSVpoOVc1aUtOV3ZvY2IvaDlWM01z?=
 =?utf-8?B?a3dGWTRIUmZCTnpiaU5UOVU2TTdKb1A2NUlHa0x6bCtjMHdyNmdRb2tCL3p5?=
 =?utf-8?B?MnVPTkJNdDdVRitGNVEwSG9XSnkySVNPS2ZNZG5xUC9RYjNFOWZiNkxxK1ZK?=
 =?utf-8?B?dmxBR1Y0VWR0WlVSZzFaa2RiUkszT0x6eGRJemFIdUpWcGFmVmpSN1VuMlNI?=
 =?utf-8?B?R2ZmcllkdmR6bnczWE16RFFyUlVzdXVJc0RRdlArZ3orN2htTjZXSERSVUtp?=
 =?utf-8?B?Y0IrbEx4ZlR1Z3AwWG1DWW9QZ0tabzczTmFISWtnVzVoSGh0ZlNUOFlIUTMv?=
 =?utf-8?B?aWRRbFJNSlRBZ3RYMzdoQjc1UDVYa3pjVXowSysyTnNQY01yaCtPR2kxWjg2?=
 =?utf-8?B?WHhuaU93cjRZcmJDbmg5MGRWcW9ZcURTTWhyUUZ2ZzZEdE1BZStCaUJVNVVT?=
 =?utf-8?B?R0VZSTJJaVZ2cGYyL2ViRjM5eG1vTjdkOTVKUkVMTEtHY3NnS1Q3VzZPdUZh?=
 =?utf-8?B?WkJJVGEvQ29CMDZQL1RpOXFZK2VUUENBNnhWbGZuaVJGZ05jM2ZSUUZ0TDZq?=
 =?utf-8?B?WkhBNVNsU3c2ZnlpbDZ2L1d5WXVRZzA1aHdER3drUm85VE9oUTgzL2todlpD?=
 =?utf-8?B?b0FhQnRUa3lVQStlcUE5NlVIVlhnRERncmZ6VkJRZVpZOUs3REZLei9XbmJT?=
 =?utf-8?B?Z2pDZWUxM2d3UFdXcFNiWW45RW9TNXYwV2dpY3hubGRlR2d4b3B5ZTJ5YVVB?=
 =?utf-8?B?QkN2U2twdFNyZnpYNDJBTDRSbldRdVVyRU05RHgzcGRqUHR5ajQzSTlUSDhT?=
 =?utf-8?B?NWZyUXFqVTBPWDBpYWJCZzNmL3h0MmN5QmNiMWR0U0F4SWRQdFUyMGh1MUpx?=
 =?utf-8?B?OFFnTDYzVHhuSmFuQU54c0cvcFBZcWg4TzRsOHBsaklOeUgzakIxTjg1Ym1n?=
 =?utf-8?B?djMvNXR0c04rMWhiV1oyaGdmazd4T0dEVmlteEt2dlJHN2w2UGFkcjNTbUsr?=
 =?utf-8?B?ODNsRTNIWFdNTVhnSmNmbkdGS1pwRVZzM2VwT241bEdiWUFxbEkvL1VrUE93?=
 =?utf-8?B?ejFRMGErUjVud0JiOWpNenArZmxGMmFXcGZIK0I3OWNxN0R6Z0pWNDVHZUc3?=
 =?utf-8?B?UGRRY3U2Y1A2UDFXaFhHNXhWZENZd3RVUTFZamVPWUdSNCtkOGxVL0ZFVzRM?=
 =?utf-8?B?bk5vdG1YOVJrQTNoeVp6SFVHbmZJOXEwcFlmcll6eHRVVkdDWVEzVElURWNW?=
 =?utf-8?B?N2FYemJpa1BLZWY1N2dWNEVIUWF2V2Y2RDNiNzBhTmtvZFV2Zm52emhPcDhS?=
 =?utf-8?B?ZlA4RHhpL1BEcVdKNzlZSnV6ZkpHMldqQ3JKSEFCTGVOK1ZURW41U3VUckdJ?=
 =?utf-8?B?SzRTRGIrK3FzeWEwQTU4aHhCYWF4VCswb3ZwTzJieXZoN2NqZExnNDhKK0pE?=
 =?utf-8?B?UWN5a08wY3J4ZTE4aSs3WFdPU1R6OWNIeUVqSzhOUUpMVDhrRmtBZWM1Y2JL?=
 =?utf-8?B?czQ2UVY4RWtrbGxpcmhxNXhkSWZyYmYxNXU3REZqU1J5azMzSDBkMlhaWi9T?=
 =?utf-8?B?cFVxMjlKVnc4WVNhRnJUdFVyVVRMNHl1QVZQTUhNYjF1WVdtTWhaSGtkV2lq?=
 =?utf-8?B?aGJhQnZqSHlvNXN1S29uNmFJSFc4Kzl5Sm9ocWppdU52aUg4cFNmTmNBQytH?=
 =?utf-8?Q?Hd+I7AiS5aPhg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520fdb5c-2dab-44de-33c6-08df4c995983
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:16:02.6757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 07/14] package/gstreamer1/gst1-plugins-bad:
 bump to version 1.28.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the deprecated Meson options with glib_debug, glib_assert and
glib_checks [1].

Drop the explicit -std=c99 flag and use upstream's default of GNU C11,
with C11 as a fallback [2].

Add Config.in entries and Meson feature switches for the new
tensordecoders plugin.

Disable the following plugins, which require external libraries or
unsupported platforms: cuda-nvmm, hip, lcevcdecoder, lcevcencoder,
mpeghdec, nvcomp, nvdswrapper, svtjpegxs, tflite, tflite-edgetpu,
tflite-vsi, vmaf, webview2, wpe2.

The y4m decoder moved to gst-plugins-good. Drop its old Meson option and
migrate the old Kconfig symbol through Config.in.legacy.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/84b3a0950debc467ce25aebdddd0d827e658252e
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f022eba452dc04d1cfefe4860a5f89bc261e194f

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 Config.in.legacy                                   | 11 +++++++
 package/gstreamer1/gst1-plugins-bad/Config.in      | 10 +++---
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  4 +--
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 38 +++++++++++++++-------
 4 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bfd03f92b6..b170aea1c3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,17 @@ endif
 
 comment "Legacy options removed in 2027.02"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M
+	bool "gst1-plugins-bad y4mdec moved to gst1-plugins-good"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
+	help
+	  The y4mdec plugin moved from gst-plugins-bad into
+	  gst-plugins-good with gst1-plugins-good 1.28 and was merged
+	  with the existing y4menc there into a single y4m plugin
+	  containing both a YUV4MPEG encoder and decoder.
+
 config BR2_PACKAGE_RTL8812AU_AIRCRACK_NG
 	bool "rtl8812au-aircrack-ng has been renamed to rtl8812au"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index fd518c228d..4fbc5057f4 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -300,6 +300,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SWITCHBIN
 	help
 	  Switching between paths based on input caps
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TENSORDECODERS
+	bool "tensordecoders"
+	help
+	  Tensor decoders elements
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE
 	bool "timecode"
 
@@ -324,11 +329,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VMNC
 	bool "vmnc"
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M
-	bool "y4m"
-	help
-	  Demuxes/decodes YUV4MPEG streams
-
 comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AES
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 8d173ad38d..2c4150f303 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.13.tar.xz.sha256sum
-sha256  3cbe7d7cec5db958781f7ab66caa5afd67b133c223fde71f0403277731f0cc4d  gst-plugins-bad-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.28.9.tar.xz.sha256sum
+sha256  4a4e0b7bf84f868378c48f143a7ac3a98923b488a5b74f1a35ba46bc3c43f6b1  gst-plugins-bad-1.28.9.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ac554749c9..ec96a2a1cf 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.24.13
+GST1_PLUGINS_BAD_VERSION = 1.28.9
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -15,7 +15,7 @@ GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+
 GST1_PLUGINS_BAD_CPE_ID_VENDOR = freedesktop
 GST1_PLUGINS_BAD_CPE_ID_PRODUCT = gst-plugins-bad
 
-GST1_PLUGINS_BAD_CFLAGS = $(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE
+GST1_PLUGINS_BAD_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
 GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
@@ -26,9 +26,9 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 	-Dwinks=disabled \
 	-Dandroidmedia=disabled \
 	-Dapplemedia=disabled \
-	-Dgobject-cast-checks=disabled \
-	-Dglib-asserts=disabled \
-	-Dglib-checks=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Dextra-checks=disabled \
 	-Ddoc=disabled
 
@@ -87,7 +87,21 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Disac=disabled \
 	-Diqa=disabled \
 	-Dopencv=disabled \
-	-Ddirectfb=disabled
+	-Ddirectfb=disabled \
+	-Dcuda-nvmm=disabled \
+	-Dhip=disabled \
+	-Dlcevcdecoder=disabled \
+	-Dlcevcencoder=disabled \
+	-Dmpeghdec=disabled \
+	-Dnvcomp=disabled \
+	-Dnvdswrapper=disabled \
+	-Dsvtjpegxs=disabled \
+	-Dtflite=disabled \
+	-Dtflite-edgetpu=disabled \
+	-Dtflite-vsi=disabled \
+	-Dvmaf=disabled \
+	-Dwebview2=disabled \
+	-Dwpe2=disabled
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
@@ -476,6 +490,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dswitchbin=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TENSORDECODERS),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dtensordecoders=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dtensordecoders=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dtimecode=enabled
 else
@@ -512,12 +532,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dvmnc=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M),y)
-GST1_PLUGINS_BAD_CONF_OPTS += -Dy4m=enabled
-else
-GST1_PLUGINS_BAD_CONF_OPTS += -Dy4m=disabled
-endif
-
 # Plugins with dependencies
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AES),y)

-- 
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
