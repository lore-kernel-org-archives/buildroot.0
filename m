Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12359606A884
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cIf81SdM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=geMCSlyd
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D49C040DDE;
	Sat, 14 Nov 2026 10:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJRRf5HxxryP; Sat, 14 Nov 2026 10:42:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CC00540DC6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652950;
	b=oUcntKDDaLpuW4VIr6P7/+LkllKddA6+64OGs3rNEtrtnri0eLJQ/EXH7++NcsknxIKc
	 UtOc0f/vefPmIkjUn65Uq4J1HXUulO/3rOJlfekRTdGj4ymQco9nnXaI+8I676QXQfB7Q
	 MRnEIigp/rum/Rg8kGjiFxEx79r8r8f4l92zCqT+yRXuGiTHFr1OjbKi/0YGf7J0Fxkl1
	 hiIj70f82kA4NvOCGUEJuWspIUSgbiUH3DEo/mPLYa+Y/IziYlIbqOPwHXBaZnBOqulte
	 nwr127vVaVa1hC7KXwCO4sg+pKDRwBg8s8uILwdicTQGEizcJciQuhK/mezfoHZhLtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652950;
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
	bh=Gr9kP2SnY/xqNke9LXnjk0wzf/JAV9lOwGSdXjftG1E=;
	b=YteAyxon55IulAzBYqByr8i3ya0dz/TntxxmSlJfkB/0nnOqbC3g/ASaHd3ts6F8PEAm
	 pcZ7htrJAHGv5FkiWCwrAfZHYykZK6eZUfBF6w/bWK6l66h08ae1Ci28wA+TUoK4Ii5sL
	 GUiOWmi4xzpBc5kqxECZv3ep6qqRTSkLf/GvREv9diPfu0NqcmGqe88yAhCYwsICtKquh
	 L1CIaIDx0K2VXYxZfEyYUVfVhXQ28TlJTsDOhud0lDzUFCbW+l1SXABJdX/ki2qAKwU8Q
	 ACKysQaFnkMXC8dvFbXdv2qU9ws2on3aizK91V6/aq3RUg3B7hfxcLdRX797eqhF2dQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652950;
	bh=Gr9kP2SnY/xqNke9LXnjk0wzf/JAV9lOwGSdXjftG1E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cIf81SdMGyOGB2yR+Or5HMZ2DIDl0mT9/4mXBWb+mN7W5x9lXJ+di+ChKxgl47JNR
	 GUziC0xkMt8ThdbKiZ7DHp6GyI5UF/al3YV4+NGdAdc7JCw9JFx6QTsjH2HmB3qUa1
	 +XzaBqtasmsfhSvg14nd5Cj7sTr0UBF8Wgt3rJXb+U5zP9DDr3rnyJ8QseHjfqqZbY
	 X9pVZDcqzKzaHzGQRZ1dM15ZSRrNr/6CgkTQXS1FHywO7F9RwnyylumcwKLfLs3y+E
	 BrZAkbG1zlGU+PHb8r1wvPvm4gtK4Q56jGIyTTG04HWn1v0TenjmjsW64cxAny9/Mf
	 sQD4u30+1HcsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC00540DC6;
	Sat, 14 Nov 2026 10:42:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFD9B70B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99290819CC
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5z8PYRaMEFn for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7AB6681763
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
 header.s=selector1 header.b=geMCSlyd
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AB6681763
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z1lnb5XighciOTE/lNxEXC4a1HC2/nkpRM+eVhTFn8=;
 b=geMCSlydAB+bGssi4Akadkb5QMqIzN571T/fjoZoZIXIQgbyUE5bOrkX0YsydcAAt7xY4khv1l7xAJ63uLgzZXH8eQG6TlUh7CEzB+AjoKCvgF6Qz9foqGrRcwdQuvE50+xLjDaV/bxw+0grGhGKRHnXdqz7XepfIftZZTtQthovGA/Zz62t8Xx7BvALlmjgqjJXbBsdIzsn6nuddw6nV4jMmh7DrIDZoc4cbPVpSm0+FUAJnaOWR/m+wOtzmW7aHFljqChO/ASyWqcUP572JGu2GRHyOWpiQgWPHTgbkvaB2QMviUKEuXbv+SPk0VMMgMm8I5Vkps3HbNj3SYX9WQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:19 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:19 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:18 +0800
Message-ID: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
X-Change-ID: 20261105-bump-gstreamer-260848b94831
X-Developer-Signature: v=1; a=openpgp-sha256; l=4366; i=tfx2001@outlook.com;
 h=from:subject; bh=1fVHMhiEMeQJFoH0fr0B6zuGWW5NkfgJ6v07ZTZ4RDE=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+DpVD6hK9bzaOaXFXiIONX/EfvL+v3VpMwQ3M
 sLUIYnUWsWJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6VQAKCRAcD62l0/wL
 2oRSEACiI8hPTZfGEq2bv68aZ1o2qtFSQxIFWNNWIRg71VaROYAENcGvYmyznlNQOrJ4K76csK5
 yqrlX5PadgGjQcB28TOh8p0jsKu0F5aUTYvfJfQSuvngR4/DwHqna9RWCed9yNGDUYh7N5KIgV4
 9t9b0GyTC0QZOWVm20bK0XIg9rj/Dmd8ro1DuCNx2OD3H81CbcTsFUorO2+x0/4NNqVEdckQooE
 TCOpwH2z3Yhteewcv00DUGwgoj28+6SLp+RdyECDpTtnk33HiRJcG+x8DGHfsxaZVmX4HVxaTNh
 iSSfLU4MGmMPxeFvj1zvbU9ynNWO7FWoShf2d/kox/VUXkNtr0xs8t6nuAW3Nhd+sk5wv2dat60
 Eo4NKJ0Ovobz79CTaNY5r+bjB3sm1ZfX0+4JjHOSzgeEtLCQMbxE6km5cnm+CoIUUobkt6P3orw
 XUdaWRm2j8HH5xRhAnkyflnZohpoiREb9aa+g7nMz0PqPbBO+SXVmzcCngz1A7cxU1rFd6rMjt6
 pKp4B+H39I4RdRGZKHDZC+JnPUMbZHuEiBUjGjyCUA8EWZb2X5lGEZrORCLxFuCuc+qzDImyF3a
 Dgy0KLr6yg9JbX0sBQr6Ya+Yb0MA+b8XLoK8mGvhvBiamil3KSRIA5A+988aHn8MvaovDwKtjA9
 EO/SqMy1qTSVjrw==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-16-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: 90195188-6182-496b-b048-08df423bf4a9
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|4140399003|39105399006|5062599005|19110799012|15080799012|23021999003|24021099003|22121099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVVBMHU2MTRJN1UwQ2FPYno3OXhKb3JXVElIWURZQjZTU3dwUlhPS29vcUtZ?=
 =?utf-8?B?K0tGQ1A2d3NJVDhoTXhHLzd5VjRtSXowQlRxYUdORXJMcmNpZ2E5eUVCK01t?=
 =?utf-8?B?VkczNXRQejFjMmpETVRmc25zZ01OeUxMdGpydHRpMjljTUI2blBqRkFvcFV2?=
 =?utf-8?B?aGkwT2RYUWR0MzQzZmZDVmRrSVcrbFBxN3YwNERYS0hmT1J0ZFU1dHdIQW5B?=
 =?utf-8?B?WFBlTG1WT3UwUHN3MDBRUlRoYnR3TFdMT2xCNHpjL0xkemNWelJHQVN2a3kv?=
 =?utf-8?B?MTZzMStNQnRlaVJsYmdLU1AvUkJrMFMxTGtGWlIwZ0pKWENValZHSlY2eGU3?=
 =?utf-8?B?dnQ0MXpITWxBV3JtYzBwbE1ySjFTTWxWeDNhZ1dGbkNFaDAxemFkTlpyZHhD?=
 =?utf-8?B?Q1BzeE5nRjJFL2hUVm1JSzAvdWdDaHRGOWFiUmFzUVYraGFXTjEyQ1hpdVhR?=
 =?utf-8?B?b1NzbDJwWkFocFJBUE5nZjdtSWo4cWxEVUJhZ3pyMXpNK0EzWTFwNkhvQUpT?=
 =?utf-8?B?MkJKblNSZlYzeEtJNk83TnByRVB0aVRuYnhjTy9jcEtYdjZhZ1d0bHI2cWtu?=
 =?utf-8?B?aDRhUGtDTHkvQ3FBandNTlpweFFzNmF4YkNCSmdRbmRjT0xyb2lQbkgrWmlh?=
 =?utf-8?B?MzVmanBvQnd4a2p4VnoxVDZ6blVVT25DQTlCR2pBTVFyUDlKcEtRS1pLRVFD?=
 =?utf-8?B?c0sxU3RhK3poaXRxWUhvUDNuV0YzZUdVTG1lNS9FNmw1cTBOUWVqd3dSNk9a?=
 =?utf-8?B?MmxrbHRUOFJnU3FBUlZJZ1FxekFELzAzdUhmYmJORmtSTUcwVW1vVDdnVVlN?=
 =?utf-8?B?UVJnKzMzTXMrQVhXVGwzK0VoYmR0SG5UR0VuTHhybDNiZGtQcVhPcUR0UEVs?=
 =?utf-8?B?OTV2REtEMlRyU2EyTmdvVmJyTGNkU3V2dGN3MnM3WDRLblFUVnZMT0ZtNy9r?=
 =?utf-8?B?eExZdDQvUHc1WVV3amFYMlg2dWc2ZkRnZXUwRnJBSGljQWgwbHRSM1hKSndN?=
 =?utf-8?B?eEhwd1BINnJHS3lqSGVkblBpNUxHZzMxUUtYVmF0OGg4WkFVMkI5ZXhLb1pa?=
 =?utf-8?B?SDVHTTRXTlFycTJ2L0k4aHM5ZS9KQnloV1hkclBzUll2ZFdLNHF0VEFhbVJi?=
 =?utf-8?B?aFN4bE5QK2gxMlgrZnpCcktFZis4Zk5FVUhOQXFuS2NOQmE3Tk9senhncnVX?=
 =?utf-8?B?UXF1R3NBeDNkblprVzBWTzU0MXdmU2hhc2xrdGZXWkdJMElsS2NuanFxZURy?=
 =?utf-8?B?bElHVU5NZ3dBNHQ4UmdxUGgycmlXd2xjTTV1UkhZdkdBb3NHRERFNENiMUhK?=
 =?utf-8?B?MFFNNmtkU2IwS1EvTXpocTU0L2hRbkVaK1EzUU9TWVdyL0p3WnBZUXFIeW82?=
 =?utf-8?B?MS9TdXVWT296UW1oajh0N001c0N0VGg5NzEyS044SG5LdUpHcy9HZFRsMkxx?=
 =?utf-8?B?QUUvS01tdEt3dDhIWi92SERqbzNZTjdIbTFaVkR2UXc3c0J0TE1PUUgrQkJq?=
 =?utf-8?Q?TTUc5aodh8nfTtTDCHqM9T+9CF7?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJoMHFFcWVpY3ZhZlNnZHpNQ25oMFMwdEtPSWErNXBxV1FPWWoyOGxtK2lw?=
 =?utf-8?B?RVRFNy9hRkRUQkt0TDB0enNFSXhIQXVCejFKV1hJZTlJaWZYWnlPOGVGOGRP?=
 =?utf-8?B?czYzWjlaN1Q2cDh4N3JXdjB4ZU5oK2VWVVc1dkNteWxGbHR2T2FTanB4QzZZ?=
 =?utf-8?B?alQzOVp6TnBlWkZUejQwbTZJS1ZvVjQzSjZHZUpmMVJtRUUybG5rTVBDR04v?=
 =?utf-8?B?SnR6MUFQS3pib2crTVdvbzBaMUtqQ1c0U21KN0NpVmlrK01RMlBZTUM5cUZB?=
 =?utf-8?B?NzVoZS8wVDNrY2Jlc081dExYYzhOTk5qNWlrTmVOR25ldmVkelJPV1NQblFm?=
 =?utf-8?B?OWM2TU5mNDBaRFFyMEd2WXNzVElXeU5tWi80SUNYRkkwcTRsNHk1VmlLRHV2?=
 =?utf-8?B?RjB2RUZmZ3lWdzdVazhFTlZIQ1lERzNUUHhyNDVVbHdwNlF3S0wwRVhTQW1s?=
 =?utf-8?B?LzUvNFFFV20rMjNTOVhIVDl1cXkyNlZTYlM4cndkT3A2VUFOcmZGSFczdi9Y?=
 =?utf-8?B?OGlVaEZXUzBDekF4K3p6VEk0MTdDR0Iwa0x3WUREbUc2aUZWaFhmSmVxVVB6?=
 =?utf-8?B?ZXA1YTNsSko1M3hxQk5DL0trZTEzcVY4R3pHWEJQSVlyZHZTNEprZDhkNTBZ?=
 =?utf-8?B?blpaS3NzNGl1RXJTYWwxNjVoenN2U3U3RFRuK2pjM3hoYlZFUUxOZHVIVVYv?=
 =?utf-8?B?WUJ4K0RUSWJEU3BubWFIUmhld2RuTkY2Y3oxN0ZzOWxBczQ2MUdrRmJocGdz?=
 =?utf-8?B?WHZ5NWE2UkxldkEyMERXbGFnQStaNEFMQ016RmVnUWxoZkNvSUNNMGsrVVJ5?=
 =?utf-8?B?QzJxYmNwbTZ6cVFNREFremNLeXFsNW0yem9Wd1ZMcUdyR2g1WTMzQzRVTXhR?=
 =?utf-8?B?NUVlSE9QemlNNzRMRy9TaHR2dSt2SjVvYUhhakgxVWVZcVdDcDdFeGNGQ0pm?=
 =?utf-8?B?MWJqTks4eE5EMnN6R2FmMlIzWm9lWTcvb2Vpa3JIVThOT1Jlcjh1aFFjZGNE?=
 =?utf-8?B?SGNtOE5wd1JhL0xhbVhOVVVRaE1KczE2OXNDTVhRM1BZSnFVdUZxYklxTDJG?=
 =?utf-8?B?VHdlNzJBS0JITmQrVksrT2tpT2tTdFBCUVZxUFl1QjdIeFdBd1FGaW9wWlJi?=
 =?utf-8?B?anJub2dNWEp3d3ljS2w2d1grZVpUUndQazlyMVIrYmh2dUxCcTVtUnZINW5t?=
 =?utf-8?B?R1JnOTdGOUlxcnYzcFl6MHdSMXBvS0pMT2RrTnltTHlQb0pYb3duSW04NURk?=
 =?utf-8?B?SmxGaFRrV256eFBOcFhXNXIyZUMvNHg2eW5vaG8zMzMyMU4xeENxcVZFditr?=
 =?utf-8?B?dytGNVJZVU40V1BnM1I3L0NyNWY1dDB3MENISVdIRlk3aUdFL2FCcmNJRGFR?=
 =?utf-8?B?UkNydGFXYjNkakpUbTdQM1RyNm1BbVpqeG1jUHRTRVZHYTZRZUNiVmhhanpR?=
 =?utf-8?B?RnJwOUU1S0d5aTJ6SDhDZlpkMFlxN2NxWVMzbDl1b2syejhOSW5vQjg2ckNN?=
 =?utf-8?B?bFd5a2xkKzAybEtSbGN2SXk2Q3Y2bjdQajdnVUxFUVVDZkhsS0czVWMraEJj?=
 =?utf-8?B?QXZ4d2Z2V21SWVJVWDE0bytGQXBPK3VxM3UrV1RKNzgxQzFJTlZ2cVZNOFNa?=
 =?utf-8?B?SGo1N3hjTzB4dXZ4ZHFoMTB6aTUwWkxucm13c202akhTK0o5ZnMwTzlyWEF2?=
 =?utf-8?B?djV2NUpOU20xQ0dwdWxWb1BMT1p5N2F0cGNJVzhSaFd5WitTaVlkS3g0NXpw?=
 =?utf-8?B?RjU3SjFVbU52TGZPdnhXOU51Zkt1NHFwY0cydXpQVmY3dlZvVTBRalVCM3Zj?=
 =?utf-8?B?b2JGa3dVa1ZVVXFvaWVZUmh4UkQ2Zlcrb290M3F5SEM4ZTJPd0YvYXhLRXBU?=
 =?utf-8?Q?EnQFxDNd5dd66?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90195188-6182-496b-b048-08df423bf4a9
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:18.9102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 00/14] package/gstreamer1: bump to version 1.28.9
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

Hi all,

This series updates the GStreamer packages to the latest stable release,
1.28.9.

Patch 1 updates libnice to version 0.1.24 to satisfy the new minimum
version requirement of 0.1.23 for WebRTC support in gst-plugins-bad [1].

Patch 2 changes the jack2 D-Bus option to depend on python3 instead of
selecting it. This resolves a recursive Kconfig dependency exposed by
the gst1-python update.

Patch 3 switches the gst1-rtsp-server download URL to HTTPS.

Patches 4-13 update the GStreamer packages to version 1.28.9.

Patch 14 removes the gst1-vaapi package, as gstreamer-vaapi was removed
in GStreamer 1.28 in favour of the va plugin in gst-plugins-bad [2].

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/94b59df4ea60d5cf4ce940dc8a105de078bd7e20
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/82a71a7739fea9d48e9c64f44bce879b86bd3df7

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
Fengwei Tan (14):
      package/libnice: bump to version 0.1.24
      package/jack2: depend on python3 for D-Bus support
      package/gstreamer1/gst1-rtsp-server: change download URL to HTTPS
      package/gstreamer1/gstreamer1: bump to version 1.28.9
      package/gstreamer1/gst1-plugins-base: bump to version 1.28.9
      package/gstreamer1/gst1-plugins-good: bump to version 1.28.9
      package/gstreamer1/gst1-plugins-bad: bump to version 1.28.9
      package/gstreamer1/gst1-plugins-ugly: bump to version 1.28.9
      package/gstreamer1/gst1-libav: bump to version 1.28.9
      package/gstreamer1/gst1-rtsp-server: bump to version 1.28.9
      package/gstreamer1/gst1-python: bump to version 1.28.9
      package/gstreamer1/gst1-devtools: bump to version 1.28.9
      package/gstreamer1/gstreamer1-editing-services: bump to version 1.28.9
      package/gstreamer1/gst1-vaapi: remove package

 Config.in.legacy                                   | 29 +++++++++
 package/gmrender-resurrect/Config.in               |  6 +-
 package/gstreamer1/Config.in                       |  1 -
 .../gstreamer1/gst1-devtools/gst1-devtools.hash    |  4 +-
 package/gstreamer1/gst1-devtools/gst1-devtools.mk  |  3 +-
 ...t-libav-Fix-build-failure-with-FFmpeg-9.0.patch | 72 ----------------------
 package/gstreamer1/gst1-libav/gst1-libav.hash      |  4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk        |  2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in      | 10 +--
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 38 ++++++++----
 .../gst1-plugins-base/gst1-plugins-base.hash       |  4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         | 12 ++--
 package/gstreamer1/gst1-plugins-good/Config.in     |  2 +-
 .../gst1-plugins-good/gst1-plugins-good.hash       |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |  9 ++-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |  4 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  5 +-
 package/gstreamer1/gst1-python/Config.in           |  7 ++-
 package/gstreamer1/gst1-python/gst1-python.hash    |  4 +-
 package/gstreamer1/gst1-python/gst1-python.mk      |  3 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash         |  4 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk           | 14 ++---
 package/gstreamer1/gst1-vaapi/Config.in            | 54 ----------------
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash      |  3 -
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk        | 59 ------------------
 .../gstreamer1-editing-services.hash               |  4 +-
 .../gstreamer1-editing-services.mk                 |  2 +-
 package/gstreamer1/gstreamer1/Config.in            |  6 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash      |  4 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk        |  8 +--
 package/jack2/Config.in                            |  8 ++-
 package/kmscube/Config.in                          |  7 +++
 package/libnice/libnice.hash                       |  4 +-
 package/libnice/libnice.mk                         |  4 +-
 package/opencv4/Config.in                          |  5 ++
 36 files changed, 142 insertions(+), 271 deletions(-)
---
base-commit: 8c4093051a8fe4a0ba40f0967acf3c8b53ff682d
change-id: 20261105-bump-gstreamer-260848b94831

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
