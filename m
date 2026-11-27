Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C446606A336
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iMZYbNk5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=VXluIau+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DBA81150;
	Fri, 27 Nov 2026 15:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVSisK6l3eHF; Fri, 27 Nov 2026 15:30:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F2BDE81136
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795793405;
	b=nEUmM5A/i6x1rO5UADc39ZrUoxDDGYyiI8Q6bpJoSzctrl7h74YFHvEgyj24KZtPb74X
	 s8hC9kQXrgz8zqYIBB0DcUe54KJcgSv2lf/n0w6smE+mdeGu0XGhe1BKD4+M/BfKVytNI
	 ehsR8V7Y6Hf6E0C2RS2IHMsUnPKjbUCvBfOTujfvNnr+tK+0i8dsAmJhpmQC0tYIKPVRI
	 aHCsa9gr1wog45Yh2ecyLzdUL7oZJyeN8DOhHLKC7tQdH9SVMkxLi7+fpVy4SAgpHNfCb
	 IU33ZRo6gH0Y3sit1fL/poEQeBmbTJUu9rWNy49s22fYGLvlaKL7k+TwcEraStDKaLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795793405;
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
	bh=KCLmCzpL8P9iKrWlVE6OkDA6SmT7otJ8S24XkzQRN24=;
	b=W7jkDPL5vtdaa7X29VUdlIZDv9/BOCU7Src+ExI2P/ENHOyxi84rZZWjgXyXIgk5AxDu
	 M9BfnArult2nQXAOyi5mZbcY1Kcb2714lQeOnEteVRCDGah79lCSvUsUywkWG9sD6LP0l
	 elDCLPvSpizA8gPch7CuoEige0pnIycDFYyk76qUSRu6R3WIUtIVjtfss4H4Q2s8xiHFm
	 uOXnRduUaGJJ6566fxpaTDPnNY/qEIPS3J4LVXPJjrz3DMP9mln9dvAHdweCEw7D8jz29
	 OdAl3xOCkSOyTl5L802BucGzjOxKi07rwsOQxVt+XIEQem/vlF4S7+/WOgm43xxt2CQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=VXluIau+;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795793405;
	bh=KCLmCzpL8P9iKrWlVE6OkDA6SmT7otJ8S24XkzQRN24=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iMZYbNk5gf+umgGdVgmLTvAIJLLNrZTm1kbD04Xgpt1X6dZEUMwA/GnAXUgfoqyDF
	 3atk56iM8Qla10KjGDCu9PXtGteFFxcpMl51ZmXlTuxhcBv2WZLBdea1q8jmgkgwkH
	 qbAwn/yIb/3Vm65TuIccTgEcgzA3VAt05edRx+DSS4y60Lav979pPf0qa7apTvqX6r
	 reeyCCnn9gpuZMewctRkOHEB86Sx2+o7g24GqW/6IYghqV6qNIhKP9DIld0gdQtd2I
	 7GsR7exDtuQ9QMoyCo4a6TA4J613DXP7b4eBRTygw798RBQBey8FhPaoZfZxNmGLWV
	 gCu5EEFzWwqjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2BDE81136;
	Fri, 27 Nov 2026 15:30:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0839C2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E28BF81136
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hf1I6BAfYQQP for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:30:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AD2A381129
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=VXluIau+
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD2A381129
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuDJtAwehcr1+b8OspG6swA1D3STNfGMCimk36+5NnI=;
 b=VXluIau+9RsOmMJkZFkh0YmXgi5MjQenZnrmZc66/DwFKJaD4hyAngYoil37gtl9pcP3epvukvc9PLCNLsJqq68q3txchdHzpMgCRaSGj5URpf51SS7n4kuLBj74X+xGSLFfNY1nGcM5Id9uKIZ27UHeS2FumygZ2r6dQ3P62OnltM1E1YEcF5dNWZW+AYUw09QrwUMXcqPUtdyKxMb+jMiMf2pGTO0LF3PxsYdVpcBIK2yEFyy1fw7gBh4uu3Hl+VFJEiOuKvaZLe7z0FinuZv5MLWtBF8JnfUKLiEk8Bxrli0EspABiKu79xXtCLfi5QBS4oxWMBFCI/P4w6C+RA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY0P300MB0692.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:27d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.11; Fri, 27 Nov 2026 15:29:53 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:29:53 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:29:19 +0800
Message-ID: <SY8P300MB0041CE6075BA450B89A3B4E3B5412@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230; i=tfx2001@outlook.com;
 h=from:subject; bh=Zk0cf9sJ+QyHqt+bIqBO+RC+ispYVsraiLgDQiK1y2w=;
 b=owEBbAKT/ZANAwAKARwPraXT/AvaAcsmYgBrCaHOWIm5THZLfKnXXNOKIRQbxdnPNw4M4wHug
 E7bETEyyd+JAjIEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmhzgAKCRAcD62l0/wL
 2vKHD/dwxRAaixA3FG0BaybREFS4XOx+DlbrygHV7MEd0+AJzKTHd/X0houW2W5+0vw10/K7+RF
 6JUlxzpb3JAhh110FviorSGjKNLUv5eTFWvc7WAGqBdequWfvaZicb/q+g4NwyM3kXSIdEoJtKg
 e5s2ohqhpw0OGzXviP8uUNV0gc49lqqC1uJlr+F1EHdsZ9b2E2+VLjYEurzSgXzIST5BtrLiTbq
 CKboH6uvBEkfmG4qXz58y77l/+GphTg7Hn4pDKxZWYVSsHlum86N+w/FCc3Luokoc17Kx2aUjIF
 9Q1BwSCubsftice7rF5adVSw/QWwq5PoT0dYBB9DDVsb2dHrsv6Im32clCbpttxLkNCTOaLmOzg
 h7y4jVxiLlSRnNaMw3DqLgNi+u0sz+dWauzTsDo3AnSeBH/B7Sfjfxa9b+O6iDpLiHZjX5kVDMH
 Jq/xC1ljMekn23xjlBf2Mbm/ppevG9yRiaLOI93kABLsCOtJ4Tpyvr42vp7sy+NKXVNbGliEXDr
 tGbo2/lxFin3DUEGzuhAAHidespZnXUpB+JhJRX2m5r6g7z04wYjZTPv/YX15QqLtOG5CbleFyu
 RLvfrsQ85y5eyK+n1FWNGyLvz+fX5ygRaTeRNtJ2kn6fbKhbG29jD6PlU6lUnc1ZYUleJUb4eK6
 W2lFAjhC+e1tN
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::12) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261127152918.358381-4-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY0P300MB0692:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e989bd-c091-40fc-4499-08df4c9b484a
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|25010399006|260925184616899003|16051099003|24021099003|8022599003|19110799012|5072599009|41001999006|24121999003|15080799012|6090799003|23021999003|22091999003|8060799015|1602099012|10035399007|26121999007|3071699003|440099028|3412199025|4302099013|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlJnY0dpTjExLzYyWEdDU0xIbytndTk3YUZqNklQWEVQd25MQzlSUENIQ2E4?=
 =?utf-8?B?RWlkVXl1TjVxRGU2VnVsNzZnNEMxQkNMQzlrSG05RXMxUU5jbmNhM2JqNjNI?=
 =?utf-8?B?UUJKeTBJWjQ4dUF1ZWdrUVBPK3hhSVV4RmdFbklhaTArSmhScm5XNEd4L1hk?=
 =?utf-8?B?NUpnWklqZ1QvUE5mcnBHWjdJb1FlKy82YkVjZnZNSWlwVlJwUHVaOExuSS85?=
 =?utf-8?B?VlpPYnRXZW90Y1RqMFR5cWljUlRianpzS3R1WFc5d2Q3VjhqV2tSN2JqeFZv?=
 =?utf-8?B?K0FYWnBmbkovdzlXUjIwMTJDUFVKVForVkZVc3M2Zjg5eHQ3N3p3Q3d5L1hT?=
 =?utf-8?B?S1k3K0lUb1p3a0JkREZvVVptSjM1aVRhMHFWZzFyOTVWRlQzdnNvMnBvNmZV?=
 =?utf-8?B?YS93M0FQQUFRdElGNmo4aGMvSDltUkorS05pYXBLYmpNQnBCakFwV3BBVE1Y?=
 =?utf-8?B?TVZSZjhGSnVtcnFiNmdSbXdrQS90Y0hIZ0x5aVoxemJIeldwWHdlelcyeE55?=
 =?utf-8?B?OGhhbGtLcFVKR1o1OHpPMnhVbkVkVG5paE1sZmpzQVlSVFR0aEJQK3o4SVpM?=
 =?utf-8?B?NHNzZXZKaXVuejE0QzhlSW0wRlgwYm5yZ3dtOHgxMlQvcWtRekt6U01vVW44?=
 =?utf-8?B?aDZVV01QR0s0bjFYRnJ2ZHdjNDN0Y01rR3RJS1ZiaFk4NnllWUJBcnhpMVE4?=
 =?utf-8?B?UWlLeWJxOU01OU03bDFRYUNqS1o5dHVsZTFwbWhyRFQrYlR1TUpSbmpVYWxu?=
 =?utf-8?B?UWhRWDdZMXBNbTd6aVVpejRya0JuZU5Tam43SnJkdUlwSm9xcXN6MkdtV21Z?=
 =?utf-8?B?cVVrTTY4MXU4UTl3UFJRN3FKZTNTcEo1SXp6K01wNFYxTG02N2VBM21aZ003?=
 =?utf-8?B?WVJqL2YvNG5TQ09RQUpwUkIyb0gyMEk4YUcyRkpnZmUzQTdaQ1JVMzN0a2ht?=
 =?utf-8?B?emxiUmhqdnpMS29XVG9hOGJxdjkxRzFuZnA4SUc4dFZoUVVmR0pyUG11T2p3?=
 =?utf-8?B?U2xiMExMRXRPMjJWWUgrT2VhNU9SYnE1NnFUcWxlV0Qwb29pdTFId0EvWUJV?=
 =?utf-8?B?VWRpRU5PR3VTYkduSWE4ZXVpTFJvNDZ3WnZrTzI5UTZtRVMwaGdjdWgwY3cy?=
 =?utf-8?B?ZXpVMHpXSnZyc09uSDlhZ2lhb2pZaTA3TUs4VEw0T2g3MDJFUlpZVzBaV1ZP?=
 =?utf-8?B?Z0JYR1oyblZUTG9oekZxVmlsMHJYOVdvbEMwWFc4Zjd5VW9YVDE0d3c2Ly84?=
 =?utf-8?B?Z1BIVk1oRFBEQVZpS1VENnUrSlFBT0hYY0VGQ1NmVmMxNXZ2VlNmeGlvTmNp?=
 =?utf-8?B?QjVFZmtQZVBHdkU5ZFowU0REZDdMMG1RbW5VM0Y5Z0NRN2tuc3Fmb2c0MytO?=
 =?utf-8?B?eWNZZzRlT2xlRUwxTWFJMlZxTVpIL2lvMGxrWDB6WHdIWVhSMGlkQ0RXcytF?=
 =?utf-8?B?OEZqdlNYWjdoVEZ2bk9TTlFwSDdJclFQY1R1LzJ4NHJ2dWhzelZEZDkzV01C?=
 =?utf-8?B?cXVNY21iZDBzMUpmL2huQU5vL1JxcnVGQ0tMUmMxYnhpTmlYRDlOMXU3TDlO?=
 =?utf-8?Q?Tg+1ArznshTK3NZNi5yQDHlLoFnWG7JJXTI6481chijWSz?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjBVejIzYXIzRklkOWtJQy93b0JLT0dMNzlKZ05ONDA1M3kvamhraURHOWMx?=
 =?utf-8?B?VFVBRE1WbzBQSjE1OU1ZUjl4RTlndHdzRnZqZVJ6OVFvelFOTzQxQ0w3Nldo?=
 =?utf-8?B?N1hmb2NjS0JrdGcvV0ZjQkpOUFQ2UldLeldJY0Q5RGhrTVI3eGthSWhuaGg4?=
 =?utf-8?B?STVvbHdsaHczVTlNbnRPcjBUZEE5VHhzamNRS2pyRDczbklZR1JWK3BEY1JG?=
 =?utf-8?B?aGQzY3hYZWhqbTVJQUlNSmxqeWF2Uzg3VHJtRjdFUllzVGhlRTI3bHNtNktW?=
 =?utf-8?B?WU1VUkRkMGpMbFV1aWtCVlNCWEI0S0dCTjdBUy9TQlhWdzFobUw1VnptMmFF?=
 =?utf-8?B?L2FYOXROczhxbllzK2xNQm9DZnUyWFlka3dTVktkTW9yeFd1SUFPa2l6bWtY?=
 =?utf-8?B?cU1SaVVMTzNKZmZ6WjBZb29kekVmWXdWNldkZk4zMWtrNFJQd3ZkaVRBczdZ?=
 =?utf-8?B?MHNVelQ3dStpVU4zc0d5UWpiaS84VWVsRHFTdFNrK291NkE5bzN1WjRYQk15?=
 =?utf-8?B?WWZlVWJYM2ZYS2tMTEFuR281UVNCSS96UGFrYzZ1VmxaYTltRFFGakdoMWRF?=
 =?utf-8?B?T3JRV0hXSUcvcWZEUm5vUkpVMHJ2aXZ2QkdrYUpnNzNBcDVyOGFIdGFMOG55?=
 =?utf-8?B?dDQrWDNRWmdyUUlQdXJQMTVqQjhLNU5oT3o1KzFsRDJ3UkNMbkVodjU2dW1E?=
 =?utf-8?B?bytndkVJRkFMUGtHMzNVRVhJbUNPL3lHd1FWckRkRDR3Yi9CbmV4QVBKSmxq?=
 =?utf-8?B?eUdqS0tqNXZ6amg0N3g5UW8yWFZWcGVPdFBrbnNUSTZEWHR2aHR2QTdFY3lZ?=
 =?utf-8?B?MVhlajgzSGZhckV2QkdVRFVtcFhRbnRTZytNdi9lNFhPU1hUQ3JWSll6eEwv?=
 =?utf-8?B?SytMWlpYT2lXTXpNOXNUaDhRUVZQSTAvdUtLSmY1Wm1SeDVVL2tWYk1odFVo?=
 =?utf-8?B?N2JHNkgzNjlES1FMSmVnUEE1QmZpTEovWFd1WlRlTEwybmxOM0xpU3M4dnRO?=
 =?utf-8?B?WHRuUmhXdWFyd1p5M1BJeXQydFRuU2N3cUxkWjU3Z21Ya2NHcnNWZ3l5VEt5?=
 =?utf-8?B?eE5raGlvbG5IdWorVG53Y0ZhTnFuY1hjcEd3Mlh2T2gvUEdkNUdMd3QrR3hn?=
 =?utf-8?B?a2pnZ1NibVFrcUJWNE1PZ2FlRStJSkVXNzh5UHY1VGdXZnZTb1VqS042QXRl?=
 =?utf-8?B?UUFZVGxHdzVIVXBVY0xTN2FSUDRWNnBtMjMveVRIS3NHRTVhU0VCNk9seEJN?=
 =?utf-8?B?TmhuOFdTKzRBWWVPS3ZoVEhqV3ZUc216VUR0Yk8yRnJQQ2l4L2NOUTJwc2Ur?=
 =?utf-8?B?QXBFTUg5SWVhWjJGdXdIUEhYVldqRGtYZmtKbzYwWTJBMmhoL0ZRdWZ0RGpY?=
 =?utf-8?B?NVlxdkQ2SjU3Ulo4b284eXE3aFpQck1NSWhIcm1RQzZQYnBhS20wc2lTM2JV?=
 =?utf-8?B?eWdyV2lndzVIMjFvUnVNS3l4Rm9wYTdoNXlQNGYxcHZTTldUbTdMS2kxRHFS?=
 =?utf-8?B?M3VjenMrUGM2REd1NHpLK29tNEROYytHSlZKVlVJTVJwUHRBWlZCNUlLbTBW?=
 =?utf-8?B?WXNLY0RHWTVndkJZYjMvMkpnOFhSZDJqSjJWYVIxSzhpcGJsdERtdkcvMDBt?=
 =?utf-8?B?RzBOZ0dCOFIwWTUwRkdqRVpTQjEwUy9PODdrYXBza0RtRnhKanBwVVY3ZllY?=
 =?utf-8?B?NEh5L3BObEtodWx4Y1c4VWIzZGxJdW5CbDdNcE5XVDRwTUQ3SVlvUDJzUGJP?=
 =?utf-8?B?djZaaVNpS3RSK29zeHlxckxpUDc1MkQwUDVqL0JXdi9DN2N2NUdzK2JnVkJF?=
 =?utf-8?B?Y0ZWVEN1bC9LWEtDUC9Jc29Db0dZTFVLek1UUXkrclBmdTRCMytQcnJyT2dW?=
 =?utf-8?Q?jPQ4qt0yQwEFv?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e989bd-c091-40fc-4499-08df4c9b484a
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:29:53.3724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0692
Subject: [Buildroot] [PATCH v2 12/14] package/gstreamer1/gst1-devtools: bump
 to version 1.28.9
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

Disable the new gst-dots-viewer tool, as its Rust/Cargo build
dependencies are not handled by this package [1].

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/61159bd992fc0d3dee42b93d164f07b4f68a127c

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index 9009b96935..e70310ab55 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.24.13.tar.xz.sha256sum
-sha256  2485b30dfb94b65e2e4befb0b9367fbecbfcf2102b24fa9138df4403497e7b73  gst-devtools-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.28.9.tar.xz.sha256sum
+sha256  cfe8ae964fb394e03fd66b831daba08e0b5d1fb7d8bf047ade351afcb5855eaf  gst-devtools-1.28.9.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index d56d99495c..5572615977 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.24.13
+GST1_DEVTOOLS_VERSION = 1.28.9
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
@@ -25,6 +25,7 @@ endif
 GST1_DEVTOOLS_CONF_OPTS = \
 	-Dvalidate=enabled \
 	-Ddebug_viewer=disabled \
+	-Ddots_viewer=disabled \
 	-Dintrospection=disabled \
 	-Dtests=disabled \
 	-Ddoc=disabled

-- 
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
