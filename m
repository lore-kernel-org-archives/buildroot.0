Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8458A606A323
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Doc3AHVX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=BP1vaUYa
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A5C40DE9;
	Sat, 14 Nov 2026 10:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_BPtKriMnBp; Sat, 14 Nov 2026 10:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 487A340E30
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652967;
	b=iiOuLiPG7Y2Fl/EM/x/91hzdIKxQ/guk/FqLgf1xKi6W76TuE3GFEYWmErh2Ho2WzmKg
	 tgdEBxgwgY6Ff7LYQyjYlG5DmabhyDNpTRpZWdouKbSZjcYoIuqSSTzwx8zQDVtlY+RiK
	 8gkE0dut095bg7G1Yg+nIp0W8YaFjlc2iLWA4jVPS2AGjc7MxsYkjFuHFQ7WiqupzkT7a
	 58gY3JbmSdqqtLVzDoXFt+ftKxpJAA3ZPFeSs3666mDd/rBmWAio4x/imTPsv438i57VO
	 nJEAgJJ6Bd8dwqoLSC0ws85FklJp7JqiHu0WR1Dk3T1jTv1mxy2qCIXZrGosgp9lPyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652967;
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
	bh=isU8/w122tnDNDwYi1qmhNYbvEDij1PDJvvrjdQnwCE=;
	b=XLMHa9MIaIyuEgtpRiqQzOmpxvSCAF+lsXFx84V3h//QTJ87Ah/+2ZF0EgHu77M+2ntI
	 hXtR6WZFFxSmCSYs74FDCScsPtEMKy03AY3X8i0coDeMBJsDG69xzvYKCvieG7ruPuaMH
	 DhSb+Jbr0rA26CQJgsSEIpqDJDCwQioUxc8urIE+jRmGRuvIHufqltyAxvNG2ftL0xszf
	 bZ4T3tvtjCIpZfUtpv/UmtFsuhzywZiJ4HAc0mE61ZZ2W8Ej13mtME1jfi0Wj4MUGCpzT
	 uYqhMt3aH/XdUPadyU4GW6OaJJjzgHdpst4HHuVy4a+IcoJV3d5lcQ8EMrV5tTaxg9Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=BP1vaUYa;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652967;
	bh=isU8/w122tnDNDwYi1qmhNYbvEDij1PDJvvrjdQnwCE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Doc3AHVXR1GTArAkzT7uHUhGtSvSRRbDQANfP8Xumq9vKjiuXTJvyYLW3iQY7WVWd
	 LTXC6vtJXTyts5fzDTtx9yPd4b2VyedvL1pXkm3cS8Dd3enWDJPwlGV3BfZwvHzo70
	 iMvOVc2QLKvYbHyIv2CyZlhpEPRYiILmZDYSptuLd21A2x7k0QW58EhNrPZ4ZiwTLo
	 vE2iJooS90VanGYAprINgLcM0FZLDxLJHFUoZuFMUr34koZK7UjPX79cdSFdJijLZ5
	 B+isS4EP/rOH732Peyj9VPgPv5jxxip3IM/yw8b8kO9kW1QsGWEPWkz1jqbCwL2X47
	 3kKWmsmTnupdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 487A340E30;
	Sat, 14 Nov 2026 10:42:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E105D70B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D35AC40DEC
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdkxjzJl28AT for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9169D40DE9
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=BP1vaUYa
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9169D40DE9
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTri32h1ow9J08Qfkv6M4KoFd2aS1lpR1cUf85H4dGI=;
 b=BP1vaUYahgOkQx1WUS1PSLt4ACh7Ciove8xEsWUnvEyENg2d7n1AERtBMiOgwFidNhFzTedvAcE1Y1nLPFD8a+RBqwwJi+D1RjsQiPupNPa/pdJ5fzPkOgykwK9HR3Yve7xFKArk3zymQhtrS9xCdyt2AAaO5eIwZCqcVTsBjNhCJslMhifCZZsOSDg+ljuB/FeiA+e3g9f50SYg378PQDi6c60CfKZ9w17JlAx2mYCE4I6byGa/BgntnmD4KXv8ueuuj8KFoJh6281jbmBY4MLffpHgvdcUzXox6oJ59CL0v06uMCwohriCDRGHGFDx/gve3r/324RQO8cDXjhAxg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:38 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:38 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:25 +0800
Message-ID: <SY8P300MB0041BC7192B746E5A51D2A9BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6710; i=tfx2001@outlook.com;
 h=from:subject; bh=7a4g1n9LQTn4QhC9M/2Wl3acbLC5dQzs7y4oDQLJEZc=;
 b=kA0DAAoBHA+tpdP8C9oByyZiAGr4OlqhFsAzmCMaU4lFgfIgEzdpd3yogCBtvd7ZVXu5UYvhJ
 4kCMwQAAQoAHRYhBMzvu9arYwEySAaoBxwPraXT/AvaBQJq+DpaAAoJEBwPraXT/AvaH2QQALXR
 YCyaTuNCbai/lH74STWegU+l0hwGTkVHe0Gcq8ExMY79cOr+WP9/Y1/m7iY9UXcon1xiC68S4FQ
 wG3Qbkts/x+WTLKmeEXAVo5cbcAtwtUKViFYrXdU2n437vqKQVyhEF49zJdhlK9jXUHG+LGcTkc
 XSMeEVHH8mD36oOb3o31LICjoYiiYns1KRjZNw5v85beWxA2N6uBlnhU7yraVWf4k1KnDFhHx4d
 Qh/Nvu7zG9+ved+njLzE0kRhdJijjPnjb2BMzwy7CfQFKT3JoIqhNviORLVHbbn6h1prU2Gvun1
 qsGjxge6X8u3fCnODzEjcx+X5N0/yLZ8vo365FltMiZHpBIIuzSlfp0Xg6Paz9KKjqzkQA1isZB
 mAfzaeeKvN1WSWxTGu9e+1kN0cTy6iylBcvqsAijL4vBQ2D6y3mG4nJV+iVB9KIHS/lGP2ruNFt
 fd9E/XQdwBb3pPAu1MYCCy/ePPuf7lQ2hq98c5lh2JGFvacy+xOoSPfjnAfWrIdSrglLLAAFBob
 ZfkJ9td0dsweTnX4e5fQSwHrzDBnLg4ZadEgOSyshuQ9Fnxg05+3my/LIbS4qG+LjfrBCQonJNY
 bmA9RH9i/s0CJGCdhdA26SLq3K+saau6MjP3CauXMPWWOECsMJ/5eXQ4kGQn5OdZsxga3ybeW9z
 xxMzj
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-23-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: ffad952e-ae73-402d-0ac2-08df423c0069
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|16051099003|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dThKdDRJUnlDUlhHUFBkRERKazhzM2lZM1UxeUNUR1J5UGFhQUxmc21NNHBz?=
 =?utf-8?B?YzFadkRhOUNLenJTZTh2RjFlWDBMLzNoKzl4cUFtckl6cngzOG1tUjgwdUJt?=
 =?utf-8?B?K251SStYQk91WWtzNEtxYzdBYkpaK0lSbGpNOWlwSmV4MEdLS0hGbXkyVkNi?=
 =?utf-8?B?RHdWU0hIRFgwUFRVQTBCbjZhejlONnhiTjZEVC9jY2tZNTNNaHdUekl6Y0xE?=
 =?utf-8?B?UWlaWHdyL1NtZzJFVENTRkdsRi9GbE9BWGljUGYwanNRc0N0akVyeDMwMGsr?=
 =?utf-8?B?cm5JT1dFVlU5UjhCN3QyakVBVzlRY2RTVHFVTDNzU3RWQXhTNzRXS0lESDY2?=
 =?utf-8?B?NnVSTHh2N0VMaW9GRllVbnRiQ2ZWMnNLYTBXYlhSK2tNU3BNL2ZRaDlhSTVi?=
 =?utf-8?B?eHdvM1g3UE1lVzQ3TGEzdWw3RWxyTzlaU1ljTXpGQlV0VEg2SFZJMGxYWjI5?=
 =?utf-8?B?allCWHUvWjZRY2p3b1NCaGlZZHpCRkdiRSsremJBbUllYms4b21hNXpYUEVt?=
 =?utf-8?B?Nk45M1dDMGNHOFJ4VEw3eVJZbExLVmh4VTY3UWxCV3VSK21wbDlNNGxKV0dp?=
 =?utf-8?B?OWpMQnk1cWJOTG1HNG03SmRqOXZTaDhNMVp3dEVoM3gzbmFlQUJ2RzV4Q1Rl?=
 =?utf-8?B?VzNBeGZSa2g2SXlaNTd4Z3hlNFJOOTVTbm5qZjZjRkYvZ1dlR1kzOWVVT1dw?=
 =?utf-8?B?dDE0ZU9ZMzlhTEx4UGprVnJ6enJXaW5SbXRDaUNNZmdNdmovNlJFZlEwNUp4?=
 =?utf-8?B?NEhrcUltVUkwQjZIV2UxWE56eGZxS1I5amNXakJLVXBIMmJCeTR2SDNiSEJY?=
 =?utf-8?B?OGFvUk1JNHY4cDNqMlZWZG51akYzRExIbitlU1U2Rkp1QThqODNFVlZTVE9Q?=
 =?utf-8?B?U0gwT01xSGtHbHNnR2NOWEd6QVpCUzRNR1pEeWJyOUQwUm1hV2NmaVF5VzNu?=
 =?utf-8?B?bTZ5bVhkQmhENTA0djVKRFM2ZXA4bGJWaXFsRC9rQXp6R05HVjRkMThhak1J?=
 =?utf-8?B?TmovUjg4aG1YdnVvV0krOUFhTnNOdnpuSTczRllQbm5VOStLcmZXd2QzOWdE?=
 =?utf-8?B?MkhlL044TXozcCtkaCtTckM1cGhFV2pZZGhFd0VSaWZnYW9KeVJsSDFwL2gw?=
 =?utf-8?B?YjhYMUE0b0pxTkk1bE9nditPaUdvSWlMT2s4ZGZqeFk2MmRlS1VSZkJVMy95?=
 =?utf-8?B?Q0Y2a3V5M2pUVEU1OGNMUmw1NlZJUDdrdGFtajdvbVdCczVna2lqMzRnZnlE?=
 =?utf-8?B?Q0MzNEdrd3gzbU9xZCtkN1BZei9WMEpmeiszSXdCbk85SkhBQ3A3dzdkWjFU?=
 =?utf-8?B?M0pzQkNpWGVBZjdYeVBvR0xYNVJ0QmJSbDE5WWZDaDlxUVJMM0NMNkNtQ1h6?=
 =?utf-8?B?d3Z4Uk91NnBmaGVyTldNVWtWdUljK0NYYkFYeXdwTXhvZE44cFlCVkdMWDl1?=
 =?utf-8?B?dk8rK01mb0ZNTEh1Mzl5a0xLcDhMSHEzdGFiVVU0aTZNYjROL1crSkRtZ3JF?=
 =?utf-8?Q?AIOf88=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHlqenVuWHc1RUtsbkhXM1dsQlIvbGJTOWRnUytWRjdmb0x0Wk9UcG45S2dG?=
 =?utf-8?B?NUl0TW9Yb05oZHk4TmJVeFFtcklxSHRVTG11L0FYM2J4dVhHVmhaVUoyK2gv?=
 =?utf-8?B?RHQvdHYyMkNNdC80cDkvbEFtNkQvVDNnYVBsa1ZRZ24zWTVrQlE3UmY4dHlt?=
 =?utf-8?B?d1p5U0VPK2MyL0RZUXV2T2VTTDlkWEJBZDhibElMOUpBUlVmTjZNWkFZQjBk?=
 =?utf-8?B?bjFRcFVLaFNJRVQrTlpBVjI0T2dqS3pKb3dQL0RucjcyNC9ZL3lqNjFmejV6?=
 =?utf-8?B?bUQ2S2U2SmQwT1A0WUswVE9YZVlhc3IwdWxxRWM1WXRITEJMQzZRUVFzMFpl?=
 =?utf-8?B?MGJnNFRRVGdhbFkzUS9xYnZmN0Y5RXRhVWlwaFRJWDc0b05BaVRoK2sxeFlw?=
 =?utf-8?B?ZmtLaDViZEJMWWh0Q3ZNbkhsWHhpNm93d29jTVRHMXloTUZ0TXA0RUpFbWtI?=
 =?utf-8?B?QjV3dlZEcWFzUU9pd2hObm1oNWpwT0pVT3RLbkpXdWx6UlFtZmo4Q09jTHov?=
 =?utf-8?B?YVVzWGxvQ3NtM2p6TjZ2TUNMbHV1Q0R3NFU4Qng2b1ZHeTNUcGRIRjlIQkVB?=
 =?utf-8?B?S2pIOThWTGJDQ3praG1RWDFtR0FrMlZFcWJueG1ZK09mbjIrR2ttUTVlbk1q?=
 =?utf-8?B?ZDdEYm5BSDdZd1JSNGxGUDhMV1FCdHJ3djFRNUFSQ0N2WkxORkhZYWozMWhy?=
 =?utf-8?B?K1Z4emVoZ1pXbDc2T210SlFsb2RsKzB3TC9UM29QVWF5NzU0bE5laCtIazd1?=
 =?utf-8?B?dEZMN2pOWi9zanl3Qjdhd2NuSjZuelpjOVE3dmVZTmZrY2VTM0pHd210eU8v?=
 =?utf-8?B?cFdkeW01bmxPNXVybzZkZmliVGRISUkyQWFKaW00WGtPSTZ6MTlxUWxHd3B3?=
 =?utf-8?B?cVVGb1lYNzQrcmJGTldTSG9nN1BNamtySlJBOEJORDJ0c0VPNmxxa1RYamJE?=
 =?utf-8?B?WFE3ZzJTQklyY2NKZklWSmdoWTJoMHFaeEJodjBlUTZZNnlQMzRyZVpFRm1V?=
 =?utf-8?B?MFFEaVQ5amVOT2J4ZlJ5YW80VndOamtjTHRqdkZyNkUzc1Qyc21SK3AvZEpF?=
 =?utf-8?B?T2hqL1JHc0ZONEFJVW04TVBMUllCeWNFb0JBUS9uditrSXR3dzBoMjRLSnlZ?=
 =?utf-8?B?M2RDWlQrZXBnblEvWTA0RFdVa2FVUDhLNDNFZW93T1g0SkhpdHVmV2pyTE51?=
 =?utf-8?B?RVhYcm1TVm5tMk02aWFSNzNzUHRPU3lmNHh4WTVVSkNmeTFVUTB5S0d5S2Qv?=
 =?utf-8?B?RUg1MXhwNlRsREVMZTZLTHlhc0Z3dGgyY1JSakpmTE44TXAzR0tWYktvdXps?=
 =?utf-8?B?S2xiMXJBTllmOUVFZUhBRURIaUJoVzBuV0ZkOXFIWDFkbHRRL24rMjNRMEl5?=
 =?utf-8?B?V0pqdjdVdG5YK0R6RHY3Q0pIS3RYcVFqUlQxU0FIK3hKRGwzNmV1QjkxdHJx?=
 =?utf-8?B?YlJNczRZUkZwTFhsaHRHRDdJMkorQ2FrSHd0K1RlalhVOXJ0UGV0NUdmVUUy?=
 =?utf-8?B?RDZNL1RnS2ZYQ2lFdTBiTEtrd3gxRE1UNzcvWFg2czlRTngyQUlXRUNvZkFl?=
 =?utf-8?B?S0UzWUhVNnNrSk9TYm9vVjF4V0xZSnNEekxxL2lXdTdlTVNDd05QZEJoYnI4?=
 =?utf-8?B?TzBoN3Fpa0VzVW5WNHRGbzdoSUVuM1J0RzV2b1ovaWFqREI2bTZBSEdSSldH?=
 =?utf-8?B?YjF2WGNoeE96bitxTkt5QTNZU2tpMjYrUGFFRGViRGRRSHppZGNzV2kwbktM?=
 =?utf-8?B?MWVsampOSUJvTll4T283ZFRNMTlwN2RRZTZGb0JVeG1POFlFT0wvMU1OYi84?=
 =?utf-8?B?QlpObU1zMkZPMUtWbEdvSjJuOUo1U3U5alN2c0orYm16eUlVemFOU0JEeXNv?=
 =?utf-8?Q?1skZxCdKJNLsu?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffad952e-ae73-402d-0ac2-08df423c0069
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:38.5286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 07/14] package/gstreamer1/gst1-plugins-bad: bump
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

Replace the deprecated Meson options with glib_debug, glib_assert and
glib_checks [1].

Drop the explicit -std=c99 flag and use upstream's default of GNU C11,
with C11 as a fallback [2].

Add Config.in entries and Meson feature switches for the new
tensordecoders plugin.

Disable the following plugins, which require external libraries or
unsupported platforms: cuda-nvmm, hip, lcevcdecoder, lcevcencoder,
mpeghdec, nvcomp, nvdswrapper, svtjpegxs, tflite, tflite-edgetpu,
tflite-vsi, vmaf, webview2, wpe2.

The y4m decoder moved to gst-plugins-good. Drop its old Meson option and
migrate the old Kconfig symbol through Config.in.legacy.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/84b3a0950debc467ce25aebdddd0d827e658252e
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f022eba452dc04d1cfefe4860a5f89bc261e194f

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 Config.in.legacy                                   | 11 +++++++
 package/gstreamer1/gst1-plugins-bad/Config.in      | 10 +++---
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  4 +--
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 38 +++++++++++++++-------
 4 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0ee4d04751..cb3e483e62 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,17 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M
+	bool "gst1-plugins-bad y4mdec moved to gst1-plugins-good"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
+	help
+	  The y4mdec plugin moved from gst-plugins-bad into
+	  gst-plugins-good with gst1-plugins-good 1.28 and was merged
+	  with the existing y4menc there into a single y4m plugin
+	  containing both a YUV4MPEG encoder and decoder.
+
 config BR2_KERNEL_HEADERS_7_2
 	bool "kernel headers version 7.2.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index fd518c228d..4fbc5057f4 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -300,6 +300,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SWITCHBIN
 	help
 	  Switching between paths based on input caps
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TENSORDECODERS
+	bool "tensordecoders"
+	help
+	  Tensor decoders elements
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE
 	bool "timecode"
 
@@ -324,11 +329,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VMNC
 	bool "vmnc"
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M
-	bool "y4m"
-	help
-	  Demuxes/decodes YUV4MPEG streams
-
 comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AES
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 8d173ad38d..2c4150f303 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.24.13.tar.xz.sha256sum
-sha256  3cbe7d7cec5db958781f7ab66caa5afd67b133c223fde71f0403277731f0cc4d  gst-plugins-bad-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.28.9.tar.xz.sha256sum
+sha256  4a4e0b7bf84f868378c48f143a7ac3a98923b488a5b74f1a35ba46bc3c43f6b1  gst-plugins-bad-1.28.9.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ac554749c9..ec96a2a1cf 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.24.13
+GST1_PLUGINS_BAD_VERSION = 1.28.9
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
@@ -15,7 +15,7 @@ GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+
 GST1_PLUGINS_BAD_CPE_ID_VENDOR = freedesktop
 GST1_PLUGINS_BAD_CPE_ID_PRODUCT = gst-plugins-bad
 
-GST1_PLUGINS_BAD_CFLAGS = $(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE
+GST1_PLUGINS_BAD_CFLAGS = $(TARGET_CFLAGS) -D_GNU_SOURCE
 GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
@@ -26,9 +26,9 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 	-Dwinks=disabled \
 	-Dandroidmedia=disabled \
 	-Dapplemedia=disabled \
-	-Dgobject-cast-checks=disabled \
-	-Dglib-asserts=disabled \
-	-Dglib-checks=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Dextra-checks=disabled \
 	-Ddoc=disabled
 
@@ -87,7 +87,21 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Disac=disabled \
 	-Diqa=disabled \
 	-Dopencv=disabled \
-	-Ddirectfb=disabled
+	-Ddirectfb=disabled \
+	-Dcuda-nvmm=disabled \
+	-Dhip=disabled \
+	-Dlcevcdecoder=disabled \
+	-Dlcevcencoder=disabled \
+	-Dmpeghdec=disabled \
+	-Dnvcomp=disabled \
+	-Dnvdswrapper=disabled \
+	-Dsvtjpegxs=disabled \
+	-Dtflite=disabled \
+	-Dtflite-edgetpu=disabled \
+	-Dtflite-vsi=disabled \
+	-Dvmaf=disabled \
+	-Dwebview2=disabled \
+	-Dwpe2=disabled
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
@@ -476,6 +490,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dswitchbin=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TENSORDECODERS),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dtensordecoders=enabled
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dtensordecoders=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dtimecode=enabled
 else
@@ -512,12 +532,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dvmnc=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M),y)
-GST1_PLUGINS_BAD_CONF_OPTS += -Dy4m=enabled
-else
-GST1_PLUGINS_BAD_CONF_OPTS += -Dy4m=disabled
-endif
-
 # Plugins with dependencies
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AES),y)

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
