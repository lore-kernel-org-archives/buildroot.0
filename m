Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D32CCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 09:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB034106A;
	Wed, 15 Oct 2025 09:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97-JPjpNJOzB; Wed, 15 Oct 2025 09:56:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3574A4106D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3574A4106D;
	Wed, 15 Oct 2025 09:56:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A47D94C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 09:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 964F940396
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 09:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOPMku-X7Qbh for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 09:56:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c408::1;
 helo=pnypr01cu001.outbound.protection.outlook.com;
 envelope-from=esakkiammal.murugan@iwave-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 512974005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 512974005B
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c408::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 512974005B
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 09:56:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Elfa5mtSazs4cae3f2D6fq0CY6HethTELq6FNu+WHZ4wz9U2+V0Ze/5IB6Ja3HzzOsnGfSobgx2oOqcaV4cv3J0VmRas3F/ubZNz9t6oZUOnia/66Yrdx9DS9woZoFwmDsQEX6030WZgvWwVWvRlmidE8nwqpxiHuOLF7dOGAXpijsNJJjnnCpc9OWVwJBUXAMn1MnvE+Bu3ZeLkcYv0hm1s7UGzHCyvoyMZ2LGNtJ/9bnDjUcT1XZDTDhXAhzvtmtQcsXQfOIrLjLia9iMuQTckjEcdHUTAxpiCqDwumg9sUgjS6fEIFz08HhivgdZSeaIyEwFwzMVupYylTy27yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMPuia3tp+3JfUAlBS7gLO8ok+uv6nz6j2vYydCEePQ=;
 b=oh9RX9axSCPA4BdWFBp9G3BTpyaflI4kF9PY8P14sVsT0UgHjr1rGf5arUnVF3kH4IELpfL27H4mEdNnshTzUukOyNfeMJ7DY7q5EbLTfdTbDkVZH96BHwn8F97BIMk5UGrxr4Y98tyVwq4zReGW9tzy0820HJ8iB1WkygU9/OsUAseaofDla0CiSH0zwf28kGUtMdDlILQ/4FUDd7H8/yaz2Jk/f768a9aLMPnNVOpqLl5jcamIWwT5Be8de8WWs8xgD/3zuegWHNX/b9BD6rgoiMq4dKa+ttluJVlW1gt+0rndl6FOXgo4hYNeQO0itShdeRIHMnk/oo6dy4lezQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwave-global.com; dmarc=pass action=none
 header.from=iwave-global.com; dkim=pass header.d=iwave-global.com; arc=none
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:122::11)
 by PN2P287MB1184.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 09:56:26 +0000
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e]) by MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 09:56:26 +0000
Message-ID: <45b0422f-620c-4db5-9a35-423466de2db5@iwave-global.com>
Date: Wed, 15 Oct 2025 15:26:25 +0530
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
Content-Language: en-US
In-Reply-To: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:122::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2448:EE_|PN2P287MB1184:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9191ca-68db-4204-6218-08de0bd11aef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WndJSmJHcmh3SXFubFRzY0tKcHBFZDRtb2JMbjVvMmlGUnVDWUNRU1BXaU9M?=
 =?utf-8?B?aEkvZ2NqOHloYTdFQ1R0OGg5eTdJaVNPUklCZUF4Z0w0WWRRNlpoK2ZaaTdm?=
 =?utf-8?B?N1VUdVM4emxYTU9DcERrUms4YUtJNE9QOXhGdUtYUU04NEN1THd4Y0lwL3BR?=
 =?utf-8?B?enhKa1hvaVB1NDQyUytmWXRvdTVTUFcweGZabWJEZVZieEdVdFE4YTNGUGE2?=
 =?utf-8?B?QUx6bmg0Ni9SbE1Ma2wyS25aUE5ZalJxWXcxTlcwZGtrTXg4dGpQdHJKSW5y?=
 =?utf-8?B?RTFZMGtWUzlHSU5lTE9wbm90aVQxdlJIdjVxVnZYeFlMdlpHYlFoOGFzRWZY?=
 =?utf-8?B?OXBHMjVRWmpYQjJDcVJJWXJJeW1ra25US1dibWZxbWc3aEs5eVlUbHBENTZS?=
 =?utf-8?B?OEYwNHBLMG90Z2lqOGxEYm1DZmcxdUNPT2Z5WDVhck1WUGx4MldzUi9LaUF6?=
 =?utf-8?B?WEo4WDdkdDdBcWZSaTN5aUpMSUJQT2x3N2x6TTloK2tjRDBsRlZJK0pQRHNS?=
 =?utf-8?B?Y1lwZHgxb2ZSUnZERWJ5MldqUmtwbWRnSk0wYVd2dTYrQVRtdVhWZzFkMkM0?=
 =?utf-8?B?K1RjL0doMDhJeVJEZDZMTERNTi9rWVVZK0tXWlE2SldFbjJabGZzdjMrVHFX?=
 =?utf-8?B?MlZQakFuRXRXbW5vUFVEb2ZOM2diNW15MngzMktEaHBsRjlrd2FhNE41QUZX?=
 =?utf-8?B?MTBnclJpUmpESlEzRHNHSTZvR09aSG1CUmgyTW1LbldrSlgveUZBVlZETGt4?=
 =?utf-8?B?UFZJNkZMaldhN0p5bW1RcTBBR2J6Qm9mN21IenZTZkVEbFBjWFV0N1c4M3RE?=
 =?utf-8?B?RWR4amZXNVh3ZGpIUVhsUkNXM3FQd21Ra2diUTBQSk5NbkozazNleTdtSkZu?=
 =?utf-8?B?YmFPSlZDckNWeHNYZ2dlVk1Fc1ZSNDd1a1ZOT3VwU09KSFU5WnFPWFVNVzRU?=
 =?utf-8?B?OTZaRnV3SUVxeEtiV3V6RHZwemZhZ0d4SC9vckJ1MmQ1ajg5OFE5bTQ0THlG?=
 =?utf-8?B?a1dPZzZ5Z3UxK01UV28vK2pxNU1IVERnQ0xjRVNWa2VUNkNsNjJ1c3VSNEcw?=
 =?utf-8?B?aFB4S1h4TkxqRVJtb2lVTEhCYzd4NERUclh6OUU1SFZJRk1wT0RZNERWbncy?=
 =?utf-8?B?MWI0akZiZ2xOTGxHUHZ6YnoxUVNnUTVNYUM4Nzh4TE1LU01ZcmNCUEdkT3I3?=
 =?utf-8?B?US9RL1dxS0NsS0RKdHdlZ09Yb1YxNFpqeDUrMUZmR1VSL0hVSkUwQUtpR0RB?=
 =?utf-8?B?K0I2SVVlYlg5Wnk4MzNVcW00NXlhb3U2a3dpa1VtWExUS044QWhwbFVLTmVQ?=
 =?utf-8?B?TWJ6UzFRclFQcFJnYndxWUN3ejhjTnBkQnhxcFRnSUROUmVUTVJlREN5SEIv?=
 =?utf-8?B?ZTlZY0pKN0lrQ2dsRjh0Q3d0SHlBWTZLSXMva0ZCNC82TlVFVmprSEpMaGZK?=
 =?utf-8?B?QlM3cTdHVzFoUGRKaVpnNHFiUEpqOXYzR0IrZU1kc0ZuYUFiNnNDamJlR0Fv?=
 =?utf-8?B?SkloZTBmS084MVFDU3Q1bzluUEFlVHhaQWlnMnNreG8xMG00UUdsL1FTT2cv?=
 =?utf-8?B?bytGR1ZzaERNREphenhMbDFnK0h5UDhtcGJOODJPOURzZk43Rjc2RDdnSS82?=
 =?utf-8?B?bGZyM0lPL3VoZ2hQbXRneDRNWE5zbkQvLzhNNzFXVW5raTh1WGVGTnNYUllv?=
 =?utf-8?B?MmM1b04vV3dURVNXZlA2TWlFNE45YXlUaU1lalNOdTNyamMwWFNlbmYzQmpo?=
 =?utf-8?B?VmhoencxVURiMG1vRlhzM2xTT3pzU2htYXFWbFEwSHlxWGF1TEUzWUtUbDdw?=
 =?utf-8?B?bjdva3lWbFNibVFWUUlCQXFrUXZTVHNmT2V0NHZsSzdhUC9qMlZ5N1Exelk5?=
 =?utf-8?B?OXNoeWFiR1A4elh3ajQ2UnNlYThBWFZkbXZOczZXZzFBTXZjNmZWdUdvbUFs?=
 =?utf-8?Q?R2jHCKHtBSh7N9d2svzL3yOP9XtP5eyg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0P287MB2448.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk1GUzMxdkpYa2dvbzc3Z1JJbTFKZzFCUjkvamVZSTdtRzFuVzk1NXI5VHJi?=
 =?utf-8?B?eU5RcUx4bE4xbmtHTjlER2NMWE5nOFAyS3k1QTZHSURVcDRwaVFhS0FaNE5J?=
 =?utf-8?B?clB3N2lPSEtuMjZFRzJHWlF0VWt1VGV2cFlXNkd5dS92YmZWSjVxVm9Dd2F2?=
 =?utf-8?B?Y0N4RGV0NEdSN2VTZkxPQTd6bkFsRGN1TzFMSnJJY2U2UXNYTmMvWk5aTEhq?=
 =?utf-8?B?UURwZDJzck1GamEzdDRzYXRXN3ZYL1VQWGVvSlRYWndqbXB1bzB1TWRrODRn?=
 =?utf-8?B?U040TlF1TnNCR0RIWmJNMW5QUUhXL3hxOEFlcGlZdlJqSFZYdEtwTk9iejQ5?=
 =?utf-8?B?Rmp4b0ViMDFWYkNTRk91d0RNZ1VjKzVCVUs3cjdEenR1SExnQ0o0VFowM3dT?=
 =?utf-8?B?MUJBSE4rK1MzL1RwaXllOTNlTExrQkVpMnUrWndmTmNWQTA0UTEyYlNzWEhI?=
 =?utf-8?B?c1FiditaMEcxdzM4SkxCMW85Tno2RW0zTFRMZ3FlV09oRjJFcTUyQzdRaHBn?=
 =?utf-8?B?bE50MFpxN3NSNHVneEgvTnVQaXhnWHJHdHIvMG4wNElhTXRYaUJOcmhhTXdP?=
 =?utf-8?B?YmJibHAxM2tPTzVTcy9WYkdmbXk3dWlDRXMyNTlEeTBGeWNQdXZ1LzM4ODdm?=
 =?utf-8?B?QXRKTVB2NGx2NW5GOFpRSDVzUzVyeC9zYVFlQzhVMjFDa1hLNnM1ZmhpYVZK?=
 =?utf-8?B?aHZjVTlaZ0lQODF2aG5uRHZqdnRNYzdWUC9lMkZ1WEt5VkF2VzhFa2kxMHVu?=
 =?utf-8?B?YUtjREgxaDBuY0gwR29SZ0RQM0ZiRDNCV2ZzTzZKYlNrL1lONHNFeDY2eU1o?=
 =?utf-8?B?VGZNR0U3WlhITnQvYjNOSDBQWktzMWNFWDdPWEt5ZlBDaTZiNjhiQTI0bUtp?=
 =?utf-8?B?UnJ4UksyMUlzVWxWZlc5K1JzdXNDK3htbVFhTHk4NXMyQnE2ZVdlcXlWNEU1?=
 =?utf-8?B?ajNjSVFzYUl3Q1pPTFhYME1SS2JtYTNTblQxdXorS3JYdmFuek9ZemdwTmQ2?=
 =?utf-8?B?ZXN1bXg2aXB1ZHB1a2RPcWN3ZUxKbmdWVzYwWlU2WXVub1dXaTJLZjcrMmZo?=
 =?utf-8?B?WE94dFlyU05NNUJBelZPUFMzeHdCTUQ5SEozcVdxSW5SVnV4QXZhSnA5RmJN?=
 =?utf-8?B?aGVjSzNQOUkxRytrTGkwdzQzZ05VQkpBdGJRVTNxRExpZW54ZGd6VVp5SXdS?=
 =?utf-8?B?SWNrRmtPUHNQU3VOM0Z0dzNEQUJxcWFGeEtobkJ1WWpMUCtuTWRVQXBjNFdN?=
 =?utf-8?B?UnlBVzlLY3Y4d3ZEU2s3ZStwWWFoSGhxR1d1aW9xUDRONDdYRFd1Y1BiMGs5?=
 =?utf-8?B?aTJoL3VOZjFxNFRJUGhGRWpwNEs1em1oclJ3K0IwWDd0YUtPdnN6L292SWFx?=
 =?utf-8?B?dk1lOTlzOHRmTlJwNG5yZnR3UzZ4NlIrdEYrTDRXNEF5Nm1ITnY2eTFSUGxJ?=
 =?utf-8?B?YisrbFd6TXJqZ3ZRSzl0RDEwNnI2SXV0ZTZrRVpQbzRPV3dqcS8yeGhVc0lh?=
 =?utf-8?B?UTlBY2c0a0h6ZmxkWDZFZEdXUENjWG9FNVRPVkVxeGM5Uzd5STVnbWh2eE52?=
 =?utf-8?B?bGVyb0FpNmNwTW8ycXQwMzcrZ0h3aHQ2cWxPSXhOOHBHMUtlSW1DSGhFNlJT?=
 =?utf-8?B?NWVtVkhVLzFPQ1FvWCttMzFYc2JhbHlkcUliSm51WUIyTU5GYVNjeEJqUzNJ?=
 =?utf-8?B?VHhTTVBSUlFwUnNhcDBBcUYrSEtqQWFXNEd2OTJ0dzVYRExlZi8xR0ZLczk5?=
 =?utf-8?B?ck1acnlQci9yRUtUVm1rd2Vpb1g3MkM5dURacDl6SDlGL3JyQ3hzRTdKZ1ZZ?=
 =?utf-8?B?aDJ5SEdwZ1RVdFh3VGxMNEFteXpHcW11bUtjVUt3V0dQVHpQVUpDRUR0Zm4w?=
 =?utf-8?B?SDFadFhxWlR5eHh3ZWFUT0FrcitlTDdvT2JRWDFUaXVxQlphZmpObDMvNFlm?=
 =?utf-8?B?eER4RTJtcDNmaDlsaW1Lc1hUTEJieU1ZV3VOM2JIdmlRWnNQemNOZWN4UVZ2?=
 =?utf-8?B?VHVFQVlkZ0dsSTVBalR0MCtWUVZ6U0Z5b2gyUUc5M1FsWHB2a1g3d1R5Mk0v?=
 =?utf-8?B?d2pwWHJrWUZXVnpGRTM4ZUV3MHpjSFVzaGVJSzFWNjJPZXpmMy94UkZ5bmlT?=
 =?utf-8?B?cFNrZ2tjNy9welVTcmc0V1haT3FsT0ovS1UwbUh1NkVaNWVhZ0lBcnFISWQy?=
 =?utf-8?Q?hA3BFsihYFxx5VCkwOpmYRE=3D?=
X-OriginatorOrg: iwave-global.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9191ca-68db-4204-6218-08de0bd11aef
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 09:56:26.3211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 507ae903-cc48-4d6e-bdb6-35278120a345
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTZbzY9V37r4zAWu0VxAcVr59CKrO72IUdWvmf1PNzhtC6kScDcwv6HK09YTnFjyt7TwmqmeJMe6FufchPSlirO+wJd0w2c9Jz8OOrJQ7qmC8aYLor7M6l6by0uZwbYA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1184
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iwave-global.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMPuia3tp+3JfUAlBS7gLO8ok+uv6nz6j2vYydCEePQ=;
 b=X/nKmIv4qheMMpPRFnQcqgMTfkOgvXZR3/tUdn4wjVnhfP0YXlfaUMXo5iuBAkHszxyQQGLX+pFDg/bYTcquD4hK/8humxLkhAKfhImM4mW0SejgS72WyyvNLAGss9BUCMrS5SLMUheFmUYdS7KbBUexh2FvLKnebBop+v8Qi1LLiQA2lbfKRPsUh0a0qOFKK/RDd6phgFvYeQkiJo5H8JUhpcup8mzA4FpgEqEkB4mAXD51ZW/7Yq6oAiAGWX8xGtBsuiSbbBdLnR1Uhteg9xXNWtLnse8UPCZfzgLKbuHa1UxsyA0JkGOKxTCOn7AP5qkMFvVbyq7ifBA34Q6dww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iwave-global.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=iwave-global.com header.i=@iwave-global.com
 header.a=rsa-sha256 header.s=selector1 header.b=X/nKmIv4
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
Content-Type: multipart/mixed; boundary="===============5585956501995049458=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5585956501995049458==
Content-Type: multipart/alternative;
 boundary="------------U7nZlOINMb5VzBUFb0R9AQC5"
Content-Language: en-US

--------------U7nZlOINMb5VzBUFb0R9AQC5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have implemented support for our i.MX93 custom board by referring to 
the i.MX93 EVK configuration.

git clone https://github.com/buildroot/buildroot.git
git switch 2025.02.x

make freescale_imx93evk_defconfig
make

Can you tell how port WiFi and BT for imx93 custom board.

Thanks & Regards,

Esakkiammal M

------------------------------------------------------------------------
On 14/10/25 17:43, Esakkiammal M wrote:
>
> Hello,
>
> I have implemented support for our i.MX93 custom board by referring to 
> the i.MX93 EVK configuration.
>
> I used the freescale_imx93evk_defconfig, and the board is successfully 
> booting into U-Boot. I have validated that the following interfaces 
> are working in the kernel: eMMC, SD, USB, and Ethernet.
>
> However, the following interfaces are not working in the kernel: 
> Wi-Fi, Bluetooth, Watchdog, SPI, CAN, Audio, Camera, and Display.
>
> U-Boot and kernel have already been validated using the Yocto root 
> filesystem, so the U-Boot and kernel configurations are confirmed to 
> be proper.
>
> Kindly guide me on how to add the required packages in Buildroot for 
> validating the above interfaces (Wi-Fi, BT, Wdog, SPI, CAN, Audio, 
> Camera, and Display) in the Buildroot user area.
>
> Thanks & Regards,
>
> Esakkiammal M
>
> ------------------------------------------------------------------------
>
>
--------------U7nZlOINMb5VzBUFb0R9AQC5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><span data-teams="true">Hello,<br>
        <br>
        I have implemented support for our i.MX93 custom board by
        referring to the i.MX93 EVK configuration.<br>
        <br>
        git clone <a class="moz-txt-link-freetext" href="https://github.com/buildroot/buildroot.git">https://github.com/buildroot/buildroot.git</a><br>
        git switch 2025.02.x<br>
      </span></p>
    <p><span data-teams="true">make freescale_imx93evk_defconfig<br>
        make<br>
        <br>
        Can you tell how port WiFi and BT for imx93 custom board. <br>
      </span></p>
    <p><span data-teams="true"> Thanks &amp; Regards,<br>
      </span> </p>
    <p><span data-teams="true">Esakkiammal M</span></p>
    <hr width="100%" size="2">
    <div class="moz-cite-prefix">On 14/10/25 17:43, Esakkiammal M wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com">
      
      <span data-teams="true"><br>
        Hello,<br>
        <br>
        I have implemented support for our i.MX93 custom board by
        referring to the i.MX93 EVK configuration.<br>
        <br>
        I used the freescale_imx93evk_defconfig, and the board is
        successfully booting into U-Boot. I have validated that the
        following interfaces are working in the kernel: eMMC, SD, USB,
        and Ethernet.<br>
        <br>
        However, the following interfaces are not working in the kernel:
        Wi-Fi, Bluetooth, Watchdog, SPI, CAN, Audio, Camera, and
        Display.<br>
        <br>
        U-Boot and kernel have already been validated using the Yocto
        root filesystem, so the U-Boot and kernel configurations are
        confirmed to be proper.<br>
        <br>
        Kindly guide me on how to add the required packages in Buildroot
        for validating the above interfaces (Wi-Fi, BT, Wdog, SPI, CAN,
        Audio, Camera, and Display) in the Buildroot user area.<br>
        <br>
        Thanks &amp; Regards,<br>
      </span>
      <p><span data-teams="true">Esakkiammal M</span></p>
      <p><span data-teams="true"></span></p>
      <hr width="100%" size="2">
      <p><span data-teams="true"><br>
        </span></p>
    </blockquote>
  </body>
</html>

--------------U7nZlOINMb5VzBUFb0R9AQC5--

--===============5585956501995049458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5585956501995049458==--
