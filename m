Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E81606A31F
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TkZaPoam;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=E4H9wNU+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC3860D65;
	Fri, 27 Nov 2026 15:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWLlDpePEa_m; Fri, 27 Nov 2026 15:16:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 55DC560D5F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792577;
	b=jIGC/2Skr2ij5/BFYDJycwW5cALpTPEDYJPZ9vOVPtMUi3YdALlIBmQTtsOkij1voAJf
	 K62wACM1FqM8SVKUXTRKHd/o//FOGvUzLPVtQsKphbn1ZjvbKflvkKt7b7zaa/X2sWaAv
	 pX8OimV5R93Qe02LDXKoqduW0d8FR18ZoIycZW7Nvp108q2m4wgzWSoASGA04jLKDKXv/
	 94bmQ5opoLdwJRh6CwTHkuW914tUKUaEPAKrnK2PNWa7AK0YCAflLVpHypPh1HK7uUMBG
	 lPvf1wcO6JP+xiGBnmPOUudlpMMAhY2VxnLhaiAI1aRiUYhWyW6OaOtfhM/tnrSpKHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792577;
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
	bh=cPC0eM6fCwXyHEYZaK2aADOX2gXrhDVG0uTwq/l2LRc=;
	b=pCLM+KkwmcQEqZq60/MUtmGCVNOR4B3pg+/cW6LRepl7ZrmruzfwhaXTfZnLgBNLjckA
	 6btyJ4hy/uGd9VJHBbESq8VqugzpYDF+Lxl4/TV6yjFEPxkl1gxZD5ld7gBADYbmF7Hw9
	 4ziq6xANQM649TaCpcKmpTCztSt+Ojpxx+nQp2sstBjav03MRX5Hk+PJFq95gUwzSw7ze
	 L/0uI6NGYhCN770/w5qZdrQOY46b2K/uv4RAQpHGK59S5nF8VFyrnYlzAUw7pRn+Ox+cx
	 hUIJpWgCXBQJMJmr+RIFbymD7URV1WKvC6ip9HucyCKBh86i5KF2jVDvh1Hasb7CgcQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792577;
	bh=cPC0eM6fCwXyHEYZaK2aADOX2gXrhDVG0uTwq/l2LRc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkZaPoamxBltm1HlOimiHEABMqPcXJMdGA4b0lqpigCpeuWlqsHVgAf3wXGqtQWCR
	 jycYqOs4gv3HpMQs/8LMyqRHC3a/P6/q/BGO+aQrWiwozgHeTB2RWnvPq++ZU3CRfA
	 8MjcGVvTPjxH6/4UTAusvZKKfoR/S2i8gKSQcL7UOs5rq4SWUq1yF+/RpAQ9DP9Bg+
	 AkRick+B++1wOTYLUHCt5csnJJ0fKfwMNO8aOTQ1TFE0/i7VR45ZeP0hUoKeezGNrA
	 fZtrJkg59dafZqhpN5z9hB1wW3feccRGt2g6y/HP1/5uHMQz3xQsBy3907dpPb3ru6
	 vN6FgyHWeb1cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55DC560D5F;
	Fri, 27 Nov 2026 15:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8956A373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76A4640925
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzaIDFAuVRV2 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:16:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6279C4091F
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=E4H9wNU+
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6279C4091F
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH/ztHXnpBvFlC9ZWRkIyWxaJ39Od/c/xVzvrXu+S0E=;
 b=E4H9wNU+Kd6JyFb2dGgVEknNsJh5I2ZFBIShHywGBYgAaAVNfMZlAdODfI5/4q9QE6LOZKJn57V+uek9MZKNULWT7MAiZlSWuTVG51+5jbcGNiwULa0xy48a3l0QY9iwtdjl1omnHDW2b6yKP5ScQwUpnl29DA+NcpMHp+fsms5+3UV2+PjpiiI5eZCffJXPJqQxB0SYoymK8zF+hLG6+n4l+nfQlpW4+Tv8DMwHtxdz61PzpynwgSf8TSLT+znRKaF4K/cy4x4cQt2aZcIdSnDGod/Ef8o7AJax+tKRJGzPwXbofKeiWYEFK8AOLKihNXTnV3gbOVbMYFmYF8izIA==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:16:08 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:16:08 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:11 +0800
Message-ID: <MEUP300MB0045F4051E4E0F5A4E64D529B5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299; i=tfx2001@outlook.com;
 h=from:subject; bh=EvjzkVaQmYSYrged/PxzRzR+6FUSxFGw2cV/HBjD0pI=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ5AHAeKMhcGp5oGrgyYaZTmK/ArIispd/14V
 BYQOUB5bsmJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmeQAAKCRAcD62l0/wL
 2i6JD/9UT6aL2O1dpwQrdJIOwyUsWNQgzLmqT7Yv8K76+Exc7bhbvp70qw3wgePHYz8OqJzTQGz
 HarxhGFpbJY6geXBFRPBbjdorS14rQ2ReTC85d8y8Pf983S9dR6i5a9c+IIvMKfpn4vjsebMO+X
 rb7C7Dh5y5XC0ES1pMyWcvfkH9VVgBoEVHTOUF/tDKHxSzxPBjqsu/whU2dOFONt35z5OcQAhJ8
 QIzy4585EQ7nUBxkba1vpnmmFIHTrbyVI+r8f21y9I/qthf2EGI4Znw9ytn0cMaYKjeOCplhJQS
 7TAtPq9PrXLyV+TwRH90bnSafHOLqW639rJCejOw5SSbkKqODalF1PNoi7z8Wsn/ZgiIN5pELQN
 Cj3p6xR1x//Dlr3OIkt5Xs3nkxdBjCH8rHQ3icvxTLrMoXPIcIBtKqYNBFnx0KlNH+gnZeZVjpr
 qb8vcM6s/gIHtXh0ZNrLQ5piNqSthYRpfl2TlmgJuTzs5fcH+lIzRPraN8iip2mX8mXCxOmVUYd
 lG7kTmDyDTp1nrbpt2DLnuO6rTmursLd5t4+Q2GqS6xMGRHrlTDSwQTAjln3JllGeoCpcKa7AxM
 N0wRdhXqd6Duyif/qrBPCs5prw4PCLDwhXsZZWxN6IhVOlb5dpicK3l41WoIkoI3G1fztT3S8Qz
 PQLVf4+ciwvn8Ew==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-25-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: d394133b-17cc-42aa-1dbb-08df4c995cbf
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|6090799003|15080799012|23021999003|41001999006|5072599009|24021099003|16051099003|8060799015|19110799012|51005399006|25010399006|260925184616899003|26104999009|4302099013|3412199025|440099028|1602099012|40105399003|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGhDdTkvbVdlQks5algveHVwQ0VSWHY3bzdVZnVjcVpaK0ZkcHJxL3BOR2Rh?=
 =?utf-8?B?UFZtNEQ5eERKUk9Kb01BVlRSelJsUEpENkR2L3pvM0FYZWVQYm1RckEyUWpz?=
 =?utf-8?B?Nnd4Smw1SjVTMFNsaC9zc1hRMzNGaEtINkdWNEtldDRhWkpveGR1Rk9jdFVJ?=
 =?utf-8?B?VGtWOXNrbWQ1L2plMkhFb0wzNEFrRjZRcEtTKy8rUkhTMG5GeENtZjNCbEQ4?=
 =?utf-8?B?TzJPZC81SnRnMDFWcEFRUlhQVEhkUTY0Yi9kSDBTRnVpVi9sbTU3TURlT0RW?=
 =?utf-8?B?MUpjQXkzaHU4dHJzNzl1OXIxOVVZUVVNRjR1RlY3MlE2Z25BRG1sSERJU3hK?=
 =?utf-8?B?QXoxejRSWE9adGM0UndKckYwTmxEdmU2aGQ1Z3Z2N1pIWnVTV2s5Wjc1UG5U?=
 =?utf-8?B?eTVZK2RyeTI3U0pnaFdicDNTcmZxRW5FQUwyWmtENlc4bmFxeWhVUTJSVFJy?=
 =?utf-8?B?bXY4WmNISmh1UTNxcWFSSm05d2w5Qng2UnErU1dzdm5lWE14dXp3dkNLZGVM?=
 =?utf-8?B?NFM1UEZmYktVNG5zektLdHdYclNkTlU4UG1XVThJcVlWQk43cWNOMlV6eUZz?=
 =?utf-8?B?UGpOMlhTOS95cHVoaE03VG5pbk1ta2l2dnJHMjRmeldwcWJ1S2xpZmJoWVIr?=
 =?utf-8?B?b3JuVGtZZjJvNUJVYy9VQytXRFRIUkNVYk1kVHlaZFhnTmsvbUpraHMrNmhE?=
 =?utf-8?B?bGpQeS9pYVJNZkJKajU2Y25rNkJzbWRmektoaUkzZTRwbjhtNWJaUXVyRzdr?=
 =?utf-8?B?L0pUUytNdUtMZkNKQTEzZW11TEVtV3JwZGwweUZhdUNGZ1VXbk1rNGJsTkph?=
 =?utf-8?B?M1lxNWJmTDlmRVNrYW9oMHBKekl6dVhLd0o5ZXlXaURzTDVsTkFZbE5hYWlS?=
 =?utf-8?B?c0lrb0d5Skw1Zk5DdC9hNjlDTVo2eUoycFlRSytWd2UzY3FLSWd2L3A2V2U0?=
 =?utf-8?B?Y2pBazRUYjNob0JjWXdZSmdxVExMV25SbXllUmQ2RVZDMEdma3V5TVU0dlNp?=
 =?utf-8?B?SkxXT0dPR2JUM1JjZkpHNlVyZUxIVGFEcTg1a2tOT1ExTGMvNW1hcXpnYUZ2?=
 =?utf-8?B?Z3VsdWwvQjV0OHUxSWtTNEVlME9Hc3JubVhVSTlDMGRQV0FFYkZkcUxkVjR0?=
 =?utf-8?B?ejliMTZGVXFQWm1rdnFFSGxjNnJuUDFLQm03am52ZjlJblAvWGFMTVJRVEFX?=
 =?utf-8?B?TlZRUkpVTndFREt2RnFQVTdzcXdRVUEzc3VNaGlvczBQQTM4Zk9rWWtsOUJX?=
 =?utf-8?B?RldNeTdnbU9oS2lHVmMvNHNsVEtDTG1nMW44cDFOK1hFVXg1MUtGNU1nSU5S?=
 =?utf-8?B?ZnZ1MkxPN1Y0Y0VSSTZjbzNwM2lDNnlPQlFSUS9DeStBVVhNa3lrQ3dzVmN5?=
 =?utf-8?B?V1EwVlV6YVlqeFltWElPR1UvRlZUaGVXYVQ2ejhOMWRxVlRpRmhJOWJiVHZV?=
 =?utf-8?B?QUNTZXlmaHh2VE1xN2N3RGhvL3NSQjNhQXRLdEdxZG1TQUZBWHVTV2VqbDVV?=
 =?utf-8?Q?gU8jQE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU5PRGQwbmxxZ280dVRBRi9hcGRuVXBnWE1qdWZ2clMxWVcrM0w0cTE4Ymkx?=
 =?utf-8?B?Q2U5bXk4SEc4VFErM0JYNkFuR3hKbms3OWVVVllTYnArVEdwS05LK2ZTRjZJ?=
 =?utf-8?B?a2tnQ3FuTFBSWmZBZ0ZDY0pGVEE4c2daT0tjbHZXbEI1cEljVVhvTnNGRm5Z?=
 =?utf-8?B?S3loenVmbUxQRkdBVkJEL1JUSGVrMEFtbkdKb09YSFkvVGZJdVpzcVN2RmtS?=
 =?utf-8?B?RWw1dGlEY1IvM3hzQUtCZHFqOTkvSmNGZ1hKNk1ySlhpOUxVd0NUZkhleVVP?=
 =?utf-8?B?OFpzM0tKNG1zdUVQQ2dUcjZyUE10VnRHNnJ0YjZvaFA4YitrSGZDckxGbDlo?=
 =?utf-8?B?NWlKamwwSXp5OXZNQTBReDY5RzFJazVDVHkrT0diRVdNYVNESWxVTHVLNmhJ?=
 =?utf-8?B?TlRnQVJNMjFIWlVrQU80S0pyR2FPNXlLSDcxL21UR2FUVFlPVk4xUHdnekIz?=
 =?utf-8?B?QmRxRm84Y2VrRGhadTBic2EvUm81UjJsckIrVVdaUFdRa2t4aEhzcmR2Q29J?=
 =?utf-8?B?NFFacHNNK3JzcFdzSm91ZkpjUUh1dTBKL2ZrbzBlbDRNK2NlNThDUHNJclFJ?=
 =?utf-8?B?c2U3RDExWVdHR1JDTmlHQitxQzlScE5KbmZmZXFIMFBlMFZiQzhBaERjZzdI?=
 =?utf-8?B?RnJCUWorUW5vL1VIdXA3Wm9kR0ZZSzh3YUZHSmdRQ3NtVEtqcjRVaXZWZTAr?=
 =?utf-8?B?aVFtRzRGcXZDNHVIQjltVTNvblJsZ3hLUmo5QzJ3Qy9JQTdxRENGQUdPNGdX?=
 =?utf-8?B?ck1Vbk9PY0VGRGNheW5RWVJXR3hoWU1NUjU1QTlyNW02ZkNsUk1veFdtdWhQ?=
 =?utf-8?B?ekhpU0d5c0w1ekM0Ni9hQ25pNEJXNUZXVHljQVJ0MmRaRlJvVEcrRXNqT2lK?=
 =?utf-8?B?cWdaRUM5bEpna2RJNW9UU2x5VFZxd2RCSGVJbEtlcVZJNk1Qb3RKVnR5bmMr?=
 =?utf-8?B?bjMrcDU2VzVRenFpeDB0dzJ3ZktkRGh4S3NqYTZhZkNqU2lCRmxPUFB6T3ZB?=
 =?utf-8?B?R1NDNnZJU2x2QW81dDh5eVNONkFURDIzT1dJTlhBc1R5K3NHU1RkL1dJMTNa?=
 =?utf-8?B?TlVIaGFMSnpBU29ZcW1xeUVFZDBXNVRoKzZ3c0N4T2pKcS9heTNETkxDeXRQ?=
 =?utf-8?B?enJNRHZtYTROMTdsRWthWUZlVkFON1U3Q0RpcFA2c0lneUJEbjl6bENlVSt4?=
 =?utf-8?B?VTVPaE9VbFZoRG4wWFQvdm83NGJLUG96aXptNW9hL1c2akJ2NlJwS0RaUXNw?=
 =?utf-8?B?MitTZTlWN3dhZ0FzY21WVzU3TzErOFJ1SS9WVFJlZTVpOU1mbTFwZHVkU3FB?=
 =?utf-8?B?SmpUQ3dRZExQeC9IS0JFUFE2T1VJNEpWYXhNNGlhbUswK3A5QlpYdThJTFp6?=
 =?utf-8?B?N0FidjRWZUUxbEpyZE5FTHMwN1lSaVY0TFNSM0ZTcTJDSnFLMDU0R2Jlck9u?=
 =?utf-8?B?RTVGUDlUT2hKd29zUWRsY1RnNnVXVnZWRDQvR09FMWZObnowS0V1WlkzaHYw?=
 =?utf-8?B?SU5UamZqaVBNWTIzZzlVOGtSLzN4RXp5dUMzWUZ0cHJJVkQ1Wi9FcjV5d0c1?=
 =?utf-8?B?UmZwNzk5NGQ3ckoySlBVRmhidU94MVFyS3RXQ2s1S1hsTGVaVFBIak5FcHd2?=
 =?utf-8?B?UnoyZ2xZYU9acGlKWlNWRm56bVh3TFAza3NkRTNSU0xpamNBVXM3M015ODk2?=
 =?utf-8?B?cDM1R1doMlVWRjFXbVc0ZW9UcG9FendBREdiMUtyV21KUkNhZjUzL1pJVTln?=
 =?utf-8?B?d2VOL2JDUmpzVjlQYTlFWFFSaWxBTUNMMTAvRTVDMDRIcnZjTytTL0NwaFFK?=
 =?utf-8?B?UUI3UThUVlJHekxZS0J3d0ludmlIekdSc2Yxd05CcnM5d1lxdjdESFB6dFBZ?=
 =?utf-8?Q?cA99kul+HCrWW?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d394133b-17cc-42aa-1dbb-08df4c995cbf
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:16:08.1854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 09/14] package/gstreamer1/gst1-libav: bump to
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
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
