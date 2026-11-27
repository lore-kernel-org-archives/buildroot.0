Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9363606A335
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dI02HDps;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ti1OBPIH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8C2D81246;
	Fri, 27 Nov 2026 15:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owsEvw1SIdoJ; Fri, 27 Nov 2026 15:16:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D400E8127C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792562;
	b=AiOIS0iSFTl8obNva5mBf2Zz7tlPIwCDl+skCibuuKe03+covoTSPqMonP3zrPCsLyta
	 gcVlSmfbeZaA5fMjiLPacTrCK8mfGx97Jxci2R0C9PSp2bduiWH2ThPcc0w8qrLLQqdMY
	 /EIroL7Uwo7EkR0/mg8HjWPJSc/II5lfyOqSHgunA1c8+sYxW0LiXp9x8pJXmlKhcTr5K
	 Aq2g2yc5un5MyUODEo8IZCDClumPsLJGRWtV27IZ+yc0k2YCDCXjP3bHyZCKGuZs4ud0m
	 q28C24MWErZ4CQAmRcgWl+OqxHejzHpoONWr6+7Em8PsclrJonSiar2NZccdkJ51BlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792562;
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
	bh=MGi6sb69zj3no4KoYvTAQ0NkZnZIrVT1TcFMsZG4qOs=;
	b=LPSCEwPlC7AB8ASmSQ14XLBSy9p8foPpJU5tvMffJCcfXU9GFIZv8ID/UEspldIz4z8B
	 aTMbeTYvIYjYQcZgh7HAHTeJxEax/sU/pX3++nXbpgnmKQgv5zflw2dXTzpmEWtBzsYvV
	 hTdXCgxe6lOMQ9iyhWUEq0ujQe2uuuDuVrRvxPjxru4LbyiMno8xyaZBoLxETGdvyqAyZ
	 HR4Ri9rIl7gfUhfU9YyG4Mt+ndhpz1LGu8xioRBAduLz2v8DQ00h//7e1SwUSIQRhcuZh
	 s68m5HjH92pWlrQOklQ9LCdcxBKAvYZ00y4/zB/YILoLhTWKg+yZNR8qgU/MdUWUmgQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ti1OBPIH;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792561;
	bh=MGi6sb69zj3no4KoYvTAQ0NkZnZIrVT1TcFMsZG4qOs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dI02HDpsVK9/6/sd0wQDLswN/Q15KqpgKCNRrFkWAq7Cv/HDaOJrC8A0aDB028CuB
	 dEgRbbHMP/+SMMFoGQ/2rZ7Iq0BYceUNfo4GHh/LngX7ezCWsL1queqJM/Cx8cTACC
	 bbskXLCU8d0aRpDHCR8vfVUO8DAMelvjDn5s0DeMXtK8z9bUEHl4BQA8a2zfIOjRqZ
	 eP/04QKh1pcslgcaIABWqF4c2qH+XJrDrEyrPCDJEXWgNZC8u8vbgfUHanOYoP+6N/
	 adJnNz6b0Do4NjhE6AbXimNUrnTGslnbZLmLrsRFlQFClgFNuZt9KDN5OBY1c0NzsE
	 WfveusNVc+EWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D400E8127C;
	Fri, 27 Nov 2026 15:16:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71AC42BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 569BD81232
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1TxAwcB5Lu7 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:15:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 68C11811CA
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=ti1OBPIH
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68C11811CA
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJPzNM1GEOE3lWt6KibcWU0kspb2Hkt8kWEGK4oav8c=;
 b=ti1OBPIHfY38hdk+oyUveJ3FQpFfom9fPCDhooNwR6jn2hNeeEsVTc8y7bsxMjjM+hFDw1P0+OGMjJrLRmuBhuXtVBl5zPRyUb7sKYasm+9koSYqbmUOzxPjR403MPa/TtO3p8M9TTEA16IM2xXhWyx/g2qa6sUDKc/SnohFv8LEcsdOms2WFnXm8zemUHW3mya9B2c4n1Lra3j7JUiLZfDDN4oJ/BDkA27YqGw+pkXUvYn7RBZtZ1iqiYmpNX80YgQ3D4cl1QT6ee2LMReQ6Tw/Wo6B1fAq6JyLQz1Ay4paHQNVsXIsKd5MLs4UVwPDIrp34OOZCLoNgpy17bbyMQ==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:15:51 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:15:51 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:05 +0800
Message-ID: <MEUP300MB004588321AC1F4B2635C28A2B5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=tfx2001@outlook.com;
 h=from:subject; bh=XDdKUBJTQGK/GTosLcN0QAShYaDnUyxH9sPVK5qh2RM=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ47d3cwQWM7GfG/aROQHAVMyQZGYY1LhqwY/
 xrQ1fdI0hiJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmeOwAKCRAcD62l0/wL
 2reGD/9wElg1RztnHealg/vvYMoQ4CxvpfVjaVKFd3uvtlbRedx9DqOGCBWYyDZ0IMt4eKxzOg0
 fhPfeGz0v/Nr/bDdZtxMisuy4OwoFBFq6eWyBp0QHcp63lqO2TfNnXnrsaD1fno3+5HdmhJ/Gq+
 acZk4Npjp30JwkXxd6vNyxArNNeQ55z6RQjHCLNGMILUXWYRZImr9IBN7m+epDnO9nLP1eKmTeA
 hVKUGsIO9H0zZz159onKPciPDolhcq/I0AmQeRMMhahnC9Nv6I1qfPfV5EwAdwfP5m66Ltg9H7i
 JUngKo+VJuJiug2rhapcNkj0AUddeOkzrFB8YXz8xeka6HYfizmTlndpvMo8MNcR6kBCAVH1o/C
 mb9ZMQENw7xsrHSTDuiWOE3CggqfiTBz4Uxmt6oWcIMHh3hXDtrLfR2o25wzOiitXZEmsXQDGwf
 xyb/BimD9hN9JVtBLjXTXtpmHfbmoYlprfgyk6RZeos0QsVAWasIVB3Sm6UTO4dtp4I6wyUP3Ur
 iuHaS2iASj8nQMAia79FqrYFTbYKkoMX/KF1PWzrA2pfzfAfmnHVmBYZoQ4EaQGyEpalp/D9fc9
 cHkN7dknisNjXjClLLttNWq7WoNxmvDap1bihWCD3bXTGciM5AqRX4QRWEvHx6C4iHSLXwwq01Y
 xWXbaR+I/5KkuMQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-19-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: f04d7c81-fe1b-403d-def9-08df4c9952b1
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|8060799015|19110799012|25010399006|260925184616899003|51005399006|6090799003|15080799012|23021999003|41001999006|5072599009|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWhOQm5wdkl2Z0hRKzBmTjVEK2NEd2lYa1Vvd05CSUtGcFJQYTN4UUhKRmRM?=
 =?utf-8?B?Q3lrNTRYb2szV2ZxT2N1UjJJSk1QbC80YzY4VXBoOUxLcXd3OUx5NXg4ZjhG?=
 =?utf-8?B?cVI4Rk5qcDNlUytYaC9lRldJT3B3enVKTWMwTG9NSXRLRUI5Z0RlN1F0Wmpo?=
 =?utf-8?B?V0FnR2gxY3YyTFQwVzZWQkdDNU94Ym5xb0NqUWlscGJoZXhGTnRVbndHeEpF?=
 =?utf-8?B?Qzh3L2w5WExPcXFjSDlRYTF2d20yZHByNER0blpyMWN0T3J1ZC81eFJoM01j?=
 =?utf-8?B?R3QrNFNBZTFiSVBkek9RRVNuTXlIbi91c3QwNTRaQ1dOUktuTjcvSHgzUmcr?=
 =?utf-8?B?QUtDcHVGS1c2ME85Y0lPMDNDdUdoSUVGUkZvZEFUNmp6OWdnUnNydHFFM0dy?=
 =?utf-8?B?MHI1UDdzNGRVdEpIZE9jRUpSWlluWm45MkF4OHBta0NDdnRMUzBmcGxIMmZy?=
 =?utf-8?B?akNyNXlHa1RPbDdDd0Vyb0tlc0JIOWlWamZ3V0ZoUmxWK0JWOURsclZZVS9C?=
 =?utf-8?B?ZTc5dllYeGVXOWc4L3FFdURib1g2bnZ1NTJFcnBpeE81UE9idnczbmVzSDBF?=
 =?utf-8?B?UE1xZ0o4MlVpOFBKN3NtVmg4T2dHcDZScTAvc3Z6eit5MldlZ1d4bDlNN3M1?=
 =?utf-8?B?a1lCTjh1T3ZJTXlPUk1NbElxVmNKZ3BOV2RyUFZ1QzlnS2I5YmVTa2JpbDRQ?=
 =?utf-8?B?cG5YZFI5VkVhTm9kdFdyT2dsTE5Mdlo1M1BCVzZNeVh5VkYvaGdKQzdvdCt3?=
 =?utf-8?B?RHVvZS9wdUNhV0NXTmFnTHRTU3oyRW1zSW4vTFJ6NVdXcUVhTFQ2aXJhakJ6?=
 =?utf-8?B?QkJaa3kraVVsSmN6eFdBejJkKzBJWW02TVZUek5vQ0RKRU9Ud3dOd1p0dDlD?=
 =?utf-8?B?RksvQ2hWL2t0UWI3OHlDREVySzRmL0RNSEVmc3ZINTQ3SVhvOVhEY0c5dEh3?=
 =?utf-8?B?RVlEcFY4djhkTnh1ckFpQ245aUpsNE5aTVRyQmpYNnVEUmlpM0tleWozT3ZK?=
 =?utf-8?B?UjVkSmlxOXNsR0FmejlPSERCN1haSFFldCs5YjVyRSs2Z1RTZWZiQ0Z6WkNs?=
 =?utf-8?B?dUpUS0pmczd6TStqWGdLRlJZanlVS0ZJTFlkcmhVL3U2dVd2YmlKZVZpRnVK?=
 =?utf-8?B?aXVDSWVOQTdaZEcwWVM3a1M4Mi9ZVzhFTm9SbHN4K08rVCtNSHhWeXRuYkxE?=
 =?utf-8?B?TmJnVVRiemtiSUJId0pEemU0V25Ec0MyRndhTDVZTHJlMVJBMldwWDdjZlJ1?=
 =?utf-8?B?bzhPQXlxdmV4d1pvRTJBa1o1UmlyT1d5dDhLd0JXN3VsT2NpaE5oVVp4UHVt?=
 =?utf-8?B?K09mT3ZpQisxUDlHVzJpbWd2SEk0aXNBU2paT3JMRWRZRjhGbnRpNFAyUHNW?=
 =?utf-8?B?cEpxcnQ5Wnh4cmtFcENwcm1WRC9KdGlGQ0FmbG1sR3N2TXFacmdpU2VOeWJk?=
 =?utf-8?Q?TtsOU7x+?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG1ETjN1MTB3VTBHS0J4YTdybGlGeU95dmNzSStaUDR5dldHVEZKem1BUGRK?=
 =?utf-8?B?bkxtaVlXQWY3YkRMMmlrdkV5eGdudUQzZE1WYUVTSXdDUUZueTZpRVhJcXJu?=
 =?utf-8?B?Z2RLT2djbElsNFlSTGZNL1QreUthQzFqWEFIcmlEU3c1eEZZcndua1ZvZTNG?=
 =?utf-8?B?ekRqK0w3aXNjcnFYa0pSKy9NVGFjQ3hVWmtWTUd3SVovRU9Za0VKMC9Pb3NF?=
 =?utf-8?B?ZDVQZ0Nwa3Qrbnh1Tzl2ZGFmcFFXWjAvbXJDSldYeFVCbVZrYkpITENBeTYz?=
 =?utf-8?B?VWNpQnJSZE5sVVRVNVYyQlMxL2ZzWGptM1poWXVDZEdza2JGbklvQTFSU2g1?=
 =?utf-8?B?ZnUzMDRDRzJXREViTlc1Vk1EekpVWnczR2xydmZWTm9OT3VROURUL295YmE4?=
 =?utf-8?B?V2FONFZTN1FVL0hrTjNxMHphcVN2TkhvWGVkSytPUkVJNFlxUnhvSk1BMnZY?=
 =?utf-8?B?aXpYUFFjaCs2Y3h0bXZDUjJ0cHl1ZHpGTUd5S3F2dFUreHdnZ0lVVEx1bUM5?=
 =?utf-8?B?RDc4Qmh2NWc0Um1RK1RVVm5uaXEvbW1mY1hwelF0ZzFEWHRDbmFWM1N0THZp?=
 =?utf-8?B?UVNxTVc0bVloOUNGQmVNOTJxTVQvT2pUam5jclRLKzNYdWtpZUpxWHlKcEhz?=
 =?utf-8?B?S0o3aVF2OWRNVDd5d2RkdlNwdlF1anpEWG1XTTFuNkx5b0c0L09hZWhHeWhS?=
 =?utf-8?B?OUZRU3VYRlB0UjUreUw5R2NsNGRIYkpWNHBIWXlPUFlHUFlUQ0k5d1NyeGJw?=
 =?utf-8?B?d25UNkZuWHVIVHQwL3BhdTRwbDA3MFd3MEdWZENNdEVEamNtektiRWtYZ3ZC?=
 =?utf-8?B?NXYzNk9DR3g3QXVmOHZZMjdtQVN1Ti91d21HYllZU2gwWEh3bUxWbm5tcDhP?=
 =?utf-8?B?VjBia0JMMXk2T1NQQVFFVHN1UG5mQTJCVldTNUlaenY2eUg3MS82VXpkZVVw?=
 =?utf-8?B?KzJxR1BiVUxYeTN6TE85TVZZQjJIV3pVdXI3cmQ4NUVXRmN5NFhYMDlyL3Jw?=
 =?utf-8?B?SGF3SnFDMnZGTS9PUW5haDB4UVhEMHJBelFvbjVXUmhaZlFEMjBHVWRCQ05D?=
 =?utf-8?B?aVc0bUlmZG9mYVN5c0xoU0gwcFcrelc5Q09LTW9ZZnYzOVdraE9oVS9zMU0r?=
 =?utf-8?B?YUVuUm5rM3dzS09wTERXK0pXTVRWTEJuZlVDRXpNN0hNbk12bVZVeFpreGU2?=
 =?utf-8?B?bEoxbThqS3JQRDdLOU5pczhpM0M1U0prK1REQzcwMTJxVlRWRTlrYnp3L3pQ?=
 =?utf-8?B?UkdHTXdpemQ5SG5JODJqZXVIN1hQamRqalhUcjl2bldnYkdZYmx1eDlnSDY3?=
 =?utf-8?B?QVN1QWtmSnkxNmoxaWVYT0o3TmFjQ2FYTkI2aldOcWFmZ1BQZ3RlRDhzMnJO?=
 =?utf-8?B?M3dhVVdEK09EMGN3QWN5MExwbHZwNEI4VldyRVlvNG42ZHpXWkFCeEw4VGpN?=
 =?utf-8?B?NXpzKzVSRkpmdHpHeDFHZHc5dVB5aGc2Y2VldEtkclJ5US84YXVHWTAwTS85?=
 =?utf-8?B?L0c1Q04rMisvaUdVS3BBaWhiVXZLT1NadTFJa0ZWK3pnSEdTb0ZVM2plQld6?=
 =?utf-8?B?K0RFN1Z4MUkzN2h1bmlvYk1RbHlRRDM4QnNOeGM1RHpUTmdUcU5USWhkaDky?=
 =?utf-8?B?amZpSWd2TEUwTW9VazRBTHpVNWxTUjZLUGU1L3oxVXVoQ2hpczZZSERLOUZa?=
 =?utf-8?B?Ymx1VWdMNEF2QXBuTEdQWXRwcFFwREllcmJhR0xjcHlkblhuM1ZRZ2Y1N0Q1?=
 =?utf-8?B?ZGlyajdudlN4Qlk4a28rUDRJM0RrUkVLQVNHL3BGcmtoOWh2dk5Gbkx1bTNj?=
 =?utf-8?B?RElNQXNNTkpubE84YmZmbFFmRDlJTWNqcHZ5K2d2aFZ5WjJzWVROaVNPWHI5?=
 =?utf-8?Q?9KFNgFrwVWphB?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04d7c81-fe1b-403d-def9-08df4c9952b1
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:15:51.3884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 03/14] package/gstreamer1/gst1-rtsp-server:
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
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
