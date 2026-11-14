Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F9606A323
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BinU+gaU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=MIIaVUbJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE67640E22;
	Sat, 14 Nov 2026 10:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TARIAPdvcXcs; Sat, 14 Nov 2026 10:42:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1858240E09
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652959;
	b=KfbP2r3fufozs74yXHVAQkJahnnG9pxXkdVMX91JD7QjE6JG77/a8rudbB4n4c27k1e/
	 Q1gaHJ7Jp9nTsr8GkVsroT5d6KJCFrvG8Am1EpOtCJpP7C0rQEmmCGtAF1ZK5d6YwlR5I
	 T2mVQi4ndCmPM3vY23FBnm0Gog38o2w7gFqR72/51jD6V6adTkMvdpckLR/eCMOtpY+mg
	 1tbByKjXIU0R5zcKCE2OrLA6CZOLxqD+EPnyvqMtXX4kwNCmnbGZcDj/CVC2XC7o1D9dY
	 hHLkbCiEUhid177f/gsw2gREAMSA3lgyTeNhXTwErT9h/8R+y72f1s70Tlya7gi0FpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652959;
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
	bh=RQ7VIvIvzasNCYsuRTYlNsfAIPE9UE2juwuBgN/mQZ4=;
	b=hPwtNym6DSpuPW4u/Gd5ESKEwEZXUBfr9nAQSvTz+g8BY2rXNvjr4CnAhA86lGhm+KeU
	 Vwj0eQUUVh+e8Gjuv4vUdcPJcZn2tnd1nUxQCjv2/WlvrtN8AgTungr0LHFY7TdNlYbco
	 D4MkBpTnzwDhXRVLf0Z/7zeuHC8NNMnJzUFFDn07R0Qy+iaWxs8HZsVBD3YZv+5TWTzgJ
	 cfw946sD3kx7XFdLcsnCz+OgPDIPpj6HakTKWhjA0J4lZAH7xa9vMpuW6mcz1BjZiyHH7
	 PmACTOcrw2XmjEl0b2DJOve1d2CD/B2c1wMQtNQyfepRN8LSqm8dosG/FiJwHhSbdMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652959;
	bh=RQ7VIvIvzasNCYsuRTYlNsfAIPE9UE2juwuBgN/mQZ4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BinU+gaUwHjlr+FZUB2q4YWgh6KYcmcSFBLwmpiT2bYANEdqVFi0oY12p1u4Wtejt
	 95vt3OUkPYUtTi7TI+twhJSHj8StkuNhKqsRExjBhL44DsJ9ftakdHxmbceBk+rnfW
	 04QLnkApWrV/+v4Ckau3hM4D53o+7hL4IlVW70TyB7gS2m0v39jayPfHh7nJJnRZJd
	 MCYFmDt2tL7NX5e6/+KkMBLQvBO5hLipPaf2o7ZBxQSluiG0peAuv2lgkVP9hUGZR0
	 qXE/PDG8s1bYoRvCAJYJkB8bIavLl1VFjae5wN5VYtV9yx85q1OFL3UJEASRXfyrjB
	 5LrK14Rnuglqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1858240E09;
	Sat, 14 Nov 2026 10:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A021A9B6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DCD0819D5
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gqhscuQV1rIm for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AADC981763
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=MIIaVUbJ
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AADC981763
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZglWXdVcBV2FbxK3sUtEVUEBcmeTNebz5iklGEqhPw=;
 b=MIIaVUbJiqmDRnMgzOeBBB9OvGB+JNAneLAs2nt9RUEZZGGaEX7AEx6Vuf1bmEOfDM85JMuCIhTm5ncUF/+uKHkRmg31PobEeJGmze+tVJXV44EYEsylNVdbrZM+qlmFAVZ8kw9/9HRFShQctblZu6mWzMyoyzYdqgkvD15HMlakiqWSRNVav9pinmLFSink6RZ4XIaya3fxhzYq1GMurhraWSz6kajKWw1r8Wdt2hsoCsKn7dA0nk2W05aS/ey6K2y8lcui3gFMo/4ZOfM4ux4UeVDhILn/AUi63iT+EtG2wN+DH6xoGmd9NikLceLV5oBNez1Tm+7yVrvCwouipA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:27 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:27 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:21 +0800
Message-ID: <SY8P300MB004100EAE2864D81C8FF6DFEB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=tfx2001@outlook.com;
 h=from:subject; bh=0WB0xjRh24vH4ZAN2zinaHQVThNOpJLSqF9oGVawKpo=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+DpXSgb5Y5a6hRgOJ9skfc7kDWtPI1VQw6tth
 1t8RrgI4hWJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6VwAKCRAcD62l0/wL
 2lnBD/9hvp4eVqQo2g+tV1PT8QBpgN9B5AgKVFoP3AvgA62fMhInrXs9FENqup9wijpoM6Xu1oD
 zSzdv7aegxgg3yERARDAr6twynizEeLZf6Vf1zxlte8QIq20vHWzoQ9y8o++DbZGlhp+RgYT4OR
 0H73u3GhdGK4uHofpvPwrd1wKNFtgpEjmqJbW7FBcaDJ6tNzHnS8TbAe21TeyPx+fUgMuyp13lz
 V8QkcUcQHuYRtA1/kOu64TeAT5fPeIPI2GnIGFiV8NmjSx4GURr7SsT+WavTDY+aHceTvf561bR
 dDoh3o6X7sDwc9F/0wu3qhU+znPW5xx0CyASUlb9VGfXRzCiYdrl9zeyM+vfRjV6cxuMZ+Tf6xJ
 hAmLZ7Jx625r/9Emheo7FiAEWsMWsMwRuHX0muDoY5BNUcAP/VMDoPns41SdZHRw/2zfE32Z1si
 5fvYqzTGX43ATthmWVrevqnokKiXySYlwaTKy6v1TRxS6FaDpsg3Pioa244uKtcP2TlUZcMPiPa
 5itE1Qc6FMPOLjztyBelosmjBD4kiOUfbKTztpymBnjHIv8YtU8s0DVJraOWJuKUSbIMj9kCFIW
 KN3BGHGxOzsv6R3HZz3w6XtuFXTaS32nyIG2FCjgdbKeGZo7zKNuzu60pY7qPFXh3IBM/i7B6aA
 JzTpWob+6LI5tsw==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-19-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f33d62-0369-4116-802a-08df423bf9a6
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0M1Tk1hSWtJMGZnQTJZTFYwNzMxTEFQdExyYUVFcDYxcWZoY2hLN2g0blE3?=
 =?utf-8?B?ZkZOMmNuOHYvSVhobEJacHg0MjN2ZGQ0VnhmN2E0N2d2SVJTR2RNeTFkSFVO?=
 =?utf-8?B?eHBGZGtHLy9GSE9ydm1MbmozdE1tNlo0U1VpZ0gwOFBaQUFjV2hUQ250OWZr?=
 =?utf-8?B?eVdoMTUvcGptdkxuN3dpQW1kUjNDYlRzeGp0L044RXIxR3l4QVJPcVJyY2Vt?=
 =?utf-8?B?dGtxM1p4NG1rdjlFNTM3Szl2Q0ticFB0YitGcjhybUNCR0xCNTQ3c3B2cnZC?=
 =?utf-8?B?N20rYkdDRDZ6ZlNaekVrUEc1aW9aV0RNVGRLM3hwbVNMYWJNSjJPS3RXMXRU?=
 =?utf-8?B?QjJ5TjNhSitnZml5TFI5YmI4QmxoZWVVSDJ1R2lXV0lZc1J3ZlRUWEYrckRB?=
 =?utf-8?B?UnZJanJQMnN2M0VwVnArd0RrOFY4cnc1ZnNRMFNLMmlkV0lrNW9rOG9GZ0xL?=
 =?utf-8?B?aHl5aGNENGovVndvbFlPQmtod2NBVTJRSHhFcDQ3SGhwTXl2dmhzU3VMTU9x?=
 =?utf-8?B?MjNrdGhEZnhWY3FUeit1SDVvcGdaSUIxQnFhSDNDNkt2bGhVbkQzWlYybnRw?=
 =?utf-8?B?SUxQSGxJS2w3NzFNTFJrYWJvaFVadXVnRms1NWxxQktJeGdkOWUzcHBOWlBn?=
 =?utf-8?B?NlR3SjNuTmdqUWM0QlFEU0tvQm9hMmhoZmJBYVVxUjRaK1hFY1hHZVd0SEFS?=
 =?utf-8?B?S2dhYkJ5VkJVeWU1SG15bzNRcEU5WFlrcEFJTXJUWGxQbzNzM28vbnN1d1Jh?=
 =?utf-8?B?M2JmaUhlamRCbGpMSi90eElyV3ZhRFA2UERUd1NjclE3VWd5UEZuRHFHRHV6?=
 =?utf-8?B?Q3dFM0RiMElRTmphSSt6T0YzN2E0aDdEdWNyQUpOVHgzYnNlSW9jT2JoTmtI?=
 =?utf-8?B?dTdqRGJQSnVIQ3BCM2pFUzZFRStyRnhhQ3FMK2xiL20vdmVJK29DWTFLY0Mw?=
 =?utf-8?B?VExFclo5b0kvMUIrdDIva3JpNnZlZUVyNDArUjh1Ly9nVDd4M01STlZ6elVl?=
 =?utf-8?B?S2ZPUHVwYlVpeENQUmEyRXFub09COU1oUzhEek1vTndGU1phSkp0UDVEU3hw?=
 =?utf-8?B?TElqMVJhTmVWQXpKSExUVkFlL3MxSTJwOXlnUUdaZGt0d2dYTzZibnlFMzZy?=
 =?utf-8?B?c0VNMVFyQnRRNG0xTGxjL2NqWW4vNEp6M2Ywc0ErRWl0U3lHU3ZrbDFNcmJT?=
 =?utf-8?B?TzJQRGNCaXZKNkRJczNyM1Y5RXpqMDVSck96dFo5c3VpMTU2Q1ZQR0pMWGZS?=
 =?utf-8?B?M0xBa1AzYS9Vdzhva0ZMNHNXdmk2WWswdjJIQURWTWpuVDg0NU9pMllpOWlv?=
 =?utf-8?B?eVl4YVhJUGlERWtqbTBTVGloNVBWcnRTeWF1QkdxQmdnZjU0a2VxS0h6bUY4?=
 =?utf-8?B?NnpFRDJVRklPWnQ5ZE1XcWpwc3hPTE02ellKemxMNWJ1dXdSajhqUjcwSHB1?=
 =?utf-8?Q?ymAgo0UV?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTY4dmJveEJPVlhCRXh5eGZmMGFwWWFNblZoZWRTL05YSkk5K05TNnNYankv?=
 =?utf-8?B?NkRRSEhENnc4MlBuNVZuUVlUalNmdDY1MFZvUC96NzRORjlmRDhvZkZja1ox?=
 =?utf-8?B?YitobjkrRDMvM242NWxBeEJTUUtjV2NLZmVzMmxmN1MwMmQ4MnM3Zy9uVE5O?=
 =?utf-8?B?WFRXMGs5dUpvL0dEaHZPdWpqaTVNSXN2VjhZQzZrQjdleVlHM1Jqbk9SRjlz?=
 =?utf-8?B?UWFBWVRwS3NKQ0JXMGIwRVdNR0c1TWZHeUNpZjIrS0lxdEN3dWlMeDcycGJK?=
 =?utf-8?B?c25nbWpubWNDTklLYW9kd1d3RHpFUW9OMVpXODBpbnNzWDBXNCtIa3N2SnIw?=
 =?utf-8?B?OU12TU90cGxYQjJvSWFCTk1LbndEbW5Ld2t2a0l1SEs1R1grMkJtSHZPQS9C?=
 =?utf-8?B?Q1RvbDFiRXM1NHk0NklnNFRuSnI4blBwMWdjMEcvME1CVHQzcWlRMkNFTyto?=
 =?utf-8?B?ZFIzSVozQzFjMHd0YnV2WW9wWENFTEMvZzJVYktxSFBCVGswd1VGVEoycjNG?=
 =?utf-8?B?VjNXY0dnZS9mWTRqaVJtZVVESVBjTWM5Z2NVMmIzZS9VZGVmT3hCUlBxaERN?=
 =?utf-8?B?VFFmRTIrbGUvTGU0d3JjaWtWY1ptRUx6ZUpIU05MbWNvL1JhV3R3YUNkY1M2?=
 =?utf-8?B?VXpCV3UyVlpSUktXUWE1ak1pNkhKS1JFMUlkWElDWWFsR0xhb2VzTkIxNGhk?=
 =?utf-8?B?Sjdpbld2RjU3b3MyZk9ualN4TW5ZRTZzMm9yR3lBSEtMMVFOai9iQlRuaGxP?=
 =?utf-8?B?bkFHb3lhUnpsbHk4YzAxUHdMQ2dqUjF0cldMelRxKzREOURtc2RPY0EwWGNk?=
 =?utf-8?B?ekVaRVZFMDR5ZVdsZmJPRVh6Z0tFYXJKaktwWVRvVmVta0p5R1dHTWlWZzIr?=
 =?utf-8?B?cEh0Z20vbFc0U0QxUUs5cFh2NDAweHUyZ0NZSWx3Ymhac2lxUCtBWUlzTXcv?=
 =?utf-8?B?Tk4wZjdGK2tqY1lWd3dmQWY5UFJlaEpXbTJNNUdSN3kzYkc4eDZEVTdpNXpm?=
 =?utf-8?B?ZDRlRFhkdThuOTYvbGdMcmpGejk5dFJXczAvaDNFZE96dVI3c2tTTzJDdWw4?=
 =?utf-8?B?S21SVkd2SmZMY1U0bm1nckw5cGFucXZTRnVMdWtVdUlVa0xnOVArcFAvMkNW?=
 =?utf-8?B?MnNVS0NyeU9kTkI4MzBtemdTQzl2cXpjQWxiL1J6ZEprOEl0NXVkV2FEYlZD?=
 =?utf-8?B?bW9kM3B2OXFPUGtQWU1IVVpwMU5TQ084Nm1CVC9XUHhDQjIzdEYxcHFjY3JG?=
 =?utf-8?B?Q3BlWERjMXBTRnVTUU9jOUVMcDlESE9rbENIZCtWVzNURXBvM0VNRWFVMytN?=
 =?utf-8?B?Q0ltQlNSdE1Xd2MyQlJJV3ZKM0ZjMHN4alRic1ZBOWJUTHRsaGszV3VBZm5G?=
 =?utf-8?B?azU5OExGOGV4Z1Q0NE1sa3NiYnlSUnE1ai9EQkhhS3hKbzRqZmlxK1U1Y3k0?=
 =?utf-8?B?V3RGcU1mVWNnLzkvSjBXdkkvVUF1dVhFWWRrdlowRW56dHFnOTZCV29EdVMz?=
 =?utf-8?B?VzBSeU9sZjlnbW9EOGRDVFpicGpQVk9GTUNSb1pMc1B5UzJNNnZOTm5KMUZh?=
 =?utf-8?B?ZFRvZjZxNkpCSG90N01YOGoyMlhHVDNSZ1A0bldYVlo0MjVhRmRFR0x5Wkth?=
 =?utf-8?B?TDBqK3Rnd09SNWhsbTBkM29tQXdJYSs0QzlaTjhCbjNnN0ZPWHhOWUdkVStT?=
 =?utf-8?B?TDNtVFhoTENkaVp4cEZBNkNlQmFOVFk4akNlMHU2QU50bWZMc0V6dVF4Vk4x?=
 =?utf-8?B?U28zVWhoVVlnb3FsbTdQQUlUa0s0OEc4RHlUOHNNamxSMmVWOXNyTzNlTm5E?=
 =?utf-8?B?eS9oUkF6S3VXelVaOS93blZaWFJycjRTYk1wUWpYRXFOUE9tb1BsV3RGVHYv?=
 =?utf-8?Q?qJB1OE71on319?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f33d62-0369-4116-802a-08df423bf9a6
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:27.2193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 03/14] package/gstreamer1/gst1-rtsp-server:
 change download URL to HTTPS
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

Fixes: 5a7c9266c29a ("gst1-rtsp-server: new package")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 2b54692b4a..a3143f0c55 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -6,7 +6,7 @@
 
 GST1_RTSP_SERVER_VERSION = 1.24.13
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
-GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
+GST1_RTSP_SERVER_SITE = https://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
 GST1_RTSP_SERVER_LICENSE_FILES = COPYING COPYING.LIB
 GST1_RTSP_SERVER_CPE_ID_VENDOR = gstreamer_project

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
