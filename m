Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5BC606A31F
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=huHYqqwR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=OhZj5UDo
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BA8F81276;
	Fri, 27 Nov 2026 15:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUBic3ALDf0N; Fri, 27 Nov 2026 15:15:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 66438811CA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792557;
	b=bSuqEBpprZy86XNshd/rsLVW/98IUHJyyaSmlvvicuuDVRm/IOazf93vdc9USDoMssJv
	 lDh2iwKM/jS0g65HHcKVWNgVAOTH/Dj/dkktdVWJdL7P/ZWkBDfUZM7C9qEFslHKZMLCW
	 1BIuQYQWaKXeIJYuVRmcU3BVFT2poHazQWkGi7nrTgqoeQv6N2m1XlAtVX3nfskSgMaiE
	 ETI1HOJZL6zzbptV3xPInfC9FUYjn9ewqbtZ3uujlPrUgHN2KLDJfv1wgcPYauMVN2gDw
	 Nv8TK39PltQnhIzE+BxM9Pl5ZXcnnOo4NldTB6AK6Y3zceEahaZSWlGIFho1R8MGJUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792557;
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
	bh=QNNHhyO92rmn6JsfuidHEdU1CLNS4YM6QGhUaPq8mzM=;
	b=fZ+Fm9X79ThMHLDKcMJKF9yUWPYckTO837sKdA9fHuoPYbpEzkQjRJIle5nzkth5N0dH
	 mAYlOKwmIPVmZLcpchET4Rw4uRhP3rJiFYooTjXtY3d+/Pub7ongf4fiHvLI+I80sV33K
	 EblkjXs+k3lDFRHe3KDikbHm5UW1r/cKgC7U7zIGmsqUGeKPJ8/M/4SOXmkYkliLVx31W
	 bglddGqu1Hv1KHd4U62xYtmGapES7YHm4tZ7U5YmJEX7EpBhEoZeaVhoHMx8ppPaLitez
	 P6ApCuxNp/W2BDewvYAq5+EVjwzZgY8kXnDVHAfWDNlw9V5aZHA/C4Zq7tNGkH7+WRw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792557;
	bh=QNNHhyO92rmn6JsfuidHEdU1CLNS4YM6QGhUaPq8mzM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=huHYqqwRJ+pch+lqW379ko+6XMJkUsxQWn3OmKQfAG6v8sZjV22ONXIHPebf2MK4R
	 pVXCpWiQOhkBU7O1gHCGfgHkdHO000bzcp7tf25SHbtG5HgzphdWmha+IL0II0Rl/u
	 f/Of7aYpTP+MXlkrOHLZCKqT18Lngh8yAIkNp5Cy6ww9nFM6Ujbi3pYBssD0LcS7pj
	 jE8VVVK657iAJS8SaphL15Ph12OEA0956Gvr6q5k02cQDgW+U8Dtd502CMI4wtZjCR
	 odeRs1sA24T8DDdTSm/HID7IVUs3d6gnYm/zNjE1J/o23uWNANQuhWO5TROVxeQ+jw
	 JtVI0/Hi/drBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66438811CA;
	Fri, 27 Nov 2026 15:15:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3EAB373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5F3E40012
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RO6yfb1aaV2n for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5463A400D2
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=OhZj5UDo
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5463A400D2
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBCQwTyYnriNMoslKMaVCZFQvtmnq382KgUSz8V+a2A=;
 b=OhZj5UDoeWlxDPavRc47BSquiZrVckAEYn6NyZ1tdXxZuAGDwiBtyHG3KGI39pa3VGiYMAdaTz2kJWE5OcTQfkURTOl9CRWeBi9sQE675k434FYLrM6gZKVv+sU9N/L76svrlQpIW5T3UqzXhuc+oI55R2zRBcE+K5PsD6FAHkMvnNSN0kVU8fvIzNoxLwHWTQtpfkBE3H1o4M9EmVHU2JqIOg0Y1slzh4w19hG9Psn8b2abzUS2eBa7GaPZpYjZocRxP1UlS9zXAcD+lY2dmPaVOUF32psXXZNPNW4JhWopgPZTIZnx2qXtIMNK+SIcJkFp1cMXNbQAINOyp99Ryg==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:15:45 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:15:45 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:03 +0800
Message-ID: <MEUP300MB00453EE8BA4493D9AA174817B5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=tfx2001@outlook.com;
 h=from:subject; bh=WedqLZ7Gt6l9i2Bf5LDzmjxHfWYEAM/yYFLrGsC35dQ=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ46wJFrB2wUXbjc/Sv5mO8/46a6f4NRjG5E9
 3kZobJ1foOJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmeOgAKCRAcD62l0/wL
 2j5FD/sG403Cl9KHfSgEw+ckREtBfol0Tir2ZScYlZb3U7rdZjO2+dvHKGm9nOVeSXrcFWMbL6Q
 s8fJYDbmaWlnpyLVm3GAFWXMNHqpnwbWE5WWzwhOjBWju7obC3+7aosFJaHd5o2yj5Yv3xi4a8Q
 cWBljWh1+/W0a2To40CvKVOexzUicW0PvETbXIQUk3fsN7BOmdOHwqtoP5fOaRx5tyQgxyszlUa
 oui6Lp1N2fF8tq8s98JR4mucySyo9nQVP8Jpbo24T+Awu6tlklag1GklFHjq7QtPRUXA5/2GJmT
 t4rrLGaLXfSsZ7M3A86tnoMVSQ8Y39D1gWSAm9P65GjwVuZQtIn30AtSDSSjVZjWp/Z4QRKpLlP
 3Q8CiA5zOXZGhpCr+k+tHaTfO8PjRI0qESFh5dorscF4XVcvklgML0aMxpQRAN+SU3MZ5b38i6C
 4lgUaFxnE1ZZimd7QIkQt9AsDAviUdC9HWT4dK8L20m570d5SXXMf/8v+SC27UDCmUDHMKQa4H5
 56DwaxvxOcVdTmVItv/fSYFZpM6CMDNrz792JQezqcQ9HkramtswHE740Zvsq78B9kxLzKMw5/0
 aYuhqqa7tM51+9Qt2eVDSaHuacllv0G7beAw7f1MagCZeAtp+PRz4QqhBS2TphI0qOkdJ25tn1R
 sDyDRgN+MCrN3NA==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-17-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: 1086f9f5-0d05-4fe8-6d0f-08df4c994f5d
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|8060799015|19110799012|25010399006|260925184616899003|51005399006|6090799003|15080799012|23021999003|41001999006|5072599009|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGp2d2VUckhZMVh1cjRtQmh3cFJ1czVhMzc1TXJ2N3EwRW0wRzJWaUNhUS9r?=
 =?utf-8?B?d1BGSER5aHhtUml1NFJlSFcvVkE5UUVqOWp3MWNmTUxMaUM1N2dKV1JMbk9w?=
 =?utf-8?B?eEVUNTdvbWh1L0tQcTVGWWQ1dGdJd200akV1ZFQxVjZibTh6a0hUVmpGUDZY?=
 =?utf-8?B?Z2IwOEJnNW1HVzhicndTbC9QbHJQdFZQbTl6RHBiakdSL3Bvbm9SMmNDSjV2?=
 =?utf-8?B?anFmcFBFQUNWNm9oSWFhUy8veU5OV0pibk5HM1ZSWGx5ZHM5NThsMjZCT3NP?=
 =?utf-8?B?MnBOMTIwZDZDZ09LTHFTQmxwR2FVMldPNll1VWo1M0JKYlFyeWNVL1lTNFJP?=
 =?utf-8?B?YmJMNng0LzhtTWpFWnNuTGh2Zk1zOVRoSmp0dStia3Y2NDI5OTB4VU1yZ3lZ?=
 =?utf-8?B?ck0rb2dDSXRQWTVRQWt1cWo1VkNYaU9LaTN3a0tQeWZpV1kvN1lKY0k2WGlI?=
 =?utf-8?B?VzBRYUdXczNuSmRBUHhaMWd0dk5ySy9iN3ZTT2NSOUJlbmVEUkhDY3FuOEEr?=
 =?utf-8?B?YnJZdTc4ZXc0RzRyQW8wOHBTWmd4TndpSWp5OVprdHk1TFU5dkFYbGc4dW9V?=
 =?utf-8?B?bDRjVEhMamRrRmFBQVFxazMrbGdYU2F2eHZMYnprOXZqTlJsQUJlOXlXVS85?=
 =?utf-8?B?YlF4YytsSmdHZHFIWmxnTVI3OXozSXRZbVIvdUlIOGtHNXB3QkhYU2s3MnFW?=
 =?utf-8?B?OTNoM0VIK0NNb1pYVXlnVkJhSkNFaU5URUJCTDhCWlA4UTVxcGY4NXpLRG1R?=
 =?utf-8?B?cGtNcWhUbE4wMGIvMm5oTjY4eEJqMFBPUU1PVEhoK212MTBBTWtSdE5XcmZJ?=
 =?utf-8?B?U0JwWlcwNGhhNE10OTJ1cE1yT3YwaDcwRVVObjZoUTFWTGxrem13NU9Nd0ll?=
 =?utf-8?B?NGhIclFwdGlkU3p0WnNldnNLTGVZVnFORHRxVWdEWVI3MWlNajJGME52amFl?=
 =?utf-8?B?U3FDamplZFBSemVIQ0Zva0VMNVBNMTAzZWt6NlpFV0RTQ0FuTHU0cU01Ry9E?=
 =?utf-8?B?Y1ZZYU1WemJVWkcxME5TL1ZKMSsvaElBaEdqQ0YyczkxUTBKaHlPTDRxamxu?=
 =?utf-8?B?S2o0MEo5Wmo1dkJ0cFgvMGcxY2RKN0VQSEE1V1J4YWlXc00xNzgzSS9yOHZW?=
 =?utf-8?B?akYyK29COWpoZE4wVVZDczZOVHpVTmp0TjNEdjVlRUM5MXZBeDEyZVJtSlhq?=
 =?utf-8?B?SlNkZnhKK21oMGxHcUdLV2NFQkx0Ui90VTFiQ1lDZklEU0VscndEY0g1cVhq?=
 =?utf-8?B?bVR1ekhxeUpFZDRNdDRGbXd1RnV4RngzUHdPVGpOZjdJSFZwY2dzL3lEWTRR?=
 =?utf-8?B?TGZuN3JGaXM3Z216eUJtZlBBSG5GVWJ6S3o0U1RPZnpDeHRvbWNCbkxvWWpG?=
 =?utf-8?B?WHhYdW5wa1owOERidnFRNlliOUdQOWJNaEpha3ZLbTlJVG5EcnNVRS91dmYv?=
 =?utf-8?Q?ITfRF4Em?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWovMkpsYmF0eFZ1Vkxmc3BCN0VzSTVBZnVxR1V6NExTVW5RVWU4c2ZYa0xv?=
 =?utf-8?B?WUZmazZDL1V5QmNJc3M5SUI0d1NvT1Brb1M4VEZCOERWR3JVbjNrZGFGQitx?=
 =?utf-8?B?QnZnQmJoaXZIcnJFU1FaRFpEQmFhOWhsa2FkL2ZJQWNPaW1NWFJCWXMzVHV2?=
 =?utf-8?B?ZXZnNVhnSVc5b1YvYmpvd3c3SlJIZzZ2RFpMOG1PUzJRK2xZdWgwMjNlYWZi?=
 =?utf-8?B?V2Y1bW5iaC9yRWFtbi81TXp4YXJIbEtZYTc3Z0htS2I2MEVDRnZiQysraGU3?=
 =?utf-8?B?Y0RBa0lWcVJKc0tWSjQ2aWplTEt6TGJoM0RJVG9uN2JSRUJFclZ5Sk5qdGto?=
 =?utf-8?B?SUVKL0NvSlMxMmMyOEFQekJsK3IwRy9nWGhFUWNzczNPR3NrUnBsNW9FbmRC?=
 =?utf-8?B?SWdIeUJIanpyRGJJS3R5SDFJclAvbXo0Mnh5WVJwVE1kOTVFQmlrVFk0QkhN?=
 =?utf-8?B?WmNEV0F4S3U4RXlHbjVFSk13dUtrVll6RENpY3NCY0FVbk1KdnZMNHVKeS9q?=
 =?utf-8?B?RTJUdkNWU0lyY21Yb3Y5Mit1VloyamRGTVpNRVplL1J0cUJ4aFB4WlBZYmwv?=
 =?utf-8?B?MWlsOGlnSE10M1doajJOOFdUNmNZcU1sRjREejB4NmdIREtpcEVLcllXWVdX?=
 =?utf-8?B?aFNFV25GamJybGJMaUdma2ZuTU5wWE4ybVJTR0c2ekFXVC9ZcWkxUi9yd0dM?=
 =?utf-8?B?QVkramE5NGE5clRscnZaMHJMTjIrdk5Yc1BWMEwxbStHMlZoWU5xMFZzMnVZ?=
 =?utf-8?B?SG9BbGhvbDdsYW1tdFNlSE5idm5TbWRvVERvVWNIbitDaTFBaFVlRm0zSUta?=
 =?utf-8?B?WFJNNXhmdnVCd2dadWl0Nzk0MXZ2QytSOHM4MWhXUzhGUjhSMHYwWndXUjJF?=
 =?utf-8?B?YmVzNGVCNHJ3dVdKWFBiTk5FQ2tHL1l5REN2UDBUbmFGZWk2TkxLaDN6Qmpu?=
 =?utf-8?B?eEVGMnRqQnozRWZsWkdjV2U0cmQ1clZUREc2SWlrN1A3OVZ3WWpLWm43NHF2?=
 =?utf-8?B?WjJ4MUlSZFZpQWQ5MTZnOFdhYVJaSTlQcXl1TnVDZ0lqVXcwRjFwaUZhekFN?=
 =?utf-8?B?ZTcwcWdVY1ptVDhRRkFVSzNURjJ6YzF2Mk1XcG5NU3dVUnp2WmU4YlpRcUtC?=
 =?utf-8?B?SVk5dWMvQTFVeWtObnVHREZiTjJoeE1ES2Fxak8yUVpqbDZxZEZqNm1KV2VS?=
 =?utf-8?B?ektuMDU4dGVmaUp2TS9OMTQrRlhVdTJTN0l1bkNlQVkwa0UwWDY2cklISjcz?=
 =?utf-8?B?OGJRYXNGS3JZUEhXTHIrMHRBQitjYkxvZVZ4SWhxZTNlWU43Tkx2QnNscGti?=
 =?utf-8?B?TlBGQzdFMmNTNEtqSldySVRLeHk2QzJJdG50aHI3WldTZlhtY2R5NklyZjhm?=
 =?utf-8?B?UzVEYXF3YllRZEluWGtEazRuR29IN0IxQjJoK3BBTDFLenVzb2NYZExud1J5?=
 =?utf-8?B?LzlxZG45S3dBYWRKWllJVlZ1bjNVL05HcExidGlUUEFpeFI1VFB6M0xUaDN3?=
 =?utf-8?B?UisxWklMNHZBdFZwSDhlUW9ZZHk3VWx0T0ZoVmFTL0ZhZUtwSnRORkpRNkNF?=
 =?utf-8?B?dzF1eGRNT1A3OTB5c3YvUFUwZCtoVjZCek1WcHUwbTdIOHU0UjYrUDhRTy9B?=
 =?utf-8?B?bTc3bjVhVzdSdmFGY0dIQ2xlZFpSVHJYYjVxWU5nN3B0ZGRSUWw5WmNIZ3l5?=
 =?utf-8?B?N3ptOGgydXFUbVM5b1VXSW9KU1N1UDVXR2daYkNaWHhCMEJDU3lzaDZVVEYw?=
 =?utf-8?B?T3ZBRVh3S3R0d1NFYzUrZFp6QUVXNG8xRDhOZk94Z3Y2VlEvR3NrZ2VtVVR2?=
 =?utf-8?B?OEtvNmR5NGNsTzVxaFlpdWwrRzhhWWg5dFVXTUdKS3h1SFNQUXZJQ09xb1N1?=
 =?utf-8?Q?enaTBDrDuzNcG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1086f9f5-0d05-4fe8-6d0f-08df4c994f5d
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:15:45.8343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 01/14] package/libnice: bump to version 0.1.24
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the COPYING hash following the addition of an SPDX license
identifier:
https://gitlab.freedesktop.org/libnice/libnice/-/commit/a04e4a05ab9cfc5fe257d9d06c43488f057956f5

Update LIBNICE_LICENSE to match the upstream SPDX declaration.

Changelog:
https://gitlab.freedesktop.org/libnice/libnice/-/blob/0.1.24/NEWS

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/libnice/libnice.hash | 4 ++--
 package/libnice/libnice.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index cf6d825f83..9411b03816 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,7 +1,7 @@
 # Locally computed after checking pgp signature
-sha256  72e73a2acf20f59093e21d5601606e405873503eb35f346fa621de23e99b3b39  libnice-0.1.21.tar.gz
+sha256  cfb5e8e778534f2f5b3c6f4958a1eb057c6b95c537c0f100817a537cf5d64fcc  libnice-0.1.24.tar.gz
 
 # Hash for license files:
-sha256  9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5  COPYING
+sha256  e5504e5ffe894870ea1a652df957a120ead9c3f9a5e9d314ca41ba06f2d72024  COPYING
 sha256  3b3c75ae6c663c4f93987647eb5463d33dc1602a1aded3ac479773f2c3928e3a  COPYING.MPL
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LGPL
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 56ee35e452..3519bcd869 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.21
+LIBNICE_VERSION = 0.1.24
 LIBNICE_SITE = https://libnice.freedesktop.org/releases
-LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
+LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1-or-later
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES

-- 
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
