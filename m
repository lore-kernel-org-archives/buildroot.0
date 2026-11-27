Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422DC606A326
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FTw3Ibf5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=WKkwGYOd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FC78124B;
	Fri, 27 Nov 2026 15:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZJdd4KHooZG; Fri, 27 Nov 2026 15:30:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BE9D38122F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795793410;
	b=RxHESFH+KrUc6ndMgIdpOU3SaaPNx/h12Qbb+hqwmbw09Hu2uPXSwU6Gzx2spiNk7IVB
	 mxB94wpZ6ANPRWXUg+OsGO7CKkFxWgfMn7rVzm1JvoMgWrtb3pPQpa4O3FZsin41h6FJo
	 qSq/ConNgDp+Tb2xDC+6npQVjb+XkYQD6R9rERxVb39Jk3OYELDRzScO/rWiw1H6DgNTG
	 ZGjvq574/WKSfHtKuqAW4XjUohm2ojlB4wGsX6Eq6ZpAYL2GIxTRLLmZBEGMqmTA1BPHk
	 165YQvJviOKWnhCWjjdT+lD14ek9ASli2t0WzZWgdBtcLB5KDnVW80U0N946YSwsNMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795793410;
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
	bh=PvcghG++zGD3Y+7b78HxZJ3BaAKdULTtTfvFSsCBd3c=;
	b=NTYMBnW6QxFW8/XLv0Rz6XIGISbemCF9H5JoM+Qjki+2VNWlMZCUk/d9lJpoaUUrPuy/
	 jZuTTcBoXE/mjWrzkXZ8O0wAj0JtZn6zXfR73AL7ppvzT0duO7bVOWzU0L6VBcJIYQyh9
	 pErglKgI8LT7zndroDme+wKpSCRHkeQm3UaZolaLjfcc3AlcTmrGsoybbq7eE3IRpoEaq
	 KCYpWP3sXdAZuGTAMK86FbKPHE4jdrzVmehQKuS2iv/ujZm+oIHKltDHDaaNijV9qaWyZ
	 754d+gLwlKlJQh0Kcs5TYqToEQwiPbwU2en3B0whlit69JxIR7TqWhrZOcwk59WrTYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=WKkwGYOd;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795793410;
	bh=PvcghG++zGD3Y+7b78HxZJ3BaAKdULTtTfvFSsCBd3c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTw3Ibf5kFlZd7uhrS5RPBsDb4rQBkdHA9Rn+CE5q3O09meuK6SR/ZRbrdPP9d7/N
	 8x+jx9lO07Mn8o4B7TDEgf10t5keG79H4XuC6/YxeoZ28yjv2mtdipN2yTm1p+A1uu
	 H4MoGuHoLpo1D2FhjO4QwghP1mCCYI9odDpIKLwBOhn7frIeOeU0odpJnCoSW4KOMa
	 F+ncRgd7ialBmpezPZ2MnxXB6gLlLsseeeYMSfBuzFUd2QJDl3ZJUTNWkjGHj8xI9L
	 8NtQjIxHcrGV5P7ytStIK9ihy1HwwH9HH8zdJWQJ30ECn5tn61RzThgmVpbsP1pKsT
	 SYcninBqS6RIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE9D38122F;
	Fri, 27 Nov 2026 15:30:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71B47373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63CFF81150
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJB1wzpcpJP4 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:30:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3189781129
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
 header.s=selector1 header.b=WKkwGYOd
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3189781129
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/4n0l1BGgBDa6pZqr/gV2IcJkQ+jZJysZ/HLwcLB8Q=;
 b=WKkwGYOdtxtcVsjuVWxew+gpbyG27MjZb7hZ60yFEbv6Q2u1E9GLSlkzQ2q4S4NroCT6Iokew/RR17Syy7MzT/vycY7nvAwGMtcLDVkYQK8NxlHSs3hHpsdQG1gTwZXJ1h3yI5+/6UeuHH6U0uBM9anx8M8x0d0P0x2VNhiFHkCifWu0XROCdVP2onAFg0YoLEW1R/0n3Yl/TX6npP0Gftj1+ddYlcpWwICrU5TBCkoLOEanKF0gPhG2l0nqzvsiLRD8rDmXjZMvy2PipfIuQGry5yu8+HzdqptDkUwd8rNx5elkEY8gMKSVPyTkmBK3EgfsTCBbsyJ1lgdT2OCNfw==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY0P300MB0692.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:27d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.11; Fri, 27 Nov 2026 15:29:59 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:29:59 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:29:21 +0800
Message-ID: <SY8P300MB004140FE96B4B046F4CD57EAB5412@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=7246; i=tfx2001@outlook.com;
 h=from:subject; bh=u0tE/kooGltD4qyx75d4vc8I6JWaeRxc1taOS3W6SA8=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCaHQFsF5XOQL5LprQlQL6PbVL+yZRQ7ZHnHix
 QOP3C1CmgSJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmh0AAKCRAcD62l0/wL
 2slAD/9W4CEvj0t73xRcuEy/lnd8sLkzm+hBPlc9v5kPFwuE937ST8nEw+7XYxpmKlYd+ZwFmcO
 xp40UpgzbK8pQ9Js8lV1wSqSv6/9zvelb413qyxWOYPVdeRm0oP/Ph5xXYGwjGllLUp6f7T74Us
 kLg8OCPzcEKht1fbQ1/9v58LF6wtmI/OTmPFj8++nrx+DQ+4uLlNVxKl9xgw2vodlts8pHLZ627
 XTZVc41w+Drdke5Z7qLoH2EtHDe0tTDIatHFB/sAuL3kTI66hlo7woyywc/D1szv/72Cr3oC7Cq
 SGrRVX2t2zf+9FGqAwGOeWJ1HrzFiSVnhPm3RltMmd9rqMNsDmhjXtZfx/8HvYJY8YyBCPqHSEq
 +RDsQN3Eg7YDjPUtkXesNh4RxHM7Rk4ufnyA2p+YeCp3kUAJCVWXNeFFa+LM9nhp+gZg9KT9IiH
 gY3ne7AQg7KpcGhFPcXZgw4U6w92Bdj7XJpzYcAuqyCsggmEHqFBjRTVnSCzi6PXHadZdSCrWNd
 6tU4wwl2+X/lWneCRYA2mrHgofPHbqi1nk1OotJX5R7TLCoQF/QqYStLRrUXZtcnpfDDtfEDazQ
 7SA50YHrqjLmbIaDZmXhb0yAOclgILbHfEa+dYwB+rJtYoa8Tf28gXFO/0uIdn+KvTZLFpR1lC0
 loDpOhjurj+3rSw==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::12) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261127152918.358381-6-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY0P300MB0692:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c0b910-350f-4078-2df9-08df4c9b4bf9
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|4140399003|39105399006|25010399006|260925184616899003|16051099003|24021099003|20031999006|2604032031799003|19110799012|704163111799003|24071999003|5072599009|41001999006|24121999003|15080799012|6090799003|23021999003|22091999003|8060799015|1602099012|10035399007|40105399003|26121999007|261005200801699003|23121099006|261007181701699018|11120399003|440099028|3412199025|4302099013|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZU83bFM3WjVqN2tvdS91NElUVXM2TVJONmZoV0JLaFR4T3gvSi9FOVZPamVw?=
 =?utf-8?B?bGwxMnhoVXNUeGlUa2hTSk1tUkg5SlRiNFd3c1p4YndxSmpva2l2dndKdlVT?=
 =?utf-8?B?NXFPNUR2aXhNeWtiQTA2WFUwbzlPaFRSZlo3RzFkalE5bDB4ZlZqN3NEZ0pq?=
 =?utf-8?B?eTNhbGZVbFdpVXhEeWdhdGJjOUFIcmFpUUhESno2T2Z0QXBtS3ZOcGhENm5q?=
 =?utf-8?B?TXRSeEkwdzNrMWlxT1dGemR1QlJGLzNtNmhFOUZnMUhrbWx0UEtSaXFIcHp2?=
 =?utf-8?B?VjVibGsyNVdQNnpIMU5ZWDZ5RW11NDFNeitlTkM1U0JsUmtIemxZOEMvUnJK?=
 =?utf-8?B?Y0xVU1JsMGVmVHRvOTRCelEweWp6RisvdmMwZ01ITUhKZnAzaE9YdzFPS3RF?=
 =?utf-8?B?SjdDenBIZ1BpdHBYRkJFNjJFdy9rcDlOTThDNGpSbStoeDRQQzZHRFd1a3lz?=
 =?utf-8?B?U2tSYy9HMUZXZGdNLzg0aTNCUnIxbXNQczNneTQ3am9TU2lQeFViK0JNMFNJ?=
 =?utf-8?B?TkhLdGwvcWxlZyttSDZldC84ajFTREVIYS9uK3dvWHAyNEgvemFrSGVQa0FX?=
 =?utf-8?B?TU5YMjc4SjgyK0JqNE9CcmRPUkgyMUNMNSt4ditETGthQXpGdVBBUWNVWmYx?=
 =?utf-8?B?L29QeUJzcUxRWk84YkZ6N3JTYWYwMmhMM3FTWTZzYVBRMHNzWVNiMHNId3Yr?=
 =?utf-8?B?QjF0Q3Z3NUFRT2t2K0Fqc0JHVXZtaEZmL3lHeExJdWE1ajQ0aVVKTXJ4UWFi?=
 =?utf-8?B?V2s1VTZGTmFrUS9oNXFiUGhoamEyQ0dSR0wwQVpFTjA2L3JBeXBxYUF3SjdW?=
 =?utf-8?B?K29rc0tPSHhrdHd2RTJnWXhEZ1llNjlpRWoyS2JoK0xoV2hIYUo2M1BXcldp?=
 =?utf-8?B?d0hiV2tqT3FDODhWS3Vpd1M2S21OOGQyZmliMEFNTVdqN3lOdXZZcU5OMkFV?=
 =?utf-8?B?RnY0cTVIN3NsU2dSQVdodlRDdGJ4dlBpVy8rN2swY21EZHo4bitQek1sUEFj?=
 =?utf-8?B?MmViczFmdlRIYWI4TWEzOXV4RDNZbm9yZ1IxRTZGeFFENVpwUnFpY0dxM2ND?=
 =?utf-8?B?b1pxZitrT3luS0tnVy9DVVJnaU1hSkdydDh4L1o5K0lBem5tUE1lWXRNcW9l?=
 =?utf-8?B?Ty9HUjRUMHpvak1uOEI2bkJ1VDZ0L3RoVFF1ZVE5RzVJalVWNTlidXMyRUk0?=
 =?utf-8?B?Z2V3WDYvaldZUUhKZUwydVM0Tm1LMU5kYWhtNGMxbkQzd0dCVnlKVVltK3Fu?=
 =?utf-8?B?Z0FHUEVDd0ltMzVzc1JieWR2eGZpVUJSeUpDQW04a1p5cURnd0NnY3VOU04v?=
 =?utf-8?B?N29MdTY3Z0xRQkRJUUdHWitTdlpPbk56Z2g4clJQWFY3cEpHMFJhOENlN2Fo?=
 =?utf-8?B?aFRCZVlMdDhRa0ZDOEhmRTI0dWowNm42RzRYc3NyZkJXdm5PQnhQbHRjY2RJ?=
 =?utf-8?B?VnJOZEZoNWJud2hsNi9GU2xqNzlVUlRJM0tRTFJxR3IwWmtwS2VVUjVxRGg0?=
 =?utf-8?B?RTBYZFN2MjVtUmZDZzBpSkhGWTB5c1FPRmMwVFJxMTBUbkM2aVhvMUVzQW5T?=
 =?utf-8?B?NTdJcTdMWCtER0tId055YzRLekVBbG4zSG10dEdKSURYVGc0c3BBb3c0RWJk?=
 =?utf-8?B?dWgzUzZ3WmhvbFkwZlVTNjJMbFB2cG13SGdJWDhYVEtyVzJ1TXkrWmlEam9u?=
 =?utf-8?B?YVV3ZUpyRCtWLzltS2JWeEtHQXM3bVF4em5hMC9CcHpXOXN2UlhRY2doQVJu?=
 =?utf-8?B?NE5Rd1VUellWTWQ2T0lxcU9kNnNtZ05xMzFBWUV6V1BrTHkrZmJuTWtqcHdz?=
 =?utf-8?B?MmRIeDJWQVBRTGh6SlRCdnZaejdXL0EwNE02amFvZFVzOWMzSUZ5RkJtTVEy?=
 =?utf-8?B?QzRuMFF1MWdpc1NhNVBPK1F3ZGRkd3FkWHJRRy9XRkZjVUhzbFgrSE9iMWxM?=
 =?utf-8?Q?MkjyLFk0i/Q=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk9iT0dIdnlSZ3hzKzl4RU9GVHBNS1N5OHoxNWZxRmYrT3d2SGdQdFNKT3Fj?=
 =?utf-8?B?N29wQmJwU1B4a3ZvOHJCUkp1V3orMWpTTXNnVTI4aEJBOGNXOXQ3MGM2T0ts?=
 =?utf-8?B?QVp1d0ROcmlUNlNxYW56ajlxeE1XOGZEOENuSFF0TGwwSWVwemFOWlQxalBI?=
 =?utf-8?B?cjBKQ0gwZ2RtSGsvWGZzMVA0NUJ1Z2RZZjcweGUxbVlQTzFpWFNQbzluRWFB?=
 =?utf-8?B?eU9oVHFVODd3MFhxL0g3Q1RtRXE3cWxhS3BDdk5wT3N3dVhBcjJNcGdrVXpt?=
 =?utf-8?B?cGpJdGFOL0pJS1ppK2dlMDkrWXV2V3JVSlJsZDRad2JXL29wZEJEWkwrSnVN?=
 =?utf-8?B?TW9xU0xuTUkvTWFHbENDWWtRUm5yaUIzVjlrSUdvMWZoUUF5TnlVcXh0NlN5?=
 =?utf-8?B?dHpMRGs1WTlicE9meUxzRXd1WVNqdUh5WjlMMy90VWtNMm51c3VaY3RrS2oy?=
 =?utf-8?B?WEFHS3p0YWN6N2EwMFVjV3ZJREh3OWdiZHFGa3oyVDN6V05OcmtyazNVRHJP?=
 =?utf-8?B?RTY3eWhwRVVCU0h3SitYRFY0ZEdjZW9lNmN1VzlyWkxVR0I1Uk1lbHB0Y1Yz?=
 =?utf-8?B?cmdBcXNEMFlZRTZqSDNoQUZRY0FDb29OSXByZW95akovQzJSLy9UWTFtdE9M?=
 =?utf-8?B?cmI1Y09tV2F1TVI0ZnM0V0doRlRBcVFLK0tvazZMTTYra3Q3U3ozUThMT092?=
 =?utf-8?B?aDVkUGpRc1BCaE1aWTNVcVhIRFZaWFJ0Vk9HYXRWRmlnNGpRZFdlWE9Da2FP?=
 =?utf-8?B?WTV0dVpoODRaRy9tZkd4QS9aNk5JT2Vpc1RjNkN3S1lkbkNGMXhPOE1Ka3py?=
 =?utf-8?B?UjF5SE8ycUtTcStvWEhhRXZvUU03VElGclVwL2tsdkZsMjZXdlVueW82Wlpz?=
 =?utf-8?B?WXNXWkdNN0FJdzc5TXlmWkNxdjAwb0dENmt3blUyYXBwTXVuZ0hkR0hRUnNq?=
 =?utf-8?B?TGRhT0h6ZHg3V1dJYms0b25OSUsxSHprbnV2ZTB2dkFHMndZQnJSSFZjYzk0?=
 =?utf-8?B?MWtWTEFHRkkyaTkyaU1KczA5Tkt5c2YzSVBnMXRWMVkrejZuS3JJUWFZZTQ2?=
 =?utf-8?B?VjNFVEJPMUtYckxLTE11T1N0RHllVmRvU252cVFVeGJvQjFsanNhbmJ4MjNr?=
 =?utf-8?B?UHFLb0ZBd08zUGROTnRKcHYyWEZrNVlRQlQxT2lJSXFacXRnSHBLeTFTMEgw?=
 =?utf-8?B?cFB5VDdvKzY1TnBYOFk2Y1hUSHoydFhoWXhWam1Ra3JvWmlTL1pTTHZyTmRD?=
 =?utf-8?B?WFVHRmxSenliQUx4ZTdsMUl5Zi9NYkRHeG9wMm9vQVEyL1oxcVlDRnZqR2g1?=
 =?utf-8?B?aG5uWHd6L3o2bHYzcVhWWEk1bXVHaWRIdUV4RlZWTVF0cGlkYjRJMm9Nd0VK?=
 =?utf-8?B?TjhWckpqbWVXK25vR1NuUS8xZytQdmVmL2llYnBrY2ZxcHN4emYrY1A5ZE1p?=
 =?utf-8?B?czVaMDYyQzBXcTNyOXh4WEgwT1hSRU5YcUtUZlZZU0pvTDJtb0wrN1czNm9W?=
 =?utf-8?B?V24rajRGeW5DTkxUSnZRSEJRY203M0dSTnZrTWtJOC9IUE5xNVNDRnhYVFk1?=
 =?utf-8?B?b0ExbG1mYklyUk82NXRjQWtTcmVvWFNBaCt2Q3dGeExYbk1hMmYrUjVrN20z?=
 =?utf-8?B?dFNJM2QvSWNoaWRnQ2orQnBLUHNjNVlPeVlXaHFHVW9vREJzemVBWWlVOGIy?=
 =?utf-8?B?OEdTdE9aS2NwczlKY1RQOFBsTEJtYVMxeGFhMWJFNy8rcm1nWUJpWWd6THFo?=
 =?utf-8?B?ZVAzVFlnQkQzZVhMVzRLNzRNUUVaWVhlZ2RxVUtyZ2lxQzdKQkgrVkVrbk5P?=
 =?utf-8?B?aXUvbjFLeXh4cVNuam9OWncyaWljbHlUWFQzMWhrMFVtR1RaRCsxVkJFdXEy?=
 =?utf-8?Q?9rTpJlj6SUA2m?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c0b910-350f-4078-2df9-08df4c9b4bf9
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:29:59.2859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0692
Subject: [Buildroot] [PATCH v2 14/14] package/gstreamer1/gst1-vaapi: remove
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
index b170aea1c3..56c88ded46 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,24 @@ endif
 
 comment "Legacy options removed in 2027.02"
 
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
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
