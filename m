Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D7606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DRp8/ogJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Ei38nyhW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 255D4812A8;
	Fri, 27 Nov 2026 15:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxKSbPhTVBsc; Fri, 27 Nov 2026 15:16:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D874812AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792584;
	b=L7eNJE05MvAzI+2Z37ilVp4KZLkjfXFUf7BvTBcIzLf9VbyI5+ejXKGX6j5nKKv5HQIA
	 CHnWAqDeVVzfcVn4NOFy1unlztfYh5ZGvC3xDOxAXidrZqIJabAo1++o2UuQyvqAcZ6po
	 P2nH/xy+SqWJ5O2Gj8zyI+hKjX1PZCE+Cy3FPxcjaHwtlN6T+87Hbx7jN0UOqLCL69l/3
	 rTxI2MMmMkPcZmL39TReQrX6Slyjca6Z88WQrpilsVf5k2tZenmk9msoRmIMmYrd47UjJ
	 FGb7PJ9Jd+kiF/o/xZEllQyyio6oa7aobE0qJBqlWU0sQLvg6gHjui5qKzW6TZ6vs4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792584;
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
	bh=FpwFp4c/XMQo9hDDnd0exvdjyj86IBO3wOC7mjR2sNM=;
	b=Cws7blOyPEUptlYISEcyLKLr/2Rzl1ZG/uGrb2/NrS0TBGVrFUM3/X+Da12RVaIO8/GJ
	 wkZ/izDtMviggIjuBtx2S41/bP8M64jdBrwO9zSiuSfC/ievirSJRb0KwIl/rGpWV2L5P
	 t6jmobc3/BpNbc3/SHbSYRWFTsEgt3sYxPBcer+JYpCXa1ynwiTcEf+M2f2l0FH4CBP2k
	 Hkuk36jHa4dQxyoqXf0Uv5ip7qSGXeABAHsmyRNRV+WGH+d0wEcV7hQ8f8t4e16Cut2Rj
	 DS/leyoJ8jZAqoG0xMZBxNWd3LbwdXTVKN+VSyJRrNy9KkSlxJnfkqk3oSk2qXa1mRw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792584;
	bh=FpwFp4c/XMQo9hDDnd0exvdjyj86IBO3wOC7mjR2sNM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DRp8/ogJbDxQaZwsIU4i+ylu9/gjSriN4bZaix9ZGgEbAYtblZ1NFrM8sGr1Uj+ho
	 btzHvf+LjRqgqWYngHY54UGh2F0KbuJY9SKwxS+1XjrtQZJBNgU1WUJY2fioP1Zaak
	 qXcd8O58Z8yu7qUJa2GnkBSf6txqE7si7o1LgIGv4fOByWaRFHbeH+nE4IblFcLdJQ
	 pPQzZWvEvifww+8Kwsoi/J+cj4Ozmwe66PBKxYprRUlfiMjwheh0P28/W2INiJUXSK
	 YrejyT9ubRQkCBPsH59U8mD0MABr0UMpYTS0OYVWy8DG6Yy2o9ZoHj/Vh3kvXMHSlq
	 28npXCPp+s9ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D874812AA;
	Fri, 27 Nov 2026 15:16:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECE3C2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD719605F1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZm_OmtFo3gO for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:16:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C30F360D62
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::1;
 helo=sy2pr01cu004.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Ei38nyhW
Received: from SY2PR01CU004.outbound.protection.outlook.com
 (mail-australiaeastazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C30F360D62
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HitrBdTXVyjienDTxfy4nPqnITXEgsX3RkJlasilgb4=;
 b=Ei38nyhWw0hEjiYeVo75/XMV0gvovECkFQgDJIFyo6mPJoLRuEeIfHjUfxYQmec3OSivoYi9jFtwFyjwVZSm1yliDG5nCCj4tLv5cwVkJOS4U9f5ZDWxExgsUm7TXdt+9kqNzXJJgQmx+B3hlAwDfn7UbCgNZ6B9xwdO4Mf2A9IdqfbKASY2e5P4/b7UvTXv6/6DlFgFC8URlUFDIEwdgrtGsWAkgPRTrfUV3NYyEGyMnow8zkRPT8+xDYCQ1h1tiYyiza8BfSBJYHiNA0DIe9Zjw/xNi++nlnnGB9hapTIeT2uLLPLHUsVVafA2JBAlxPDiI7NM2WbjBbKdoBwGPQ==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB0017.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Fri, 27 Nov
 2026 15:16:13 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:16:13 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:13 +0800
Message-ID: <MEUP300MB0045228C86034773FEE1A103B5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3750; i=tfx2001@outlook.com;
 h=from:subject; bh=Cz9IISJYtIXMurB9lX7IF1eYAJ45bbKl0D/nP49rzsw=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ5BwVoCoCuxom2fZ571ftByxdYmaF+nGg7gw
 EFwSTnhuOSJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmeQQAKCRAcD62l0/wL
 2owvD/9ENbyVbIE0HfCjdWx340ZovkVOp9Tgg1TY6sd2Q/5z3SEwTrg3wUyum3QOa0nhIWiA5GM
 Ffg5IjPq9we8R8i5Re4vug4p4WyW6Mb7XTiOOC+u5Kji9A/LZyDIpIF1b6+VkCI/xsRHcLiZa2E
 0ZQ78+LccAaYHgz1pOcjTmS9yNpnZxpS1o/beAfNC4MLW1CqDCv8/rOuBuQSevYWMv7mC1JkAWO
 7PlZ4knWWHsfZ2s2gWKxEPWXLg5r53gAl820IbGYJ88gKj2CcEfST/IIBNHXq0Z0z6GrQ15kvQX
 3H9vUn+HMRTnGSOtQxdSjWNhhiHyrKseOtsd9ZjPVupiA3IGUWlkJ096uduhtSBktAXVG/gIG2G
 4eQtjm+qO4Gybx+fRI/zpMtK84ZsUFjD2CiVdNldDkCXXwH34FMzgyDC/+1y/G1p07J5KuRqTxx
 sB7fOTdbFMjJsT+yM1Bnnv+r3rJ54LmrzAgkFc55pqhawb24Oz3KgPEya+VEoh8qSLI2Oqtu2QV
 DFqLxn9MWv28uYGlwfII0sKBXTwfjjFimdMk/yP+cQCY1b94lk4NpNscujlDDfMY+1ZiMbHjauC
 2kjmphMICKu3TdQGkgGonPBBaXDTlcmYqyWa9PDMat6QVomaC6i6N+ClduGWULGLOxbbyx8SFQf
 D8/bV7UCWCbJp/w==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-27-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB0017:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e3b054b-ae64-468d-ad2b-08df4c995ffc
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|25010399006|51005399006|260925184616899003|16051099003|24021099003|19110799012|8060799015|5072599009|23021999003|15080799012|6090799003|41001999006|1602099012|10035399007|40105399003|3412199025|4302099013|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEt4Ly85WHVmWXFZdEEzVG81N0N1Q1kzN0lwUGtpZjlwdEFwbGk5MXltcnI0?=
 =?utf-8?B?RW1SSEJESElwaGN1RitlMU05cTkwSkZZV085MWtKNitJVG02Q0hGNHQwTnk4?=
 =?utf-8?B?TGZQYmJiUUhLM3ovR2NiQmV3UE9VVmdCQ3h5Rkc4NFpKZDQyRHczL3o1czIr?=
 =?utf-8?B?R09uOGVDUkxnVzQ4M3ZGL3hibzJQc2NKdkZTT05IemtxbVZmckh6bUh4amtw?=
 =?utf-8?B?OGZIRE11UkRpWlBQNmMzc0VFMWZpMXdTYTJacWdsa09Vdmk5UU5UMlByeFBF?=
 =?utf-8?B?NGxrdG5KS0NlUjdlck1tTkRwWlg4V3pMbkVBM0ZYeFNMUld4WXhuSklJZkxB?=
 =?utf-8?B?VTdYYktEbVF3ZU9YZDBBQjd5QjJhNCtBSkNJUzc5VU5VYXhkZ1RGQlNpckpo?=
 =?utf-8?B?LzhQM1lJVEZ4ZSsrWDRzVkJIcVZtWFZPWlcrMmZCVWV1dTVZYWVmWHdKbUJz?=
 =?utf-8?B?dGRCcWlPSXBXL2plelNhRW9wWFJhdzVvQ1l0Y3RYeUtuelk3VExoZCtxRjQ1?=
 =?utf-8?B?eWVVakF0QlpVRDFxUDBFM2ZFTVN2Y1BLbEF3NU1CcThMNXdwUVNibG5WOXdn?=
 =?utf-8?B?VE8vZ1gyZTF4QTIrQ3NrVXRKQnl2d3k5cDFoRmpsaHBYSzdUSXM2emhmSFhJ?=
 =?utf-8?B?V0gwZXRnZU9aK3I5SFVDM1ZzTW41QllxOGFzb2dkaThkSXZRWloydFVldkg2?=
 =?utf-8?B?U3dFVWhzYllRQjRsOUZlU1czNjJEVFN2YWhZeFRkL1FKRldFTGVNeVlaWUZF?=
 =?utf-8?B?NkxVcDhsdk1SRWp4WWRvMUd3Uko4YWtQdzhWcUZSWUNhODVIVnlZeHlVZGhz?=
 =?utf-8?B?cFlVSkFXQkIwbDdxWUQrN2tYMWlvRzNNcTBjK0JmWWh6bUNRYVBwN0VkWElS?=
 =?utf-8?B?ZUpVVEUvUVU3TTcxOXpmanhHMGVRaUhjeHFCQ1ZpbEpSbjE2Zko0dG9oeDJQ?=
 =?utf-8?B?TURxYWpMcnc2MHBFbFovZHdRUisrTmdubCt1RHNaNHpvR0hhREFFaXBEa1Fv?=
 =?utf-8?B?bFpTcERtdDI0bkFrVDJKZ1VOZFVleTlobWlZOFZhckFKMDJ1NWE3K3Y3Zkdw?=
 =?utf-8?B?VUF1RnFUakkzVktaaEh0UmFlL2NXelBsRzM3TUdDTHBkLzRzellLOHBHR01T?=
 =?utf-8?B?RjNEQVorR1cxR2VUQkFBMC85ekhqbmlleVJwNklub1ZLL3ZleWhLN2FLNWl2?=
 =?utf-8?B?OVc2VDhRZkFRVFpoVjZLdmlnS3NTbkxacUN0M25lcVNSZVZ5ZTZDb3pLVE1k?=
 =?utf-8?B?eDVEZCt6RmhRZFlNMGFjMHFlelQvZU5leE9JN3lKcW1PSWRuQjJhdmc5Qkc1?=
 =?utf-8?B?WGFGS2tETUx6R3gyeEx5VUdZNTR0MEcxenJMVmlsZUlXZEtwSEZLOVJTdkRD?=
 =?utf-8?B?SkVqTmszaWwwRlZLekFwU1VCempxN1VzVW5PRUhJSGIzRTBkV2lXeXBRWEtB?=
 =?utf-8?B?MldQVEorTFpoSHp2dXlDZW45WHp6R0RtbDlRUVRqRG9zeXlRK1VHaUhNais5?=
 =?utf-8?Q?N/5K60=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE1MM1F6aEU5ZEdmOG4xS0JKS3BvMXV5YW9IbVVXYnBkaE1zUHZUK2YyTWFB?=
 =?utf-8?B?TU1SQVFobGhiVlVFcW1uUGNzZVlUVmU4UDA2VDdTYVo2Y3EyaVhvbU9COC90?=
 =?utf-8?B?MjRkS3NUN3N5T2FHa0pjSm5ML1NUazNzcGs3V1IzSkprSXVZUUlNWTFGYTZ6?=
 =?utf-8?B?SG9JZUNQa0pwVko2RFRFNUJjZUNFc2lIUENNR1BEZXo1QmtBSFB3VXhQSkww?=
 =?utf-8?B?ZEgwakRKdUFGTFJBcTl4QnZEV2lyL1FpQ0FLQmgxL0xlNzB1NkpTNHFCR1oz?=
 =?utf-8?B?dmdDVGFZYm5LRFBKYUs0WVlyL2lMZTViM1pXblYyWS9CTEFYeVFXRVhCbEYx?=
 =?utf-8?B?SWdyUnZKTDR3emRSMHJ1cjM4QklTY2pSWTU2N0k3YW5uSXZIUDZPQWhqWVVa?=
 =?utf-8?B?UXduMjhvOHM4TFNhS2F2ZDB0S3FuSWgyZ3p4QzgrLzMxL0pmTFVjM1NzaXI1?=
 =?utf-8?B?MjVsVWdZV0dIK0NHa2dqK05QaW9aUUVxSzh6M0xkWG82bmZheE9zMDBpU29W?=
 =?utf-8?B?TXdJVlM0WVVXTHZxUHhReHc4VE8rcVlwMzg5eE5tSE9KYXJ3cUtsVjQzT0Jm?=
 =?utf-8?B?a3E0Qk9DNU1JWm1sdHlKMFkreHR0SnVFdzZMMWQ4ZTZSUjlxMWc3Q1gwKzI2?=
 =?utf-8?B?azJpc0cyVFVzS3kzOFR2RGs4QWNxelRUZmpzMWp2NTFkam1ZRkNoQ2M5cFgw?=
 =?utf-8?B?QTVxcGJwSHMyL05EalhTbXZwems2dGJnTFhPUVAwV2U2M3JKYUpSREsvTjF6?=
 =?utf-8?B?TmVkYnp3T2dUeVZldXByUURxNDJLSXM5YXRqTThMdHJ5M3JZUU91TG1CZG5N?=
 =?utf-8?B?b2VkNi9abmYrWlozUjkvWHpnUnRCaGM4VHFPbjN5cFU1ZWt0b1ZzK3dJOS9n?=
 =?utf-8?B?R1hVa0d0S1JWYmJsS0N2bWhhNjRmOEQycythNE5hd1JCYmhYKzNZbTJLSk9i?=
 =?utf-8?B?UXpDQzVpL0R6cERSNGRPekQ2MjUrbE5vbTNNSFhoaTNDaXlwdUpoVXJzVlFs?=
 =?utf-8?B?bHNjS242U2pJMXV2MlErSkxQSjFxWXRSRHNFbUFKOVZ5V2t1bm5scVQxQXVu?=
 =?utf-8?B?MnA5YXhMblhXVjkwRlN3VFI1NlpTMm4zWXVjUTlxakVWa0oxaW4zbXVYeUVh?=
 =?utf-8?B?ZWRBSzBHN3RVREVtUHk1bzdqVVVtTSs2aEhpc09VR042M2lzQ0xwZTFPUjdx?=
 =?utf-8?B?cUM2dnUwMEdwQUllMG5vNnorWUpTUTIxT0tacWExR0JMcEc2Vll6RCtCSnB4?=
 =?utf-8?B?aTVGdG05aWhkaStKK3M4M0dmUkZWWXpQMnZFbFV1U2cyQXFHdTRaVXRoNlVw?=
 =?utf-8?B?Q0pOcFd2bFhGc20zZXN0OVNvOHUxakpROWJ1RlJHZzNyeFEwcFdxVTI4WDBH?=
 =?utf-8?B?YnNtbjMwZzZudGdwQS9uWGNlZmpMaTNiRXdVZGpjL3N0SDF1Mlp4MU5PSTZs?=
 =?utf-8?B?bjl0ZHY5TS9DWmhDSW9SeW9YZG5ObW5WYzhVVGNqNnM4YWQ4UHIzb05MZWhD?=
 =?utf-8?B?MVFmQm9CZjEzOTBrRVNkMkd4bEhVNmtMMFErR0ZJZ2I3dllCZCszRU1uRXhH?=
 =?utf-8?B?bnpRK0lTb1pBR2Y1bFpIU0lWSkJwWi9ldUtObGMvN0FVY3VGSHdhZnlZWVFD?=
 =?utf-8?B?UmNabjNNVFA3RnlodUZuelQzRGRCVUhDQTR6bXM5VmRwZS8yRjBTbXpxaERx?=
 =?utf-8?B?MVdjcXNjM1dvbUdiRDh4b2grWUdRMVJFMGJVMi9LRXpHRjZobmYzY1B1NGs5?=
 =?utf-8?B?aUVjMnpaRnhSeTRnREdYWmdzYkhPajQvbldDM3JBS1hFYW9aWVVERzl4QmJm?=
 =?utf-8?B?eU1KbXJrQTZIZlNzUnVuV1p5SW9FZGI2d1MrWFV2MnlWQ2hnclBKdi9SRlhk?=
 =?utf-8?Q?g5ET1r6qs/9UO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3b054b-ae64-468d-ad2b-08df4c995ffc
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:16:13.7726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0017
Subject: [Buildroot] [PATCH v2 11/14] package/gstreamer1/gst1-python: bump
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The analytics overrides now require gstreamer-analytics-1.0 [1]. Add the
gst1-plugins-bad dependency and its C++ toolchain constraint.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/e294b1b7735b91314c490c410e7960f7359c2052

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-python/Config.in        | 7 +++++--
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 3 ++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-python/Config.in b/package/gstreamer1/gst1-python/Config.in
index d2671266a0..752240f4e1 100644
--- a/package/gstreamer1/gst1-python/Config.in
+++ b/package/gstreamer1/gst1-python/Config.in
@@ -3,10 +3,12 @@ config BR2_PACKAGE_GST1_PYTHON
 	depends on BR2_USE_MMU # libglib2, gobject-introspection
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
+	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PYTHON_GOBJECT
@@ -19,8 +21,9 @@ config BR2_PACKAGE_GST1_PYTHON
 comment "gst1-python needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 
-comment "gst1-python needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "gst1-python needs a glibc toolchain w/ C++, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_8 || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 917ec1e6dc..a3d97d7053 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.13.tar.xz.sha256sum
-sha256  abb9a1edc11d67a463b6cef7b74a8b10ea6c342760c012d597102a7bfb7e09da  gst-python-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.28.9.tar.xz.sha256sum
+sha256  e6ad2658fad5b96d99af72ceec7e48995ff792fbda438d34486d189ce047718a  gst-python-1.28.9.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 87120fbc74..a3abdcb298 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.24.13
+GST1_PYTHON_VERSION = 1.28.9
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
@@ -12,6 +12,7 @@ GST1_PYTHON_LICENSE_FILES = COPYING
 GST1_PYTHON_LICENSE = LGPL-2.1+
 
 GST1_PYTHON_DEPENDENCIES = \
+	gst1-plugins-bad \
 	gst1-plugins-base \
 	gstreamer1 \
 	python-gobject

-- 
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
