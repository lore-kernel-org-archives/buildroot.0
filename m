Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A5C606A331
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eFeI2bBv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=JY1udoge
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1092E80D1F;
	Sat, 14 Nov 2026 10:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SU0dW2rHrI_d; Sat, 14 Nov 2026 10:43:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E53D080D39
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652994;
	b=k7Zf9rY7WAfkCvET1L1JH/XqVf+d4a+1Fxe2xDnC8SR9snu0Ws9Y0bRCKItsTJvi3ivJ
	 4F92VnLkRjLh3PJa/citRuuxjtoqYS6hur9GnueQgIk8gCJyul03ropWcaTrWZBeCl9AC
	 gjsjcsfEQVYB/vmoLXGcbW1ZaNkDAP9hYQBU2sLKO1Hz5fkgS+P33wYbeUXwWbAC9dQGY
	 fOufKfMywUsJo5a1XTJ1zzTZuMIJuA2rZ0FfNJ65iLSRRYrPVoT6U8hoiAPkVI1O2R7sR
	 ZzimN1rgoxm5VTtKM3piuEQZeZBIgABxZMPij3k5ASL2X2nlz8eCvG1LUh408dbDecw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652994;
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
	bh=EoB7Qhm+A6ZbY1GQ3f8zJqhX0r6guCrd/ybYPuVIy8w=;
	b=DeDbTaimP870CXo+TSBNllx7UwLRuhyNWvKHPOSCBNopH6qt+MeVYCUqOV80U5BjnquG
	 OsiXGq0j8VXWw2Jj7lkZWcMKpfuvNU0vbFKMBaMN5JlqVCItHv72lkByscx+Sod+U+Ykh
	 G0ThWUOKn7F7IKQMhh1Zb5YPGzVxK2ZpGDm0XzXM1h+Kd/imGp+GIQPhZXYW0Y49OIrZi
	 uZrP+fAfiR2e4o6Gm5jHZkW8805oFdV3tfZi7Ay7rALF/MLQ3M/0/Fx3LPW6NwwLLYZ7N
	 e8ByFt605ocY2O3B9mERwO+B4J7wlbziATvQGAggPKTBseYTHaTQmnYHkdbD3bBX6uQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652994;
	bh=EoB7Qhm+A6ZbY1GQ3f8zJqhX0r6guCrd/ybYPuVIy8w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eFeI2bBvSboj7V9W8wdK6zI3apo5YFbeMydC+wZb5oAjjZOuejcdE6FsWp7CBgZQ6
	 1VRvqblO9R4zOdK9iNCA84ld5+c8CkN3CVRJq+KEL9JdObkLylT3mANIW2vRlp5Raq
	 3aAnrThFjsjpNDKW4RUcfVREZmsA1DFDRvhf+CKUIBaPEi+nHiQ7N2C44otbeJAn1H
	 Vq2WEtWFC476AJ3Tz77BZ32Xfz4lrxgA3OmGtitVETLzSpjwydPBeLv1N9smZiJpHp
	 fVtF1zM6jhOna+CQLhyiJ0ShP2CVYBEAhiuLfmGIYXsiKBJiZfbLsU8sYVBpwFRHpf
	 O2zqkIS5EjXjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E53D080D39;
	Sat, 14 Nov 2026 10:43:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81E4A9B6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7158840050
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsX_vSgD2mQV for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:43:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 097BD4018D
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=JY1udoge
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 097BD4018D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUa5jRq7FYBDN8gwtnQgRf/jV9weNFfjIBN+nsMj8SE=;
 b=JY1udogebX67PZ3uXxwPaHAYJVgfI3sgos3g1GbA/+FXHDoOcW5hqINvu5fyIT/6GDvrQc+FLJAHixCP4sCQatfoTrNzRiDudzlhNzg12mJV4t2GsIli0HPSoLNSbmzrjeaH2W9x9YvHZk0ez447FOOYKWaXDi+xqmLe9IkALKxESyhMMUZk5rAdaYbjhBHZ6bzvxeN1noYXHLd1XziAUV3lH2zqif9vh3CR7Yjtb0m4WvElc0VzzkXSnA1uEsnRzpfiLu/+MEOQ8OxfzY1LPKFtp6Q4/tIF29XEmvCfX9DhpAgbnNVTGaC0+UXK+gSnbpnr9vYX/f0Lw19B/oWiew==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0425.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:229::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:58 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:58 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:32 +0800
Message-ID: <SY8P300MB0041E7AFE316064886B2F270B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=7246; i=tfx2001@outlook.com;
 h=from:subject; bh=bl8Bku12YVB5FIEQvBaeOScepxHPyW2erpu37eCykBQ=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+Dpfq7rMKwuZxcwCp46pzx8uxHt4xgOZ9BB1g
 MvF7Mn4762JAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6XwAKCRAcD62l0/wL
 2us4D/9/vUNGK3Jg0OJ2GWYTeSPXZUzDJ4I7eis9XXqQsgtTkLNIlYONQSGxupyCUjcERUbNe/N
 lRm7b7tNcL10C/o5AMwHJGh1tdd1xdJxtleptJ6ZcTwmSzyQVwrI2QLil7l6hedowAJMrzrCt7N
 3J5SaUCLqW648iFkhtoQYKNL6p0tbzrKaNW/GHFgdmqlo1B/CtNO/9g1aKc87sBMJKacG0pwjWO
 G83hj6ntNrlTwNhBzLwBQe1uaMOEA9K/oONUtivyIdZP0TTgAyGDKD48vsa0JEL3+vJPRfhQ6U1
 W1CRpVg8Jot+H0AlWn8L+lEnr1/sYB56krR46tgaavRwc3N+Rf98Jb15NSNR0i7wgXduNLR9i87
 FSfLvgT/OXh6fdIchXWPRz7dprZnwTf/zRcDvN44XH0Y3Tcj+tmhf4RqX3NrCUwdO7EUbfnsV3b
 ifls4prZrpMDzmIqr7KrMBBoIBwwy9ccfOgIbyNoz8kjBOO0KKrJQpqa71N6mWgZu9VPqsWG7fE
 Y413NhWM9Kk3Ux+01+WvAw60JL7QDpzEv4/BrA+z/EXeBFCnQcNpjU46aw9Ym46Dy8RCZVhaEg4
 KcjpcZPOJ7kmDYa2jZ9yxkutEXKou3Pe/U1t6Apj2PfT5UCQrIsLPzBW/Rl7/iLnHMDHCzccYZv
 L5S6m5XqnyTzyvA==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-30-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0425:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e27457-9e43-4646-336c-08df423c0c07
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|16051099003|23021999003|2604032031799003|704163111799003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0pKUjM2YS9kTVExNTdqeG5DSU9veFU4RUxVOHp1cXBOMUxaa0s3OUJIekpa?=
 =?utf-8?B?a3lGWlR4REk4a1VHZG5SWmZoUEhoQmdlTnh0RXJtS3hkZW9uRktiUUVRV1Qx?=
 =?utf-8?B?SE5jdEVzS2plcnpyUUF2L1dpZU84WThUS1N1R09oOGE4V2p1QmhuTHAzT2w5?=
 =?utf-8?B?OU5zV0d6aFc1SHdxZkJobGNHdmR2UkFCSFgxSVB4T0tUSkNyeVJEUHlxeGlX?=
 =?utf-8?B?Rkt2L2QzM1ViSDFleU5lbEFlQTFwSExFMDFOa003aXoveVRiYlI0SmxPSTBM?=
 =?utf-8?B?Ynoyd1F3SGF3ai9xQVl3MStpK2NVUi9xRHF6TzJsdXNRUWFTNWtsZmZjdHFQ?=
 =?utf-8?B?S3JHaGF3ZGp1am5VZThURDA5dTF6czVwRlFXNFFNeVBqeHcybk9zTUh5YU8r?=
 =?utf-8?B?eDZHNGhiRzk0c2F4UTZ6Uzg0V3hlVkg0WVRLaXlsKzJma3Rrb0VZd3RlMU5l?=
 =?utf-8?B?dnBiN3NVdFd2Z29yMHlVL1BxU3RlYS91MWRBcWRIbjQ0UEUrWVQ3Y25HaUxG?=
 =?utf-8?B?Q1k2aVJISE44Snh5S3ZVdi9oUzNvbjZiTDIwRU9leStrQkJEMjZFMlhLaVVJ?=
 =?utf-8?B?U2FyNHg1anFOVUhnQWhXQmFtV0ZWdEVJVFhpbjdQdUFleHJ3T1IvK2prZC83?=
 =?utf-8?B?VFJEMkhNczI4MWUvZkhGcEFtYmNPZUxIR2ZQc2NXWXVybE9KTFBZV2w1SzZa?=
 =?utf-8?B?ODJEenhRdDgySmtyZ3d6dWk5QVNSSlUvRmJ6L0Q1Y1htVXBXQVlFZnlGNFB1?=
 =?utf-8?B?ZHRBcnZaQUd4ZUEzajJDcm9VZnYyRWdjK2RtdkV5Q0JYOFJTelVpdDc5b2hF?=
 =?utf-8?B?eXAva2NNeEoyWXllZVlsTlAwbWpCL2QzeTFpNi9jZ2xGcnBraU54VVZlMTgx?=
 =?utf-8?B?Vkg0d0NiSTBMb01neU5TSXZ4Q25MTFVQVnJjZlpRS2VCalJ5dWR0anVrNGsz?=
 =?utf-8?B?eUVFVWlxcTU2dXh3Nk1BajZXSGYzNFprZHp6YmhZMThpZldCY1A3Y0ZKQVRz?=
 =?utf-8?B?cnBXMmxnR05qUzFQUGdyVnJ2elo5eVRWNWhKNkZubEhLdmc4MzFna2FxMnpK?=
 =?utf-8?B?a0RIaHd4Wi9KMktjYnhXN3lkQzdwRW9MdkFJaCtVMnI1RDhVN2R1aFdhdkFa?=
 =?utf-8?B?cnYzMUZVL01ZWEVLNlBqUXA4L3FGcUNPUmZoc0FlVnk0U3VObmRFZnlNY0FP?=
 =?utf-8?B?UUJoV1lhVzJpSCtWVmVxOUtLZWFSb2Z4YTEvNlJwWXFyYTdzcXk3WXlzTzQy?=
 =?utf-8?B?cjl6VmlmYnZGMC95bmxaQnZsMG5kTC9LbUFwOEd2UjZ5MnpIYWpUWUFaREU4?=
 =?utf-8?B?Wm96SWUvNmE3MHAxV3lzWkJBSm94UHNiV29HV1ZQNm80ajVocmJtV0tUdGg5?=
 =?utf-8?B?anB0V1JDSWI3bnB3bFl2dW1EMjlkSStxbDUrcmlyTzJYd3dIMUh4cUtvRi9G?=
 =?utf-8?B?bFJRb2g1RHppclpQenk1RjZwQjV5dnZ6VSt5WElmcEJPVnV2Ky9JNUlBSlNx?=
 =?utf-8?B?aXZZWUxFZjJ5OS9QMFZwblA3M3IzenZVbzlGbzBwNE9GTWtvL045L1hqdGJy?=
 =?utf-8?Q?F4tpy6rsLjiRryK+SGsEWq1OTZFrDET9a4GYbqtZfwCMWj?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDMrRTZkSlk4THhhZ05YaHVmd0I4dTZvR1l6WmlrUWRKYUhHa25yRW9ySmQv?=
 =?utf-8?B?WDBGbjd0SCtienoyQnlSek5rc2hiSjRjMWJVTlBWTXhueHhYYXNFNlhmaFox?=
 =?utf-8?B?cE9TQlN2NWxjZDZIV1NVRmprODZ6dmYxMlcxYVczcTEvZklUWTZMV2VZWmVV?=
 =?utf-8?B?d0NId25FemxhR24zdjFVNkdOR1JROXRObXJXL2Jqd0dYV1N0ODZIR0o0S2E0?=
 =?utf-8?B?dklsSm9PRU5SdHA1TXpYYlhuTFBSM20zWDZqWVdXU3ViczZucllNMWtTUi9L?=
 =?utf-8?B?NU8xRWlKZFdiZzk4cXI3bDJGRHgvYW52Tm5lYmRxMlhQKy9JWlZDU1VISEk1?=
 =?utf-8?B?aFg2UDV0MkZ1cW1PWmhzZXovZkxFNWc1eDJrK2l3clRZK0hiaGNKTzlPMWhr?=
 =?utf-8?B?RTFYWW5BVHROSEVsdGd3N21rZ3IxWlFXVTFrNTRaSE8zdEFlRWxqMFFzVUxD?=
 =?utf-8?B?ZEhnTDdOZXpLa0VvSzd1Q0hIb1MrNDVoSVhpN3NjRGRQdkZFakpnZjNWZEZp?=
 =?utf-8?B?WkhDM1FQMVl1NHRQLzZJbVI4RnJJcUpYK3NrQ2FZenhUNFpWeWpiSEgwNlg0?=
 =?utf-8?B?VkFFNXN6dHYrc3NtMG5TS0pUZWI0aXNkTDdaR1JKNHorbnA1MVVrd1FuVFJT?=
 =?utf-8?B?SHFmUXF1ekRucE13QXYxN1hjaU5qbDduNG1vM0dNSThrQ0dBdmdsOGJjUVZ4?=
 =?utf-8?B?NFhQVUZUV0Y4UDZJcUw2K2RDT3ZrMForRXUzRFJYMUk5VVF4dTFkOHNBU3hH?=
 =?utf-8?B?aVlJZ2VhbDVHWkJIL3hOUTJwK3loaGt4cjZISkFsLzg0RlpHVUdETkNMZlBa?=
 =?utf-8?B?WjZrWlFpY09tVlFYQTBVN3pHZUhlL3ZJaGRDYmNreXZvdG04TExyNjNoMzBZ?=
 =?utf-8?B?T1FaOTBkUFpNMjdsbGp4enMrUHkrREtnOVo3Y2tBekFkWXIySDFGYXFka3F0?=
 =?utf-8?B?T3BaWGN2d05QTkZ1Q2lueXZzRFhIWkhwdnRaOTAxQmcwb3g3VUxhbzd0Uk5D?=
 =?utf-8?B?RTZURFMzNzc4N0FvVWc0bjU0dXlRcnNDK25pZTI2bjg4bi9ZUXFKVnh1UmMr?=
 =?utf-8?B?dGYxYmVCTEYwYTE5WVBEbGRHRDJ2SW4rNjB5THJVNFMzdFNydjVVeTUvL0NZ?=
 =?utf-8?B?dnJSQldpUml4cTZkM0ZPZDBULzJwQnBpS1A0dU1ORDB5cU44N0NYaWZPYm95?=
 =?utf-8?B?MEw4N2tzcSszUkxXdEhsa0RQdlZPVzNFWmpOVWZmMEthYzlDWjh6c1hvNU5q?=
 =?utf-8?B?MW5yRW1IcjdWY2VkMUd3QmV2ZDhHN2dNV0RTWGI5dFpoYlRBTTFqam10QzRO?=
 =?utf-8?B?dW1Oc1kyZ3RIOXVqaTNQMWlpY2RqZXFaajZmQnF5aFZkVGVKMWRtUmJwNmth?=
 =?utf-8?B?YVlBOFNvdDV1SEthMExUZy9hRlJkMzRHcUQ2ZkYyeG5XOUd3Vi9ZTEF4aUFK?=
 =?utf-8?B?ZHQ1WTE0U2NvZ2laN3BhVVQzZ2hFVnZ6QUxPUjlTakZTNGUzRTBaK3Q5anR0?=
 =?utf-8?B?b0RyMEc0SXV0WUtJK2xBdXphcmkwYlA0VUd6M3cxWC85T0s4YlFSeXZPcExV?=
 =?utf-8?B?TU5EMlk5QnNhLzR1VkpxTWhYbVhuZzRCam9HYWJQa3hlcXZGZWhOYVZ0NmxK?=
 =?utf-8?B?a2FySHNsMU5jR0F1QnFZdkJ1R1ZmTmozRGFzeXkvUytkdGplV0JRN1JoOGpB?=
 =?utf-8?B?OVpIMlRLakNiSVlVNSttM3lhVy9ydjFaeFlCdi9vNW9mb0ttZUVCOFRtYnFl?=
 =?utf-8?B?K2FxNHNUNWpvblpmem1BUlhMUmFvQ3dlVU5NQlVTL1EvWXRqMktYbGFGWGJv?=
 =?utf-8?B?a3U2MEJTWXNVR0JKWDR2QUpUU05NbW5wUWhvZVJmN2I2L2lwSTN4NzUyTXRx?=
 =?utf-8?Q?+hAvfp8zGRIMA?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e27457-9e43-4646-336c-08df423c0c07
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:58.0346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0425
Subject: [Buildroot] [PATCH 14/14] package/gstreamer1/gst1-vaapi: remove
 package
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

GStreamer 1.28 removed gstreamer-vaapi in favour of the va plugin in
gst-plugins-bad [1].

Add legacy entries for the removed options and select the replacement
va plugin. Applications must update their pipelines to use the
replacement elements.

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/82a71a7739fea9d48e9c64f44bce879b86bd3df7

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 Config.in.legacy                              | 18 ++++++++
 package/gstreamer1/Config.in                  |  1 -
 package/gstreamer1/gst1-vaapi/Config.in       | 54 ------------------------
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash |  3 --
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 59 ---------------------------
 5 files changed, 18 insertions(+), 117 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cb3e483e62..2bff5075af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,24 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_GST1_VAAPI
+	bool "gst1-vaapi has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VA
+	help
+	  GStreamer removed gstreamer-vaapi in version 1.28. Use the
+	  va plugin in gst1-plugins-bad instead. Applications must
+	  update their pipelines to use the replacement elements.
+
+config BR2_PACKAGE_GST1_VAAPI_ENCODERS
+	bool "gst1-vaapi encoders have been removed"
+	select BR2_LEGACY
+	help
+	  GStreamer removed gstreamer-vaapi in version 1.28. VA-API
+	  encoders are provided by the va plugin in gst1-plugins-bad
+	  instead.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M
 	bool "gst1-plugins-bad y4mdec moved to gst1-plugins-good"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
index 67c33e5d4e..f384329a30 100644
--- a/package/gstreamer1/Config.in
+++ b/package/gstreamer1/Config.in
@@ -14,7 +14,6 @@ source "package/gstreamer1/gst1-libav/Config.in"
 source "package/gstreamer1/gst1-python/Config.in"
 source "package/gstreamer1/gst1-rtsp-server/Config.in"
 source "package/gstreamer1/gst1-shark/Config.in"
-source "package/gstreamer1/gst1-vaapi/Config.in"
 source "package/gstreamer1/gstd/Config.in"
 source "package/gstreamer1/gstreamer1-editing-services/Config.in"
 endif
diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
deleted file mode 100644
index d6a1542ad3..0000000000
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ /dev/null
@@ -1,54 +0,0 @@
-config BR2_PACKAGE_GST1_VAAPI
-	bool "gst1-vaapi"
-	depends on !BR2_STATIC_LIBS # dlopen(), libva
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libva, libdrm
-	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
-	depends on BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_LIBVA
-	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
-	help
-	  gstreamer-vaapi consists in a collection of VA-API based
-	  plugins for GStreamer and helper libraries.
-
-	  vaapi<CODEC>dec is used to decode JPEG, MPEG-2, MPEG-4:2,
-	  H.264 AVC, H.264 MVC, VP8, VC-1, WMV3, HEVC videos to VA
-	  surfaces, depending on the actual value of <CODEC> and the
-	  underlying hardware capabilities.  This plugin is also able
-	  to implicitly download the decoded surface to raw YUV
-	  buffers.
-
-	  vaapi<CODEC>enc is used to encode into MPEG-2, H.264 AVC,
-	  H.264 MVC, JPEG, VP8, HEVC videos, depending on the actual
-	  value of <CODEC> (mpeg2, h264, etc.) and the hardware
-	  capabilities. By default, raw format bitstreams are
-	  generated, so the result may be piped to a muxer, e.g. qtmux
-	  for MP4 containers.
-
-	  vaapipostproc is used to filter VA surfaces, for
-	  e.g. scaling, deinterlacing (bob, motion-adaptive,
-	  motion-compensated), noise reduction or sharpening. This
-	  plugin is also used to upload raw YUV pixels into VA
-	  surfaces.
-
-	  vaapisink is used to render VA surfaces to an X11 or Wayland
-	  display. This plugin also features a "headless" mode (DRM)
-	  more suited to remote transcode scenarios, with faster
-	  throughput.
-
-	  https://cgit.freedesktop.org/gstreamer/gstreamer-vaapi
-
-if BR2_PACKAGE_GST1_VAAPI
-
-config BR2_PACKAGE_GST1_VAAPI_ENCODERS
-	bool "enable encoders"
-
-endif
-
-comment "gst1-vaapi needs udev /dev management and a toolchain w/ threads, dynamic library, C++"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash b/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
deleted file mode 100644
index b01ff938af..0000000000
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.13.tar.xz.sha256sum
-sha256  b92c008841387043aec83b08b1fa8cf41e7866a106311a7d99e274e7d24ddc47  gstreamer-vaapi-1.24.13.tar.xz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
deleted file mode 100644
index 418369c38e..0000000000
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ /dev/null
@@ -1,59 +0,0 @@
-################################################################################
-#
-# gst1-vaapi
-#
-################################################################################
-
-GST1_VAAPI_VERSION = 1.24.13
-GST1_VAAPI_SITE = https://gstreamer.freedesktop.org/src/gstreamer-vaapi
-GST1_VAAPI_SOURCE = gstreamer-vaapi-$(GST1_VAAPI_VERSION).tar.xz
-GST1_VAAPI_LICENSE = LGPL-2.1+
-GST1_VAAPI_LICENSE_FILES = COPYING.LIB
-
-GST1_VAAPI_DEPENDENCIES += \
-	gstreamer1 \
-	gst1-plugins-base \
-	gst1-plugins-bad \
-	libva \
-	libdrm
-
-GST1_VAAPI_CONF_OPTS += \
-	-Ddrm=enabled \
-	-Degl=enabled \
-	-Dexamples=disabled \
-	-Dtests=disabled \
-	-Ddoc=disabled
-
-ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
-GST1_VAAPI_CONF_OPTS += -Dencoders=enabled
-else
-GST1_VAAPI_CONF_OPTS += -Dencoders=disabled
-endif
-
-ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
-GST1_VAAPI_CONF_OPTS += -Degl=enabled
-GST1_VAAPI_DEPENDENCIES += libegl
-else
-GST1_VAAPI_CONF_OPTS += -Degl=disabled
-endif
-
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
-GST1_VAAPI_CONF_OPTS += -Dwayland=enabled
-GST1_VAAPI_DEPENDENCIES += wayland wayland-protocols
-else
-GST1_VAAPI_CONF_OPTS += -Dwayland=disabled
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
-GST1_VAAPI_CONF_OPTS += -Dx11=enabled
-GST1_VAAPI_DEPENDENCIES += xlib_libX11 xlib_libXrandr
-ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-GST1_VAAPI_CONF_OPTS += -Dglx=enabled
-else
-GST1_VAAPI_CONF_OPTS += -Dglx=disabled
-endif
-else
-GST1_VAAPI_CONF_OPTS += -Dx11=disabled -Dglx=disabled
-endif
-
-$(eval $(meson-package))

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
