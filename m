Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED2606A322
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G/J2Glxa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=YeLbw/Wh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A9740EB0;
	Sun, 25 Oct 2026 14:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bV8QkSvt-NcM; Sun, 25 Oct 2026 14:24:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0A3A140E60
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792938276;
	b=D6NL1Onirr30Atpjb0fvOi+rYKxBOY8LmmTMpMGkjQBE3YuU2WHtcJMJHgKQH/W1SDR7
	 7mLy0ABfGzIhlMfecZ9FjkMwnXccyx8DjfiIDK6UrL5dfrPBc+P3UfGvYV/ae0e76jyj5
	 Jd0JcNbD46GV5DHnmaB2xIwq3T8BPSvQwp8npGnwPYGA2V29D5A1smK6QCdrDjdKAnwzM
	 tdwN+29NLJB/ykBsRwzeBHrl/lT24ZpVfHtd2Td93Eim0IKC7nQdW/7pVx7HdJ2/Kvnbr
	 lAooT2jiwBNopDI7Kd05NZbnqwzuiIHVw4JOEiL4CbefQ07pNA6WLYsMp5oSSLZpjig==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792938276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 X-Change-ID:X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
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
	bh=rIiW2YuhAisIs8nJf9ucQc7zHl3JZ3mkLHVer40XMlo=;
	b=TUtKUNY2QTyuKGAuP0FCKrZTxm2fippbi5rTd+AxhJC+aKuO55nXV+FrwkdoPn/6ALRO
	 qXla0pDjsULA22g0xX781dCuJX4/xtPQ/Rnfduuq+iApO9F8knVdn2KH3QfBLg9keu/pL
	 4b1+dGL4fHQd2LtJ2YJPJZ8ddXcvV+p7D4wH2M+OtiwiR8CYBslD9DA8SI9xSA5W688b3
	 FK7DjFwwt3uKh1Xv5fuwRDLloCDXBP/gfTOKAaSEzs5OtZFSmxbUP+E4sMdI1ogHf8DBS
	 9igZOdORUbyosQFw0+hGUM9q8XOgaP+HoPMwa4G6AtJ8dHdqdkSTZjhDZ8II39DJOSQ==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792938276;
	bh=rIiW2YuhAisIs8nJf9ucQc7zHl3JZ3mkLHVer40XMlo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G/J2GlxaBJgiUau9Yy4yCqWAvrRta2K9YiNMo22fUAKHmrgs9DR3i+K6K1x89U13Y
	 OGMhXyWEr/EFTZlnwmk/PEjBYNg/cJMP9/vq3x5ZrFkZp/zQRQ61BIfXZyvC2ucurn
	 RynmlqQvZEiRGbazMu1ftSM8qQgb3w1Lh/O8gBANZMK6L8b0P79uPmz01teSbwSGjv
	 gdwqvExFz8VErDMBd+0VJmSiYmDVxsDjM8Bwi1YuDxZJxBIW9/OW3siXIMxnOdYioO
	 PxhzNcta/k3cTYsIFg9sc2QsStAOliAABUi9EF5UM+COoJmz5ynPuFSWdRPQYDQzMQ
	 s4Klo86g6iWKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A3A140E60;
	Sun, 25 Oct 2026 14:24:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D8753AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F83D4008E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMqAYZnhrG6x for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 14:24:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5532340057
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792938273;
 b=a+8TGMpWtv63nqqasl1Nr27uWi1uLiKIRVcDI1lS4PPmKIlODYDYGc1k+gfRmkG6PTii
 /9K1lp6dw4i48bTJSUlRezJtxnQEj8x+0gV2vVUwmMylKtDe7CmVE1FRrOUgt4mrKkDGW
 4XPqL+HK9AiGyZXsCrPmAfFh0UQb1HY7zbumwjcFy46gmqSTLgbeo67+Tj7A0tL0eecJA
 sEWvPlo5M/yA3lzZbbEI9tZ7d5qgHwNjLCslxBjr31V9KztoVqOHG4r9X2xnAaxbR/eR/
 tfGO3aDW+Kx60GZR6g5LieyHcts5COR3efUQZIrGvXXKvsn3CVgGpMm+pBLR7vMySlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792938273;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:Content-Type:X-Change-ID:
 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
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
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=XTvoyiJHy6FXSK6JOwo4x02RIGQ+HkjB3qmqqNuAG5s=;
 b=BdjaXldBvetISd5hCcVCfvnMnKHLeGKiC5W0XhDM9f1fWVwE4BxOkjKSJaub7tdaBkWu
 y2X/lxoGtsdgzba9pFIkDdC7LhjzX31eAZgkBYObHJrrFnOBgZolznWw/Gl6DNo0lktN8
 XiJG5Dl1XUJT80CZ8KUySgIb1twtnTnfjW42KmEbZbf0bZDtFXG8cGPXa3EOzgthm34MR
 daCQAo1fqPK3RmcrreSQ3LW/DeeSpMufJhnTTo50FXTMAIKEomhulMLRMkm4Q2IGNWYq4
 rkpPk+WHQImDmAtc2vTievdwLfZdzo5y3pk07guTg3Elzst8UK8ZY0F/y42o334rpVA==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=outlook.com;
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b="YeLbw/Wh"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=YeLbw/Wh
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5532340057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:24:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUTjaaM+tn9/jrRCd+3kAAqL0fLwhPt3HM8U0qkcAtiwFLrO7QfKFPJWJ5HxDdWNVgk2s294Kfp6fOwajoSWQwoMayef5GDk2HtB2ZxWW455tIYX6rfRIAW3YqtdCal69HEQQYuOjHurWQZy2n/WL5BE/5yTWUedKJM9hM02gPhZedfzSChz77YzHHrZUVLVy5cgj9jpLcDLUDOlj/I6egl3TjPQgG2p4MoOUs9GzCAHQnWA49fih4KoYDtx5X+qlgo5QOMqV4gsQ9MCjyQUgX8o2CaZwEH0LDkXnKE9QZzz1Xaw/1CUzje8Q3RMBqLZJw6TWRbsVlxFjhd0q2eO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTvoyiJHy6FXSK6JOwo4x02RIGQ+HkjB3qmqqNuAG5s=;
 b=cD3iKTDi9Q2Q1MkmyTe7M47MMTgXEKabtQb87Vvvnn3eAYox5Lj1L+DjEA5kZtQBgQygPvQI3L03JGTfS6nlJ4+iSgO7VFliKAB5wG4/pVqQWelUg655rIkdfEZ1XEnPoPl/eDQhTSROQr7NJJQcuJnN9dO8u2uUpmy1CK3L62sWrCiSPRbxrmtsq3xz9dJiAxWLnejE7xj9XbDKosCvT8Wt9eiqkJQteuJNghNc3U9yLXTRzhd6+EZs1ZggEZevvPEpogWM16OX0J0/HAQ3u+dVT/6FkC+jcU8dB6B23kzJTwFvQVZFooUDoe9aMThhI3v4PGIoMBg0FDIxCR+OSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTvoyiJHy6FXSK6JOwo4x02RIGQ+HkjB3qmqqNuAG5s=;
 b=YeLbw/Wh9zYbFlwna/qLeWadu2vx3+T9cnz6fNV2m1Mh3oXuRRrReu7lZxOFRtvFuhULnkMdDJVQ512gFR7GdHzro+RoXxqm+gYCOvQWp1p+HDqPw1VlvJ1fEexns8O71fW7YiAvicww57dqvLGNRjHkQqEWvzeZgJCwmpNG5OjjWhR6UwMEVI2dFLeXP8QNbyGCxo66T4Td9vH/tfbwARE/yUmwrNmOseRyv3OZf3/SJaX+r++i8MzamvFpHXmfJvpfDvyqnR2iXgWP7Fdu+e9hX0qPWgg4xPNCBdT/RhEbvEAuEaBkt9S/sPLzt+RqvPDPgBz5P7Ejb04crIiNhg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 CB0P300MB893502.AUSP300.PROD.OUTLOOK.COM (2603:10c6:140:101::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Sun, 25 Oct
 2026 14:24:24 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0546.021; Sun, 25 Oct 2026
 14:24:24 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fengwei Tan <tfx2001@outlook.com>
Date: Sun, 25 Oct 2026 22:23:31 +0800
Message-ID: <SY8P300MB0041B4107E1E37E8BF9268A6B5622@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
X-Change-ID: 20261025-btop-bump-v1-4-8-63c5748800cd
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787; i=tfx2001@outlook.com;
 h=from:subject; bh=+AFlGCsitzGS6fVvvyugu4KbkMN+gHBCCLUqiRL4bdM=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq3hDigWDn3XhY2lmzKY5vnWF5qoTdJ5H+GMBBB
 /e5zWLWf2SJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCat4Q4gAKCRAcD62l0/wL
 2n4jD/wKlh+nbhgA1HTbnJhZYBzNyunVtAN1oWqvZX2oJlYhAUp2/YQgYy6RF5SADpVXfI0JZcB
 RXsw1xRkWcrVv7eR1oJFFNThq+Og2gxpL/bzvvWgUvecjCOkFQzRtRmBrLbDeNes5AI2gdpU8wm
 2EeB0DoIlhfUI9bLC5/bah9AB6ELWURED6O35s6FTPRqRLJcAcSzS3M9bRDToEau01wX1ioAygq
 HM3YuJaN8DehaP1Z1xxuYsirHV34NHW4E3X8pmlRZ0jRE0591fYkLe5in8/SBdrhX1rexBctRY1
 H9Vebo3wqBQ+V0Ej+uxx8+H3YaZktRB8kzKo0cZkLnZz1HkcDnbC/N5C4WFGjEsIooO1sbp1o8s
 YRgbO203U+KwUnWW+OPPNDGbIiu0HmReyR3OdgBAGRKWmWwmWiLSTAfeVrtJFRIakPp6TPEFAbK
 8Nv4PYtyJEqBe+Wd1ddMLL868P0W41R3zN72LUMakTJXnzXQBxU0C3p0OTxKyGXKPCEQCFlNZU4
 i8M2Kxl6AsDmza1zaAUDkhZIP8l33BBmP3H7tIOavrCU7eM0W4yj0LQc3a3+Jj2x9gFd0AdjnDc
 t+a7/Wu/ZXLMQADGClqEh1Cy8EVol/yJWfk2pejbRKFoYe6k2Zn10G4Dh7G2mWXhZuNVHTGtjuS
 t9YZR5PrvmJbyhg==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0045.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261025142330.774456-2-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|CB0P300MB893502:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae7bfd2-0bcf-4695-a7dc-08df32a3aac9
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|15080799012|5072599009|8060799015|5062599005|23021999003|24021099003|19110799012|8022599003|41001999006|25010399006|260925184616899003|3412199025|26104999009|440099028|3071699003|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akxIQldaZFlOOENOMytKVTZiZi90Zm1kQ1R1Z1o5bXNsd0lXOXA2Ykx0YUZV?=
 =?utf-8?B?RmFKYXVSQ0pDanFYbVcvcDFCL05BVEN5eEJWMjIzUUlncnEycnFwSzMvTnB6?=
 =?utf-8?B?L1lxNFZEMGw2TWdhMGRRSXVtaUtLbDZjNFBYbFBLQUI1ajdYei9GcnBjRkhu?=
 =?utf-8?B?aWJza3pIdzE2T3VuWnhra1lBazlsRk1wSnRubDZqdXYvWHFKcTFObkdPMTlp?=
 =?utf-8?B?TWt2RFRvYjB6UUtWSUlKbDVUbHpLdkpWVklUMDVvdms0ZmRFaklSTGMyT05I?=
 =?utf-8?B?OGRlOUNCTER3akJjMFZvVEt3UFB5d3VRMnBOcW1Gc3NLQTY1bFFybU83a1V6?=
 =?utf-8?B?NUNXR3hnbXhoZk1nNDJ0cjFRZG5GK0FiWEFQRTF6MnBOMWRHc0dpckp4R0Rm?=
 =?utf-8?B?QVJ3eG1sUEpGaVJqRlI3dSs0clhHTmN6c3ZXME16NTIxZy9DQ2loRDFTcDkv?=
 =?utf-8?B?RjZQRXUwZzFYZGx1UGk1NFExR0RuaDcxSllWakloenZYTVdWQ1VjczVKbU1D?=
 =?utf-8?B?M0ZRMEE3TnVuaUFzTXVMaWk4OC9zSkR4MTN2TzZaOGg2ellYSklYNXlBby96?=
 =?utf-8?B?M09xNnZzMWdKZ1Bqb3JzcHAyTURVNFJva25MRGZKc3hvb2I4QjlSSlUwU0tF?=
 =?utf-8?B?Nk1qbEcvblJvZk5vVDFMMFlGakxVZzRqS3ZOWmxkU011UG0wS3pCcm9aWE1U?=
 =?utf-8?B?elFlTGlVRVhWTU5DUlJlVjltdzVKVU9CVFpYWTk1QVdIOEhORXRnUjJPZitK?=
 =?utf-8?B?ZEFNS0JQbCs4bkVnQ0ZHcHNDOFNOQnFOQWlGRXprVjNnam96dWtFSmxwejdM?=
 =?utf-8?B?ZEhodjFOTjFaVDlya01Sa1lrWElqSElKQnV1ZHJWWnhNWkU5N3R0d0pQazN0?=
 =?utf-8?B?QW5USVprclNHczVIWUVqUHJZKytEZjdHaG9pQWtCdmFmWmYxYjBQTk44TG5Y?=
 =?utf-8?B?Y2NxMkYrVXZWdkxFRmltU0ZoaW1lQzZhcUlRMGFtT0w0bjN6NmJpTVZWYUh1?=
 =?utf-8?B?dE9oQTNmMEptcnZURFplTUlEL3MxcytjUDhGdXJnbWhXRnBLVTE3T3lEWVZI?=
 =?utf-8?B?a1E1d0lsVk1aQk8wQnM1a05UTkhNTEJDd0xZRVpQWHNhRGw3UDZ4OTVOanNW?=
 =?utf-8?B?YmFHbjRyWVJTU1hHTUhuellWNDlwc0tLNUlTUlRKaWgxZ3BjYVpFZ2dpVTJm?=
 =?utf-8?B?b29NVys1SFcwMERmMWdVUlFYZDkxNFRFZ1JMdkkvQisyaXhTSnNsQmFkSHVk?=
 =?utf-8?B?amhJZlFsSngySnJZTzJndEt6Q1dLRmdQcFM1MDZobTNsL2YzVnVTSVZ6Z2Na?=
 =?utf-8?B?ckd6QXYrTlUxZSt6MklGMmFWd3JKak1ndHI3L0tnc1JmMkFFci9pdXJ3YjNo?=
 =?utf-8?B?TkNXajVYaW5ad1lYSEJNV0xSbmZlNDhNU0l2bk9PeHlFN1N0OFR4UU81NjZS?=
 =?utf-8?B?MThJV2lyb1Q4L2lIUEhxMmpNWEVnbEMveS93L1FRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUJIUWw2N0NZT05VQmZUaGlJM3NXVnlXMStrWEpaQlJwUEpEV1Q1TjBpSUZt?=
 =?utf-8?B?VlU0K09Gbi9qdkFHM1I3UjE3Uk1HK28xVGFFNTQ3Lzh1N2lybzF2d2w1L2pY?=
 =?utf-8?B?RzM0Q2g2a0svSTJMUHVtWGhxK0VpaUc4U0lRMXFRUUV1NUFiYXZPUGNGTTNQ?=
 =?utf-8?B?bC81KzNDZzFwVmpiTU5YWmg2VjBQNnV6c0hja1ppd0N3R1FsejZsd043ZUV6?=
 =?utf-8?B?THRSdkRZNG1hTjlVN2s0L0ZsTFZta3Y0cFVBQmpPUUZyWEowYml1U3FUZUk5?=
 =?utf-8?B?alVjZ3FqRzg4aEE0d05nMXlRbjByVU4zelgrcDN3MzhUN0RMeEkwcHZqUGYy?=
 =?utf-8?B?RkpYS2NhZ0EydU02RVFNcWZnSlJMeFVMcll5V25iYTAzMjFUKzZrZERuS3Jo?=
 =?utf-8?B?UkJIaytKZ05GeXBFZnQzdGpwSkJ1Y2xkQWJtOEJmMGtzQnJkQ2NDK29jYnh6?=
 =?utf-8?B?MzBHcnhrVHZidWJGazJzbVlkVlJlUGo5RVd4aEF5dVdtMnhwbkRjZ05Fc1k3?=
 =?utf-8?B?blM2bHFOSGxXVkJvS3BIMmkvSFlURjViM0p6cmk4NldlZDNuRS9rTWwxNng4?=
 =?utf-8?B?aHQxNFBMUmZPUkhJaCtSODZNT2hYeU1nbmI4QkpQQXNvTkxRbnJxTERoOHFR?=
 =?utf-8?B?WTV4bGg2Rmh3bU5FWEJXYk9QS0hrVXJYZForNE13T01GQXhSSGQyVWJ3Z3pD?=
 =?utf-8?B?TC9vNEJxcnhwUTVJeTAweU9QOTZ6SUhzcmlpTW9Hb05pQjZPZnFBNDAweXFF?=
 =?utf-8?B?UHhLRHBBamg0SS9JeGdPbnJ6Q3NabWdZaitKYTdScUtGVmQ1dTVxMUkvcXZo?=
 =?utf-8?B?OHBTMVNxTDc4RkkxNStFUzMzVkgrVkF4MTArKzFETk5WK1hlMlF4Y25tSjBV?=
 =?utf-8?B?bVNkSlA3cWMwYXRTRzZEUTZoa2U1MHd2c0ltbUZDMTdnTDJyMFlXWnFLY2c5?=
 =?utf-8?B?cGdHbDM0TE50bTZOcmIwRUFpVlFWaUlIR2FGWnBoMjNtK1NZZCt1Z3ZaVWQ1?=
 =?utf-8?B?U29PL0NHT3hCQUZ3bjNEYmJHdG53Uzl6UisrNG4vdjMxYm9BclZUenViYTRy?=
 =?utf-8?B?dlpsMm1vS1U1aWdPWG5hNVFzVkl2OTgxQ21HeUdpeUtDRThEOUlHMVlIaGwr?=
 =?utf-8?B?ME5DaUdRbHM1Qm9NQWtsUXZpU0c1bDMwRjJPVTk0clZEaVFrRlNocnpKNTZ3?=
 =?utf-8?B?RThlY0MwbWhyY01XUVNSZ01zWjduUFdmeEp1NStzNm5uUXZTQk1zQ2hxY0g4?=
 =?utf-8?B?NmZxNnZpUmRSd01idlNtRlhPZzhra1RZZlhwQmttYjZkMVR5SzVSMEh3TGhL?=
 =?utf-8?B?ODAxbHZ5SVlWS1Q1TExFMnF3R2krM0NUMUMzU0ttZVU5ZkJpUXpUU2tnQ251?=
 =?utf-8?B?SlB2TGtOUXFWcys4emRkeXdHLytidWc4QzdxYVlKbjEyL1VzTWpBdFlQajFM?=
 =?utf-8?B?UEtId251UWZWSmkya2dkTUQ3b0JmSExTd0hnai9RVHFIeGJydFpqT25CVzBJ?=
 =?utf-8?B?RitDck1oMFZuYTNhaGFUbEhVTWxEdUpmcGRqNU5uQVhTbVZtMnhWVlNLUVlK?=
 =?utf-8?B?RGdWWGhQQVpEL3ZXZU9wS1BObU53Uy9IWEZQaitSQ3hRK1pwakEvbVhYdS9t?=
 =?utf-8?B?SmxMeFpyY1BNWlFsNkFQcDhSeWdITHR0VUlCZ1hlL2xwQi90ODRXWnlIVTVh?=
 =?utf-8?B?U1N6T0ZzdVRUQ3Z2c2xjM3lOR3dHa1ZiS1BXbHAvL0ljL2dEUk5IZ3VWM0hn?=
 =?utf-8?B?b21pM0VCai85dlF1WTd1b2pqS1RHcDExWndCbWsvVHF1dEFkS2JEdHgxV3NB?=
 =?utf-8?B?ZjU3UzBXYXB6N2pnOENrVEdEcGplbmNMYzVkMmRRSlY2S01ZZm84OEF4TU4y?=
 =?utf-8?Q?qk2YOzqmIEHhH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae7bfd2-0bcf-4695-a7dc-08df32a3aac9
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2026 14:24:24.1841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CB0P300MB893502
Subject: [Buildroot] [PATCH] package/btop: bump to version 1.4.8
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

Changelog: https://github.com/aristocratos/btop/releases/tag/v1.4.8

Update the hash of src/linux/intel_gpu_top/intel_gpu_top.c due to
upstream code changes.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/btop/btop.hash | 4 ++--
 package/btop/btop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/btop/btop.hash b/package/btop/btop.hash
index e748dbb373..777ab6fdc2 100644
--- a/package/btop/btop.hash
+++ b/package/btop/btop.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  933de2e4d1b2211a638be463eb6e8616891bfba73aef5d38060bd8319baeefc6  btop-1.4.7.tar.gz
+sha256  67e07c21b770a6d884c5e50ba1d2cfc90732ea57459367d8732ec7ecbeb3be5f  btop-1.4.8.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  include/fmt/LICENSE.rst
-sha256  e0309e3ea5d2c839946816c557ac8da5ec022b3f0bb26a5b5de0f709567902b3  src/linux/intel_gpu_top/intel_gpu_top.c
+sha256  fd0e63f4a1b411fb8ae10107c1fb8919b6ceadf656bc9bfddd9f9f76b84ec4e4  src/linux/intel_gpu_top/intel_gpu_top.c
diff --git a/package/btop/btop.mk b/package/btop/btop.mk
index 50cdca90d8..4c4cb8712d 100644
--- a/package/btop/btop.mk
+++ b/package/btop/btop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTOP_VERSION = 1.4.7
+BTOP_VERSION = 1.4.8
 BTOP_SITE = $(call github,aristocratos,btop,v$(BTOP_VERSION))
 BTOP_LICENSE = Apache-2.0, MIT with exception (fmt)
 BTOP_LICENSE_FILES = LICENSE include/fmt/LICENSE.rst

---
base-commit: 44ed6fd12a207cf0d61e27460afdc9bc28001649
change-id: 20261025-btop-bump-v1-4-8-63c5748800cd

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
