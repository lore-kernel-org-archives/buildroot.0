Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91144606A329
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WjhBaPCL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=N/1hW++H
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC13608B5;
	Fri, 27 Nov 2026 15:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKZMvPgVeDUA; Fri, 27 Nov 2026 15:30:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A7826070E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795793409;
	b=XDd+3d6KGF+Bj8dGwuoglrdZCkIsHhOJQg0k9ZAiO1H2HJ+2xqM4goIDY1tj/+v+WbYj
	 r8PMFKcADbmgKSCdxyH6cZaxOVNDIk5An7umpyAl7Aj+N6wPHueMkY9nHwfZi6eiFU6CO
	 OfcgCKf0ktnCTxN0sXFX/XX2AevbabB0vcOH9gPfLc6P/AwtCv2y70mTeV2lYA0vW9Fel
	 heVc1xVDcZL1v9tDj/o4LQESP6j7Vr7usJU/uwOkEGUhaKFsYWnwEMwwR+kgXkP0xSuB9
	 /tm7i2DunRrBMCuDOlaX4v0kLkbUopRC2Nyq8mWpXjmRSHGWyh+sWWvJQpQTDsiGJ2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795793409;
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
	bh=lLN17TkF9XBDbzgQuLeyo6wZI8MD7QXc6TLraGp8oBI=;
	b=E74e+MbySMNJ86egMiooxFc7BPft362eMbcl8QId8FfxMsFMsf7/u3hhECaNcsIE28bo
	 LH3Q2LJpduwPiU3D5Zq7HLmppxvvnRbvWHF7+khLwYrrHVIAw8Qcc3hrbXx8J9jX83aI8
	 oFiW8SWR3zxfi7xJqcgcsMZnJeo3imgvIJPNJ8Refe52VtDPjqMphu3SauH83ZgnmLXGv
	 4VctGkt71AIwG/3ZAFJcalcWmdRRIeQLKmsLl1gayaSjQP9NXXIN35M87d8lm88m+fTC0
	 LalpjzhggcuR9lXECNssM22S80nV+TWBFsOua3CEOHGRcOQogI24/GoQ1YGk2V1/EEg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795793409;
	bh=lLN17TkF9XBDbzgQuLeyo6wZI8MD7QXc6TLraGp8oBI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WjhBaPCLvMiuvSIs//nZCUJ6PPKpZUhZxX+T0ocIktmaKRMRnIOB6RRUhBj6M8djV
	 +PubemqOb1PKBvLkbH62Kl7MFW4e1YA4cfitDMvBYGaKJgONId3ZyPRswjke2XRt8m
	 T1SNipLpB5VgdxkJBC2lnSgq5GVK9y6+0QQBZbtmOXNJBc/sXYhUuUS33GWNmWHsnq
	 zRP0hDC/wfxCUZN61QRpvVODGabAbygv0GNDVQVM+0a33QfxXbDmMBpZ+7fIq23kv2
	 7U13vOOtVXUtPGYzVyi77Zx5xlX3fbatmGO7y5BVt26NAjVl9WuKvMMQnmtTsu4bYz
	 kZoue3uKHAZPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A7826070E;
	Fri, 27 Nov 2026 15:30:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88FE4373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A91B81136
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmbOgQ6ty_Ud for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:30:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6F0F281121
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
 header.s=selector1 header.b=N/1hW++H
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F0F281121
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Su4O2zkZ45YWf34xwRzjWIlFB2LYUQlsGFczehjOjfs=;
 b=N/1hW++HypuMtdnS6zmVks1SkgTtE2Xt9bcZtkRTrUpJK7IhjAmQBdhFJ0e0Y4HjlzDmfo/SI4GfzreTNzlKDh8QHhMwq4hPxSrHI2Z9DefWCmZJLhule645geNcZryo0oRLO2mUyrWpV/SX13X5QwYAm+DtIcv2bzhDw+A1ufRg5s7GhXdKiGKV5jonUyczp0o+KRdeMV03q727Jm6DaFFcAE7STqKFuPdXN4BNQrLb4+xvsQAjvHOKf45slxdXkizdV2fhBGXN1W5pLuWc+j6uDUUZOcLA8ojUuGrMtTY8Rn47HL/DmwU4/lm2sSHhDw360DLBu72dEsbVqd6aCQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SY0P300MB0692.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:27d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.11; Fri, 27 Nov 2026 15:29:56 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:29:56 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:29:20 +0800
Message-ID: <SY8P300MB0041BB05678F5646534E5315B5412@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249; i=tfx2001@outlook.com;
 h=from:subject; bh=Ykzd3aQ/gKqvtJjVlaXgyb4lxwVQeFOcNXf0G4em7Qk=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCaHQbSiGmxyAYv+x8ZhHNfvhDA7SUc1SUitM7
 yKGNQ54oE+JAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmh0AAKCRAcD62l0/wL
 2gFDD/4h0rY+OyrqEwk2TyMaHaBihef7G3JBpj+J/4r69tctzLdAP2TYF/XaRBP777QQtyVzcma
 pvwzOjEHFS2atapxMpiXGOEYCz/K4fx2OteE3y8heUqV/72kvHNZF8avDUWEAD7/LccxupYZr4m
 7W+u0/fKrlSZF9XAjKVAOWnu7uevnMohR6vpvk75XZ2euNl61bOfu9iICFqWF57xMSzz3I44gWZ
 YkhWZuo/s/JHaGuXTJ9oQFAPHM7uDjD+tc96EKkNrQPCrx1oK1fDvaZI3B/BNbiEGgbWf2pYGv9
 v7RcRCC/lD1ZqSvcTbPfIT3J+c+oIs5valYT0C+xiVGDsvJTfuMvNUCXU79T5sHqZdkdn7UC+o4
 XLH6zuB4AHbkhVwxQQmj3AdPSRjcUcwjBu0ShfMoaHM0her62Pyr1n6jVnRNPEe20s7vFRix4AL
 1ujJeynNcMjpAb/wBbovIci/p3ui803HmQvLoSK2pWmOmqccGkgk1MjxDc4eGgCSZt2jR8SSb1N
 6NCVCPe52EJrddRw9s5R5wYPMIzHeJ8h95VfS2IzEJmOgoge8pZKTv+Nyf7KJd6137+vOrTbt0H
 QWVF+Z5iweyy9hyFPtj+56wSFswl2eqKijXX90nMpLFmWLiRnQNGEcWzHSevBalXdCoYnCdY2hC
 xTflRdA7mnv33rQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::12) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261127152918.358381-5-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SY0P300MB0692:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe5dc83-c2e3-46cb-8f1e-08df4c9b4a42
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|25010399006|260925184616899003|16051099003|24021099003|8022599003|2604032031799003|19110799012|704163111799003|5072599009|41001999006|24121999003|15080799012|6090799003|23021999003|22091999003|8060799015|1602099012|10035399007|26121999007|3071699003|440099028|3412199025|4302099013|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2txRm9hblVsNFQ5Mm94R1QzZ0JPTlZKWVhVcVYrUjhjbmFlSEs1VWRnd0x3?=
 =?utf-8?B?RFdIWUxwU2xFb1Z4VHExQXpPTnNvdGVyTzlvY0o0My9MU0ZHMG90b0ZLK2Qy?=
 =?utf-8?B?eGhadVhydEdMOEU2K3VzWmt3ODhBZDZPblNvcWVad2x3TEZrZXkybTF3ajky?=
 =?utf-8?B?cHpwYTFMM0YyckgwS2drRnZVaGMyUWVIQnZMdzB4WENtdUVwcklTb20ySWJT?=
 =?utf-8?B?NlFXZTBGM241S1RyZ3BnVWFJSzJmZWZPNEFINWRFUEVCSUt1VVM4RjM1MUxM?=
 =?utf-8?B?VkZHUkpZWmdtSzRleFdGdzQrZThhNEtLSWhONE5TdlB6clBrWUpIVm4xN3Ux?=
 =?utf-8?B?MEZ6U0RDaHErQjNDaE1mNC9DZjVPTm45ZmpsRG1NMjcxUkNjSk0zSkFKQjlu?=
 =?utf-8?B?c1RuVVhEdk8zcDF2NXJ2MWNRaHNKMS8yL3ZkSjVYQzFrQnF1Q3g2WG1GQWND?=
 =?utf-8?B?OWE3dlgyUkkxK0dWRFpZbnB3Nm5PeWpmSndhZzZmS3NKUEVaWUwxQVVTMmxs?=
 =?utf-8?B?RHZmZTRmZGhhdG5heTU2SU5xcThaOUsyVXZoajduQ1BjUDVpMG5OSkJmL3NC?=
 =?utf-8?B?Ly9DeWtLVGJMYjVmVEhmU1VoaThpSStVblBneUR5MXMrTm81NnA2NElaVFZ6?=
 =?utf-8?B?aVY0Skk2ZStZVDRmVGpteU5va0E4VVZCK0s1a3NxaU8zRHM4c0x1N0RYOUNZ?=
 =?utf-8?B?UTd2Nk12WWR4VmRYRThqSlgvb1ZaeHJOOFRvWnZQQ3BVbXpGclFtdUpJQWN1?=
 =?utf-8?B?dTFrR09sM2ErcEVmSkEwaEZvRlF6ekpOSDdWYkxjZ1N0L3kvMldiTllXeDVl?=
 =?utf-8?B?cllUWHNOQXJPQmhZaHdmUmsza2JRalNOMG5oSjA2Ym9LVGVWeEVwSUdFbDhX?=
 =?utf-8?B?WERtU3ZYTkE0cG1renQ1MTZybnIrai9vZWpPSW9FNHFCbG1MbHhhODBmbW8r?=
 =?utf-8?B?RTlwTnJvazAzUDgxSjk4QlBGcXE3VUR1WDQraDYwaHRyVW02OGJpNWRySlJy?=
 =?utf-8?B?bUJnVXlodDQxUWJpOVViY0NYdTdlcUNxV3p3NytxSG5HcG5CMzVrTW9iaWZN?=
 =?utf-8?B?WmlQdTdSMDJUTEJSNXV5cDJKY1RHL0UxejdibXVMemo2NXVNYXNWaW9rNHoy?=
 =?utf-8?B?VnJodjZxT0hoQW02TFZEeks0YmFEM1NieVZ0VUdIdzYxdGlQL2RCL2pNdFU3?=
 =?utf-8?B?WTVLNisxbzhjVjlhTFVzdWVrVEZpem1rOWNLL0Q3RjFFQ1NnUTRORGZDbDQw?=
 =?utf-8?B?aVE5Zkg1ejZpMmswUFU2bjAyVHg1UStPTnRlUlAzb3RXd2tvUlJCZ0xYZENW?=
 =?utf-8?B?cjNuQktnUjdjV2RTYVVyM3A2YzdxREM4ZUNhdnh6Z2NDRWRYMkxua1ZkY3c4?=
 =?utf-8?B?N0pIbFh3UGdOZFFQb01SNmUwMkswVW1BMDdJNXk3NEoxOTVOdy9MditPblJj?=
 =?utf-8?B?UWJjUVM3czZpckR4VlZQOUhTZnhqNWlRM05qM0JCWTdLa1E3ZVh3TnFhbXlK?=
 =?utf-8?B?STJKUi9QcmVYdkFtRGVraThZOUh6VTZzWlpUM2twZHUxUlNaZXA3THZ4S09Y?=
 =?utf-8?B?Nld4MWtwcmhQYU5pdW9PQWVZM2NpbThqbTh2cUdQTnBpR0xjbUVrUzFLNFlL?=
 =?utf-8?B?QjFBMFpUbVlFU3BVWVk4RmlyNHo1bFAwOTBBZUljakZYUEVkWEc5cG15NG50?=
 =?utf-8?B?MVpzOVZteHpuZUwxS0srZUZRZVdpZnI0MnJVdWh0d3BFYVBzOVZzWmV3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDBUbEtDRVVRaDhvdHRDSWFucHRiTXRjRU1DTnEzVStEVkc3WHYwNTc1Z3Fs?=
 =?utf-8?B?VC85d2t3d3cvSUc2S2dvOE00enNTdThabzBNQkt6dXU3M0d6SUtGSzNnazJx?=
 =?utf-8?B?eWk4cHZSVnZDaUV3eTVlSmw1a09ZdFB3bnZ4VzNYcmNNcE5LaFVhQzV3c3N1?=
 =?utf-8?B?MEpOUmNtRlpsUkhJRm4yNS9MdGg1UTlWU01jNXNqMjhHT1RsenFWaWc5SlhT?=
 =?utf-8?B?V29qeWtYQkcva1d1OUhwQ0xkSm0ydVA2RTFONHN2bU1rR2dEd2ZhcjZUUG53?=
 =?utf-8?B?WklicTNsLzlUZC81U3k1cFNSSUNqWWpDeEN6TStvcHQwUEJWR2hOZE1oaitu?=
 =?utf-8?B?TkRjS0lsbXV3ZHNJK0ZJdlhHK3FaT3hmc2xPR216T0Nxbm16TVQrbFdnd2JT?=
 =?utf-8?B?aWxEVUFPdnRaU1cvcVNyblBSZXB2Q25aR2lLU2dlV2R3ekVZNHp3OEIxMXRB?=
 =?utf-8?B?NWtBWlhET3JKMWxKSHQwTXgvcVVocm9OWFB1Nmc0UVEwNEZPbnliMDI2YjBM?=
 =?utf-8?B?N25vR1ZmeVlHd0dYZ0pPdytobDN5SjZocStTT2gyUUU5MlBYZ3plSnNWQWZU?=
 =?utf-8?B?c0x4aVYvV1NrRXoxcElla0ZLTENWdFYxMlNsWk80TFlNalhQbHBuVjlHQlNM?=
 =?utf-8?B?QnkrL2RhUjdiUHlidHl4SUVZbzA1ZFRCRCs2T0JmRWV4bnpqaE5oK0crZDh0?=
 =?utf-8?B?OU9xbzhiVmdQTXMxZWwvNGZpUU1LcGRsMXFEQVNJdUkwdXBUcEY0aUM0bGRo?=
 =?utf-8?B?RU5sSnU2TjFsd3VJcFU4RVFhMUgzTG1uWHJYbUNFeGFmYWRoaTFmS0Q4VjA2?=
 =?utf-8?B?T3NTd0U3TDViZ2FLVS9DWGkweUdCN0Iva0ZKSWpFYy95RWd1U0hHS0JGT3Bl?=
 =?utf-8?B?THdQZkdKSjFxTCs5cHFzVGEvVEQvNFQrbU15WWQzL3ltM2E2SjVHZzhYcy9I?=
 =?utf-8?B?Y3ZGRk5RaVprMWtWcFp1WlMzZ2RwMkphVUR0cFFmQlNQSXZvN2FNanA0SVVX?=
 =?utf-8?B?VjBrWDZyL0xhd1BHcmtBek0wRzV6dHVFNEM1TWJ4WHRKdzlLQnJpSXNpdDBZ?=
 =?utf-8?B?WDFTQUx5b2syY1J1RmdQbVV1OGZJOC9iZmJ1b0pQc3F2QUFMV290R283MWdO?=
 =?utf-8?B?VUNnVzJmc25TK2FVOXJLcmYvZEVObHFubFRGVlFpakdXbFR2WDlwT1hFNEw4?=
 =?utf-8?B?UDRVSjIxb2swelRDS1l1YUVJNG42TjV3cVlEUEJJT201NFFtK0dteFVVUytG?=
 =?utf-8?B?b2NhbVNJQ2xQZGNaNWFuc1dZOVhTRzExaWFJc1VSUnZyTlFzQlBYN3FlTjBi?=
 =?utf-8?B?aFY4UjQrSXN3YlpXWk1oMW1GSTZCK3UxMnRTUUh5LzJMY0VmYUxGeXBiS2JX?=
 =?utf-8?B?cjBKRDNzcjF2N2RYS3BWa01TSWs5dE9xaTRVbU4yblNhdkllY01FclMzZ2Ft?=
 =?utf-8?B?Q201dnVtM3d1bnNHaHp5NjdaS2JRUUxXQk8rdG9salNqZ1ZLaUNKdTZ6UlVm?=
 =?utf-8?B?R093ejNtL2Erd094TGZrZEw5WTF6UzJsWFgxVVJ5ZjdmbXl2SGdTdnBIOFox?=
 =?utf-8?B?Qk5ZeDF6QnUzeE5ycnk3SFlQVE5BUjBZVytXeVlSVGltNlVLZ1Z1dmV0RDNS?=
 =?utf-8?B?OUV2R3RxTnpiUkxzTUFmSDFuTkFEY2psUW5QUTZ4TnBRVzFiZ0dsZmFPcWRT?=
 =?utf-8?B?a2crUXlFbHUrVFVzM2RSWFpjNlF4ZTNrOUppNW96UG1mUzZwTEE5MlN4MzJT?=
 =?utf-8?B?R3ZHSFpXay9FMG4yU2tESFRuSzA0bXFGZ1ptblQ2YzRXaitNR2NKcXQ5bklC?=
 =?utf-8?B?QjNlL2JRRjhSbmNVYzlibTFrQnkrcUFwRTJhRnFnSkMvNGNHWkU1enlnN001?=
 =?utf-8?Q?6Zcsd5Cp+UF9I?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe5dc83-c2e3-46cb-8f1e-08df4c9b4a42
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:29:56.3079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0692
Subject: [Buildroot] [PATCH v2 13/14]
 package/gstreamer1/gstreamer1-editing-services: bump to version 1.28.9
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,TVD_SPACE_RATIO,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 .../gstreamer1-editing-services/gstreamer1-editing-services.hash      | 4 ++--
 .../gstreamer1-editing-services/gstreamer1-editing-services.mk        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 4c94cbbf07..df331bd7e4 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.24.13.tar.xz.sha256sum
-sha256  e9792ecff0df0b1dbbf90cfb271b9ce840bc048148c2d9d49fb6c6062bd18f4d  gst-editing-services-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.28.9.tar.xz.sha256sum
+sha256  23caf8439ba063091da226e7a1774915848105ff47ebdbe7773fffa21a094692  gst-editing-services-1.28.9.tar.xz
 
 # Hashes for license files:
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index c59315fbc2..2a7ec992c2 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.24.13
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.28.9
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+

-- 
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
