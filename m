Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D191606A327
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p+dMPA1H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=SwPjEl+y
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142B96072E;
	Sat, 14 Nov 2026 10:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7F1sk1qZGBx7; Sat, 14 Nov 2026 10:43:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 29211606D0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652990;
	b=jeOFi6yPWDu9MoDs5/r/B6h5Nbw3Youl2+La6Ns4p/leP8dzFrCAycyh9HC6bETf4CHq
	 qJg3+GBe50UBNZGD41j9vUmibjH5w6Whfn3WYAbsJTlLc/pOkMFpqmlI6AbuEBbe4ukOI
	 vIY8eAb+tFCBJyFUG0eNrRcjJZHJTsLe4b+iYkwdMncu72zEWYoVdKIetp6De59RXSst1
	 JjhadXQzombOp9noEERrpDUo9pe6T6y/bv1N+CVtG6oDZciiGs5idlJdDYnShRy3u3jcA
	 eCRa8lAQ70ulHxuuoDs/yEs4aOhi7OzDBs7fkvM2RCpbFFvdVF5XeTHamoFW+/P4oQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652990;
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
	bh=MUxvJY4bsCG9CKhvZA6uzLEj3nNdhYfFY9r31rI+HNg=;
	b=hOg/KehbySy+p8w4yF6MjYGBoBWmY781bR7aOf+zmBmOlg1btu9VC2FDB0MwxObyDeG4
	 C12KUfBCs1rMuVks6KO9PLHAkC1UZiJChhMRv+neEjLj7xJIuFhS5tAIlKU9+MYelsSyD
	 xZYkXRBXQ9MflOrar7wlwnxiC+RyrsetylkXPXgNh+iqk3RMSVcwqqi9JBRF2D6tiqMlT
	 qO01KmsX7VXlDdQ4k+E8zAaAv0Xu0DYp1cucopq7pJIfC+OyhSmy/0Rwe9soh3G6J3ohJ
	 EvmKZxNJxc3FxOTIoesVCaDZXH4/udeSR0XGXdri6qfRVPsPDCQ1ZrffqhzSUQ5bfXA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652990;
	bh=MUxvJY4bsCG9CKhvZA6uzLEj3nNdhYfFY9r31rI+HNg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+dMPA1Hs2fU1cbWy78QeduJB/i1sPwHbv3wiUBqmcXTls3UnpxlTEDjYH/GWv38Q
	 7G2zITLFxmjQyq5ckN6qt7/9HTGWiJ4vwL3wvk7n3gcgmp47ZwZMoOQ1iAt7EfHnK7
	 hMWjSaA0acuLWVfaLhwvdD4iRU6WIZQ0Tt96m3U/MSuJQNzeqvAMz3zhuMgAvE9nnh
	 Z/v3A2sq7f1F9pclEgFLuHPohfeF6UUTVghiyd0P2uK9JcM5DY66tAjLe2lTXPwkDJ
	 9vh+ggdrpWo61rsoIyxcT7VkTylHDo76MhmL7kMwxxA1gfA9mJvLzfqKNs4GIrewwS
	 dsh1IovNsqDOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29211606D0;
	Sat, 14 Nov 2026 10:43:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8D2172D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B102401C8
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0lNEmJFJPiB for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:43:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9A0554018D
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
 header.s=selector1 header.b=SwPjEl+y
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A0554018D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cr5AKbk6wjGUsVZyhnMyxW6lICegllPUmY1ItGW+vyk=;
 b=SwPjEl+yF+WFF2JguCXdjmQ+1EmZi0bkzu50pcnET8gTW/WINJTCpdDgsAkApAeJQ/mb10ZDpRFL++9ZqsN7UaYLEeneL0AeQzNMTASgeFX2rLX48qo43WqIDOGpDv1SiffxJ6K+uNOF3f2hjXYndqmS6NhZb18sa/2VtBEHaffnioRY5Zeo2o0WKVjWA4Fg1USeL2o08ABrLF/kftW9oWLGTEVKPo+DH1YAgmCUgxEWULK4AEPI5IBzPoQoACtd/Qh/rHJU6KkARXahxw+zMIOTIbry3SB9Z2Y73yngsvxJyGJDMTk+RW8Z1o+MtxNDV5Tr2RhV11iIvTMxPkWcXA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0425.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:229::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:53 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:53 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:30 +0800
Message-ID: <SY8P300MB0041AA84B38FBFF281B5C295B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230; i=tfx2001@outlook.com;
 h=from:subject; bh=8+xtddOZ9YIzyGfVOZSqqCXdx0jKIicLwWexw3FZy0A=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+DpeQOzKj7sCCPzCHwGJxfdmPzhZGDM5qd9cH
 3ngQKKrHh2JAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6XgAKCRAcD62l0/wL
 2hjiD/9vji2mzTJhvPbH8E6WUUz2k+rVmwtmvSaCng2WB+yPDfpqUj0IQw84zig/TW1Pk1eKZyW
 z98NabcyhfbXF+CNpXNS+8kC2wLpe+Vmvt+Tb6MFbYPAeNumjAQkMYE0DS/uatnrNqSzXqCoojt
 N6uQZgWx3XlZbgAVIaM5OdIVGCzFkYnQaJ283JuGpqyCOXnPlPL3vpw0e/eijqyeaukCVcxhRGZ
 dGLarei9D/ZnwRyshQzrTcsNfqf/NNJLL1c0hU7I8YRJVC2e5oAUjw4NaLqVUoKlHzi6fiVuXHV
 RNrGm03EojcTW0FcKaT/Xd5ZVJpCyE8rcfk0Xn8ypUfIKBgOWpa/Iyig6DHIeRbpzJyRmTkTcnt
 ktuov3cfKOqwdzaUesf6QNxIIq3LxTOIHD4hcN80z9s6sduFBrTgFM0SLwUpBinpPnXujdPITPJ
 VqAjoNlL3HirPkYrmeATUG5WVlUfjdP4ilQ37IFCTuwrSQbq8nSIAe9KHJnaSNJuPDP6CPmtWA/
 2GyQrL7uqPnsd4XsaY4yoIM3WaxQnj/1tRHkZ/89zRAvndN9dsmFPC3puE2xpVYm+AKkmbI5wSg
 L/91a2SsaGpbg9DvZsBgg69JH/Tp1DMw1ZZd2VfXF5LnQcoJqIIVyZtlsvU+mXX2WrPw4AhcKR4
 a1SJxVDexkOGQXA==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-28-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0425:EE_
X-MS-Office365-Filtering-Correlation-Id: dd930ffd-b19a-4e5a-6b2d-08df423c08b1
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|16051099003|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1piK2JiSlBnZms5eGFqVFNsRTBJSVlRSmFKZG1JbzBoVkFER2pJdXRUU1ZW?=
 =?utf-8?B?WmxJcXZZc09DODhFOFl0UVBIWWw3dmcveGpYaEQ0YkQ5bXkwZVNtcEt6TTla?=
 =?utf-8?B?NUJ6STVHa1JCN0FWNkwrdmZWWDlmQlQ3NmZ6Umt2QlF6bFhYWWEzU1oxekxN?=
 =?utf-8?B?d2lSYWpNTzUxb0xmcUJOWVFoeXRxMjVGcGxNUUdMY3VGTTFDeEZzMU02V0lL?=
 =?utf-8?B?SWhMVURCU3NFS0Y0NXN1Z2ZEM0c0aHNJVTVGT1dVcHErSXgvVkFJMUFpZ1FL?=
 =?utf-8?B?Mkd3clJnMU1adGpEMy91Wm5lNzVqaFloYVpjUGhiSHh6YU93TW9YOXkwN3da?=
 =?utf-8?B?c0dLN0prc1RzeldrRURJWFNhMFpBUkYxSStXaUFUSG9RRllOSjkrTklXQTYw?=
 =?utf-8?B?VWJoNnlPOHBNKzZjU3dDNDZUR1pQTTN3akc4ZEhRRVRBNVJvRnFiZUoyVjZD?=
 =?utf-8?B?OGJtZDNtMk9xQTNWL3pjWnNmM2JoYjVRMkhteElGR2VlY2hCZm9ZOE1FcEdK?=
 =?utf-8?B?OFk2LzJYbSszdUhyVUtyRU5kdzNNZUtpUG84OTF3Sm9yL1hDVzk3MzgwSmFQ?=
 =?utf-8?B?ZzNvZnBQQkFGenpRTmVqd09UVDVCYkhsN083T2k5ejlZeGJwN09jZEI3MTVr?=
 =?utf-8?B?S3pTS1daaVQ4RmdjU3owbDdnbU5UOGs2clF6MzRtV29NeWxoNUNjR1dDY2x3?=
 =?utf-8?B?QStXTnplZnY4TEsxS053VVJNSm1JU0hzUk44cDZoYTEvTzk2cm8rVzlDRTJV?=
 =?utf-8?B?WVhMVGVSYStOQkV5SC94ZTlDM1dQVzVRZHY4VGpUZTNEVDVHNEs3elpRY2Fp?=
 =?utf-8?B?d0YrWWlPdmtVM2U1d01XWC8rcG81VG9EMzFMUklsd2FzR3JTekZhYnA5MklC?=
 =?utf-8?B?V3dFU2JUbytTZG9FcUUvN24zWWs2SVJESW1JR21meUwra28yOTJsTjk4UlVk?=
 =?utf-8?B?Q2kyT01ZWkNCSzlmNGNLNlNvR2lGWkR2azdpYURLVFJYbENCamJKY0FFOFVn?=
 =?utf-8?B?VHVCT2NKeVA4amM0ZXVxTEoxaVVRc1BQRDZJSDU5cGcxV2xWbERyckdnL0tn?=
 =?utf-8?B?MjkzdmwvMnVmbkYycVhaZTRQenNzWHpNWWk1UTJmaXVySHIzQzdjdTVtS3Z5?=
 =?utf-8?B?UlBtZGRqT2w1OXJocG9RQ1VqNEtXRTRrbjNkaVhPRlJKQndTWVlWcFpqaU1T?=
 =?utf-8?B?cXhrRDUzd0M5QjNMR1BGdkJPMkNMcHhxVzkvQnZrN0FLTTlCSEdBRkRRdFlH?=
 =?utf-8?B?NDFERGFXVjZEQXp3WkZqREVvdVlRZkgvYVdzRm1nRVBZVERCZFVMbFNDb2lp?=
 =?utf-8?B?ZENhemlxcHJsVXRvTk13V3doR3dzRk1NbGovcm5GS1A2TUUzT3pSUGJlL2t0?=
 =?utf-8?B?bWEvcEl2WDVEcjdETVhWaTBEOVBuTUNPOWZ1QWpaRVNvM0pLLzJwNU52ekkv?=
 =?utf-8?B?TXZLamFLdlBlbEVrZXdhTFdGMGhNZzg4bmNSQU41eTF4RkxHY0dWQ2V6bTVB?=
 =?utf-8?Q?gwp2ds=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUNtMkpucm1LbCs4c1lxRnFoOFdEdmVhTk9LVzlMQnJ2b085N3BUQUJwZ1lV?=
 =?utf-8?B?Mm52R1g2TGpSRVltZTBRU1BubERaMi9WMVEzWVJqWDNjNmtDeVp5c2QxWnJ1?=
 =?utf-8?B?Yi9ybHR1MndtOVd5YVRuelRPNFNLRnlFVVpuSWpwNEgvYmw3Q2JpeXBmYjE3?=
 =?utf-8?B?dTJEZnMvcE9NUGdSM1ZpWXFnVTdVazJlNDF0dGIwOFB2UkNtM2thMzBnRUFq?=
 =?utf-8?B?eE0wTEh3dGM5SnBiZ2RlWlgvZko5N1dOTXdCV1ltbWtNQ2NPaEkxVjRINFh4?=
 =?utf-8?B?YUlyZU05Sk83c2FqSm9GbGplRVMxRmVNckczNkowa0N2VDNOOXptMzRTQmky?=
 =?utf-8?B?VDl4ODlESk1QT21mVjcrNE10QkhVaUdoU09QQU1MOU1jVTNOem9HbzY0dlc1?=
 =?utf-8?B?cnRRN3drRHBTcVZWaXlMbjRVUU5zbkkzWmYwMG1pUitrRllTR0FUYVlkcFFZ?=
 =?utf-8?B?TUZ1dUMvQUhtcEFCUnk2YjFJK3ZxUjZVT2E4ZTFmWUpJcy9KbzNXb0ZURGZ0?=
 =?utf-8?B?SG5OeU0rbjJicGJBSEFsdktPQmdEelJIMG5FbFNjRDd3ZHFnSkF6bXlNR2xH?=
 =?utf-8?B?QTBHUndTUE1hNTBOalE1T2x5UVV4Zyt5Q2dzNnRRRVhoMnUyRW1ycFhldUtN?=
 =?utf-8?B?YzlZczB3M1FsRHB1MkpDR0ZGT2xLdkRzdzc2L0toRUFJcFRFZ3oxbGdCNGZK?=
 =?utf-8?B?TGhjUjlpc2pMem54TE5aRFN4YW1TNFBHQ1c0VmUvVUEram1rMlNWT3g4bGZl?=
 =?utf-8?B?WXJsZ3MzRGo1c1pyR0RELzViNmFwL1Q5eGQ3OEFTbGQ4ZDFsRmpZWHpzMnZl?=
 =?utf-8?B?TDhjaUkwWlhOb1lrbGptOTVBczFXR0VoWThPSWJOTHlnZTZBVDVvandBSUc1?=
 =?utf-8?B?RzU5YXowMUhwRElTd2Y3K2d3WkxEUVVLeVRSYmQ4eWZ4Q0JGQjVMNkFuTFJm?=
 =?utf-8?B?QXRDYXdLckM0YXNLaFBvOU1wc0JQM0xzREhDY1hTelB6eWlkMGY5QjQ0bjlM?=
 =?utf-8?B?K3pzeEgvRHF5RGplMFlYbmFDUm1PaEpYZTJuZFEzZVRGaVV5SjArYXZzUTVL?=
 =?utf-8?B?QWY0Y1kxMW1QQ1dCWUc5SE9RMFQ4ajh5dW9ibnZDUjlrYno1NGNPVzBFbWFj?=
 =?utf-8?B?aXhWQkZDRTN0cGE2M0dNT0RwdGNxY1hjT1hGVGVHcTRkdXpjUzJ1TE0wcmln?=
 =?utf-8?B?STh4a2IyajNxZWZraExsVGQwMGdpeUtQVTZWMUhMWExGNnFrVGFJQnZxTDl5?=
 =?utf-8?B?WXV5UDZoeHVLeVZpcGwrcFJONmU4MWdFMWh3TEVEZzQ1dXBsSWQ1L21rQzJO?=
 =?utf-8?B?OC9QZnNUdUpNaitnU0NtU3hBRjBqYnNQM1JvajJMd1ZlejBoNXl6YmlGVUFu?=
 =?utf-8?B?RFVlaFN1UGQ3NFltMkVkRlFLV29aeUlWVUFHcW5Tbm9WbWU5L1B6aEtMdXQy?=
 =?utf-8?B?MjZIRXdZSFdFeWt4TXA4a29JUWcxckxWVEhEZFJuU0NQQXJVQVFGWm5LOThH?=
 =?utf-8?B?Y094eXFOUzkyM3Rtd2NPRWpIWG0vMnc1dlBtU0Z4U1IvMHUzZFFrbFVDUVkz?=
 =?utf-8?B?cENlTVRIeHRBMnprVGlhUkVHUjV5bGI2Yms0WkhDTGpSWEE3YkZlUkExcW1s?=
 =?utf-8?B?Z1pIeGVDYi9yR3V2VUhFeHhhZVd6Ky9oWGxrbWhmWFNDQ25VUWtVQ1d5RjQ0?=
 =?utf-8?B?UkRhR2dFbjZkMHJaT2kwY3dSVlN0eDh4ei9QME5NM0J2Tks5cEYxN1dpWkhB?=
 =?utf-8?B?VTdXNmxWZU9PRldEMzdMNFdLdG90c3gxTitHVzlxUXBncTZZQ1hkdEVSSjUv?=
 =?utf-8?B?MEs3L2JYS21EVWR1dmVMV0xaTzN1dEpaZXdPVXhGaUJ1M1pVZ2hjL0IvWXZI?=
 =?utf-8?Q?9QcSbvsKArH9A?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd930ffd-b19a-4e5a-6b2d-08df423c08b1
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:52.3387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0425
Subject: [Buildroot] [PATCH 12/14] package/gstreamer1/gst1-devtools: bump to
 version 1.28.9
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
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
