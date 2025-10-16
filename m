Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5666CCD194
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 05:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70050405C0;
	Thu, 16 Oct 2025 05:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qB78kZ1Ep10w; Thu, 16 Oct 2025 05:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58908405E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58908405E1;
	Thu, 16 Oct 2025 05:37:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24D2C968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B61C405C0
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wya70-NvMZOh for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 05:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c409::1;
 helo=ma0pr01cu009.outbound.protection.outlook.com;
 envelope-from=esakkiammal.murugan@iwave-global.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EA244059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EA244059E
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c409::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EA244059E
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEsyk1PiAhpRKMgaJo6NPzpMTZkCnIgPaKyBZbOIB0o8pkMovqp8w1L2VDnRp9Q76x0taucULSle9TgQw34OfGJAikOKVs7mTL25wynqvYaMZN+Rgc85bTdHsFqgjreo7nnraEbpJeH4jHlNtxBJR5UYzZA4RDCmQqhiveQwiInCtdKMtqSGwLi7/Fx+YPhfwFViMtl0lvBJxSM2RVqRCyho3h7Ux2qwCr0dAhCi6yQ6VGINQTcZ1F+ac35UqPOwvI+orlu1VghGNzptBOPl2eAzqIb+odmKHiJ/mEtpjSn6pKxJAw7V70BHIb0LGZSAmVTuBO0YHoNiO0uC743wKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwGLqjKYB0arJCwBdRnU5UqDMdOf0ccrkcDnvSMwW/I=;
 b=TJKLlC0FP44QYEymoa+36hrRwmOa9FfHveoPbwYXZQcNlAkJ7U116kjbMQPTTOMeu8Y/avHWQ0N9Oahni0KNJuMETp9woH0nGNrAM9LmV6QKn6Su+MOiSGYneiNoyypnPVoiKtNFbd3GvOQx/Q89nIPu7wdLHfwz/jOA0Be2g6s7W0ho71evoRN1eMm4EGQvK1M6aZcKuGm53bU0xflf61Xl8xkwbgY17dgf20MZF11UjLJkEWmH7zRmFQ2tjXa0VxCNdHN+ltFNZImASuk0gmB6847/qKbFKu9bd0eehyPoXGBoMG70EE0pARyhjzEltr1z4dj/E6rMb8p9XUM7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iwave-global.com; dmarc=pass action=none
 header.from=iwave-global.com; dkim=pass header.d=iwave-global.com; arc=none
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:122::11)
 by PN0P287MB0264.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 05:37:40 +0000
Received: from MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e]) by MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 ([fe80::fafd:97ba:ad13:4c1e%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 05:37:40 +0000
Message-ID: <5eb375f3-d026-4592-81f4-462548717d61@iwave-global.com>
Date: Thu, 16 Oct 2025 11:07:38 +0530
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
 <45b0422f-620c-4db5-9a35-423466de2db5@iwave-global.com>
 <584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de>
 <3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com>
Content-Language: en-US
In-Reply-To: <3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com>
X-ClientProxiedBy: MA1P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::27) To MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:122::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2448:EE_|PN0P287MB0264:EE_
X-MS-Office365-Filtering-Correlation-Id: a25eccd6-865e-49c1-a830-08de0c761efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXQxbHZhRkI0QVliUjZ3WEE0SS9OQkFqRDRhTWt1UXVCVlc4YVBIeFMrcGVy?=
 =?utf-8?B?VFJTb3lkYXRjVTJrckJkam01TktiZ3U3QzM4OHpubG5vNVliOE01bzZHZXZo?=
 =?utf-8?B?R0xtTVFzakQ2M3hTTmtMQmdXN20yaGdVNXdQMDdxSE5jckhSNitCQURoSEhK?=
 =?utf-8?B?TWhZY2pndkJ6N1dTZVljKzN3K1BqSEdzWklieVMxUzZKaTk0MEMvSkNGQS9Q?=
 =?utf-8?B?blpxeVViczRWNzg1TW1UYlhRckhPOG9BUHNLNkQrcjlmOE9VTTlpUHVIYXVB?=
 =?utf-8?B?UHFmamRPNzU5TFJuKy9rb0dsMXFIaWk0U3g5cTZValFXeitFUzB1NlJhcXBO?=
 =?utf-8?B?eEt4cTY4RHh6NVE1TG05S0hEODJzNU5nSGx6NHprUW55eElLS3lrN1U5TXdl?=
 =?utf-8?B?akQ0K1NlK21zQ2NNdC9XamQ3azEzRGFzRHU2MzFtSWpaSmpObTVucE04eEZq?=
 =?utf-8?B?TVNTd2JaVnhYYko4MTc1b1JYWGYvQzFGclQ5T3J4QXRFYXZIZytkV2pwNW44?=
 =?utf-8?B?b3dnaHJIemJ0b3RLZitkUll1WU1zeXJSVDd5cFRSUEdZc202dEIzaUFJVzZp?=
 =?utf-8?B?bVZDMEMyQ0s4RldiNElmd2lyc3p5UTA3UTZzLzE1WjdydEE4elpNbkZ2eUJM?=
 =?utf-8?B?bU1RZnlGM2xOVW0vZG1La3JuMXFvOXVtbE5zdS9JY29Pb2hoa2Fnb3FMWUtM?=
 =?utf-8?B?YTRmeFdPYTByeXB2S1BxcWRrN0R0KytRMlp0ak0zZzlJd2t1bkd2eDE0eTlD?=
 =?utf-8?B?ZnZnTkdIK2RldjhUQUpMSk5qeGdVYngrajRVeHV4czBlTlBaK3ZFTmdDN0tE?=
 =?utf-8?B?U25QeTVFVW1HTThNU1lRZTVkZWZRWFc2TlduVE5pM1Vtb3MvcGdjNlFGMndw?=
 =?utf-8?B?YnR1eTd5YmFGSHJ2R0RNMm5ITy9XWWtZK2tvWmJHUEhDSWk2bGh4Wm9Ub2xI?=
 =?utf-8?B?eUpYL2l3MVJMZVBGaHpxMTBUNTBodi9aQUV3UEllRGpjZFpmMHpaVmJ5Yjcw?=
 =?utf-8?B?NnY5WXVvTGdOKytGNGN4ZzhDNVRvcXY1MFRJUDhvcng0SVdhVi90cUJ5RXl3?=
 =?utf-8?B?UDdLdFZIZHVrNnAvb2h6cy9nekpYVnUyVGFGaEJ4MkYzOFlicjd5UDFTR3NC?=
 =?utf-8?B?bWdNWTRjdXFPS1ZUSmdGa3FQYlFteHJubWxUb2RYd2ZEZGdJemljRUM3cmNX?=
 =?utf-8?B?RVVGcytqMEsvNFprdndaeUo0OUF3WncrYjBKU0dpWG1PRlAzeVJZTEJ2d1Ar?=
 =?utf-8?B?TFR1WkZmS2ZXTEtTWmpweHp2a2NLMlYzbE03amY4Z3BSS0tLQi96RjFOUkt4?=
 =?utf-8?B?akZmeHdkelR6bURza1dZUUZzWEpodFdMdVJHU296T0ZXSzdhR0JFN0d5cmEr?=
 =?utf-8?B?K3VvWXlFTTlpSTZPQk1qTTA0cUd1ZXVqaHA5RTNrc2dZeDlVK2VJQUhWanRi?=
 =?utf-8?B?UU5UeW1kZUowcVgwUGRVbjFCQXJqQXNXeEQ5dWw0Zm9PLzQvVjFiaDJrSHVv?=
 =?utf-8?B?WHFLT3VYOFFKKy9uQmZ4QXBVMmRheU9YcEtsZEJPU3BwYU5Zc2xacW5uY2JT?=
 =?utf-8?B?M003dllDMlU5TUd3dVdjWGswSnBTYTl6WnJOYUV3VXhpMWo3ZmZWTEFMVkNV?=
 =?utf-8?B?QU95eXFVUXMyNWIyUVpPT01rZHBYUVVXWW10aGxXc044NG1LTXJmMGFYd0Rm?=
 =?utf-8?B?WFg4QXhKM2VCZ2FabW5DVXhqWm5BUGVMTDZydjFJVVdEYmZUSWFUNGdWWEIy?=
 =?utf-8?B?YmhhTnRCUXRMMjVLYUcxaDJ3UTNnakhtY1hINm1GKzlseDlZRlVqNGFIbjU4?=
 =?utf-8?B?bDFqbXJORGZkUmh2RzNqOUc3SDBMN3VRTU9rV2lENm53aWdOR0JwSGlHUXVE?=
 =?utf-8?B?Mmp6VGRoZ2NkRWlBdjhEeXdRZkZzVFNRZUpCZENaSk95cC9EV05rb1pIOUlO?=
 =?utf-8?Q?1flYtLtSnYFCmdEeo2RNT466qlaoCRRA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0P287MB2448.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXVNb0NYZmUrbXpuMFZYUkRXYkh2UHh6S0d6aE55eUJlZkJtU2hUYStURkha?=
 =?utf-8?B?MWFTbmFtUnBOMnBIY3A4bXhuVXB1U3pZeHlkcU5DMnZ6KzlXZUI4Sk1iSXpJ?=
 =?utf-8?B?bXpoc3JyUjR4elN2RTdoMlVadGxwYnBlQzl0OVFRc295dTV4b1Zwdi9Nci9X?=
 =?utf-8?B?QitEOW5YT2FCd0ZKaUdBRTVvQVhEWUMrYzdSdU00MWxIN1VXSFpzRTlJTHQr?=
 =?utf-8?B?M1NxSlhrZWc4UDRDbkVVYXl6Zy9aenZwd0FURElyTWszN3QyVGk2TGEzOXlw?=
 =?utf-8?B?Y2xIc3FhMHdNQWhaZGVRWEZhTUY0b1U5dndkaWg2NElpVUZ3Y0hVSWZWMnhN?=
 =?utf-8?B?bTRRbStqbjJvZm96d0NpUnBRY3c5WmVWWDhXVllYOWpKR2lBN3BSVUhQdnVj?=
 =?utf-8?B?OGdtUURucTc5RTR2Rm1ESCtFWkliTHlmYmVQNTFEeGNFSjN1VE9IdEhaS2JJ?=
 =?utf-8?B?cWNYZDZSK1N4UnN1QWpWTmFVTlRBeDROYlZwZTJHYjUxdXdxZU03SjhFN2Jh?=
 =?utf-8?B?NERkV1A2OE8ralBNUTF0eXN1NCtnR3htZjh4dE5NdVlJSmRBNlhHTDdRZXkx?=
 =?utf-8?B?UHNMdmNqb0tHM2Z6S3pCV2c4UE4ycWRUN3RPNHB0Q29iVlJxV210TDZXVnNC?=
 =?utf-8?B?Mmk4SS85T0x3VzR5YTNsdmxpNFY0ZGdkZWhEa3BWcFhuaDVkem5tK3pGNXpP?=
 =?utf-8?B?dGtPQVkvNUp4MzBINVRWVkREeTRRRW1JV1gzUCt3cDFhMVhWM2U0MEpGTHBJ?=
 =?utf-8?B?aW5kVFptdElLMWZUakpaSFFDYnlYMG04WkF6THlYVTcvQ3RMOXJ2QVRyd25J?=
 =?utf-8?B?UnR2VW10MGoxOXhXL2sxdncvNlR4NmRLQm5lOHJlWkFmUm5ZSlNkdFhFbFZ3?=
 =?utf-8?B?RjJpeFNKdlpSdzE4RUpCaUtUVitGa1FreHZHNHcrTzdCUkNwZFBkckRtNEI4?=
 =?utf-8?B?MHZlZytpWGdJRXdsb2NoMHVPUzVjQldMQ3UvcG9Dek8wT2VUekVpSXNPM3li?=
 =?utf-8?B?Y1hxTEFFaG1Zd1I4Z0kyVHBjanpPU2ZyeGgreURGSHdyc3d6Y1drUnFEaTNl?=
 =?utf-8?B?cTc0WEFwZDc3QjRFZ3AxNmxNNUVPSmtjRVNUVGpyMjFiS1hLZThadnV0eUNj?=
 =?utf-8?B?anJXSHVRN1BUaDFiNHFXNDN1U2N0dkZHUjFubDJWNlRRc0lEL1Y3ZWhFd3RV?=
 =?utf-8?B?VUNzcGlhZ3R4bzM1Y2lpYTUrOHBoMkpwUlU0L1FQMmNpekpkS3F3Y0c5d0lP?=
 =?utf-8?B?T1ZGdC96ZVBzTTR0RGhoM01LSWsvdFljdTV5aGtSUGt2QmZWbjVtWFZka0s0?=
 =?utf-8?B?OSsvYW9rY3Z0NzBSK3VLb0QyT2t1aFJIZm1DYjlKRnNCRVgvRFRyeWx1SFRX?=
 =?utf-8?B?YUVCa1NGN2YxcnNqL1VweldRLzlKZGFVT0FiSG9hMGpHNE40cEFXZXU4ekFi?=
 =?utf-8?B?d1lDS1VQMlpnVFY0NWRwZ3dWT0Vvc1M4KzhJSnVRb0RYTGxGNkhnUEc2VVJ2?=
 =?utf-8?B?L0hRT2ZOaDFWR1R5SDhEL094eHp3dk9pQ3RqREszdkRYV0xYeFBFaStmOXhM?=
 =?utf-8?B?MGZuMEJOZnRmS0s0emFFVTZQajZNdkh0dzkwd2huZWxDRDBXdlBJVi8yNzFr?=
 =?utf-8?B?TG5LUEZrRWVoM1JkZkQxb2Y0SFNYTDdacW5KbVV3a0RBM2FuV3p0R0xRZG9D?=
 =?utf-8?B?cTlDbUdpSTk5WVJkbnYyRlhoMFNmSzE0dWZsY0U5QllsSlY4Rk5rZzhOY1pV?=
 =?utf-8?B?RDRyanZGVzdUWEhla3dUMyt3cjlRWUpkUU5qcDRYQjI5bmxSV3d2c1VYVUNP?=
 =?utf-8?B?OHVzWlh6MUVQMDc4V3lKd2J0bFR1T29icGxUV3Z1Y3FCUXp2WVVNNHVPU3JH?=
 =?utf-8?B?c2hoVFZvTy96dTFVaFFEUFhicWU5VmVkcW9xY0hsa1F5QlZDWlI3RlN3d1N5?=
 =?utf-8?B?YlZXd0l0RERoZS9hdURYc2RtS1pNOHJNQVl2Zys5anFDbk0rRWRWcXRaNy9P?=
 =?utf-8?B?bW5RbXluQW9PeE5pTkhidE55VHVvSmtpNno4VTF0cEFSTUpwS2VTZFpXOWEz?=
 =?utf-8?B?a1FhT3pqVm51TXBsVngzeHJZSkVCZHpQZWlHekl4S2hRRy9lejh6U2RlN0Jz?=
 =?utf-8?B?TENnb0RuaTZZNTJTUTdRWnFpSkM3M1phWDc3VXF3WDhGNlVJVHlUaXRsR1Jx?=
 =?utf-8?Q?yiNxT+rImZM+dXf7Vl+eM8I=3D?=
X-OriginatorOrg: iwave-global.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25eccd6-865e-49c1-a830-08de0c761efc
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2448.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 05:37:40.0346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 507ae903-cc48-4d6e-bdb6-35278120a345
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0ldgDSTYD92qwgcLKxrVzkO+7azP36qKIgrQ20Ntz4SVlX22Lvy8teEwGRwBV/OoX5DbUX+vnnXRVEEuv8PDCylQ/7pfuBR4ttD2F9qsi9oj7ZHRxIh+aKnQ3TUF+nq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iwave-global.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwGLqjKYB0arJCwBdRnU5UqDMdOf0ccrkcDnvSMwW/I=;
 b=HnAwpwfAiUC+q3CIfAd1UdDbJ5K5Xb7FUIicrjfI3KKOU74MyaT6NVR1ClvWf5AqqtmmicXtRtsK2m7lNzCaNyfTyehVu//fnVUi2nLaVRD7CaRD54UWrki7b+ukN2renICjuRNm0x/SjQn3jqdWkEosTkKA4T2ZmB83aGrYyGtoCETnAviYKK9UO/jrNVvzUOa4u69vqnuuhC/iJq+FCwZsvEAngNg9qgg1b42Dpe072Uj2Rk4TZtnhbJpx9FmVPxpRdz9F1zCBeubeWHKkOpRNL7ZD2zoB1tNDC44VtiJAi4TIqtP/JRkFInEuGY6Ojtk5I3C91kprStaQmVza4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=iwave-global.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=iwave-global.com header.i=@iwave-global.com
 header.a=rsa-sha256 header.s=selector1 header.b=HnAwpwfA
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
Content-Type: multipart/mixed; boundary="===============5718138633982159027=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5718138633982159027==
Content-Type: multipart/alternative;
 boundary="------------INtxJRjIqIQFayvkWxr8qz6B"
Content-Language: en-US

--------------INtxJRjIqIQFayvkWxr8qz6B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I have enabled the MWIFIEX Wi-Fi driver in Buildroot for my platform. 
During validation, I observed that the driver fails to initialize the 
firmware properly. Please find the log details and observations below.


Steps Performed

Enabled MWIFIEX configuration in Buildroot.

Loaded the driver using the command:


modprobe moal mod_para=nxp/wifi_mod_para.conf


# modprobe moal mod_para=nxp/wifi_mod_para.conf
[   28.293486] mlan: loading out-of-tree module taints kernel.
[   28.332881] wlan: Loading MWLAN driver
[   28.336987] wlan: Register to Bus Driver...
[   28.341369] vendor=0x0471 device=0x0205 class=0 function=1
[   28.346989] Attach moal handle ops, card interface type: 0x109
[   28.352833] rps set to 0 from module param
[   28.359963] SDIW612: init module param from usr cfg
[   28.364906] card_type: SDIW612, config block: 0
[   28.369439] cfg80211_wext=0xf
[   28.372405] max_vir_bss=1
[   28.375018] cal_data_cfg=none
[   28.377984] ps_mode = 1
[   28.380435] auto_ds = 1
[   28.382879] host_mlme=enable
[   28.385765] fw_name=nxp/sduart_nw61x_v1.bin.se
[   28.390227] SDIO: max_segs=128 max_seg_size=65535
[   28.394921] rx_work=1 cpu_num=2
[   28.398063] Enable moal_recv_amsdu_packet
[   28.402098] Attach mlan adapter operations.card_type is 0x109.
[   28.408248] wlan: Enable TX SG mode
[   28.411751] wlan: Enable RX SG mode
[   28.416394] Request firmware: nxp/sduart_nw61x_v1.bin.se
[   28.642440] Wlan: FW download over, firmwarelen=1065364 downloaded 953164
[   34.648319] Fail to poll firmware status: firmwarestat=0x0
[   34.653811] FW failed to be active in time!
[   34.657996] wlan_dnld_fw fail ret=0xffffffff
[   34.662266] WLAN: Fail download FW with nowwait: 0
[   34.667216] SDIO Func0 (0x0-0x9): 43 03 02 02 03 00 00 02 03 00
[   34.673318] SDIO Func1 (0x10-0x17): 00 00 00 00 00 00 00 00
[   34.679151] SDIO Func1: (0x8) 00 (0x58) 00 (0x5c) 0d (0x5d) 00 (0x60) 
01 (0x61) 00 (0x62) 00 (0x64) 10 (0x65) 01 (0x66) 00 (0x68) 00 (0x69) 00 
(0x6a) 00
[   34.693708] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24 14 70 
c8 ab 37 80 00 00 00 00 00 01 00 00 00
[   34.803809] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24 14 70 
c8 ab 37 80 00 00 00 00 00 01 00 00 00
[   34.813727] woal_request_fw failed
[   34.817132] Firmware Init Failed
[   34.824576] Free module params
[   34.827631] woal_add_card failed
[   34.831003] wlan_sdio: probe of mmc2:0001:1 failed with error -1
[   34.837160] wlan: Register to Bus Driver Done
[   34.841535] wlan: Driver loaded successfully
#
# connmanctl
Error getting VPN connections: The name net.connman.vpn was not provided 
by any .service files
connmanctl> [   62.608517] cfg80211: failed to load regulatory.db
enable wifi
wifi is not available
connmanctl> exit
# ls /lib/firmware/nxp/
helper_uart_3000000.bin  sduart_nw61x_v1.bin.se uartuart_n61x_v1.bin.se
sd_w61x_v1.bin.se        uartspi_n61x_v1.bin.se wifi_mod_para.conf
#

Could you please help me identify the reason for the firmware activation 
failure and guide me on how to resolve it?


Thanks & Regards,

Esakkiammal M


------------------------------------------------------------------------


On 15/10/25 16:38, Esakkiammal M wrote:
>
> Hello,
>
> My kernel and U-Boot are working fine under Yocto on this custom 
> board. The hardware includes Wi-Fi 6, Bluetooth 5.3, and IEEE 802.15.4.
>
> I’m now testing the same setup in Buildroot, but when I try to load 
> the Wi-Fi driver using:
>
> modprobe moal mod_para=nxp/wifi_mod_para.conf
>
> I get this error:
>
> modprobe: module moal not found in modules.dep
>
> It seems the NXP Wi-Fi driver (moal.ko) isn’t being built or included 
> in my Buildroot image. Could you please suggest the recommended way to 
> integrate the nxp-modwifi driver or any patches required to enable it 
> in Buildroot?
>
>
> Thanks & Regards,
>
> Esakkiammal M
>
> ------------------------------------------------------------------------
>
>
> On 15/10/25 16:30, Fiona Klute wrote:
>> Hi Esakkiammal!
>> Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot:
>>> Hello,
>>>
>>> I have implemented support for our i.MX93 custom board by referring 
>>> to the i.MX93 EVK configuration.
>>>
>>> git clone https://github.com/buildroot/buildroot.git
>>> git switch 2025.02.x
>>>
>>> make freescale_imx93evk_defconfig
>>> make
>>>
>>> Can you tell how port WiFi and BT for imx93 custom board.
>>
>> It's impossible to give a definitive answer without knowing the 
>> details of your board, but in general:
>>
>> 1. If you have a custom board, you may need a custom DTS that 
>> correctly describes your board (instead of the default one) for all 
>> hardware to be detected correctly.
>>
>> 2. Make sure the kernel drivers for any additional hardware are 
>> enabled in the kernel config you use.
>>
>> 3. The defconfigs are intentionally minimal. You'll need to add the 
>> target packages to support what you want to do with wifi and BT:
>>
>> * any firmware needed for the devices on your board
>> * wpa_supplicant or iwd or hostapd, maybe NetworkManager too 
>> (depending on how you want to use wifi)
>> * bluez5-utils (probably) for BT
>>
>> Some of those packages have optional components that you may or may 
>> not need.
>>
>> Best regards,
>> Fiona
>>
--------------INtxJRjIqIQFayvkWxr8qz6B
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hello,</p>
    <p>I have enabled the MWIFIEX Wi-Fi driver in Buildroot for my
      platform. During validation, I observed that the driver fails to
      initialize the firmware properly. Please find the log details and
      observations below.<br>
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
      [&nbsp;&nbsp; 28.293486] mlan: loading out-of-tree module taints kernel.<br>
      [&nbsp;&nbsp; 28.332881] wlan: Loading MWLAN driver<br>
      [&nbsp;&nbsp; 28.336987] wlan: Register to Bus Driver...<br>
      [&nbsp;&nbsp; 28.341369] vendor=0x0471 device=0x0205 class=0 function=1<br>
      [&nbsp;&nbsp; 28.346989] Attach moal handle ops, card interface type: 0x109<br>
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
      [&nbsp;&nbsp; 28.402098] Attach mlan adapter operations.card_type is 0x109.<br>
      [&nbsp;&nbsp; 28.408248] wlan: Enable TX SG mode<br>
      [&nbsp;&nbsp; 28.411751] wlan: Enable RX SG mode<br>
      [&nbsp;&nbsp; 28.416394] Request firmware: nxp/sduart_nw61x_v1.bin.se<br>
      [&nbsp;&nbsp; 28.642440] Wlan: FW download over, firmwarelen=1065364
      downloaded 953164<br>
      [&nbsp;&nbsp; 34.648319] Fail to poll firmware status: firmwarestat=0x0<br>
      [&nbsp;&nbsp; 34.653811] FW failed to be active in time!<br>
      [&nbsp;&nbsp; 34.657996] wlan_dnld_fw fail ret=0xffffffff<br>
      [&nbsp;&nbsp; 34.662266] WLAN: Fail download FW with nowwait: 0<br>
      [&nbsp;&nbsp; 34.667216] SDIO Func0 (0x0-0x9): 43 03 02 02 03 00 00 02 03 00
      <br>
      [&nbsp;&nbsp; 34.673318] SDIO Func1 (0x10-0x17): 00 00 00 00 00 00 00 00 <br>
      [&nbsp;&nbsp; 34.679151] SDIO Func1: (0x8) 00 (0x58) 00 (0x5c) 0d (0x5d) 00
      (0x60) 01 (0x61) 00 (0x62) 00 (0x64) 10 (0x65) 01 (0x66) 00 (0x68)
      00 (0x69) 00 (0x6a) 00 <br>
      [&nbsp;&nbsp; 34.693708] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24
      14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00 <br>
      [&nbsp;&nbsp; 34.803809] SDIO Func1 (0xe8-0xff): 00 00 00 00 4c 8b 0e 00 24
      14 70 c8 ab 37 80 00 00 00 00 00 01 00 00 00 <br>
      [&nbsp;&nbsp; 34.813727] woal_request_fw failed<br>
      [&nbsp;&nbsp; 34.817132] Firmware Init Failed<br>
      [&nbsp;&nbsp; 34.824576] Free module params<br>
      [&nbsp;&nbsp; 34.827631] woal_add_card failed<br>
      [&nbsp;&nbsp; 34.831003] wlan_sdio: probe of mmc2:0001:1 failed with error
      -1<br>
      [&nbsp;&nbsp; 34.837160] wlan: Register to Bus Driver Done<br>
      [&nbsp;&nbsp; 34.841535] wlan: Driver loaded successfully<br>
      # <br>
      # connmanctl<br>
      Error getting VPN connections: The name net.connman.vpn was not
      provided by any .service files<br>
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
      Could you please help me identify the reason for the firmware
      activation failure and guide me on how to resolve it?<br>
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
    <div class="moz-cite-prefix">On 15/10/25 16:38, Esakkiammal M wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com">
      
      <p>Hello,</p>
      <p>My kernel and U-Boot are working fine under Yocto on this
        custom board. The hardware includes Wi-Fi 6, Bluetooth 5.3, and
        IEEE 802.15.4.<br>
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
        recommended way to integrate the nxp-modwifi driver or any
        patches required to enable it in Buildroot?</p>
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
        Esakkiammal! <br>
        Am 15.10.25 um 11:56 schrieb Esakkiammal M via buildroot: <br>
        <blockquote type="cite">Hello, <br>
          <br>
          I have implemented support for our i.MX93 custom board by
          referring to the i.MX93 EVK configuration. <br>
          <br>
          git clone <a class="moz-txt-link-freetext" href="https://github.com/buildroot/buildroot.git" moz-do-not-send="true">https://github.com/buildroot/buildroot.git</a>
          <br>
          git switch 2025.02.x <br>
          <br>
          make freescale_imx93evk_defconfig <br>
          make <br>
          <br>
          Can you tell how port WiFi and BT for imx93 custom board. <br>
        </blockquote>
        <br>
        It's impossible to give a definitive answer without knowing the
        details of your board, but in general: <br>
        <br>
        1. If you have a custom board, you may need a custom DTS that
        correctly describes your board (instead of the default one) for
        all hardware to be detected correctly. <br>
        <br>
        2. Make sure the kernel drivers for any additional hardware are
        enabled in the kernel config you use. <br>
        <br>
        3. The defconfigs are intentionally minimal. You'll need to add
        the target packages to support what you want to do with wifi and
        BT: <br>
        <br>
        * any firmware needed for the devices on your board <br>
        * wpa_supplicant or iwd or hostapd, maybe NetworkManager too
        (depending on how you want to use wifi) <br>
        * bluez5-utils (probably) for BT <br>
        <br>
        Some of those packages have optional components that you may or
        may not need. <br>
        <br>
        Best regards, <br>
        Fiona <br>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------INtxJRjIqIQFayvkWxr8qz6B--

--===============5718138633982159027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5718138633982159027==--
