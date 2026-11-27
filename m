Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF2606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o5BrIO7H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=KX6vh1BX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1FF8812B2;
	Fri, 27 Nov 2026 15:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5R584RWgE32; Fri, 27 Nov 2026 15:16:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8FB2B812A0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792575;
	b=MofpA+B2J+6jLj1zYuo6nHJ2BBebjtykN/8+VAD4KIm8Vi32lUXluAyBaz0d0XfCTnrt
	 PJC/+m/zRUdZCzZmVy+SsjCkQS+zg99xd2Qvzf09HSr/JulySedn3cRi47k38cUqHbxjT
	 oiLBiSrCFq2lz+k5Sdg1Ip5KN4dWPzLzRFPM+5sqgUui/tIWZJXVJfeBCZxZMFdLTZR+W
	 viaPXdJtnrlPiLX+GPKyf+ndn95HmD+ybeHLd9lXAM+/do8V+zYTtWwfkSHKm2mA+zx1b
	 tJWXJXTCoFyVCw/HSHOg0fy8puNfU+3/u+40CKCn7/0tY5PFYfoZydNuzk7opSxIAyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792575;
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
	bh=4pnKcLqrK812SVLKRtVWxelCP+YUupVM4Utby+dxe1M=;
	b=H2RUatXrdDmO2owX1JOFC2fb3NuOAzidASLX3XxH8uh2DMjuuggukoESk+rlwIdkXvPr
	 mbJ5vLIh0us0qWZRZViKYyOlmDlDfP8/OGSO5cgAgA9KM726L5zocVWPkhoK/SFe31jLg
	 75laKJZfUnKIBqE0L5l4+am9mhX9mKPUwsFJRdAfOjXN+hwViFuneOLq0UWLjgVUnJNvI
	 LwNsBg1XHoFxMp17tg3rF3aLidvFCgdxn9wsvr9kt+TWyKZqvrpxPAqLzIJspxs3U8PNf
	 hckuW0N2PG5jxGb1tKrd6+AXQ6tBg66zWHDrCpfn/Lls20WY/1lNSaFyKCusDt7Xvhg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792575;
	bh=4pnKcLqrK812SVLKRtVWxelCP+YUupVM4Utby+dxe1M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o5BrIO7HbcnMwYTqVayHVkbEl08EZ3RN0qrSCl18X2K4Tgy/ZdczwBOiyVzanVwqX
	 qy933hCHYB4EOqxkF5O+FgIaz06irkdAt/Gq5yBiwOxqYbj6ruQxGlWi+FVImgei/P
	 6r2xchhFFcNHOgdLps0G5HzmKEEif4sn5ziyhZg8J5o3GPjNjk68yLt0NQiEH+HMOC
	 n2QdTY+LUxEtELzsKjyam1TfRUvqjSsgsmqthKLR8/KOKUcUuTAzxNsc3gQjiULMi1
	 oT37agqZqiqv1uVLMnMnqTkky1lEdVO6M+U7ZhuLNlZUQPW0TPm9cWDYxidH+CoDHK
	 JSXQ6RLqtEFwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB2B812A0;
	Fri, 27 Nov 2026 15:16:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA9EE2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF1B1409A0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMe0DXAS4CYw for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:16:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8B1E540925
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=KX6vh1BX
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B1E540925
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pldGBrwVPaZwi3+lmseCXtktcj/5WOD2PPC9aP98qv0=;
 b=KX6vh1BXirliHPM6rsO1RARRn7sfUEoVY3gRzZDwAbzUgIOsr+q1FBxvxmGxqEHYZ8M8sC6FEwrSjoJbCjD8wmsjrYqXm5O4B2qbNX/5p6PViwUPQ+pfFq1d+C09wiPT4FDXUH3jcKoDIaM7VFLJ8FnkXJTP1mpQ+OTC4aG6hNPhzG113CpDF1ChUy7I37qZCk60TB3gWyuGEcBdObQAG6wNdy7VVP4nPt6+qMeZNtrYWSUDvq3T7u0LkYjtP1Oi57oHgLxeRGv9DeN2NxTVugq2WYjK08HwlQezY4X/KHVyQWQdvh7+8fKFQxbhUuvInTBn/0GB1qXKpqSJE+EOuA==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:16:05 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:16:05 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:10 +0800
Message-ID: <MEUP300MB004562B5F8CFB95DC1A107E3B5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2316; i=tfx2001@outlook.com;
 h=from:subject; bh=Zq12L5yFZMU5HX4kuzwwBgjhA1P05HvleewPoipxY4Y=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ4/xqJW8/i5dY8bEmGJXfnYU8pZ0abE3TBf5
 uUN1rSY2oiJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmePwAKCRAcD62l0/wL
 2vMgEAC1jyuFUbSPXHlSy7f4mdcpp/alnCUone5nI+kJCJ1+TXFu5xrOyi4iP/TXIoJPGIdXHuQ
 n0yyia9brn8HEFCsDxgepzjziqpFnyWbVaaVavnGwGYeQCvfmzPxfS0r9RFLv9tMn9LISukWsXo
 38n751cljfCAkWoyacrXth+NVwMS708wULoIVhVFhO0v8JiXD7lcHpKSXPSItFVwzohMCoAi+41
 P5irf9UD1ih2mhRz46dZz7mUpxoDLxVJI8GsGE/VYBmNutmF8s2zM0POBTM3JY7lkKubAUPnYXx
 n2V3w65Nse/sigFw8A+3nBWS3n/q3/yHRpe9JCSuocFh2kEPoJGgyaKfuLTSuF5/rEbyee2RfKG
 9GBmftVAg7B05Ox7CxNaG+dMSyJzebyXoxl40+3hGhDHCNflTWWzvmq/J8WyuZebr+4pxQF8u2o
 mbYlUv+HjyeMc/Y295wrNHMpZk2fKfmY0X5qbkR5o51/At5EgwBOQqXKbIv6QjMjTH+8xMaIVw2
 5JGi9sgJU146HjhFC8i+a3XJV7TZ5EDKq1Cuadn7bCTCclnJMKwQ5SihkxHW0etE8oNapjLef6m
 RcdAZwUvwi18Du8elDnSDCSbLcnMtUPIvhTIyfLtRFhxp0TpPxGkajyaj2yrKWMlnUjjIMYebEy
 ug467MENr5r7SkQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-24-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: a6632d41-4380-46d8-88ba-08df4c995b0e
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|16051099003|8060799015|19110799012|25010399006|260925184616899003|51005399006|6090799003|15080799012|23021999003|41001999006|5072599009|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFVtM3Y1aEdOSmdpejJlVVFTMldOVTdNbXdSSmZuTjAzZmRzaGhBeStiY3JS?=
 =?utf-8?B?NExQWkZEUXVXdXJXOVdYNkN1QjBQRFdkSk1kZ1lIRDlMTW5pemlTTFBTZVor?=
 =?utf-8?B?QWJyUDIxaVNUQW1GVkdPRDJzL01Zd2hTT0wzOVVJQ1A2NERMOHZZbUV6bnEx?=
 =?utf-8?B?L1FnMkVIcUJMRUdhSlhibFVPbUxpV0ROQ3BIK2lOTXZzaDJRNHBvK1RNdHk1?=
 =?utf-8?B?SUNKdGJEYXUyNjFFV0o3TUlqbk81SjRQUE84dEplQ0NpbmwySjI0VnZrNW9x?=
 =?utf-8?B?dllkSWJ5T1l2TjFLVy9LMFJvb3NkV1NGaVN4NG5KakdVdm9KaGR2TjFhNWdp?=
 =?utf-8?B?amtGNEQ1TVo5ZUM2MmdPYmRxMGZjZ1JrYjdTVFRjTHpGcDBhVEF4TjZQRWRU?=
 =?utf-8?B?c3pWbVJTcXBuK0xyTENKRVFRMVBIK2NqeWhpVkMyTVV4REZabFNML1dDb25u?=
 =?utf-8?B?STh1ZW5SbWVIc1E3eXJZeG9rcVFFQk9aZjFmbzZ2djJqWUJzNGFQU3E3bEYr?=
 =?utf-8?B?ZHRWYm5la2RhYU9HcUtBUXhTTEJwUXpEdWRNU0h0YW03VTVIYjl0alVpVEZW?=
 =?utf-8?B?QmM4anpjMmprSXcxS1E5bkJqVVRIQUhVd0lYZUdYM2owVlhtVGJlWlRacVVM?=
 =?utf-8?B?ZjlvamcyMGgyckpVTkRMVWxONGFGejMyUzJrOVAzbzZxNFRrVVlqK0cvOXBa?=
 =?utf-8?B?UHpjYXNrektGVm40T2tOS2pFYkZmR1U1TlVmM1ViVW1POUhhakFSRVF2M2Vs?=
 =?utf-8?B?NHJ0UnI2T0FPWnRQQmJJODYxUTJ5SzUvM3JrWG00M2gyTTFPNGxwbW9oNFBh?=
 =?utf-8?B?ME96dFh3VHRpOXFrU0pmeWMybHlvVDlXR0lDNklqSk9zcGRTUllPNTg0RGZJ?=
 =?utf-8?B?bHVHRUdDMUt6WlVBdFNnVkpCUm4raDFGUWd4eVowZ0d2T0lLVWxBOEIwcTdn?=
 =?utf-8?B?SUNIL0VYZjdnTUZUM25xMnNSL1BTSVZwSUdqQmJHWkFFODk3UUlMemwxWTZv?=
 =?utf-8?B?OHRjT2Jqc1pVNWRzTVEwdUc4T3d6N2lDTzIwS29zUUNKSW10NnVkR0xlcGxO?=
 =?utf-8?B?UFRjNldKdnMyUG80bjVqVzdYckhHQjZCVUlvTkY3RTI4ZjJSN2FYK0sxMEFp?=
 =?utf-8?B?cG0rNTVlNEc0eDlFOTY2NHRDd1Rua2VJM1FHRlgzOEJ2RzlqL0NwNEpVOVp4?=
 =?utf-8?B?YmNFTnNlZHdxSHBxbTFqUGF1OVJ0OVN1SUxaMDI0TUFqSkFIeVdhbVd3WmJ6?=
 =?utf-8?B?QXY3N3BCSmNORE1lYkdFVU94dUZIcjF1Rkpuc3BEbTlGU0gxZzZELzd0TXdl?=
 =?utf-8?B?R3lPc3RyREs1ZG9RTUR5ZjZQT0czbTY0VHhtaXV1K0poNjR0TWU2eEFFOEZx?=
 =?utf-8?B?YmF2VVFnSzIvRVM1MWxaMnhXT0JGSURZU05lbUJxekc4OTVTT0VicERMSmNh?=
 =?utf-8?B?dXJWVnhCNmQxOWxVcVltdTFWMks5dEV5TEI0dElBPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUFVL0Mzd2NBbnBvdFltNTcvMm5LUnMwb3BFWWpxSkVPdGNaTVNXcWdMcTVB?=
 =?utf-8?B?eEhjU3h5SU1JYmNzY3ZndmFPRThFSmNaVjZiNVc1b01lN3hvSld3T0xKQ0VR?=
 =?utf-8?B?MHBZWUMwT3hnc1dobElhUmlPb2l3cEt5REt1NTBOalpSQVBjM2YvbC9GWWVn?=
 =?utf-8?B?YkVDc2hzNkxsRzZLRXVmN0lyUFd2L0I4WW84dGk3MmZ6elJKVWxJK01FMUdm?=
 =?utf-8?B?d01nUXkrdk0ySCtob2JlUDV0U2dITUhnOWZxcWZUbU9hWVRMaGx0K1dKWUZJ?=
 =?utf-8?B?ZGNkTThpeWcwOXBDc1lWMHY0N0JrUmFvbUxxdTNiN0t5UkRNL1R4WERJdVVK?=
 =?utf-8?B?ZW8zQ0ZoSzZuaktoWS9aaFlLRWpTbmdUSVQvOUN5bis1eFl2S0I4a0RVUHN1?=
 =?utf-8?B?UUpwUWJnWWltOW11bUZGNG1CMG9NQUgwQkwxdGFxKzFOMXBFN0ZIdm5ZaDMr?=
 =?utf-8?B?ZW9mYzJCU25rUFhwSUJpbUJRWkZwZmNQc2N3RHNvNkFJK0N4NzRvMTF1ZVBI?=
 =?utf-8?B?MjJ4dnMxMTh1eXgvTUNyNUMwN001SHhkN2Q2V0FNdjNnTXRiWEk4Zkl1TS8x?=
 =?utf-8?B?dFUxL25OOElxSWZ6bG9RemhaSGlFUnlUdDlRSVBUSTNlSDNnWThvRE5BejRL?=
 =?utf-8?B?Ry9xWFVMNXdyNXgrTmF2SG52aFlqMDBvOWpocHBCYjloQ3pLZlA2WmY0WnQ2?=
 =?utf-8?B?OVJaTTBmTUw4WDZlc3RJQXorUTJURXJqWmNwRHkxdk1lcVlNUTY2eGpVMnVT?=
 =?utf-8?B?OVRFNWIxdzBxN3RYMmFlVThGN3dJSEw2VXg0eEpRaGtvU3FvRGo0SUhPdEtX?=
 =?utf-8?B?US9yR296QzBBU1RZVGVrS2x5RCtoUlFRWXdVQ2NadzJLU3MvcGdjV0x6emgx?=
 =?utf-8?B?eUJnV3QwZ0xXalpzVkJ1c1NkVTJwQ00vbmF0L0FyVC81OTVCVFloem5UYlJX?=
 =?utf-8?B?bEM0dE9uNXk0NG52M3R5ZUk2aGJURmpvWTVQSTZaSXFLQjArMFZSVEJEL0Z1?=
 =?utf-8?B?bHhWVUtnbng4ZlpxVDNyL2dteFpuaEdqWGtPQTd2UkVicWFldmRmQ3NWdkdn?=
 =?utf-8?B?cEd4TVZOMTFyc2poaElNZ01oaVIyYTFiR2piRVUzYlp2M0t4ZFl0U1dGcE8r?=
 =?utf-8?B?ZnR4MWJjTHFETmhoRURDSUpJTmZtOTBqeDNCSVJoajBpM2tFQWNPSHBMOXVh?=
 =?utf-8?B?eVp5QmhpbUF2cUpRbVUxQTR2TmpsQWtnVVZtVmJRWWFndGlUcHlNdlVzbVZn?=
 =?utf-8?B?RkZ1VCtqRVdZcmJvaklRR3A4T3FHakl6TXdVQytKTFg2b0Iweks5OGpINDV6?=
 =?utf-8?B?bmV1dFZXSEVDbkE5bHRGd1lEQ2NuMnNpRDVYclZab3ZaVDVGTnlXU1hyQXV2?=
 =?utf-8?B?QS91ZGlsRUsvdFh2d25DRTg5Tk9BYzk2eFBaNVpZUDlSN2o5cnh6L01Yd1BM?=
 =?utf-8?B?eGdoaExwRjYvSlJkZTlldEJ3cjlaZ285ZkZKU0JoalBHK2tKNzMyQWxJd29D?=
 =?utf-8?B?ZGZwNzIwcDVRZk1oNTdlSFV1TWtzOUtuMENGYy9qZlBITzVsaG15YXJzSFdN?=
 =?utf-8?B?VllpU0tKbmxDQTVFSkF5VmhWaWZvb1BsR3F0c1FRZ1dQSzdaZTRSdlVoV1I0?=
 =?utf-8?B?UlorVjcvcVo0SFhSZFM5NEE0bkQ3WjNKS1NuY2Y4N0NTWERSVlBodmpCcWVD?=
 =?utf-8?B?cklhOUNIZTJ1QVBsZWNmLzY1ZytBeHhSNzNHU3JJQXdFSGkxSE41MTBESmNp?=
 =?utf-8?B?ZGhzcDVvUzJVci9jMFp0TlhkVFg3Umo0ekNUdVR1bnloTkdtUHhtU1dhS3lt?=
 =?utf-8?B?TFhDcUpBZjZkSEFZYTlkaVRIdnErMmcrZkNXb29xSW1ZejMyQW9SUzZvYjl4?=
 =?utf-8?Q?KJEGfJyeTk8Xk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6632d41-4380-46d8-88ba-08df4c995b0e
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:16:05.4794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 08/14] package/gstreamer1/gst1-plugins-ugly:
 bump to version 1.28.9
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

Disable glib_debug, glib_assert and glib_checks Meson options, matching
the other GStreamer packages.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 322c61790f..53a8d7b0bd 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.24.13.tar.xz.sha256sum
-sha256  dc08bb11dce0a43453466fb9034e4fe06709fb5af68475bcf6d288693b661a5d  gst-plugins-ugly-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.28.9.tar.xz.sha256sum
+sha256  550a52536962186f5488e06b5c08f31ae0f18400aee32a3385156d31cb4b1189  gst-plugins-ugly-1.28.9.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 02b6e59e3c..c0aae4ea70 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.24.13
+GST1_PLUGINS_UGLY_VERSION = 1.28.9
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -15,6 +15,9 @@ GST1_PLUGINS_UGLY_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \
 	-Dtests=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Ddoc=disabled
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \

-- 
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
