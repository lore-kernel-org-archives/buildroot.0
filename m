Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B5C606A336
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M52fx2vX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=jcKECKtj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B752560737;
	Sat, 14 Nov 2026 10:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19ZUU4i6FSIR; Sat, 14 Nov 2026 10:42:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE380606BD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652965;
	b=mNx5gW33BvuRF9k53m52z6M0SDC+AoJ8Y2+xelBvvuq8nd7zeBnxS3TN26+okmI7X5tC
	 WdCopL0nAanqkTRbJiu84VyX6z6EUBVTzCs3OnYWBdU832zHFLtC7DKA+sHpGL7p26lAm
	 EY+caJQc///fASyehDCuCBKUNX4YpChKLLxK/WnRnsUilMVGS/l1GXmABsqbFODbcAQc+
	 C0wNgjjN3S6hjR4m+9tQoM/eJ6g8kQ1Pz3izLgXYsJAg0JNxwYS54V9mOgowWgo7U/g+Y
	 n0Z4PhK+MDNkK78tNY1LF0kxLv0VzHxke5h4Js0C0WtTr4ovwYxdPZTDIAfFloeUjqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652965;
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
	bh=Fdunmeky5yc0IuUePbc3iTSwo0yojK6kmLSD4Nsz9sI=;
	b=Ay6zz/zu6DSAAjHgrIkA0MU1UHrIHHxVmUNH4tbdyzAxXnH8GBfrhRsdt92B4OZAkkSu
	 6yKKvoOM7m3pbL/QNHjhPpRV0SFVkTTbOR9gagP8Z+kUzXzpSp6ktERAvFPYmeGFAYD7B
	 E0ZtHDkdJwpFV0kpsDPSIlfxqPPjUw1edomLZF3GlCAgRizAvCnANkPW08kjXE3PfCV7c
	 s+J75/Gjv0yuqeCDI0FgWl5gdx7plijB/UMACuskxTTLhJLI06ek2Ss8HKDHrhiQmtFvl
	 +DBUdmGeS6xUqauvUvsPHlkuZJQV04stqS9cIUZ+Lcc78ZI2jKC2zLDRZ5wOt9R/FCw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652965;
	bh=Fdunmeky5yc0IuUePbc3iTSwo0yojK6kmLSD4Nsz9sI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M52fx2vX31n6bC8+TFJey0xLaRUVIxb/JW4JwEG82XTb2y8Ze+duKmWDVEP5gt5yG
	 gx1vLq7e65b66oZjW61mb9m9wxy7schKRd9s1YLQhya6Qh2L7rzo0ZQx+UXvCjR/My
	 3HVyubhzSBXYIR30ghouIZoRHU6UQO6coHGDpHFHK+V3vfR5sBp2VuMKfOaoexrKVW
	 lpWcGymRkLNKgYq+30QwsPhkoS/uEZ8+vrLiYM5Xat8Vg9ixRz7/dlEfgV6P4tkwiZ
	 niBL1uN6wJ1uHd4zfYz/QPHpswRXIBHC6AbBgdl9F5QjB7d//c1yi7cXGb3d6LL5+a
	 L2VdjG5DZRujQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE380606BD;
	Sat, 14 Nov 2026 10:42:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 820AD70B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EF1481C38
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzeyVOIhmVrb for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B16281801
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
 header.s=selector1 header.b=jcKECKtj
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B16281801
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vohJWorjPOK/qUej3F3rxVAjyLymEA6KgzJVAxZz/U=;
 b=jcKECKtjGIfyamwJbVOe0TPrXdsqUaPJwXgOl0nyFGl8AFOHmFvgOaFD8TC5InQb6dT0a4QEJKYLorY147EtPKRYUJJyMs9Tafgfz0rfgXOBQRU73F+arBk3+GNBkYdp2Vj2HjD/SXsHoP2/SJvuHMZyc4KvFEhI3Bti2/Scy4YBVQFHKPKDxFqDnvAr+UFfal/MP7YihkAJmesQ3aO7qAzXgkfSzH8uJ/GxnoCf5OMBRwCfy6XVt57dlpUBpNLo9fpSh6dIxBFNczgv4BNt6ASLvuRa+AugQJM1ht7grXqjGjA23nvBZ9mLgRbXywmzzSYKWDxKuwLdQo2Py1ECjg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:35 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:35 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:24 +0800
Message-ID: <SY8P300MB0041542388570B734074A4D9B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3836; i=tfx2001@outlook.com;
 h=from:subject; bh=+dj2/Nxo7W3G8WEmuS7dt/RlqwGYTTqzl7P6iHjrDhE=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+DpZjqx3WqPUU/HXAs8RMMozZIh2WTmJJ2v3G
 9KCXuuRwWyJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6WQAKCRAcD62l0/wL
 2p5fEACScrjEnoMQb4L8+36eYtaiGH96RMaVQyYaNjlo4bvN3nz0ySnE0QivSisqwAtFaUfqKDo
 3XrjiURZUWTfes2lcPvEzAVss5eQhDVzBzFdblGtmkXXJfsygwA7u/BiFbkNKP46JxYPyfE7E+s
 ri/wFoTbl0x06WTC/m0fPQtdj5aPw4+xFU5XCUfpm4p7zd1yRp/iSWfd7ytUelzbFJZFCPyAGLa
 sP1OEojXTCmn1pOqdCH0NAlNUgbSTZlT69tCzH6VgC7u4leBl+e6Tr8FRDldrwlxgrBHyAGWe1l
 0zFcxVfph0iWQbo1e7DaqBBbrOAl87ExnhDOyMRS01YM3tolBgsD+dzFOGHws7dMHeleIVgnfQq
 dKZKYvDcRCmb3G+D7unPEjZvYXA/fL3+JBfT1c46+3oR2LTpHHdMnkXWM+Rm6mA0rMf7CYDkLOv
 b/kLLEQonG1LbyWjQk3eUsu5qgsOWLXVnLbahik8qwOcTmdPchbcyLLztXAlax9tmwIgvDE1+3X
 x5P6COoyyLMK0yl4O/nIr5QYCBVpO5CbnI48ytE15ot0cBU+j7LvG0/0GlKMX7fHSTzbJfNEdC5
 dP21hzPdEGHpLlT4zvafk2hJFU+jHCjX9Lw8y2J1zSAoz46eiGVe9f70/qVidLioVhdwjPPwbWg
 cMFuhsIIWmcfdaQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-22-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: 85696371-24a0-4818-c0b7-08df423bfeb5
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R210V1R0V2NBeXlBZDBjU3VqYmp6SzQzMnN4K0U1K3V6bysvcU80WnZsbTVD?=
 =?utf-8?B?T0V5dFREdTZtSis1RDNHNkJVTFVBRGZjbnRlVXpYVWRKaWtucVV3eEVBNGdZ?=
 =?utf-8?B?dHoyQTM5ZU5oakVlSkJiMGVlSkdtVVZLZ0hteXZ6ZzBFZ1hHUkRqZUJKS2FB?=
 =?utf-8?B?azJsY09sTG9GN1l6MmQzT2JtaS9jUFFGWGdWMER3Z2t4Zm5hUk8zU0JwRklU?=
 =?utf-8?B?Qlp3c3pWMmJvazdCQVMvaHZZVUFPVGNpYUxTOHNJMmVqekN6MFU0M00wdVpN?=
 =?utf-8?B?NmJKSGtQSUtDSllVblAyZTNOTElDbDhONlR3cmo4QStpandnaHFMcTAyTkN0?=
 =?utf-8?B?VlQ2RGZWSFRYWDNJS1V1QU9YaEZkRnozdXJwQkk5S1RuUElBWXM1VmNELzBG?=
 =?utf-8?B?ajh2N2QwbkVwbVl2RHZjS3pSOGY0S0tVYXViN29KRzhzejUyMGs5cDNYZ01R?=
 =?utf-8?B?TzNBUjlGeTBDRUNCWUZsczVaWTZCK0xVVWE2OVFHdkEyc2FiWEQ0VnZLMVdP?=
 =?utf-8?B?aVo3WnJDTExFVkMzS0FBWU5jc1dza2Y1bmxnYWRQNlZ6NndmQ25reWNsSndB?=
 =?utf-8?B?aGpqRENrT3pKM3VSaFg1UFlCM2RHT1p6ZURjbTk5amxTVWxhVmFzNGpjek4x?=
 =?utf-8?B?c0twMUJUVlU4Y1lGZUhidGthZWxFcTRzbW91dlZkb3FIVTU4eWkxLzBkU3lS?=
 =?utf-8?B?MGhzZ0NBOGxkV0U5WmpTSjVaQjA3NjdZWXRRMDlRb25wbU9NUDlBbnBjNzJ1?=
 =?utf-8?B?RWJFc2Z2MWpmRzBobjlLSkw5NTYzWUozeVdYNmlRM0V1N2VxbXFSVjBoQXRT?=
 =?utf-8?B?eVYrZld5elBRWFMwTUZSdlAwd1RHQTNseDJqTXgxM2wzamN3WmYyL2U3dGlL?=
 =?utf-8?B?bFlMMjN5dklqS3BJYnR2SGl0ZDJ1Y3phd1JLRlpzZUpFOG9FbnhDMEtuSTFw?=
 =?utf-8?B?TzRDK0JVelp5TlBQSFNaRVNRNGFwbFJ0b0FkSkRteVpzUTh1SUNhTDFvK1Jw?=
 =?utf-8?B?cElzR2haYmVsRFh4ZHIxamwvbjlkc1l3U0dIY0FBRU1nMzNPWG1aV0R3UjBS?=
 =?utf-8?B?UnRsRFBiRVl1RTlmUEFuakJ2ZTgvRENSS0lmSzRLUHhMaGtiZitvckJXaEt3?=
 =?utf-8?B?bjBqV0Y3TWZ1MkFaREl1RG9ONjdFRWx4ODFIODBXVWhpVk1NOEh6S25MT3Nv?=
 =?utf-8?B?dHUxVlRPdVN0bk0yWFAwWlNzOWl0dHJWU014TlBYRDE2ZmN4YTNhbXM5S21s?=
 =?utf-8?B?a2w5dFNET0Y3Z2JYVjNCT2k3VFU0UGJhVEhUNzdVK3N6SStBdHJnNWQ2WnlF?=
 =?utf-8?B?RHpNclQxN0ZtUVNSSmh3em5FMUp1eW9XVS9Kdit4WHBhNjRXYW5LbzVRcS9M?=
 =?utf-8?B?YTgwdm9jQWx1K3B4TGR5eVo0YW5RaVdCY0hrMlpCUkduUWw2bU05dGcxWTU4?=
 =?utf-8?Q?MrHSSoB6?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3NaTkw3SmlqSGVQRGxuNmtsMy9lS0NHWmw2Z3FnZUYzVG91Y3l0bTNIVC95?=
 =?utf-8?B?Y0QzNnhOb3o1cDZRQ09aU05DQ1BWTGRMWmNadlhTeUZZckNiSk1qVW1GTlJB?=
 =?utf-8?B?MUFzdEkxSU9SS2FCVmRqSTkrdEU3TWVVdUdUVDdYNFFCYzlYb0wvclBwWkZJ?=
 =?utf-8?B?VXVnWnByVytTS2dZaHB6ZUNVbmhjak1YOHE2d2cwR1ZqYTV5eHBNcTNjeC9L?=
 =?utf-8?B?NVhNaHVoOVF5LzVYZGRWdmtVQm9PZXd5VENKNUM2aHJVZ25UeUZYUHZVaFZp?=
 =?utf-8?B?L0hCdlBDM0ovdTR0KzI3RGNoSnV1Yk5sSVhKRUFnZnkybzhLZnJNOCtlUHRC?=
 =?utf-8?B?YWE1ZFNhdkpUNjNDWEF0d0p2WDlpSFFVdUYwWW5Wc1NvRjlHMUJ5WXRHYS9P?=
 =?utf-8?B?NnlCbVREc3lPNnhha2NUMmJtQnRWeTc1a2s2azRaeUhCLzRTMDErZHZsdU5Y?=
 =?utf-8?B?QzZsNXZoUHhMd1hEbExRVGd2TGNOd2xhbksveEhpYVcraE9YcEt1RUp3RzV2?=
 =?utf-8?B?OEE3OVdaWHQ0Q1BwU0MxQ2Y2M3FjRzZMUTJHNXo4Y1JPdmwyTVMvMno0R3Yv?=
 =?utf-8?B?TiswZ1Z0Wm4ydnFMdkFYMFREbGdWMDF1cjB6WTBGdFNsQ0s5Qnl4bk9WemZV?=
 =?utf-8?B?RkpGYXBKelRaRmlnUTI1cGdPZVhkdU1vcVp2VFppelNFRzVpRnZTRWoxWlF0?=
 =?utf-8?B?VkRQKzBKakFwWlJFQk9sR3d0S1VvbTQwbUkzUlZUc045aXVhMUlLRjR3L3Zr?=
 =?utf-8?B?MTdObVFLSEdDY2toL25NdHJGcTUrOUFyM1BWSXRnOEtKano3anZibWtJY2pX?=
 =?utf-8?B?eHErd29oVkU2Mnl0RnVCbjFYYUdOZVgxbzl4SGNmZWo3aGRRRjBpdjZ3Rlkz?=
 =?utf-8?B?UlI3VWFybURZMG9wcHJ0UlA0VVpqdDZJMUJsc3pjNEV3K3NZazVVWjVsak9r?=
 =?utf-8?B?ek9RUlFHd2YzYnd2UzRhMGdjU3haNzFXMXI2NGFicG5nZjFabSt2SjN1Wmsx?=
 =?utf-8?B?OHlQUDNhR1QyTEVhcW1IVEtzc2xUOTVybDREbDU0dXZuckNYRGVMVjZBUGVo?=
 =?utf-8?B?R2JqVVdlNVZGeHJoSHRDTUZycGRWZmQ3TlY5K0FhNzVkdmpZcEZiS1N6NmtZ?=
 =?utf-8?B?SVNnZ0IybDAvL3JZWHUrdGptdEdjTDAwRlpwSWtlVnRWdndHZkNKYVRwb1JY?=
 =?utf-8?B?eDYwS2ZTTFBuY09HMzdZd3dCWm51bkJ3L0xxaGdwKzM3ZWRZazBSSDRMZmxG?=
 =?utf-8?B?RW9BSEpMUy9jOVFZNGNQbFRmTExQTUlEZW5IRWhKbWlPNXlHTzdUbTVhZERB?=
 =?utf-8?B?ZlJDMWV1cFdTZXZzaHZaVjdiSUVHOFR1ZHBXT1VsUmtqREFEdWJvTUdUcW90?=
 =?utf-8?B?cW02YmxHNDZJaWxObkhDaDdhSU13MTBwN2JFMWZZL2RVZHhScWRRQXFyZ3F3?=
 =?utf-8?B?TlJpSWkyaXoyZEpxSnVjZ1pGRDA1alhpSzc4aW9nNWNzMCsrUzRBM29Zczh2?=
 =?utf-8?B?YjJlZi9qYXd0OS8yV3A4d29rNUIwUXBZbWZEN2lBY3ozNEd1dkgwU1BqcTZq?=
 =?utf-8?B?NVdKN1dsS3FiakFQb0YvS1UwcXBtMHVIQmZZUUJNdFpnZDl0ZzdoaVlyNitm?=
 =?utf-8?B?M0FYaDVxQmx3cUF1SzJETUd1SysvZ3FKUzlMUHMvVnVFQWEyOWtRL2tnQnlq?=
 =?utf-8?B?emJONG4weUNuTkdrU3dwZVNGU3lDUWtLRlBqdC9heDVsaldCNml0Y3EyYkRW?=
 =?utf-8?B?bDVjMVhXWkcybHNRODBOd013N1FCUkFqbkVwWnhROElFRjk0Z2YvM3Y3cjZF?=
 =?utf-8?B?RGNMOFYzTUE4TE82VU16SkFqM1pmc1dlM3NXUHFRNnVoalBqekZNZ1MyODZr?=
 =?utf-8?Q?ER0GzKsd+X2oA?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85696371-24a0-4818-c0b7-08df423bfeb5
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:35.6886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 06/14] package/gstreamer1/gst1-plugins-good:
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

Replace the deprecated Meson options with glib_debug, glib_assert and
glib_checks [1].

Drop the explicit -std=gnu99 flag and use upstream's default of GNU C11,
with C11 as a fallback [2].

The y4m plugin now also contains the decoder moved from gst-plugins-bad.
Update the Config.in help accordingly [3].

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/84b3a0950debc467ce25aebdddd0d827e658252e
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f022eba452dc04d1cfefe4860a5f89bc261e194f
[3] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/16d34468fbd46dee295e117d3c300c5259ad7070

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in              | 2 +-
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 9 ++++-----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index c4eb4efb65..3d595edbf7 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -254,7 +254,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_XINGMUX
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
 	bool "y4m"
 	help
-	  Encodes a YUV frame into the yuv4mpeg format (mjpegtools)
+	  Encodes and demuxes/decodes YUV4MPEG streams (mjpegtools)
 
 comment "plugins with external dependencies"
 
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index a8b17f3d0d..e19e379aad 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.13.tar.xz.sha256sum
-sha256  574ac6f9fd84b32eb04e80572391d6762df6f9802a47bc0386cd6cc48c14d08b  gst-plugins-good-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.28.9.tar.xz.sha256sum
+sha256  e518cd97483706a252e95e60312a22d23dec6f5e7673af6f5bde719c3a9ca7f4  gst-plugins-good-1.28.9.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 1b48d83c8b..8428d82460 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.24.13
+GST1_PLUGINS_GOOD_VERSION = 1.28.9
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -12,15 +12,14 @@ GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
 GST1_PLUGINS_GOOD_CPE_ID_VENDOR = freedesktop
 GST1_PLUGINS_GOOD_CPE_ID_PRODUCT = gst-plugins-good
 
-GST1_PLUGINS_GOOD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_GOOD_CONF_OPTS = \
 	-Dexamples=disabled \
 	-Dtests=disabled \
-	-Dgobject-cast-checks=disabled \
-	-Dglib-asserts=disabled \
-	-Dglib-checks=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Dasm=disabled \
 	-Ddirectsound=disabled \
 	-Dwaveform=disabled \

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
