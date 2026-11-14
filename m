Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1F1606A32E
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hvhz/4qw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=MNqh1fsF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F01B381A2B;
	Sat, 14 Nov 2026 10:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjE5-zU59b-i; Sat, 14 Nov 2026 10:42:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2434C81801
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652952;
	b=c/OxjfReC0tGkESNiHw7Vrjp3qNnadbO+xZj63e854ozldOhopRj+r6Fk3SxtWCREW9g
	 3L2wjip9+pJs0y17SL5ylUuz8Q6W32gCiZGrMHD7XsgTw3WYY41k7IUCjfKwlLc3f2nmK
	 XrVgfGSj8BGmygrDvFG4rHAriAI0Cc1oWX6wRePXyp+gsWwqsaquFsg5oCA58trOyrfsY
	 NUBtwY+1L8rKCsOQMACZ79Yz6QdOPgK5xwW43umyU7lNTftbI2bwqbTnJiF01tQLz1Mww
	 lU4p+h4ANGr3fG/1cHI5csOw2fdDPnbHSMQrEyR0qq8a0hv/zcNkgUXik6ux8eNw4KA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652952;
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
	bh=xyrpVBoxayUlxyq72wiG0538MBTaCHp8lCJKJbX4oSE=;
	b=V38iYqFaVvx9mPDL9lBB+02zjMlCOPZLKqym3pDtoDFUmhBvzFwn62XYSivGIgIGoLTE
	 rwpF1cEnkhTnYn8rwvo68ZcrD6pnMoBTaiDBSpM5ycgyIRxxpr6N0dVag95y6fapwdSmi
	 UM77IAQ1KZTIFdmegkRZ5/yyTZ0e73PDb7q673TiBoIzx1ClILqlIGdeXdROxXJEipiYY
	 sIIg0UJfqKflNv8Qa2lEkMmD3f9xLh8F32H4zAU8Qpc6NZEa4kVo/49fo77XV40cDWIfY
	 fw+OV8yIGN5JOVSAedIJA6xsxc0qFzqpejhqMJDiwSr9GeozxnNIESsySv9jT0AHDRA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=MNqh1fsF;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652952;
	bh=xyrpVBoxayUlxyq72wiG0538MBTaCHp8lCJKJbX4oSE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hvhz/4qwSEpx6OZplGCTDSQ/T3JMShakr+XIdhEca60dNRHu4l/7qfDjJeSMpJ9eb
	 sOmnKtNHObnWXmDJ9eb0P1C++mF2yGpX+G1HrdH/+mksR8s5PUNFRfjQsROnyN9Asz
	 veOP4Bl4oAePMCfIqTRe3YkAqfvgLMTXgzZRzK5WU758zJHOIAywu60+qxOy/rtdNB
	 yV0zEGkjpdsvxGBxmOrLSvRX0aJanDRf9k92rT1yHax1712gNVPiRaTpeA0n/okGa/
	 HMoS54L2k2EqTwXRbh/Pd3kWI1BV2n/SZfqLDRZGbqD80V8J1gfwT7964xw14t1GwC
	 dwKJNW+ozGUYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2434C81801;
	Sat, 14 Nov 2026 10:42:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4302770B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35228819CC
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmIdZo2qazWS for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2AE7381801
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
 header.s=selector1 header.b=MNqh1fsF
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AE7381801
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUTHyDxsU3rdKJrEEVl0Z5r9mFHTVBUCIs+KMlKtB1g=;
 b=MNqh1fsFqbL1sIXQDYP4GSRBJ0/eOIwlNNTjm7WIAwDW4uwKvV+SJpEicC8vp8qCxJqNufmsBzPrrEg+lvOrPvGveUsjqjXCOImbkCGGaM42zr6ty8WKHRxhuo2RT+17hrlxRR8a8gTmpK7fjMjS93odPTW/UHCqRVlOqJINQvn4A3L+Yzl+KhvQuLRmpKDkvfdiwvYnMn5iITFu3yoxd6SjBavROIsgyynEYoglvFn+CDdM2nuiSRP9Jrz+ozFFyF6St9eww5nj7kPfFE+71bT+aEa7MVUG39fn4RktmdFiGO2XcD+bxtgA2RlH9NRxOQvh67X2aul83QBRtKjNFA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:21 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:21 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:19 +0800
Message-ID: <SY8P300MB0041D9AF0A0DD91DCBA36A25B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=tfx2001@outlook.com;
 h=from:subject; bh=9vxLkhvEq0lJClyuC5aus2UNTnV2uNcmT5uw4zotRvQ=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+DpW5rFljIwMZl546LspOuIf7viCuL/ccRCoI
 ek+Nb2GjrCJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6VgAKCRAcD62l0/wL
 2q71D/4sbJnPhZr3iILpcrLruRKxK8jueHAXQLJqWM8HwsPuOEnp8I5li8KDWGN/qDJZDapLkOj
 J9j5m3gbhweppuLi2hvuvIJbbxTw3s7E6GSMyQE5Ifiw1zmHSgDJWX2U3vuEjQ4u+sIM1GrjV4o
 +JSDmKliAk2B5BdXdZUPjSNSeT43gK8gDF8abi3x4dFW8AoMetZt88EVp/2vWYpu8uNkaI+uYQ7
 uh/n3u+msj2fwF9E/ENH0ptWoF+rY6AX+N9MZDBSEO8d0DKHxk1D5DVUUY6n1k4ia9VRDABBum5
 RdAMZrd4odibwlYwmzAdLtqsmQ5cI/ciW9Na0bkemZM8mzaXXa1zTgB7h8qjjH6TIvX299xzaIU
 MXW6K7nuBXtGpTxt1Q2vYm9nkZDqvZUaKxOGm1GHbfu0HcxSD/M6CcAZc+jDbnMGnIoD3qz+UMU
 Il5rc0aXNLmcP3YPU7o+C2YdameVDYR5ZBMD0gn4quew+E0a5DiQflhXIl0f7B4qxZQlxEpAQ5v
 VEjaWTS/t86CN6TbhFxdquPCHbYHqRaP9+VhKW6Ak+lT2b9Iyo0qgTgTdPbqY9ugVoCMCCZd535
 we8fe0Jf7MwHogPIuEWnBYdG+eevmgvXeEz6B+eYe++ChvSW4oQ3H9jSBbuJasmOP1Ir9pvSMti
 J6DdnaUzfeb8VRA==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-17-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c348dcf-f18e-483f-c9a1-08df423bf66a
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnFyL3hqOHRJZytRVTJMeHh4bTR3S3JDNWRUcFhqWlVIeGp4MFd3Ulk5ZldM?=
 =?utf-8?B?MG9pYk1OZ05Fdk9qYnNsY0hZbWE4RE9hckhqUnZEWDRrRFA3MkhHSkFIRktr?=
 =?utf-8?B?TnFtUTcwVFBOK2xoZE5QTFJMNmVnRW9NWjdkQ3RUVHRaRVFpdE5YRmh6S1RS?=
 =?utf-8?B?VHNUcGk1NWpBa1BxZm9GZTRLRDRCNVpxSENHR3hLMzNGWlFwYTh1SHdFbmQx?=
 =?utf-8?B?NFdpRlVPK25KTjFwV1BnNEd6UXRqT1hjZHJkUklDM2lkYmpSTG9SKzVveXVI?=
 =?utf-8?B?ZUFGbzNZc1I1VHhlbGRCRml6WTZYalBYODB0WXZncUhqTHp1SUQyWTdxaHRV?=
 =?utf-8?B?MXJVSDF0WmRMRVZ3S0xvRWtkRFZDeUphMmlCN0p2SEk0THNzRWFpUHFMR1Jl?=
 =?utf-8?B?ZVpkc1BqUVpyWmdBcGVUUlJjYWNjbGhyRTRGZW9QeGJCTVRBUTB5Sk1sR0h6?=
 =?utf-8?B?RDRPbjhrZCtSQ0EvOTRaenBlS3pQTGVER1RpNjhvUUFMU1J2UVdlOEVSSEkz?=
 =?utf-8?B?OXZYWlE2bUNpOHNRWGJSSG1FTFp4WUdsMDhKZmpVZVVwdE9RM0ZZSzFmVjZt?=
 =?utf-8?B?RnVwOExJUjI5KzFSQTdkaUlxZmhtR2pJNGdhMWU0ZE9JczBaZ0xXTExkWHI5?=
 =?utf-8?B?bEg3UVZJUm9vdHVmUVlicU05a0pTbGZLYnVFd1VXcDY2UHEvZlF3MDA4YTJy?=
 =?utf-8?B?K0hNa0lrMEpoWWZvSXRRMHBrUUh2dEMxNXNVMUk5Wk80SU5XL2RLUFJXamkz?=
 =?utf-8?B?dVZ4VDJ2ckJxTVdtWElaY25QWjV1VXB5TjR1aE41bVpySkNEY2lzWEtIZ2Y4?=
 =?utf-8?B?VzZsYitGc0lXTys2T2ptZWJ6dnkrZTJGanN2a3lKZzl4MTRXd0ttdEd5ZFhh?=
 =?utf-8?B?Z3U0U0NiUWhPSjRLUER5YU1oVHdFYTI3Rm9QR2VOdDkzODhpTkhka2h3aVk5?=
 =?utf-8?B?aTZsZHdYOGVoUlVkdnVScFNkeVFnYlVOeGp5QlJYMHZiT3FCOHBJcHNRQ1RU?=
 =?utf-8?B?QjJjRzg1UXlIRWRsVnFOOVc0dnBwSnMxVURaWkFpU2JEakQ0UzREWmNacE02?=
 =?utf-8?B?U0c0aUtrUUFreFN6d1U5SXVNcEpLbjlOcVZXWDEwTjFHaVliYmVjU3E0dVFp?=
 =?utf-8?B?cFdieUgwbTJOelVVaS9YSUg0aVV2aWFVeWNmbXI3TlZ0b1NMRzB6ekY4MTU5?=
 =?utf-8?B?bUtFeHJBZWFtcUxzVTgvVUI1ZHBqZUJ1Z0djUmNlaVo0UWZhZysxT2I4WUZv?=
 =?utf-8?B?NGlDMnBZZGtQV1FEL1ROWm90YjNUYnZOMW00a0RBSFROZHZXK2FrUVNsODdO?=
 =?utf-8?B?SjRhdTliRlVVNDRoOUZvYTZqdHpzeVFPeEVsTXJwK09BQVp0ek4wZVpPRWhk?=
 =?utf-8?B?emJPVGZkTXR1ckdYMHh4eHNQalJiSjU2SkRZS1NJQnVNTVpnR1I2K0ZsZ2h6?=
 =?utf-8?Q?2tyCplvX?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW5MNDliVFVva3NXVG5jTERObWRhTzY3a2NzcFQxVmhjZ3Y4OTNXZm5RaS8r?=
 =?utf-8?B?N05PWk9yN1RXb3o0ZzQwdTJFalR6M0RCK2IwWG9qNzhqdWl0Q2Y0RXM2YkFk?=
 =?utf-8?B?bWhPN0daVU5RS1N5QndleklKSTBBdU9maWwxbzNoNHQ2dlRZTE5GUEZkN1Bj?=
 =?utf-8?B?QU8ycVl4ZU5UdGhFQ200aVV4WlJhTjkxM09PN2dGNGJ6dmc1d2p4cG9VRFdV?=
 =?utf-8?B?NVFpUTd2b0JHV3pZLzBjNGZDUkkyekd4and6cGY2UGdXemt1Ump4clpVNGpt?=
 =?utf-8?B?ZG1OS21IQWdOaHpDaFUvNGQrbHZNLzc3VXBjOE1XTUpEZUtiMFJmTXNSdExL?=
 =?utf-8?B?a2VieDNrYVhzbEZTZXdlcCt4bGJoajdMN0xhVzFaMEZrUytrdjRtc01LUURG?=
 =?utf-8?B?Lzk3bkVncmx3ZVdKWlZZYXNsTml3MUllZ1JOOWdabXZ1a09BNm1VdEwrUXJV?=
 =?utf-8?B?V0g5N3Y2bkN2Q3MxSUJ1cjYxTUYwWUI2Wm82Q0Y5RHU2dHQ2bkpzaS9SdlFl?=
 =?utf-8?B?RVJTWHpIMExQa055TW16VE9TNi9taUgreWVDdytkV2R3azlhSHRzdUNIaVVu?=
 =?utf-8?B?Und1YnhJeGt6eGVNT0NyODVTQ202b2RSb2ZKcitxeDc0VHlRV3I0OVFGaE81?=
 =?utf-8?B?OEJJeE90Z1RiVVRYQzVtc25ZTlgvaUl2Vk5yVitQMkJmVHFNaVcrY0pJMmxW?=
 =?utf-8?B?OHhmeG1nTVRSSnRoc2VwRkRkZHc5MnZkcDhNekcwajRVSStXdno0V21ZMW1x?=
 =?utf-8?B?b2kvYnNLM0I3ejNkK0NCSGtWSnltNEQrU2xOK0NPcXorZitvbmhSSDMzQjls?=
 =?utf-8?B?dWhBWHprRy95aEJ5SU9WUG1qd1M5Nlh6SDFYNXZiYVlmUDJvUWNHMi9ybHVu?=
 =?utf-8?B?c1NFVkp0NjhZa2g2cFR6NGdoWDdUazhYWUNBL0lFK3BDaEQ4NTM5MldJemxa?=
 =?utf-8?B?K0tsZjY0bEd1M1RFVWZDbFcxY1R0VUZKVm82bWhTNTJDS3R5Mlp5L0Q2TlJ3?=
 =?utf-8?B?UVZXanRBKzlzdUd6eUFhaElKaWVZMGcxRnFTSUEwMzBudEVKbTVnUUR2SWZH?=
 =?utf-8?B?dVVTV3QzZkFtVXlEN2M3T05wVzBJY3R2dXpvTkMvUUpYWWl0cXhLS2ppQTh0?=
 =?utf-8?B?VWg4ZksvRTFESjNUZldJVTE1YVFJRmxVQm9zQU1ldDdQQTRCNTgzOUJFZkFS?=
 =?utf-8?B?endnYjl5ZzJIQ2pxaytWTzVISGE1VW9sRUFiQkxSR0NodGF3Mk1CQ2FmTkxh?=
 =?utf-8?B?dHhaVVJHc29yR1ZiamhJZDRXeTZ1WGk0WkJZYk1wdHdNY2JHbmFvZ3pkTDln?=
 =?utf-8?B?eCtJUGhJZVVrbXRzc1JWdTJCaTNrTnFETjBzbExXNWJ3azNYYmI2YnpRUi9N?=
 =?utf-8?B?TXh6c3o3d3dEcGQ0a3krbnNCOHJ2ZnlLY29yejFxRlVaME1sY1BiN1Q2emJP?=
 =?utf-8?B?VVpjR3RpWWF3cVo5VlB5ZktjbzJ0K2RxaVFVUjRnbE55cDhBT2lVV2pHOEtW?=
 =?utf-8?B?Z3JTNnA5L0hGQkhVc2M1TVIzRzIrNVAxMFhsU0l0aklGbDJwSzRYS2F0Q09r?=
 =?utf-8?B?QWNqT0grdnBLWFVDNFNBYnFBS25wbFUyT1lQbHY1Z3IzNVVuRzlxajQzb2No?=
 =?utf-8?B?c0tEaDlwZnBITkxSWDh6TjNBcEFXNkREMTlPTi9CMXhJOWZlSlZxWklMeXdL?=
 =?utf-8?B?WUZzNXJNUW9MaWdsTHJaN3B5eStOU25SMnFCVUlUb29LOHZseEswRmRtMmNv?=
 =?utf-8?B?M0tGVjdITVdiWm1RNjFMa3pTcmdMdi8reldaYlV4NkhLZWZMbUkxblB2UXVY?=
 =?utf-8?B?SkJ3VHdPb0lHUkx1cHdpK3k3SEozUUFTSDNqZHNvSTlvbDdqZ1BCZ2xQaWpM?=
 =?utf-8?Q?RJR3IPx9tAzsP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c348dcf-f18e-483f-c9a1-08df423bf66a
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:21.6674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 01/14] package/libnice: bump to version 0.1.24
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

Update the COPYING hash following the addition of an SPDX license
identifier:
https://gitlab.freedesktop.org/libnice/libnice/-/commit/a04e4a05ab9cfc5fe257d9d06c43488f057956f5

Update LIBNICE_LICENSE to match the upstream SPDX declaration.

Changelog:
https://gitlab.freedesktop.org/libnice/libnice/-/blob/0.1.24/NEWS

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/libnice/libnice.hash | 4 ++--
 package/libnice/libnice.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index cf6d825f83..9411b03816 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,7 +1,7 @@
 # Locally computed after checking pgp signature
-sha256  72e73a2acf20f59093e21d5601606e405873503eb35f346fa621de23e99b3b39  libnice-0.1.21.tar.gz
+sha256  cfb5e8e778534f2f5b3c6f4958a1eb057c6b95c537c0f100817a537cf5d64fcc  libnice-0.1.24.tar.gz
 
 # Hash for license files:
-sha256  9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5  COPYING
+sha256  e5504e5ffe894870ea1a652df957a120ead9c3f9a5e9d314ca41ba06f2d72024  COPYING
 sha256  3b3c75ae6c663c4f93987647eb5463d33dc1602a1aded3ac479773f2c3928e3a  COPYING.MPL
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LGPL
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 56ee35e452..3519bcd869 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.21
+LIBNICE_VERSION = 0.1.24
 LIBNICE_SITE = https://libnice.freedesktop.org/releases
-LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
+LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1-or-later
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
 LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
