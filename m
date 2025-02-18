Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D22C02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 05:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3007D60F69;
	Tue, 18 Feb 2025 05:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0UD2YCNyQxE; Tue, 18 Feb 2025 05:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A39860F8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A39860F8B;
	Tue, 18 Feb 2025 05:56:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5B8968
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 05:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C162360F69
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 05:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJ-DllpGTAPO for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 05:56:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2413::608;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B65C060F8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B65C060F8B
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::608])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B65C060F8B
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 05:56:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRWCfBsdLX+c2YZONzzTjh1GAFWtuVjqdnGSYcjp4B+7T7G1uzUQF9pqw2mukIzpNIHz+bFkzjCjz32EMi/IIpV435fjzWVQTVCrHuHga25WFM6HtwYaYQ7HFKabSoXCHvgKucOdhhGULE/HLKzwO4k9PFC8tJ289n+jI32j51hOvwNouY/aBulJQ8ScZWC8XS0vqFXA3shSUSSnK4ryI8qsrdYjCH+ZU0diF8Ap190+Zbw8y6qyqcCs/PQkYPY0j9VytDRPowdP1Su9Px4ddxdVmLQrSzaTgT1chxjyGV1QqtnO7mgN8f+/ubrrWXQjWd0EiMJB2gDF4Y2u5X9IhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nFQvVDJs47DTxRP1YtPzR8V1NmmlI6Xd4fG95dwW1g=;
 b=PXTFkLZkDqPvMqqAXnZA6+nl0Kh2IpcZ4qm2emQFGbNAsnP5goVGtYz6z/AMm7JA+TdMwnJlksD7fOlrgIL7T81J0sjQ9auNzOtuqYwbVU5MDwEG/E4Lf1S6J/1MVRcsGCp+qaAkOtPSzO0H2phGh1j+KAy1TnIlYk3PHDuMy2tKDDqFMUnKnIPgLbvASsqWZ/i+UKU2ZkJss4Vo/gheyfmQFxt0r8LVvEaXwt4HKR9QujygOfxAOzSkiPxVWorsIK9IUKZ2XyNNzLTpXJfF+q6c4BGmFkoMqLGtZLSKYy+6PV/I8rRSJfbuwIgGl4tDe41SVYxVl96x+OGZMRIYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CH1PPF931B95D07.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::619) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.21; Tue, 18 Feb
 2025 05:56:38 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 05:56:37 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v3 1/5] package/binutils-bare-metal: add
 multiple tuple support
Thread-Index: AQHbf6kyWn7uMT21M0acf/GM+lz6bLNJ5qaAgABOhdCAAQXlAIAAHcQggACrLICAAI/7oA==
Date: Tue, 18 Feb 2025 05:56:37 +0000
Message-ID: <SA1PR12MB56157DC145A9132AD77048DEF0FA2@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
 <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
 <SA1PR12MB5615121EEE77BC29889A29D8F0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
 <8e84d75f-32f7-4095-80f9-0c1279d3ab10@mind.be>
 <SA1PR12MB561507917041F98A96EC4044F0FB2@SA1PR12MB5615.namprd12.prod.outlook.com>
 <940016c1-23aa-4a59-a168-dcc6ac5e144f@mind.be>
In-Reply-To: <940016c1-23aa-4a59-a168-dcc6ac5e144f@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CH1PPF931B95D07:EE_
x-ms-office365-filtering-correlation-id: f549dda5-ac4c-49b9-3a60-08dd4fe10226
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?bEp1bHpxTFB4Y1pSclo4c3FEOGJ3TnZkTGx3SDBFemxtam5EM0RYZ3JzMlBT?=
 =?utf-8?B?M0NubmJBZU5jVGxsN2NpMHpRRnM3ZXpQem5rLy9nRmNqWndVbFJydmk4UnBo?=
 =?utf-8?B?Q3BhQzZBTmdtYXA0L1BsdmNadDk4Q1ovN1kzNkgwYkNxQkhLZ042ZGlRWEFK?=
 =?utf-8?B?d3E4QkVjbTJycEZHRmJsRHhLemJJckxvNWdzR3VZT3VCSXRZMVU4UGxvZVpT?=
 =?utf-8?B?YTAwc1hyRG9hQ1ZzbjFxRFNMVHRBdVpkY3BvTGJ5ZVFZeklXTnJVbVZqZ3N2?=
 =?utf-8?B?azJPRndldE9pWGZmWnl2Q1BZT20yOG1vU3ljdnNpTTFhaTZQazNjV2h2eXZT?=
 =?utf-8?B?SnljekJncVpYVnJJTjc1WGg1d01aTTdpV1hwSmZDMDZCZDhOVllHZ1hRUVV1?=
 =?utf-8?B?ZUhTdWQ1QnFJWlNoVklSOGxTWTJvUUtOMEs0dkNCVHRKOXhWTWtjS3BtYlFF?=
 =?utf-8?B?OUYvaVo2RS9WTG1lZ2VacXE4QkNRWjY0dVJQUi9WVnFKSnkzdmhiL3YrczB2?=
 =?utf-8?B?OXR6bGNQNWRhZXpzZi9PN0xOcnV4bk93QW44SFRmL3F6Z3VSVHA5aVpKMjJq?=
 =?utf-8?B?MjMwV21GTjB3S09xeVdTZmdacngyOUVUbW5BMmlwU25PQUhpWVpEYVhiZUtp?=
 =?utf-8?B?WVl3Z3VZSWY0aml3TW5BL1dSYTJjMk9Ha1B0dG0xMmIyMHdQdDVjQW04YVEr?=
 =?utf-8?B?MElyR1U4N0Z3dFl0VmU4K2dnbEZUbkxsbFUwK3RrNzN0dVlpekJ4dWtKekdz?=
 =?utf-8?B?OXZFWjVLU3VCRkhXcFprbUZBVjZ0aFpDK0JpY1ZmdWdJcDVoZ0p3ZG1tMEJN?=
 =?utf-8?B?a2d4L2hWTXR2VHlyTGVBU05MVVM3VFFCZGF0YlY0UEF5bHUxWjVIUC9BYThC?=
 =?utf-8?B?Q0ozdVhHWlZCYTBsL1gySmJibmZqL1Fqd2kwckpaT2hsWlpwWWJJMGJhWXRL?=
 =?utf-8?B?bERudGVrNlR3Q1VNKzMyQzVqd09QNHdnMlo3ZlgyREVNc0lYemV2bGlDdkk0?=
 =?utf-8?B?Y1pBeG9EV3FWTzROM3hKMUl2OERDMWRhejJiQjFlS2xwNlZWZE5FMDhSaUh6?=
 =?utf-8?B?N0lLaitDNEQ0NytBNk1YUHJiT3JnekRGSkdhMjRybEg5cnlZN2VmOGxDNElp?=
 =?utf-8?B?Z2x6WlFUbFB3My9DWU1ubm5pdXZ5WGZxNmJVR1lsalE1djViNGtHM0pHSmxO?=
 =?utf-8?B?OGFUUitZLytTeGZacGVZZGt4OEFvL3FBMFZOZERaNkpVelpEWm9XWkpuZk9u?=
 =?utf-8?B?cjZ6VXVWUFBCQVN1NitiMUJRZWlnZnNIWFRNY2NFTHFPQjlQRXcvYzBsOTV2?=
 =?utf-8?B?S2FERHFETE5QTkMzcnJvR3ZNOEI5STI1S2JDb2JTdmJYUkxBYmQ3MCtsQjFz?=
 =?utf-8?B?NzlveWdhcHpONFRyYVozaGtBeWFYT2VYQmlmTmZ4S2xGbU1KRHhqOWcwTXNU?=
 =?utf-8?B?SVJheUhBRzY4K2JGVlVzUE1CUlozZjdmR1FCQkxVaUJobFErZGtNR3RUMTk5?=
 =?utf-8?B?Y1Ewa2xpNjVkd2ZjRDFBbHcrOU5VL21NbHZhUGV0MVpLOHU1WmdjcGVaUlBZ?=
 =?utf-8?B?SHZzMVA3TlhHZkJMZEVEdGlyNHgraC81cVUvRmR2WUgwVnoyYjNEOHc2YS9o?=
 =?utf-8?B?ZXNpSm8zTVB6WGE2N2N3YVdXcVNzdHdXTEpYRGt5ZjMva2xJNVZqcVY1V0dV?=
 =?utf-8?B?REdadHd5cjBnK3JBbDdyV1hyNjhZbFQraHgwYzArS0Z6RklJM0xLcTRkQ0pS?=
 =?utf-8?B?aHVLbFZNUllMQW5jNlE4MVVSQmpCUlF6WFpTVStnTkVKTVRUcEE5NG1BMzF2?=
 =?utf-8?B?WlJVeHl4NzdrWWxJSk5Ub0UvdlFuRk5UK0ZTVExOSEZkMTA2WnN6L1hXaGZ2?=
 =?utf-8?B?S3hwNXRpWXUxZ2plTlpCOHVLUldhZndlejlNTFIvTHJISXJEdTlBT1dpb3NZ?=
 =?utf-8?B?TEJoaDNmemlFZGhLWklFbnJJVi9HazJxYUM4SUpPdUk1WTI5QkNJT0E2clFM?=
 =?utf-8?B?WGpUcXo0REZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlZyZzdJYUwzaENsQXlueWx5alVVL3FtOXZlZjZCVlJGRzBQOU9KUWdHTWdj?=
 =?utf-8?B?Z1FSN0pPYngrMDZiSEpJMzdwS2c4QzB6L0JUQUIyNVNSd0ZBdjJRY2RJTXpl?=
 =?utf-8?B?b21LdzRHbXpXTTR2UkVmSWRWVmY3WFJ5UUxEaVpPSDlVL29JYXBZRllkUkE0?=
 =?utf-8?B?VDdRbjJoN0FSSVIzWlYxa3BVVlAzVmgxOXl4WVVpcW1IVzViaGNtaCtiMTNH?=
 =?utf-8?B?TWJpKzhlQTB6YW5ZQUdXUFhNTTFRRWI4SlBZdlFEYjd3ZHZjV1ZoMzJhUnVx?=
 =?utf-8?B?RlM4RzIyYW1QdlkxWGxPcVpOYXlQOEgxclF0NmcrS29ac0FTQ0oxK0Z2NUVl?=
 =?utf-8?B?b3BVSks1d24xZWtHb1NhVkYyR0JMdnpqQ3M5ZUo1MkNCcEpqNndMN2pQUFlC?=
 =?utf-8?B?eGk2NU1Dd2dOOTVtcUNycXQxN2lRNlVKS1lZdU1VYlFpeTlnRExtUldHcjUv?=
 =?utf-8?B?alQ4YmlUdW9oMDNZd3o3a0tTSkxjR3FiQlVnOUlrNHhBU0JtNVp3SENWWmxq?=
 =?utf-8?B?Q2c0d0NIRFVnSTNORXlNN2J0SDQ1NVh1amJmZFVQdzZpZWtWZzJIb1AzcjJJ?=
 =?utf-8?B?bFdETmhOSnZsclRQQSsvVjl6T2xYQVFQeVhSUkJ6a3lHaS95Y2IzZ0t4LzBF?=
 =?utf-8?B?aWJyTFhRYUxHV3ZNT2YxdnF4R1pLcGNENzVOSCtKL04rYWJQaXNyWG8wQ1JL?=
 =?utf-8?B?TXRadllKN1VVb2owRG8rZHpUdThYaXlDcGd3am9mbkFOclFDV2hkSUlmUHVB?=
 =?utf-8?B?REdqUXFzWG1qNkNUME5zUzNTMmt1dExiTTlmc01EREI0VFVuL2pUeFNtZllE?=
 =?utf-8?B?YTN5WGUvMzBYMFpGTUdocHEwK2RxNlhCNVdJR1pvd2E3ckxzTDQySjJ0M1h6?=
 =?utf-8?B?dEt1OU1HSzV1V1JkejhWeGNSN0FXRElXeG43ZEFLc3NGSEEzVXpOQXZMRkQy?=
 =?utf-8?B?cTJ1YmJQZjhEMm52NGVtZ0o4QWUwN09EZUpmb1g0M25iaWd0ZENPRG00RmF3?=
 =?utf-8?B?WTFhcTFiYVZuRVRkYnZxNlJvK21Nd3ordkd2VUZ6QzIxTFIwSzZIdzhoQVI1?=
 =?utf-8?B?cnZnSE9EVmZ1SHBDTG9BcWVlamhaT2ttRjd4NVJ0bGJkQ0thVUprNG1XeHdn?=
 =?utf-8?B?bk11Z01keS82c2p2Ukt4SE14Zkc1MnUrVzU4Z1lXNHJWNE5XTFcxczdFUHVm?=
 =?utf-8?B?c3dZWlR4bTNFUkdVVzFyMEx6cXJDM2N2b0E4aFg5ZU85UllMQkw4QkxqZE5W?=
 =?utf-8?B?TFNOdlJRUk8wZE02Z2F0eTdiWkh5OTV0b29IVHhuc3ZOaDFPYXJ5bkg2U1Uw?=
 =?utf-8?B?U0dFWkNYZERsa1dRT3ZraDJibDdnNnY4a2h1eUVFUTZmUitDdDI5MlRBaFBt?=
 =?utf-8?B?MHZoUTR1cDdNQmwzOW9QWXZuMHFZNVZEZEhnQWdRM2NOdXlscUE0SGNpTmhP?=
 =?utf-8?B?U24zYmM1dFpYcTBvUXk2YlIvQ0crVEZDa1hWQ3ExRVY3WFlzOFVYSk9mMTVx?=
 =?utf-8?B?ZTNHRTlGMU83aTU2Ull6bCtINWVCMkVoVlhYbWc4YUFlN251cG9yYWhmREhS?=
 =?utf-8?B?c1FxNW9Dd3poQ0JQRmRiRDNzZkpFWFFibDRWUGtabFdjTUJScDI0TCtDNWRE?=
 =?utf-8?B?UDl4cGZ3Nzl0ZnkzUldBUCtScUpBUTJ2eUZHa3FyTXJBdVJpMUlEbUI2SHlB?=
 =?utf-8?B?NFkwY0gyY2VZdnZHcXd3UUZmTFNXU0gvNDFVVFZTbEI1enNMUlNNOTRxTTdk?=
 =?utf-8?B?T01GeUIxRzlPYjlaZGQ5elIxamtjdmk1aXZ2aDkvdE4xVGxvL1ljYis4aGZm?=
 =?utf-8?B?dFIxUDlxekVzYVBHZDdwMU5vZndnaWRLTVRpdDFlYk1XNFpjU3kxNGNZUUxz?=
 =?utf-8?B?Sk5DV3g0T0pGNTZyUEVQckNMWHJFTm5keVFURis0VXFqQkx2R0t2WVBreWZu?=
 =?utf-8?B?UEU2R0ZMWGpWdEQzdGxpWEtEekNWTFEvb0V0aFNrZkNLUk9PK2gyNW0yOXVC?=
 =?utf-8?B?cWxad3FnWm53a2tUQ20rVFNxK1ZHeUJwc294RWYxVlkzcmhTRUphV1lBckEx?=
 =?utf-8?B?M3pDamtObllWRFRxWjZUTWJUN1hSOFlwODhoVzJ4NUltTzEzaUFsYlZScnZ2?=
 =?utf-8?Q?zUlw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f549dda5-ac4c-49b9-3a60-08dd4fe10226
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 05:56:37.8757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQIHhlNA/CisIsWrWXzX8uGsraYnUjNcw6JqZpTStZ45ewy/8cyq+8gCpWIIiByQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF931B95D07
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nFQvVDJs47DTxRP1YtPzR8V1NmmlI6Xd4fG95dwW1g=;
 b=qgZ5DGsxIqRLVg3TRkqXIIaAeQp6ufbujxBurya00Gouxw8vaGX+VPkGOjMxs6sSsVuAUEHzaDutYxLSE0TV7MQbnzzk73EvT5o7DCH/Kq+ADQNmeEeMIOXHmL8WeejvMAAJam6SY1ioUh/RKzLhWnDbfmEwFruMtCeCMaNgWOY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qgZ5DGsx
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/5] package/binutils-bare-metal: add
 multiple tuple support
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> CFLAGS and LDFLAGS are already defined as part of HOST_CONFIGURE_OPTS.
> Is this always the case?  And are they always the same path definitions?
> 
>  From what I am seeing, I believe we can do the following with the autotools
> infrastructure.
> 
> pkg-autotools.mk:
> 
> define $(2)_CONFIGURE_CMDS
> 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
> 	$$(HOST_CONFIGURE_OPTS) \
> -	CFLAGS="$$(HOST_CFLAGS)" \
> -	LDFLAGS="$$(HOST_LDFLAGS)" \
> 	$$($$(PKG)_CONF_ENV) \
> 	CONFIG_SITE=/dev/null \
> 	./configure \
> 
> Could you verify this?

>   Indeed! This redundancy was introduced by Thomas 15 years ago in commit 
> b07030a708293756e25edd6432ed02cc53ff758e. Before that, HOST_CONFIGURE_OPTS defined

> CC="$(HOSTCC) $(HOST_CFLAGS)"

> which is not actually sufficient in many cases because configure wants to parse 
> and interpret CFLAGS... So an additional CFLAGS=... had to be added in the 
> configure call.

> So yes, please remove that redundancy!

Ok!  I will do that.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
