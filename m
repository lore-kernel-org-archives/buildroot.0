Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9CC606A323
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TnjKrwvh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=sKpxac9Y
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D1376066A;
	Sat, 14 Nov 2026 10:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i51RJozTtg1h; Sat, 14 Nov 2026 10:42:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 12F3860687
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652971;
	b=D38X/iacl+ZqG1Cn6F5zb3VDWQ1Sg7ezm2gqVR8JVsYVXCPZqrO3PlrKX68kelro5DE/
	 GVbR/+J6fWoquZwdNxsHG68dnw8XSatnEl+Dp/d9AtcpbVZTgHHz9o+oelLWdRJARl9LL
	 YkjiZbD8SOk2pf5SWq+zDUWPWBGAC9CU5RJgutLvL/v25dLkK5e75FZ1g3VBl2/2ai+Hp
	 ey9tPtCl/FgV6rcN0oLgnr0oB3bT1WyKM3y4t+8FaStguNXcYiMYYZ4Xij5MX7JxUlhjj
	 oi557vab5ZVL4t3ZYdn8B2llm6S9XSYDWtIrFAkG82Q6PSgM5163aiw9k4U+UuO0/mQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652971;
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
	bh=hQJF+waBnBcbQAE5bYbt9f+UngXLP4DfrN595iAVwHY=;
	b=h/LZO6q/HFiPGg314xNjqGq7+2t5wruc9Ycwc6mCmk9h9e2kHMaA5Sg6s9ots2cUXJjK
	 K8EvcgBzWRtfuZP14+43OUnE8gSGXJRZGq3WoGy7UDfx2tkqy1eG9qlVUo821Iszh7UXQ
	 w4poQVRxjziuQWpe14b+zQR5DpyhW0ULwLVVHuR6Lqm8eav21EQsmkTsSxUvmFeW3cNen
	 mjAR/u/vPvlnLby9bmSSnfWDBPGYggcKvR6uU3ueNQWL6RXb19NKnDf2i6ywWimedWMrn
	 hBqPRiR57cs9empXWkT3Kyzj/RtUg5cV7MLn11lxgrw9gr0y+v2IP5movGI6MSo02+w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652971;
	bh=hQJF+waBnBcbQAE5bYbt9f+UngXLP4DfrN595iAVwHY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TnjKrwvhdgq6hNzLcjqgSg+ah97+ZKbtctOjJ2OyRwphksYfbSOqiBJbmZk+dIKAJ
	 FAf8O3Qu0Hmg78H4myIRhrD3r+/Zk6yVhpq3Z81uh0n4kmicg09cL0A/POIhtFITYl
	 t905vePybk/JkbNdvexhhe/wXGtgjKpqaI9+Eyoe9R28mgN4f08hLMO2QAk5omkNlS
	 iy/nVXH/FHWOlj0Xb/n0CQHV3pV4beKUd58vDIplo1V784L6i0HpQfFDZhDbCOVMtY
	 ZzJczDZpgs920q9afn6DTUZlpSq7CCvQW3R0HLcKrLQfTU9JI3HaFlWUg52nqKoopI
	 Cslu9SHFBuQ5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F3860687;
	Sat, 14 Nov 2026 10:42:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 752E89B6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5971A40DD7
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdXIQnPdS7Ow for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8191540E5B
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=sKpxac9Y
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8191540E5B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IhsKksoAQV1OgZrc6b7hmo0p/KHzrH4UdEmaY60hac=;
 b=sKpxac9YMJXTdzvhG3joP2W5F3pO4gEpdYCtxl6jePQjhSbAG9dv7IxZgJT7pXjJFPHfDZum0hyMlO4syLs/2u6Ps+xaddgCD8pPr+BL4w38M+hFeam91Ie9sS6wr24WynyiETMRY/lt4a26pLagFIc1tHOZJ47RAI1S+6+skob8jqyG51NCpn+OfqCvhwfmHMo3G4Ff2mWB10x7Ko0+fTkcF115PfubV4ecMIZjOdFOR5BLRfXdgspHqAdY/PHVIeFuQNfiBuRXKifRdFE3NpZq7j4SW0hWj4fB2GpQ5RumM0UmDk3Uw2Ij+V9PZQtWFC35l7PisQsJSu0xfmjcOw==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:44 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:44 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:27 +0800
Message-ID: <SY8P300MB00415E62E810CC5777604DDFB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299; i=tfx2001@outlook.com;
 h=from:subject; bh=h9nen7ungrMatQnH1L+e2P0+oGIp53r7XB+syZao9hE=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+Dpch/xDJCDv+lfpDqjQavg1/6j8HTRksDzLn
 ZNsjlrhq0CJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6XAAKCRAcD62l0/wL
 2gOaD/9sku5hCYG4OHHM/q0SOl9frmrmGnngV7CLf5MNzzGtXpSxekTiMGNzAP5MoJ52BTVtzAp
 EpOKypOETPog5OUFzu5h1p9wWUKOH15kUCpmkJPg57sk7t92DezWBkM05EDtdQ+fbl5KT4o/dZC
 pT/sOFujLYEe++SjwKmdpeXmnRAhIaBQNyGDXIY7SYOijHHwmQSJOhNXZ2oxURviyy6DgfVX97R
 wxsk5Jm2C7VotDl78oxGIWEGNezWungR8rGOUBHIvO/iksZwMnUj66DcaWdfkTiNzND80v5n1uu
 JnaZI80gV4zBHtAQr7eJlptYpAW8mz5Ae/az0y9tfWkgV0OmNECfYuLz/AibIpQK8JWqw/s0AS3
 pJhrOp499Ly90bpHQ0KDhecLV9w5pIsa7YMjoy7iry8Fo8+fXd9+AgFjFL0odmuxLldsU8ph8HB
 2OBsqAu9sn1ax3ECBn6SWZkcQMDYwcNAUzKwQFU6NHPwcllZHtgdfQycwjVfOAKRIUeDpyZ3da7
 gTUy2/lewNvnfUhcLJj97X3WOeLdtE5hal8NdZKwRS8vKuzu4MWY7wKq1sGMFDPOaw5P9Z9Uyun
 G/zL5s3COC2O6W1pgBgMeA0Ka9P4yxl8FPMvmRtA+nrgHCUKy5XRB6t0Ry2Y9eDRUbh/X/VmZEO
 SCAqN7bhikqmwEw==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-25-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5ff805-18d6-4eae-ecd3-08df423c03bc
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|16051099003|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEF1RmR6WTBYZk4yNDM3c3NBdzhBblMrdjdlMmxKNFVpVVgwUHpiTXlmMi90?=
 =?utf-8?B?czRSeDRBVzlpNzVyMGxOUlNTOHVtVU1tcitpVFZURnpCRkdYRkdkSUlZbmQw?=
 =?utf-8?B?eE1ORDB6cytwSDV6QkFiem14bndLQ0dzRzc4MXVWOFRlRUZFczFVL3JjeEhW?=
 =?utf-8?B?V1JqK3I3dTNnRTQwTlB1dGVPK0FRUUdOVEtLbnlmWE5QYUlXZGpXbVJQVmI3?=
 =?utf-8?B?ZUw1Rk90RWN3ZFNQalZ0TUhvbngrdVdheHVmWitYV2h2bTFweTVCUEhMVjZ2?=
 =?utf-8?B?Q21pRXBGdGY4c2ZLeWpXWXc5aFlGbkwva2RKUzZHOExNQW9uYU45Nm1tTUtY?=
 =?utf-8?B?V1NGZXhGckZwejZHYW55WGltWEx3UHVRR3FhM0lMSXRiTnFFeXI1TFRqMVdl?=
 =?utf-8?B?RDlDSFlwUWtiaGlzeXB4b05GaW5YOW9jcTJ4Yk90Zm42R2NEVjJ5dmhTRndK?=
 =?utf-8?B?WGYxYStNZHF6UDF5Ullac3pmWk54UnB3R1Vyb1ZFTkFpRk90Sit6c254Y1JX?=
 =?utf-8?B?NUlaVk5YSURDc0hJeW5jT2Z2K2Zhano1TC96YS8yQ1U5Q0owUjZsY3ZDTVg1?=
 =?utf-8?B?cHErQUdaZG5Ha2ltL2RaV1FISkU4RU1OWFZLWG5kQVgwbU01UktaVFZkV2sy?=
 =?utf-8?B?clpFV0dRM1pUTDVCb1owaGVVMnFDd3ZkQW9UQ3dsL2psMjROejV0eGhveFRk?=
 =?utf-8?B?RTJ5MGZqSlZ4Zy9mT0ozR3I0NlRPSWZudlFBRHRNeVRvSnFHbVB5YTREaHc3?=
 =?utf-8?B?dENJQ1M4YjlxbGYyc0dma2FvWFNGcnA0djVuZzRzam96djd4d1RlUE9uUWl1?=
 =?utf-8?B?dFgwTWZyV3pHbml5VzNJYXZkUG4rOFBHZXoyWms4YVdseU9sZ3lqRU9PakNJ?=
 =?utf-8?B?R0o2a3hGQnJzYTM5c1N5Y1QwTEorbHl3UUpqK1gwUkZzWmF1UUpRMEJyeE9p?=
 =?utf-8?B?ZFFlWWZIVkRReGJqQTFxVnBRTDhXdm4zVGhMMERpNWhsRlhlWWdIUEhQUEdo?=
 =?utf-8?B?aGNSY2VFN0hKZzBlcFpqby84SStEQ1pKTGpqcExQcyswSkVmaEhRUTltTHJi?=
 =?utf-8?B?S2VPT00yNVEvbHVSMDcyK3RlOXIwS0xUOXNlN3c4SlYrcWpzZ1FRci9kbVhv?=
 =?utf-8?B?clV6d21SVE5HR04xeEpEVXdIZjF0ME9ucWRDc0U0YnpxeUdIcHl5Q3A2ejU0?=
 =?utf-8?B?OHUrRWd4VnpnRWRFMkdtMllxMTArdnE5N1l4cGpHQVptbDFkaGNyV2xlSWha?=
 =?utf-8?B?WHh3TENVckdMYkQvc0FmaGJwV1ZFN3hycCtEKzltcjJQaCtLd25QdnZOYUk0?=
 =?utf-8?B?Z1pLV2hhWW9IZFlIV2ZHcWcvUmhQb0had1UyQTN5UjJDcnlVVDVrNlhQblp5?=
 =?utf-8?B?NWdGYm9hcVJKMnV5b0RvRU9rM203M0dLaWZKK3B6NFNveTkySk50eW5TRmhz?=
 =?utf-8?B?VDh0V3hNYUhpeWhiRTBHVm90MnYranVsdFVOVThtYVJuelpkYW00eHZ1dzVn?=
 =?utf-8?Q?HRq+Xc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUdZWHN6SURXcEc2b2l4UkhrckcrZHQrVklBYTUzNUlKelVJWHFkeVRHVDJF?=
 =?utf-8?B?V2FRZ01nb2p3REltR01NWVlkK21VbDdaaGVyZWxBSjBYSVArajJieWZGKzFa?=
 =?utf-8?B?UlpZTU5pT1VNcFY3UEp2SCtsMmRySXo3RzJtb1BIdHpkL1dJTUtaVUJsL2Jx?=
 =?utf-8?B?ZWlDVVFuYzM0L1pKWHB4OHFjWU5HZSt6d2RlQU9ZbzlsWUYvalFUeTk3djNw?=
 =?utf-8?B?RjVSVjY5QzRLYWlhUEdtdWRzQ25TaXdqY1pFMktQRjR0bTFqNnZYNmZWT2lJ?=
 =?utf-8?B?ckRZUnFabkllUk1nLzcrK0R1OG1uMUliMmxZS0laRmtOcHVGdk91NzdSOW1u?=
 =?utf-8?B?WU9lNHR2amRmUTlyZ1FmeDZwVzRTK1BLWHJ2QTlUOElKWWNBSG5Rd0Q4OWQv?=
 =?utf-8?B?b1J2ZG1nRkZRZmpYOEVJZTJRUkNHenZDMytqODRGeXdncmZVTURzQlRQcncr?=
 =?utf-8?B?eHFXalczek8rQk1MeGN2cnBIcmN3OGN5b0lUVEhWeG5EM1dRdlFTcERnYVVs?=
 =?utf-8?B?Vk9uU2FvNk5hbEJWYkxDS3JWZHV1b2kvY0VkWXplYUt5ZHVQajZvcVdia0tz?=
 =?utf-8?B?cFE5cmhJQTdkTWtEOThJM3MrV3psZEVKUEVsV2c5aENBMm81bWQrU0U4blRD?=
 =?utf-8?B?YnMzUjFVNXYvdFRmUlhvNFltaHkxd281cnEzOTlNZzBDaVpFS0tiUjFCZU1F?=
 =?utf-8?B?aEZYU0svaXRXT0lUdklBdGkxWm92L3BMWlQ4MzhBTG9PLzV5ZlNGdlJ1Uk83?=
 =?utf-8?B?VHZ5aWk5WkVKR3JJcFI5QzJNdkpydW1GL3RPOWp6UGZSUkVQUFE2bnBPLzFv?=
 =?utf-8?B?MS90eTRYMHlrbDBKQUxkNm9wN3dQN2lmYVp0SG5jSlkxZ090eE5EQWdDL0Jp?=
 =?utf-8?B?TjVTSCtJNHhMbk5lUFh1RG1VSzhPSHJ0d1BWZGRDMHFlR2RIalJBRFFyOStz?=
 =?utf-8?B?T2NyUGlydStzWXNOend0WVdHTTY1bWpoampIcmJqaVRPZ2pPb202cFZNVlhC?=
 =?utf-8?B?YVgrM2QxVnRVanJrOWFOVlFjcC9ucVdHQ2k5QXJCVjc1cVVSTjhaT2pydVpk?=
 =?utf-8?B?UFZ1a20yQUg2N0ZPVjRqSVNiMllRMXRhVXVtWlRjMlhiLzJtT29LVmFTSXVk?=
 =?utf-8?B?QUdHSXNLZzVGYVpyanBSU0tDdERoZVNwK1ZTUjNoTVVudHFSdUxFTW0yVDE1?=
 =?utf-8?B?a29MdDhsTXNPcm1QbkJjODFKVWxPUVhJVWFEK1U5eGpCVEEzeTFRWlhiMmor?=
 =?utf-8?B?amJxOTFCcE4xZVlkbXZtODF3QXpjS09ya1JpTFFYSXorMmtyeUM4b0hrQWU3?=
 =?utf-8?B?MmxpYVl6eVlBSkNjcklhQzUyUFdVTXllTDNzM3Y1QlN4djhRV1NBaVRaYmZ0?=
 =?utf-8?B?MWtvM3JNb3BZcjA2cjRld3UzSC8zTU1TcS84a056clJHeUxoUWxzR0plcXlt?=
 =?utf-8?B?VlpzZk9xeXE5RGI2ZnRwQ1RFVVJYZ2hGZHVQZHM2VnJLVnZ4Z3FCZzY4ZURK?=
 =?utf-8?B?Ti8vQVFFK3FRRmRQVW5YTVFVcGRFS3VtckRMVjFxL2JvV05yci9pMGxwbllK?=
 =?utf-8?B?OHowRFpZaWNUU2pGTEtsU3JwNXorQ2MyaWJKcXNuSE9GSzc3NC9Mb2FLM3pY?=
 =?utf-8?B?OG1WMGhTNVZ3TThRK0hlM3NHbEEzNlJxWkhQdlZpandjUlIvTFdOMFJYZjdp?=
 =?utf-8?B?NWZuZnRDeTBMQTBSMkVUaUFrK0RHZVRrUUVsZzcvWXNCR0g0VEFycVkrOGNp?=
 =?utf-8?B?alBnTXlFd1lTeGtoaEN1M05tamVUNEhGUVhWZHpPKzY3ZjAwcHBVblBJODg1?=
 =?utf-8?B?WFpQcDdQclZtMXR6N0Q0Y0lCL1VIREJtQ1dLMVdqQXZuL1laZDhEVFY1N3oy?=
 =?utf-8?Q?hUo1gUo7aK34m?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5ff805-18d6-4eae-ecd3-08df423c03bc
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:43.9786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 09/14] package/gstreamer1/gst1-libav: bump to
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

Drop the FFmpeg 9.0 compatibility patch, which is already included in
this release [1].

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/fe4bb54ec4247882dd7c99c8d413243a2458311a

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 ...t-libav-Fix-build-failure-with-FFmpeg-9.0.patch | 72 ----------------------
 package/gstreamer1/gst1-libav/gst1-libav.hash      |  4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk        |  2 +-
 3 files changed, 3 insertions(+), 75 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch b/package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch
deleted file mode 100644
index 31899e0a48..0000000000
--- a/package/gstreamer1/gst1-libav/0001-gst-libav-Fix-build-failure-with-FFmpeg-9.0.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From be9bdb67f4fc868977f1f74e95b6ebe19ef792ec Mon Sep 17 00:00:00 2001
-From: Reilly Brogan <reilly@reillybrogan.com>
-Date: Tue, 4 Aug 2026 12:09:11 -0500
-Subject: [PATCH] gst-libav: Fix build failure with FFmpeg 9.0
-
-Closes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5251
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/12217>
-
-Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/be9bdb67f4fc868977f1f74e95b6ebe19ef792ec
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- ext/libav/gstavviddec.c | 15 +++++++++------
- ext/libav/gstavvidenc.c | 15 +++++++++------
- 2 files changed, 18 insertions(+), 12 deletions(-)
-
-diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
-index e21f3e1558..39335d98b1 100644
---- a/ext/libav/gstavviddec.c
-+++ b/ext/libav/gstavviddec.c
-@@ -2677,12 +2677,15 @@ gst_ffmpegviddec_register (GstPlugin * plugin)
-       continue;
- 
-     /* no quasi codecs, please */
--    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO ||
--        in_plugin->id == AV_CODEC_ID_V210 ||
--        in_plugin->id == AV_CODEC_ID_V210X ||
--        in_plugin->id == AV_CODEC_ID_V308 ||
--        in_plugin->id == AV_CODEC_ID_V408 ||
--        in_plugin->id == AV_CODEC_ID_V410 || in_plugin->id == AV_CODEC_ID_R210
-+    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO
-+        || in_plugin->id == AV_CODEC_ID_V210
-+        || in_plugin->id == AV_CODEC_ID_V210X
-+        || in_plugin->id == AV_CODEC_ID_R210
-+#if LIBAVCODEC_VERSION_MAJOR < 63
-+        || in_plugin->id == AV_CODEC_ID_V308
-+        || in_plugin->id == AV_CODEC_ID_V408
-+        || in_plugin->id == AV_CODEC_ID_V410
-+#endif
- #if LIBAVCODEC_VERSION_MAJOR < 61
-         || in_plugin->id == AV_CODEC_ID_AYUV
- #endif
-diff --git a/ext/libav/gstavvidenc.c b/ext/libav/gstavvidenc.c
-index 2ae6a1b451..b8e010e70c 100644
---- a/ext/libav/gstavvidenc.c
-+++ b/ext/libav/gstavvidenc.c
-@@ -1025,12 +1025,15 @@ gst_ffmpegvidenc_register (GstPlugin * plugin)
-       continue;
- 
-     /* no quasi codecs, please */
--    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO ||
--        in_plugin->id == AV_CODEC_ID_V210 ||
--        in_plugin->id == AV_CODEC_ID_V210X ||
--        in_plugin->id == AV_CODEC_ID_V308 ||
--        in_plugin->id == AV_CODEC_ID_V408 ||
--        in_plugin->id == AV_CODEC_ID_V410 || in_plugin->id == AV_CODEC_ID_R210
-+    if (in_plugin->id == AV_CODEC_ID_RAWVIDEO
-+        || in_plugin->id == AV_CODEC_ID_V210
-+        || in_plugin->id == AV_CODEC_ID_V210X
-+        || in_plugin->id == AV_CODEC_ID_R210
-+#if LIBAVCODEC_VERSION_MAJOR < 63
-+        || in_plugin->id == AV_CODEC_ID_V308
-+        || in_plugin->id == AV_CODEC_ID_V408
-+        || in_plugin->id == AV_CODEC_ID_V410
-+#endif
- #if LIBAVCODEC_VERSION_MAJOR < 61
-         || in_plugin->id == AV_CODEC_ID_AYUV
- #endif
--- 
-2.47.3
-
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 57416e4ccb..112feedeba 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.13.tar.xz.sha256sum
-sha256  150e2b70588fa32a1294f42665756f2175417ce4b5988e2c2081b683719aa6c1  gst-libav-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.28.9.tar.xz.sha256sum
+sha256  4b3df21fa70972a80891d2298cf32c14a62c3db4483d545c7ac018230399186b  gst-libav-1.28.9.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index f01ca0de45..548b78a2a8 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.24.13
+GST1_LIBAV_VERSION = 1.28.9
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_LICENSE = LGPL-2.1+

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
