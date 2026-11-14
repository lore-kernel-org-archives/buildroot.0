Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B5E606A329
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aJlZ4w+H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=twpPyb5l
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76B7F40E59;
	Sat, 14 Nov 2026 10:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8stLbLh7o5X; Sat, 14 Nov 2026 10:42:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 756C840E00
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652974;
	b=ZD+f/KjeuPTmWPsJ5xlaOgoBbbasOQdFHfcb31KwjNxXtYn64Rwfs0Za9yWgIWB+WjiG
	 GChzRkYavPpLlqip0zRJQ0hkX4kGMhnaV2QynxKdjG8xnf0bID9ulzly7qE/V3BDygj06
	 hFepQMUg4A20Y7dvx5pizxn7N7hQmWaKZAm5H/Nm1+by5CLznrHOWMY8oY63livWqS6xE
	 ARTlkMivFe8mm1A7EpY0kB565MgrsQYrqvtMCygaLC+vbAs98E5CMNLB7H7Rw/0mL1NsH
	 ZPPuLfByTnc3+X3lWR3l82OJA4bxi8tphmcZemhw6qWyEoZThyl/Ur4RgGDoC+xtjWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652974;
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
	bh=g8NwOCJuQb9py5n3GEXVBoFGR7R1eIGdDx/RxRj/CBg=;
	b=Pb4CzZsZh0t5wGg6iWIAaP3HEUveoSp4Zt0ZVnj4nV4Sh+AbNKHpJmu/HBdJTryEVt6h
	 ZeubSXIc0fmr/tHitk9+JLC8DKgjO4diS6vrKzHGL1Hui9o+NBDBIxRJ6GSb4HQV/XJlc
	 SDr+a7+OEn822cLZkXz8yQhJeYqt7WYV9dcxy1Wj3zJiShajKVIQcz3+AbJTkXw/ghu35
	 vRRtvsXTox7diOvK78mWanBI6rU012Wvj7oFoq3KQqtymHv4H2nCo3bEO6CrH7RvcLhc0
	 bCnS1luZyG1gzhWwLVzj7oMyXU4a5+hmBhjIXqaENii1HkdEQORQ0nWwvFFgcHfXaYg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652974;
	bh=g8NwOCJuQb9py5n3GEXVBoFGR7R1eIGdDx/RxRj/CBg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJlZ4w+H5tHzEGv71qLLYTM8jGkJabSQzwZUwIf57QsIudxzowQx/ef2aI+N8J+aK
	 Vp9m3da9oqHUYoMn+xravttyLsTQb0odxDs4+ITYRxPJvQNWppWeEatzRQfBdPc43E
	 sx/NZkyeBRimJlqRf9q+wZ0KkaEwInq3Kk1XfOtJ52esd2bG4n6OtpRqMc0SCf2o1y
	 qyb/4D3IWN9ezHi9fnzsnszPnGmxxKH0gDwgwIbEoNAY9rEyvDGfEdYl8SvthMt8Bb
	 JMfAkusWZ8E84t1kURn4XZ+iV5L54zF2S7P12EOF9RrX6aWd3E2NNgftw9JOxPlwu/
	 ZKctNcKLQWfiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 756C840E00;
	Sat, 14 Nov 2026 10:42:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E842970B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D94DE81A2B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e76d6mZsWBX6 for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B2EC781D35
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
 header.s=selector1 header.b=twpPyb5l
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2EC781D35
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkIRd4yhO+9tzo4Tez14EeRRiBOUMCFlsZEstmg8TCQ=;
 b=twpPyb5ll/F9DJKmiXFQTW6vbPQJGP72XZsWzTDRAP235I6sGLehaEwtslo86XgH2dK85prWbc27GpPjkI/rimVn3+BiBXUpP8jhtTvkiHXylDB5Oj+/I7GxbYyG+mNBHy9GyD4SBAc+I0ohK8f9a3c/kTH6g82K9rw0W06lI0I444rPW6raDpMKSvqFSCKVt3PQUAGaxDdEeyIDgtejRW+ZeQbFCfz4g1peQ3nGxVRc121aR7fNe4X56BptfUgwfO62WN/QB+UkxKrpb80tRbrt/HPwEVX24chrC/02ECKZJywtcLmb3ziMzkjwmHEMuDs2UIBvXK2/tZDU5hlz8Q==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:46 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:46 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:28 +0800
Message-ID: <SY8P300MB0041A3D2B872330BA2DBB9E8B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844; i=tfx2001@outlook.com;
 h=from:subject; bh=i5ydUfTGnD6TSKKaChGkolv1NGtrs1uhkVHl3DTry+c=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+Dpc7n/Etx4GOYiYl+epOn+0OZrfh4v+LROOt
 5sr5eGur3uJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6XAAKCRAcD62l0/wL
 2uDBD/0W9sGTPKFk1Axj0VYyMrsOPSuuLV4uahZWN1o+Ou82XDjnSyb/SmWkpB0cr3mNSw1Wwis
 Gc5nxuAvI8973B3yupr3J/kVZfD9QHkgGwH43pZW/lx2scGQv7Gh1ogVWE+NqUSHQU5eRsf3Lte
 RiOKe0sd1IYprEAxcgZo+gOU/u8D8rcg9OtsGGd3HKj3a13/FPM5dSW56IqEl1unSCeTOEqTQHm
 Mk0zyXPCP32Wk+eL+fFhh8RCLYxfKsWmJef98EPp+lS8PEeEeT6EGhJ/wN5vHB2748axPEelqjF
 AUdehfC8uKAh9mqYJqdpGYLHZI+sUniLK5sxEkwoTIW1muMgk7bDOngdrOout1SN4hmHLM8XwZ5
 IK6LpI/c0nLPIVAJ6kFc/zJKWsX8FHWrpT34HyZKQysWxg6v9yGVfVu+LLaychyEjMvwo+blGdZ
 3TPmoJtCvvcaH+IQTzF+NA9WtKt5bmV5WB/Q782XSCiqVlRP2OJc+mIdUXmeFt9Kt7Uo8YiYMI+
 XGHo0/TUxLrQbMqPla5xLMw0hDRFyX9QbrpUZ9AmczGYtSkD48lKxtfEJ2bql5P2FAoUf509rFK
 4HvxqUfWwaZwBKnqgzP35Ok6eTk/6wSZuwlbPOFjYntmUkVq5a5eIj8k+LUyOlmqQHOMXc5iyWL
 v4348Pj28+2O9dw==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-26-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fbb2e1-a825-4ea8-936a-08df423c0556
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|16051099003|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjVYRGFyazJ2aGpaMTdKNnltYlgwUkRhK2FjOUgzdXlKL2hqVFpWb2k0Um9T?=
 =?utf-8?B?LzV0R0VHWElzYXZ5ZWt0VDJyNmZzeEhnVmtoZUxwQjF1TmZ3Wi8rZ3drOTFV?=
 =?utf-8?B?emNoNDRXRG5ZdW5ZZW9HblJNT2FXYzgwMG9pbFF0SjlvOVBNeHl0VkQ5NEtL?=
 =?utf-8?B?NmtlSEVnTFM2dW5lWU9vM1puVDV3dC9Rdm5RcmtoU2owZ2ozZUJvdE1kN2Fm?=
 =?utf-8?B?YjBiVEp5R2xYcngrRzdXMGMzcExiSDNnMHU3c3VneTduWUUxME12b3NvTG5Q?=
 =?utf-8?B?RWNyUGVVRlBrVEppUXJrZUdML1QrdTlCZjh4TTJURTBPVVNoTTRSNngyb1dZ?=
 =?utf-8?B?NFVGT2FhQ2NhWXo0RlhEL2o3ckNEa0pmaGdnOWJyelFJbnlsSlNnaDNzNTdC?=
 =?utf-8?B?cDdUdFJ3KzBneU1VeTk2MWxUWldQMWdjYTZJUUFMbmFzVjhCSmdMNGhQTXMv?=
 =?utf-8?B?SHdmRmtCdjM4Z3lnTzhGeVJnRjZ0UjllKzhRU2FLVXYvdGZ3YTVXdGVINDVU?=
 =?utf-8?B?c1FyNGZFd1dMWTFVZzgxb0lUS2RFUGVaT2dIOFVwNFRPVVdPTTZzcXJmNFlN?=
 =?utf-8?B?RW13dU9aY2xaV0ZCWWZQQUFXendRdVZBQlYxa2liVjJSM1VNRCsxQnp1RWxB?=
 =?utf-8?B?dU5rbXZ0MzR3eWFqa1ZTc3ArYWJTUnhQZlNZbU5qd0NpVlZobTNURFk1SWRr?=
 =?utf-8?B?MUtsSENtRm92T0xxWGN2amFuNS9FakwxanRJSWlCdWFlbFk5cVk3MnhYZnp0?=
 =?utf-8?B?WWgyREI4a2pMbEh2TjlPK2xUQWVrT0VIVE4wcDlBVGJFemF2cm42dTE1VlJa?=
 =?utf-8?B?S3lkd3RDV1paQllVYUQ2TjJzaGlwMXBjM1JmdlpTbmx3cW9pVFluRk4xaDVz?=
 =?utf-8?B?SU1GS2pQTGFlL1l4R1RSUWp6bzBoalhzMU5hdjVaR3lCbDNZNnpmVlUrMEZn?=
 =?utf-8?B?RTl2S2pwM0FZYUZMTG1Zc1MrN1l1WGxPS2QyakRlQmdlYTAwaWJWaTlYZ3Vl?=
 =?utf-8?B?cmVlVGpNL3JMekdVYVhqb1dBQlNPekNIa25xYW5rWVFtaTZXUjdnYzdSeG5S?=
 =?utf-8?B?dHc2aGpoWEZUNkZDY3Z0bzhmSGRXNmowMkRxallscWlOcjNYQ0ZYWlEvTEox?=
 =?utf-8?B?WDJOSC9vN0pGMUljajRFWmptMEdGaTdHZUZJbmpTYVo5bkdyb0Rvd2dxWkp4?=
 =?utf-8?B?TXhUTzBOZFlvSzExdExaWjkxSUNsSnFQR3VWT1JlQ2tqd1FQbkZFT1NkdHFK?=
 =?utf-8?B?eFBHbVVzRlF5VGQxbkJwNTJLYi85aWRJenAzdDhSS1FvWjBkWXJiZ051K3BB?=
 =?utf-8?B?QXE0SWJpOGc5ZmtpbUZlSG1PdTZCaE03YkF2VitNSGpBck9ucG9FT0lDa2Rm?=
 =?utf-8?B?YVFNMGJpVDVNcERvSlF1UDhBNEZjNHhwV0pDSUlXQVhjWlVzb0JnTmJFaEpk?=
 =?utf-8?B?SXRWdmJReERvM2Jnbm11a1IrQjJDWVBjODB6em5pekt1OW9ZZ2FzLzBIblhB?=
 =?utf-8?Q?P+Pwn8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1k4L1BTRmc5K3h1MHNMVjFYd0xIaGRCQUJSRzZ4MGU5b20wZlJmb09PWVpC?=
 =?utf-8?B?YjVhbzNUL3JiM1Y5WDhTeG1MR01wNVFmOUsrRzIyWUQ1amhRR0RmYXR5MEhm?=
 =?utf-8?B?eW96RTJHVHZMZ2wrUFNuRXNSQkdCMnA0TUdRSjh0MEplcnk2NnArVmpmN2pl?=
 =?utf-8?B?amZlTEpQVCtmT1FKRjBDbnhtb1Q3TXlweGpscUpqZEFXOXRpR1ExMU9Wcm04?=
 =?utf-8?B?K3R2N3hjODdueGpBdGQxaVNUQW9xaWtlcmtoZ1JzYXN4SzhXOFYwK09hWlBN?=
 =?utf-8?B?VVdvcXlOYU5QZnFjRVJLNEJwWkg5VEtPdU1leDlacDllaTF1QVNjVjJtQTZS?=
 =?utf-8?B?aUszd052SlVMRmpZRkYrNEUzRVEySTh0dExuQmZINnpqR2l3S3A5WC9UeWNm?=
 =?utf-8?B?aWVCdE42c241bTcxaGR2N0FNZTZBaFJSeFhnZEhGUklZUUIwb0pnSER0VFBH?=
 =?utf-8?B?UDQ4ejN4MlZTL0s4R3JCejl4MkwvQ2phY2ljWllOZ0ZtOWJDdzVPTWpHNklQ?=
 =?utf-8?B?V1JRV1V6K1gzQkJoTEZSYTAyQmpxcnhCUnJINitUSU9nNzZyQ1ZZYUk4UHFa?=
 =?utf-8?B?L3ZoN1JPUFNBYlA2VHVZbEI3VFVvRVpkR0l4aE8rREhKQ3U1NDBjbnFaSGtt?=
 =?utf-8?B?U3RGNnh1T1BIdE85YTgzdnE3dFk1WnVidzRBM1RLUGNMMVAxdEVNMmRrQTFV?=
 =?utf-8?B?d2RIR25ZclI3SmNsSHZOL29PUnFzTlBKZnRmbnpjQW12dzBiM0ZyMjFZRkI2?=
 =?utf-8?B?NG0zenh6SlVnWGJ0b0g1cXlla2taNWhvS2p0dEcrS2tzK25ndU05emQzSUZ5?=
 =?utf-8?B?QXhseWppWk1GazEvbDhvTjhoRUZ4cmo2djdDWmNwQ3ZRNk1SQjE1bGwwWGhq?=
 =?utf-8?B?MUpkV285UWNxbTVBZzk4WERuRGdyTzFObGZHa3hzNFFEenJkMVE3MEllcjhZ?=
 =?utf-8?B?bXRpa2lkY3BBMDFQRnlNRXhuazI5NWhqNmh2KzAvUmkwLzZhbCs0VWFDMXpK?=
 =?utf-8?B?Q2FscGlueGg5V0w0SmowQ2VIUko4LzZpUytFN2JHT0tnSkFPK2VNWk1ObXFD?=
 =?utf-8?B?Y3JEMzF5eWVmbzUrbTUzeTFzZHA1WnU4SFBsVlB2K2xXSkZ4UjFKczJzOUVB?=
 =?utf-8?B?c0FtWFJLYlBTWFd4NENEU3lxalJVeHQ4Sk4ycFNnWUpTcEZSWU10Z2lzRzBm?=
 =?utf-8?B?ZXZVa2V3dUdkczZ4Z05KTUhRWDErWnpKWGUxNmNsYUFIcDFIOUdEckxNWWx5?=
 =?utf-8?B?OVJZY3ZpeThWWXpTK2dZQlkwZU8yQlI1dDFEL2EwVGZLaXltalNtWG9iMmJv?=
 =?utf-8?B?dEFETjAwdmpmOE0zb01vWmtJOTJscVlib2hla3EvWVdQcUxqbXNHOFdUY29z?=
 =?utf-8?B?dnlqMVI1T0h2dXpGd24vSWFZTU9zTlBrbjlnNkh3UTRqWDN1eXd3em0wVkpL?=
 =?utf-8?B?VFpkZk9jK2J0TUdxZi9pNkdMekUxaGxseVA5NVdsS1ROdDlhaXI2QTd4T1ZV?=
 =?utf-8?B?ODl3dmt2UGwzN3pKU0NuWjVYeVZsUyt1M3NJNjh4RWs2SDdadEtzT2FBZC83?=
 =?utf-8?B?aVBuZm1jejIwemxFT3o3UUpZek1HV1NOK09EYjE2b1BXWVEyRE1obGxjM0dT?=
 =?utf-8?B?WFdGcG1JUVR1MW5Id2V1TTJkUUxXbmtVWXRZRUo5NnNQVm81RjJpOTRZWG9P?=
 =?utf-8?B?ei96VFNlUkgrYmtxVURPQktwMk1YRXNxVmN5UmQvd0VYYyswUlV2aWdWN3dn?=
 =?utf-8?B?ZmpjV3dob1VSU1FrS3U2WGtvWHROWEpXVG1aTzdUUmtva1F3cDdOZTc3eEU5?=
 =?utf-8?B?MGErZ2xzc1VFdTM4L21iTC9tNDY1SWVpbUVCSHkrekZsV3dtQlB4aGhHVHVy?=
 =?utf-8?Q?pgNKNvdnUDT5w?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fbb2e1-a825-4ea8-936a-08df423c0556
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:46.7982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 10/14] package/gstreamer1/gst1-rtsp-server: bump
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

Replace the deprecated Meson options with glib_debug, glib_assert and
glib_checks [1].

Remove the duplicated examples and tests options.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/84b3a0950debc467ce25aebdddd0d827e658252e

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash |  4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 12 ++++--------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 9fc7a0f9ea..4bbd63b8fe 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.13.tar.xz.sha256sum
-sha256  e8dd102a3d1026414f0048daed91078e7958012b56efea7e45fe2b3448b42d6f  gst-rtsp-server-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.28.9.tar.xz.sha256sum
+sha256  b87ed564d857a226a3135bd2c42eae7b40eb64031cb9cbce124722af92cc8b9d  gst-rtsp-server-1.28.9.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index a3143f0c55..58b7c30dc5 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.24.13
+GST1_RTSP_SERVER_VERSION = 1.28.9
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = https://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
@@ -23,15 +23,11 @@ GST1_RTSP_SERVER_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 GST1_RTSP_SERVER_CONF_OPTS = \
 	-Dexamples=disabled \
 	-Dtests=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Ddoc=disabled
 
-GST1_RTSP_SERVER_CONF_OPTS += \
-	-Dexamples=disabled \
-	-Dtests=disabled \
-	-Dgobject-cast-checks=disabled \
-	-Dglib-asserts=disabled \
-	-Dglib-checks=disabled
-
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GST1_RTSP_SERVER_CONF_OPTS += -Dintrospection=enabled
 GST1_RTSP_SERVER_DEPENDENCIES += gobject-introspection

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
