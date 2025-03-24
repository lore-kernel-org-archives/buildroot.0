Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C70DC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 16:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 718864089D;
	Mon, 24 Mar 2025 16:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9janqs1s72X; Mon, 24 Mar 2025 16:26:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2403C40759
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2403C40759;
	Mon, 24 Mar 2025 16:26:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF7941B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDB2C60BA7
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jdne66wG3Rt3 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 16:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.183.28.205;
 helo=mx08-0035d101.pphosted.com; envelope-from=gilles.bardoux@sagemcom.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FF8860AE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF8860AE8
Received: from mx08-0035d101.pphosted.com (mx08-0035d101.pphosted.com
 [185.183.28.205])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FF8860AE8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:26:32 +0000 (UTC)
Received: from pps.filterd (m0166232.ppops.net [127.0.0.1])
 by mx08-0035d101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OEU2iZ012636
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:26:30 +0100
Received: from paup264cu001.outbound.protection.outlook.com
 (mail-francecentralazlp17011030.outbound.protection.outlook.com
 [40.93.76.30])
 by mx08-0035d101.pphosted.com (PPS) with ESMTPS id 45k3ej8b07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:26:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FC1PcLf/8QonIckswYEZDOXCh+dFiBtZSvI6DJ6xAYWz4jtMnK31eU6S9G2xgdaFFSUlaOAZ903zsZfRkQ4jwHXjJKWhyGjpulvAPiUHiHbOLQzgsCZrfW7yAYpDF0vxk1Lc417nDrDFWNJy+YQ0pCuPbwYEp3mQ9OKCkMXwkAbSb5FTteLCOcaflju0n0ZqXB7xnP9r/CGTW2X+4s/qVpX3Hs6UmPHQds20+9QgXWAn7ExHBvXungbB5OgqpxHRKRhOpo7AkNJBXzNcreYthUDAdLmo/gXcYp/tiJ53HWlmcCp5Bjh+/URXFbagC8tUGK6r15sJs+7j0vTha0JATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REMl6mR9eq/cnGAjyOEZE+yufMi4bZ9ZgkW10ms/bH8=;
 b=agUBgJzxmwGR8kYiBsbpR1yHZ0K1dbqpBS3rQEl3jv38z9LBDQdAM7gciVCHGn/DDqtr1W1L/Ujnj9sALMvyhvsnm2byFSTUmR5aHnsFpSBNIBuuPA5/SdDIZkaTo4RBbDGbZFViGsUJinK8g7Em0Zu1xAw5TV82AEYNNthp8Lw0PBYgsfgPrgPtk9jB8DLzNprnLrOgxW7q8jHZpz/dOxUBVbTD0u/ZitFZnUxylpllEOK8Tvxdf3eY57z+f/db6nHMpl1eDjAf8GPuHkCCwLCLChUjnEeLZsqoXrP44LYFyx4pVZRDtj5sqByJ2X0KpCeOcSR3GPP6auiTb6xAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sagemcom.com; dmarc=pass action=none header.from=sagemcom.com;
 dkim=pass header.d=sagemcom.com; arc=none
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::9)
 by MRZP264MB2492.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 16:26:26 +0000
Received: from PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1]) by PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5e6f:3831:f41e:93f1%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 16:26:26 +0000
Message-ID: <a7492951-7d08-4509-8243-c2b9e9b1dfef@sagemcom.com>
Date: Mon, 24 Mar 2025 17:26:25 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
Autocrypt: addr=gilles.bardoux@sagemcom.com; keydata=
 xsBLBEjzGhEBCADAVAUqhr9fIVZnh2OlH4+IMEcEFuLP4vZUAUmhZ6n44r1PsAQ9GVYm1DJb
 8p41JRRC4BIfyHtL5A7g4JedYlSEI/NYyPK+r2swpms9lJ24wL5XpNfYP+h/WmWwY48lw9V1
 6pIiZB2eT2TzFH3q2DYXy4HK2zOvxVOScXev4vnlr6l4lNvuCre7R1iyPEQDpAIgGuIZogkK
 32N7A8RmhaCIgxD4Dd/zPwPIuI/ZYHeB6m4sFWtlChsyPfuWjofvdEcyDOFx+isCnta8dKPD
 h1bAoN4jLrevGVZWwCVNlPEZ6YHSxro8wqGhV0Giy8BZfiERpu/mlbzNxq1NEfQfLbdxAAYp
 zTdHaWxsZXMgQmFyZG91eCAoU2FnZW1Db20pIDxnaWxsZXMuYmFyZG91eEBzYWdlbWNvbS5j
 b20+wsByBBMBAgAcBQJK3FkLAhsPBAsHAwIDFQIDAxYCAQIeAQIXgAAKCRBucG6QhnQboUNo
 B/96YqjKnD5q53ZKYtv2FsAR4gNoLAjiK6KUXkgpZQearLM5TVRP1Vo2/T0Arehy+gHBJfmu
 d407CjmXIK/vKBFUtufVniUKyn6wfp0i6rdBerSsdx6cMDS4TLUfigR1QWPaBe0KrhyhUkFT
 XpanscgHA99zyjzEAZDNK9g5O1qGHe9CevZDAd8OTK4PAMqA8+sRJIHkMnGwUdI1usPoGTwO
 Xt/mPm8jvOZVKYyS0frzxUNEC208jxeR1fpPHb0BU+Z6LXbRKYL8M/ZbkawJskyeMRqkIGcW
 86wk4EXvQRFBhtpg1lBFkKf8RKadkjV1cH6gHnBdQ0pOjU92dII9VVM1zsBMBEjzGhMBCACf
 Jg1c+8U74IxG91wxhC+7j7Xs25r4mbJQs8NclZn16GUd3yykqw4VscNMSWHomXT3j6Q45QOa
 nzry38NYi768fNDYRqVZPrTjE2oUkas8uq9CZp+NYj/vMkjf2V+wi29XZ8LE0Yn+fpb9DORM
 4hZe/DEKvAIfC9O+9UyymoNNoxuPXg4QlYrbnH8uvnexhdxYLUQwEO03z38vMHVZQqILJiMD
 mMenzrB1990ij+fmOyMaNwqulNcAZGZ4ltfOOBwxpSK5yhvyHGf8oVc+EdBqzYzweyPMZ+NB
 VPAj4Wtl5yYJYUqET8cec0A9QCtMokHUV9+DJVhQ8dUOi0UUnjAVAAkBAcLAXAQYAQIABgUC
 SPMaEwAKCRBucG6QhnQbofhAB/sFZJZakJk9ARegRDk82OG7Cf/2oooK3NboxQUK9OI48nvy
 6ow+JfRkBHYfId9HbGP31ca94p1mkJoI/2wwo0KzSm7ke18pglHVe9PIvs9hiUQZd6D56nlO
 6mqnd5MTv5PN7hesjwmZYTT/S3xkzw/4nEcENBKK5B7V7JT5XydyM9YW/I98M/tWPt4DfJfZ
 VvMYpOZkiDGK1UJJCQwNdbfNR+XbMSLov98Nl+QAu3tbwPrFzDolB37q+l/sYMvXXZ89KPft
 qK2Am9oTKflG6Z25wrIQqxkEb/DNbcz9McOvVRqIoxIsMYUmv6bB7p8Lm3y5Nbfej2G7+MgB
 UfWmTKcF
Organization: Sagemcom
X-ClientProxiedBy: PA7P264CA0253.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::9) To PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAZP264MB3183:EE_|MRZP264MB2492:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8b8f47-4b3c-4aee-b37e-08dd6af09fb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dG1XeG9ISVgwKzREYmQ5YURWR2dCcU9xQzkxYUdkRmJaOUZWNnhILzcyT2dL?=
 =?utf-8?B?UjV1RnpDcys5VUtWTjkzMmZ6b0FUTVQxUTA3eTVKdUczazQ5V3IwZTc4NjRn?=
 =?utf-8?B?bUZkekROZ2UvZExqMk9iMGxTYkN4eDV3ait5QWJseGxZSDBlL0RESU9nY0tC?=
 =?utf-8?B?TmVUbW9kZjRLTkU1VnVTYnF1Z3ZCS2ZyT1VmQ3poemVCN0pJRmhHUnZScVFs?=
 =?utf-8?B?SGh4ZkJEN2VNbEc2KzFidmZyRmZ3Q2FQVHd2NUZ3NW56dXF6ZmQrQVhFcTlk?=
 =?utf-8?B?TzFXSWlxNHBYbzlMczFINjRUQzZaR2xYYWFqblA3NlVnMHdoVWx0NFBHa1Z0?=
 =?utf-8?B?VFNRUWJxd1V1MXYvMHlCKzlxYUVneHhvUTFMQTlaZXRaQUJaT1N6eUJhVmFy?=
 =?utf-8?B?ZmhJQVBjMlJUSkI1c3pjYnBaWENJdWh5VjVKQkZjdHVhd2s4RGdRYzBNVWNT?=
 =?utf-8?B?a3VSZnAxM3JCUGVUajUyb21jRVVDTWFBRHhUTEQvdWlzMlJrOUZrdldHMitZ?=
 =?utf-8?B?SlhtSlQvb0QwRUg5Y28yYW5jZVRkM1BrbkNKMUZTNEttRS9nOGsxNGE0OHZr?=
 =?utf-8?B?UUcvZnJKZDR1cTc3RmRvTDlDaWpnemlNYkZmcXg1TUdWWGlHaUhIYVgwT2hM?=
 =?utf-8?B?OXdFMzdTVENHYkpTK2xlYzYzSjNLcU1Ba0lwbVowQUZMUE1DbXJlcVVpVHZ0?=
 =?utf-8?B?ZUZhM1NMd1IzYlZ0RFlpMzRyK1I4alBxOXZVUDEyUnJBYlgzV01RQXVhYmg1?=
 =?utf-8?B?QUdHY1NDbXFiNGViQmswb0xndWJNTkt3TldXKzBDUXEwRFVESENWbHJtRVNi?=
 =?utf-8?B?RDlDVmQvV0Y0UlVYNDZ1emcvYjIyMmU4anYzbHJPK2M5M1hJUWNtR2JLa0Z1?=
 =?utf-8?B?dDA5MkVqelJvM21BUkQ1QU1sdWR5NjFHakF3eFY0S3lURVFLcTgzR2xXVWht?=
 =?utf-8?B?NGpiaGN5TkpvaUlTYmx6L0Q3TURYNjNyZkhKd2szNTNIbE42RXNWSW5tVnli?=
 =?utf-8?B?WnZmSVZXdlU5bDVHS3l6UVkzK2NNV1FGTVdFVkRZaFdtcXAvWjBMUTh4TFdP?=
 =?utf-8?B?eGNkektLMkJuY2xkclZkemFzOGdtNkxaMVVZUkVqV2pWRUZPbEFYTzdaaDRi?=
 =?utf-8?B?K2RGM05MNnFoeVlZOFlwaWtpei83VTJHVnBQck5vZzQyVDJYSmVmdFBsOE9P?=
 =?utf-8?B?blVmMkxVKzdxbnZjMkJ4Z0l1RnJnZUh2VStBbHlQQTU4MUt0aW5HYnZlTTQx?=
 =?utf-8?B?T29rK2NzenlEL29mV01nS1d1Qyt4WFNmckN5NWRha0Jma0VlWnVFYzVHdTY3?=
 =?utf-8?B?Um40c3hsQklkZFpLTmNsU3JyZVExYjR0Vm5yNzA2VXRKYXhySTVkMStJVzhB?=
 =?utf-8?B?RE10K2R6ZzNTbG1WR0JFU1F2M01Vd3M5dStSbmY3amRmVzRzVjltdktyQUN3?=
 =?utf-8?B?NGxScWQ5REpNK2xsN1psRTFwMVZ3dmpVVWE5eG4xYkJrS2c1RmtRMkRQczND?=
 =?utf-8?B?cjlLYjhSNlJERGx6aytTSlo4K3FGbTdHWUZnVjBmRW9pMmJ2T1luOC8vUTZZ?=
 =?utf-8?B?dk5rZjRKVFRZcXJUclo3dThMbVdWREFmKzNnb2ZZUmU1QmNoWE5HQ2ZFV0lU?=
 =?utf-8?B?Z1NOZGx5cmpUVzNCdFBRYVFqdUtzQ2xCN3drejIrcXU5K0tBVi8vanpLcDNL?=
 =?utf-8?B?NlBkbEhSSXFnY1JtcHV0OC81Rzg0UGcwSDV1ZnV3b3Q1Y3dMcXdZc0RicWVQ?=
 =?utf-8?B?bmtsMFBTbTFDOUpiYzh3UnNjcXVJZStwMy80Z0RYdGtHcmRGZitPWHVxcitX?=
 =?utf-8?B?K1VZR1FpSHRsYTVVTzNVQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlVRanFRNjBJdHZVSkFxOW8vL2hQdDNyallxby9UTnZlOStzY2xxaldFTVd1?=
 =?utf-8?B?ajhvNmROZWJCbGtGbWpQa3UyTlA5QzU1RkVqMnZVbDVpU0V6YWJJUGxlK0hu?=
 =?utf-8?B?enRHN0xycTFRaDBDRUpnYkIzV2lGZ01vVFhnOWMrVTVDN0k3eFFOb0ovTWI0?=
 =?utf-8?B?MUdmLzJzSzMyRGMya2VGZ0FsVUhRbmYyT01lWjVMVlF5b0g1TlNWM2tHaTdO?=
 =?utf-8?B?NmtYWjBBMEI4cE9JT3JJOEl1ZGwrWTFhNWJuaE9BMkJZb3h4VDdYT1FSR2ZR?=
 =?utf-8?B?a212MHpZSEhTN2VEM1ZNMHlZM3hlVk93dlV6RjRseTAwQWlJVk12Q3ZreXQy?=
 =?utf-8?B?UTdxN0MxTnFyRDBsd2JFN2J4Tk41SFpHR2VLRGVYYkZxZ0c4eHJCRmQyUE5P?=
 =?utf-8?B?THljOEZxK1VkS2kvOEJ3MVVSd0RkRjVjcjltdUFTTGlUMVR6U2drOGtraUFk?=
 =?utf-8?B?ME1FZ1FUQ3VlZUJBNld5bVlYeVY1b0laV2hRRjlnNTM3MncwYzc5VFplTGRv?=
 =?utf-8?B?ZVI4eUNsN0dGejhneFR5czFrRTFERkhTOEdTc1JmalhCU3JTYWkrMWtsKzB0?=
 =?utf-8?B?dks4YkY4SkRSbCtJd2c3dWhzZmxjb2k2d0lwaEl1TWFPemdBcHJMY0xXQzEz?=
 =?utf-8?B?RVF4dkhDK2FBeHp0R0pYVGJlRDNML0FrdmNvaDVySmRsaGtRV3VpS3dOTWFV?=
 =?utf-8?B?YzU2dUVLU3BZNzlqRnUwWUtZZzA2a204Zld1ZkhVWVpMMFV5dFA4SEFuR3JC?=
 =?utf-8?B?ZmsxaXFSdDE2M0pZNENiMm1HRTV6R3NuQkVORnE0VGtRNEdCUHowUGs2aTJH?=
 =?utf-8?B?M2hUNmphdXdhUTVkMmsxTEdzUE40ZFlCTTNuQklnUkdqOHRvUnc2c0J2Z2dS?=
 =?utf-8?B?RDY5R0ttdWlaa1VrODNQMXlyRmNOSmxnQ1JMSWNMZzhiWDQyMzVlRFhyVEJr?=
 =?utf-8?B?bFpJdkZ3elZEdG1MSEVHUHpoQlpWQ2dzRVRQRkJQb1M2RTBhOFNJQ3NrTmNB?=
 =?utf-8?B?Ukk2bzdNNUFhN3Zmd1FmQ1VzcG1ISk9HZE9VRW45UVZJT2xLQ1JaUkwzaGNL?=
 =?utf-8?B?cFFBL1JsZXoxVE1zZWROVGVOVVZmSnN1VXBJZGFhY1o5OWVGRXRidjdUdGor?=
 =?utf-8?B?dE5qR1ZzRndUWWZTUGNnWC83aC9HQkd4ZFErT3V3M0F2Qm5lNHdzV2R0Ynp2?=
 =?utf-8?B?NFdNb3JtcVoyOHhMd094OWJmVFpJUFMzbndIQ3RoSkV2dC96T1o2L3VCbmp5?=
 =?utf-8?B?dUtzZzgyY3FnR1ovVUNEOHVOVFNHempuR2tOcmRFMHlVdUx2WFFnU3VGNGNC?=
 =?utf-8?B?SVByM2FmRGV4Umh5ZmF5ODdTZFozTElRNldEQlRrZk9LM2FmdlBOQ0V3K0tX?=
 =?utf-8?B?QktlblZYblk1OW8wc1d0SzdtTUtlcmZlSnBoSkpqU0VFdG5HRXQ4TlVvZU1z?=
 =?utf-8?B?b1ZBSEU0S2pmVUN5S2Ivd2ZOeEtOYzI1YTFvRFBhckpiYll4eVQ4QXRkVVY5?=
 =?utf-8?B?dFRLL2xWQWVydnA0aE1CU1RWcWowUlFpSUxaZ0MvRk5tRDMzWUZqdXlRN0pF?=
 =?utf-8?B?QTFCcTRuam9YcVB4MzdoRXNmYml5UU82bUQ1M0ltTHE2c2tFUm1BNFJUVWFV?=
 =?utf-8?B?ZXJ0cktUck94TEwzZ1lLcjVndlUzV0RqczlrTWp2aFRXNTg5TkFubFY1L3lP?=
 =?utf-8?B?akVlV1ZRV04za2tpVlZxZVFCRWU3dVA2dEVYTWNRZVJZUWZhUjdNVFgrKzhZ?=
 =?utf-8?B?emN1TXlnYWUrcTVXMU9yT3JMdDhZc3JLSDh3WHQweFFGdGQ1RWNqdjVaTFUz?=
 =?utf-8?B?VURoZ3VxRThRQVdkYU51dXczQzQxQmtoTDJKZithNmN4K1NXSU5KWGhpbHk3?=
 =?utf-8?B?ZVNhZ0I2SllnNksyV1dSbW5LMU0xL294UEtqSXh6ZXRKZ3VLTk0vTmh4dC9z?=
 =?utf-8?B?TmtlY2tqcDFjSHlYbExxWDhGMHhvd0crUTBEbzNKYk12YnM1dHc2RmIzb1J1?=
 =?utf-8?B?dXBYOVppb1JMdEV6YmlvUWgwTzluSHExaVVna0xlNEhTcDBKQ1IwMDBrOVcw?=
 =?utf-8?B?YzRQM1M1UkUvZ01FNDRQUWltZ0dqejQ2UGRiVjRlZWprYzZvbTNQc3dCZ28v?=
 =?utf-8?B?WTBsYllRK3JGRjY4WFNncDR3QzQ1a0QwR0k0QzdKbElsRDJmTERnZ2ZmWW9D?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: sagemcom.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8b8f47-4b3c-4aee-b37e-08dd6af09fb2
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3183.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 16:26:26.1817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f9ffeb1d-70f1-4c2c-b7e6-d080242df8d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dmmRazg2whJGI85aV0pnR3VAWXPkvTtM1CyG6mnDhSFi+9c2qbVqQBwrJEDjeFg3AD6bN2Fvp+nmb3C8LY2k47swHRRNsYTwAi0gBHNZRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2492
X-Proofpoint-ORIG-GUID: Lczw1PFNE3FK8eOqi315-WcNRDDFBzGC
X-Proofpoint-GUID: Lczw1PFNE3FK8eOqi315-WcNRDDFBzGC
X-Authority-Analysis: v=2.4 cv=A/lsP7WG c=1 sm=1 tr=0 ts=67e187b6 cx=c_pps
 a=NZNHP/h0LOsy2fOF9GDJOg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=cWJNfkV6-HgA:10 a=HbzeB9StAAAA:8
 a=Yh41P-WkAAAA:8 a=yAcR8KIbhqQ2j1wF7RYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=i9oqPCtDvve8OcjLCTCP:22 a=t-YQpmI8WX82GxrYqon6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom.com; h=
 content-transfer-encoding:content-type:date:from:message-id
 :mime-version:reply-to:subject:to; s=s1024; bh=VOTfaKUH+XnmbNEf7
 Sj/pPrnm75oQnijF8ViBqeTMBk=; b=B1geKWFs51+9chw/kKBL4wkuQMN6YjyPw
 gIcreVdC8ska5pvhfu3YvYa0SnsuYsKDu70HFIQlsC9D664IdZ7Zhx/2z9wKqyjB
 AIUxtGRgFnpf3NwagXY/qpQmdiuLVl+x6rE4pVMW6yezwiRHl6ceu4csUyqXDCsZ
 cIX4BvnU8iC0DyoyNDbIkRcleXUfLxOrLtUMrN7UfOVF7sBsGYnaDJ2pMHd8Ah42
 Cs0AnVSwjXopCH2Wv0UyXYDGBJRABeKMN0q25bfmwMJ5a+TcZdYfszRTHngHP82I
 2i+L/Xtvv4V7gzbJ/CLwsD7TbR9lDLi+AQquKNOpl/Icw+0BGkxAQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sagemcom365.onmicrosoft.com; s=selector1-sagemcom365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REMl6mR9eq/cnGAjyOEZE+yufMi4bZ9ZgkW10ms/bH8=;
 b=ZKOFPKtmyMoc3Lq+z4vZstYB/jujAYGjH/wdTw3rqBu0gwKJE75pNO5NX7clpLxR8VXG0NCbXWMNDFWqeCh6cjZs6UqBxbdYNFkNqZzd+VbHoMaZ2X/yG9f9epZlwihybex+g967Oa3TNgur1gNext2Hm66QnkHaPo1PqObK+JI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sagemcom.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=sagemcom.com
 header.i=@sagemcom.com header.a=rsa-sha256 header.s=s1024 header.b=B1geKWFs; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=sagemcom365.onmicrosoft.com
 header.i=@sagemcom365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-sagemcom365-onmicrosoft-com header.b=ZKOFPKtm
Subject: [Buildroot] [PATCH] package/python-twisted: fix cpe id vendor
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
From: Gilles Bardoux via buildroot <buildroot@buildroot.org>
Reply-To: gilles.bardoux@sagemcom.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGFja2FnZS9weXRob24tdHdpc3RlZDogZml4IGNwZSBpZCB2ZW5kb3IKCnR3aXN0ZWRtYXRyaXgg
aXMgZGVwcmVjYXRlZCwgdHdpc3RlZCBpcyB0aGUgY3VycmVudCBjcGUgaWQgdmVuZG9yIGZvciAK
cHl0aG9uLXR3aXN0ZWQKClNpZ25lZC1vZmYtYnk6IEdpbGxlcyBCYXJkb3V4IDxnaWxsZXMuYmFy
ZG91eEBzYWdlbWNvbS5jb20+Ci0tLQogwqBwYWNrYWdlL3B5dGhvbi10d2lzdGVkL3B5dGhvbi10
d2lzdGVkLm1rIHwgMiArLQogwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi10d2lzdGVkL3B5dGhvbi10d2lz
dGVkLm1rIApiL3BhY2thZ2UvcHl0aG9uLXR3aXN0ZWQvcHl0aG9uLXR3aXN0ZWQubWsKaW5kZXgg
MGY5MWZhMjQ1Yy4uYjcyMTdkYTZlNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tdHdpc3Rl
ZC9weXRob24tdHdpc3RlZC5taworKysgYi9wYWNrYWdlL3B5dGhvbi10d2lzdGVkL3B5dGhvbi10
d2lzdGVkLm1rCkBAIC0xMCw3ICsxMCw3IEBAIFBZVEhPTl9UV0lTVEVEX1NJVEUgPSAKaHR0cHM6
Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzc3LzFjL2UwN2FmMGRmMzEyMgogwqBQ
WVRIT05fVFdJU1RFRF9TRVRVUF9UWVBFID0gaGF0Y2gKIMKgUFlUSE9OX1RXSVNURURfTElDRU5T
RSA9IE1JVAogwqBQWVRIT05fVFdJU1RFRF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotUFlUSE9O
X1RXSVNURURfQ1BFX0lEX1ZFTkRPUiA9IHR3aXN0ZWRtYXRyaXgKK1BZVEhPTl9UV0lTVEVEX0NQ
RV9JRF9WRU5ET1IgPSB0d2lzdGVkCiDCoFBZVEhPTl9UV0lTVEVEX0NQRV9JRF9QUk9EVUNUID0g
dHdpc3RlZAogwqBQWVRIT05fVFdJU1RFRF9ERVBFTkRFTkNJRVMgPSBcCiDCoMKgwqDCoCBob3N0
LXB5dGhvbi1oYXRjaC1mYW5jeS1weXBpLXJlYWRtZSBcCi0tIAoyLjM5LjUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkNlIGNvdXJyaWVsIGV0IGxlcyBkb2N1bWVudHMgcXVpIGx1aSBzb250IGpvaW50cyBzb250
LCBzYXVmIG1lbnRpb24gY29udHJhaXJlLCBwcsOpc3Vtw6lzIGRlIG5hdHVyZSBjb25maWRlbnRp
ZWxsZSBldCBkZXN0aW7DqWVzIMOgIGwndXNhZ2UgZXhjbHVzaWYgZHUgb3UgZGVzIGRlc3RpbmF0
YWlyZShzKSBtZW50aW9ubsOpKHMpLiBTaSB2b3VzIG4nw6p0ZXMgcGFzIGxlIG91IGxlcyBkZXN0
aW5hdGFpcmUocyksIHZvdXMgw6p0ZXMgaW5mb3Jtw6koZSkgcXVlIHRvdXRlIGRpdnVsZ2F0aW9u
LCByZXByb2R1Y3Rpb24sIGRpc3RyaWJ1dGlvbiwgdG91dGUgYXV0cmUgZGlmZnVzaW9uIG91IHV0
aWxpc2F0aW9uIGRlIGNldHRlIGNvbW11bmljYXRpb24gb3UgZGUgdG91dCBvdSBwYXJ0aWUgZGUg
Y2VzIGluZm9ybWF0aW9ucyBlc3Qgc3RyaWN0ZW1lbnQgaW50ZXJkaXRlLCBzYXVmIGFjY29yZCBw
csOpYWxhYmxlIGRlIGzigJlleHDDqWRpdGV1ci4gU2kgY2UgbWVzc2FnZSB2b3VzIGEgw6l0w6kg
dHJhbnNtaXMgcGFyIGVycmV1ciwgbWVyY2kgZOKAmWltbcOpZGlhdGVtZW50IGVuIGluZm9ybWVy
IGwnZXhww6lkaXRldXIgZXQgc3VwcHJpbWVyIGRlIHZvdHJlIHN5c3TDqG1lIGluZm9ybWF0aXF1
ZSBjZSBjb3VycmllbCBhaW5zaSBxdWUgdG91cyBsZXMgZG9jdW1lbnRzIHF1aSB5IHNvbnQgYXR0
YWNow6lzLiBFbiB2b3VzIHJlbWVyY2lhbnQgZGUgdm90cmUgY29vcMOpcmF0aW9uLgoKVGhpcyBl
bWFpbCBhbmQgYW55IGF0dGFjaGVkIGRvY3VtZW50cyBhcmUsIHVubGVzcyBvdGhlcndpc2Ugc3Rh
dGVkLCBwcmVzdW1lZCB0byBiZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgZXhj
bHVzaXZlIHVzZSBvZiB0aGUgcmVjaXBpZW50KHMpIG1lbnRpb25lZC4gSWYgeW91IGFyZSBub3Qg
dGhlIHJlY2lwaWVudChzKSwgeW91IGFyZSBpbmZvcm1lZCB0aGF0IGFueSBkaXNjbG9zdXJlLCBy
ZXByb2R1Y3Rpb24sIGRpc3RyaWJ1dGlvbiwgYW55IG90aGVyIGRpc3NlbWluYXRpb24gb3IgdXNl
IG9mIHRoaXMgY29tbXVuaWNhdGlvbiBvciBhbGwgb3IgcGFydCBvZiB0aGlzIGluZm9ybWF0aW9u
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQsIHVubGVzcyBhZ3JlZWQgYmVmb3JlaGFuZCBieSB0aGUg
c2VuZGVyLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IGltbWVkaWF0ZWx5IGFkdmlzZSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhpcyBlLW1haWwgYW5k
IGFsbCB0aGUgYXR0YWNoZWQgZG9jdW1lbnRzIGZyb20geW91ciBjb21wdXRlciBzeXN0ZW0uIFRo
YW5raW5nIHlvdSBmb3IgeW91ciBjb29wZXJhdGlvbi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
