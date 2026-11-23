Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE01606A333
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H7NUEN6u;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=iTz3k/80
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF2F4065C;
	Mon, 23 Nov 2026 10:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yav5midCxA3U; Mon, 23 Nov 2026 10:03:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DA0A140651
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795428203;
	b=chs+2S0d8Y5qi7VvEXxStG1RzDxmEvEiU8kV2L0JYvCZRU65PIRb3ndy+n1kEipoV1pV
	 6FSV8O8eIbzr0uoO0j/5wZ/RMkMQyCmvfTU7FyQ3gmIF/e7TAjoA7DRHgmNVKTsXsuFrh
	 5mk4ZZ7xtjTruEDln0WV1BGUFdaArz+gcRHtZby3uyxJs3i4BnHynYDRte7MA4mEi6oJ9
	 jR1e9HcgiG4AygmNQvQY5E0ftIfOpvLvYYjZVgK3Zp0VdHFPJXdFvZxpGDDJFdNu6Bgv0
	 VXHQ0Z31Z1uQqJJq4RE5fJUu4BkepbZw3eUPPiz3aw/UnDLD7Qnt7dgD1XhSdFGU5dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795428203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SLBlob-MailProps:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:
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
	bh=pCa1hwXL3bRLuo2GvP1wlzGXtYwYmtWi5Hg30qRj+jw=;
	b=LogiQs4K/NyhkDmqKk4O8M0kLHGwRKAI7cXgJH+2GXDDNl+LboxfjxOKtn6HcU69x0sC
	 n75sdoad4kh7JkdOpfFQxboGsSvSVu9502ExPqjIysADdhrF9HfKnfbNTAB9JBzh4aNGN
	 +VeHVAxTENPSF3dn7hCTY1b7he21c76JUGlMZOGbprOwxmHTZrBNtpa9uqxWYsPcpTp36
	 t+y5W0rfRkyNv51NIIE9dXYtgKVLI56FCvvjdprc5DBauTEdl9o5fRm3ox67yP0jmcmvV
	 yt+vsNUaglGDsPLaeEOV203mWWGHmg7p38eDEmIJ9ieFQp0+s7XjSSaLObfDu6Ahw9A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b="iTz3k/80";
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795428203;
	bh=pCa1hwXL3bRLuo2GvP1wlzGXtYwYmtWi5Hg30qRj+jw=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H7NUEN6ugsjbIXDY8SP1OJz/01LEXM/Fr/8bve27Zo/ehruBeJuaBTQieW8UMbHAD
	 rc80WaifL3RuNI0yNn6c6f1DC/cSB/6iNkkJFPgC1DQkUZ2GLCJ4hXQqhxKfpRTyEY
	 r64ghPrNejJUWZbReCvsAxlpG1F/vyOvtcUdMvVTYkX7fiMW7dkoZ+ACYK/+/Ri6W8
	 Q15FwmOTlVoITYU3rmtLcLgcVlzk2FzdGVPHVwWe8mPgsD7KiH1MkoU0ymPKY7mAej
	 s2I5rDy7yGl06/g7iMx538RfhviWOqlA5ckn/ia/RLHAdmoEQx3dJAwx1EFyeoJFmQ
	 mNUPcPSvHZGQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA0A140651;
	Mon, 23 Nov 2026 10:03:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F7011AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80CFC40642
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez1YETxHprEB for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 10:03:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A420940637
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=iTz3k/80
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A420940637
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCXLaGhNywyhu11bXlRhqrsAxUFd/ONaKesf0z2VaGE=;
 b=iTz3k/80DgZdmOdwCjfxeV4MtNNIOJz2Of9w5qJvNwOsD3uReAH4P2TJZcpn/l+dx4Z5oprVwnjZB8JeTby5emUKmxXjzKAQTdudRLNfAVasBVC7zC1d3AlArVgnKBU9+qXrC8sLP84v8YkuuWoRqutpnFbr4H9msvvI+jwxDt9sKEJ8n8YMlJCUlSA9f8gj1qLgmYtWibItE+mVLtXqaReU7c6EUsAOMo3ukAMnWktWZPkGCA9rYAPHMwLIDkZbnENFjV8+NIzv3mcf4JnXaNQiHfhjPSZp6y5j0U1OL/7R+GupvWaeSUB4bTKVK9xIcB8zepR+7fPI1zc0gASMFw==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 SYDP300MB360871.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:36f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 10:03:13 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 10:03:13 +0000
Message-ID: <SY8P300MB0041633A883543D06E724B7FB5452@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
Date: Mon, 23 Nov 2026 18:03:04 +0800
User-Agent: Thunderbird/154.0
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Francois Dugast <francois.dugast.foss@gmail.com>
References: <20261123091624.1331936-1-fiona.klute@gmx.de>
Content-Language: en-US
From: Fengwei Tan <tfx2001@outlook.com>
In-Reply-To: <20261123091624.1331936-1-fiona.klute@gmx.de>
X-ClientProxiedBy: PH8P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::27) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <fcbf6e38-2653-40e1-aa3a-bddb24cdc736@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|SYDP300MB360871:EE_
X-MS-Office365-Filtering-Correlation-Id: 59cdd143-a028-4bc5-21a6-08df4948fbcf
X-MS-Exchange-SLBlob-MailProps: igNrEvV8uhEjvtWg4HuO4afqtzhSzTL4GiJ110c+z/CsKq4yrRDwmEDQX7nMF6WS/aSU55oQumIl2qOKGhezXmpD7HMYKckkZ4NbnjEtneZKUMPxS9bdjfHOgfLMZtGiiFcB98+2hd27euKILcmMF+VsxAZmYeoQFJ2pHavfxdSozUs3kN2Wlfx4+F9qtq4gjKtx/MNqBcLPLcUuqYl8hSiMh7YqsWyklvO+fl654h5Nf6jFdRan5mm4KbEZ3NjEN33a3OstGn4DT901A4o35Q7dzsybGuejEpl2o1tp44GM+MRBLxhFCyuaUDmfmoytQxDI+kW9pbe/CAXKSzr1AX25W2uKRQpKY25NJmJiJZlfS+9VcpBEEF1eJhTtqr3lUOSVFVKSr2g+hj748Zqob6sYxEV4VoT7iG93h9URIyuPXKfDMRl9bGDmvwmXVJ91sTyxo8J4gqR6WrYzw3/w6AQRvbmcuGiUWFYQgOj6HTGKmOJfvsIhu9ig0M0n8+vpII9fsKJjfpFd0uevdT+9K41I8sN7uI/g3WTI6oD9m0PTKaBAHHuVkeurAXyVk/4CfGIXK6MDoH7+9/BgJcxCA4+9kFQlpxd8ik9HZHgo1NXAWvw+hg7hNSCoKkL53NrOEpEaBNORsZt8YhntiC1TUDqebzfkTV8etxTsulKugNo3EMgvdvzQV3fvtc2wYlQ/clFEQZNfd/Y=
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|51005399006|6090799003|15080799012|23021999003|5072599009|24021099003|19110799012|8060799015|25010399006|3412199025|26104999009|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjVTb3VBeUdWNWVOb2dMNEE5MHgyYUpWWjJ4bWQ2N2RLN2g5RDBKZGxmR1NT?=
 =?utf-8?B?RnFjNjZYeURFQk92dXdnZHNOUlcxMlpUZmthNTY4cWhWc1FQVktHd0dSVDhD?=
 =?utf-8?B?S0ZwdUE2OEZ5bFZWRm1ZVnB4Snc5TlBMYVdjWVhZOEFBQTJkYURBdjJ6Q1pN?=
 =?utf-8?B?eVh6UnIybHhaYndGN0tjbjFqWldFaDlVT2Y1TjJYQ2ZUNDRPRWpMVXlRT2pQ?=
 =?utf-8?B?WmdMSWhBZExKMzIrcVlZSDdlWms2MVBoSzFhMTQxOTRLYUxiUkd1c3FrSGRF?=
 =?utf-8?B?MzNyclc1TktCU0R6Q1QxcUVSZ3p4aW9IdnZiMXM1elN0UFA5ajZML0VhMFJq?=
 =?utf-8?B?UHZyVW1ENGdlTjFZTkF0Q2YvQllhMXA5eHdPbElNMC9mK1BwZERCazJnbkxE?=
 =?utf-8?B?bWVOS29KSXdqK0lHWWdaWjhOa1BSZmVhRFVqa1lpMHduaHpEWmtiNVZZSFVP?=
 =?utf-8?B?ekJ6MjEvMk1ERjZJRk1XcFJMLzNweGIyTzJVSStiY3BFbEpyeldkY1VrTnFL?=
 =?utf-8?B?c1FqRHB1RGo3YitVaDhCQjd0djQ2aW0zRjFRaUFzSWpKMER6K1NBeHdFV2or?=
 =?utf-8?B?WkIvekE5UVJqcmpidGRjQS9ha1oxR3FVWU1USEpOK0lOUTBiZG9yS2tPTTNz?=
 =?utf-8?B?Si9KcnZ0VUNhRDJmaWNQUmQ4ZlRXL0djdkZDYXVKOXpTTXN1T0ppUTZOTGY5?=
 =?utf-8?B?aHhRMi9lRVAvU3RaTURFUGFuMUhiZmZlMVdZdUdoTnB5UFBPaFcyMHd5VW0z?=
 =?utf-8?B?d2YvN3ErdktrUUp0d3ZPRGFXRGFuQlVEbE5RVHg4RFh0Um5PcmZYRitIRFJT?=
 =?utf-8?B?a3ZKWXVSSlRNRnpGeUpFMFZvQm00VUNkSUo2dFc0Nzc5NDB3R0hmT0M2bXU4?=
 =?utf-8?B?ZmlHc2RsUnh1WTU3VUlWVzBYRjVKNy8rbGVLQnBMT25JL0tHRG5CL1AycExs?=
 =?utf-8?B?ME9HZEhEZE9OY0FqeXMybktzUFdNamtrMDNEZFlVMC93cHF5UXcrcndKK2N2?=
 =?utf-8?B?dTVRZExTK3BGcjBhWE14RkJ3Umk3UHc3RldCUEFHRUk1RDFDOGR4TklmMWxy?=
 =?utf-8?B?QUwwYjdzN3h2SXJHZ1lpb21pTmIrWmhCUDNPYjVHRHVRRmJpU0Q1cHNSVE9E?=
 =?utf-8?B?WlVVNUxYaFdoSXl5VS9mOHJJY2dTemhrblorbzNTdy9SN3V0S1pjWG5KTDhN?=
 =?utf-8?B?Q0lWdG1TYkdyYzJkUnNUaVRpc29wNUdMRTA0Q25hZWR0OXVneU9UeU11L242?=
 =?utf-8?B?d1FoWGx6bVZZU0hHR3IycUZLQ25JbTV3WkduQ01GcGdwaVJEZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUNFcjJzL2d3am5jbTJpUzIwMTFsNVM0ZDFZQjBNLzB2UWN1K2k1ZG54b0tZ?=
 =?utf-8?B?aWk3N1RIQmpteDRDVEI2dUpnRC9xNVhteDFuMlpoa1BQRTJxeWdQQWRXS1hh?=
 =?utf-8?B?dEdzeTV1MFJSeDNVbXB6aksvQWJ5b091dUoydFRUR3Z5aFJuczBqSjMrcWZ0?=
 =?utf-8?B?UjNEOHRZMlhxdGZ0TDB6SjRwZEY5ZkJJWW5MWkd0bit0end3S044SG9QRVcw?=
 =?utf-8?B?eEFTdnlUS2NIVUJCc0FRaXlLekhmT1BlNFE1SHNyWHFZeHYydHhYcHZQRExM?=
 =?utf-8?B?NFljM0t0ZURNNHFGQXhST2hCTkpxcmIyYTM5V05jMXVTNXRCRkpkWURnT3Rt?=
 =?utf-8?B?Vy9FUm4wV0w0MWxKOThNS0JwOTNtSjA2RnFpUkdtR2kvWjVVMHlDS2RvWFVz?=
 =?utf-8?B?bkh6Nk52M29kME83elk4SllBYVZMR1V2MzhwYzQ0SDZvR295MVFaZWpUQVZn?=
 =?utf-8?B?bWwvc0VBVmZadit0aEVYaWZiUlNlSy9rME5keTFpb2NPZ0N3STdUOHlWYVkx?=
 =?utf-8?B?VW9abFJOa2RGbW1FTkthRisvb2tQL3ozTjBnQVVnM0gxOFlmN29jekJZd01X?=
 =?utf-8?B?aUNvOWJsbXQxZlpQV1Z2dlJFaHovSWg4bVRVOEFEeGE1Vkw5K1BTWkxoQ05x?=
 =?utf-8?B?N1U4MTIxbUp0SzJSaU5DWmNlUzBvaHJDaENsVXdRck5yMXFzeUJjOXhqT09q?=
 =?utf-8?B?WTkwRWZjdmF1OWFDT0F6UlZOem1KbDhpTkJ0ZHJyc3NSYzIxbFhuQTJVZU5x?=
 =?utf-8?B?Mmp0YlNRTnZ1Smp0RkllMEhwa213ajdObEVUczNYOFB1Q0o3cU56M3M4S2xx?=
 =?utf-8?B?V3NERk1HVERWT012R1ZBbEhNdU96a1dORlNXd2hCTXE0OTJnK0RIOTFKQTNY?=
 =?utf-8?B?dXlDQXpkekVZaDRJSS9EOHMyOG1BTFNMVFdlcDI1bEswaFJKSHFJWkJ1aUVz?=
 =?utf-8?B?bm85cm41Z3FWUStLZXVMTEEvUXhYRzVLYTFLTXFzOTdmdmt4cU5Vc2NCL1l3?=
 =?utf-8?B?VGo3dVc3bzBUem9BdFVDK1EvK2lwMXNIZG5BYU1Hd0UydWZVMWNvVS9LQW9N?=
 =?utf-8?B?U0ZuMlpxM2dVSzZNREhPOHRhcnZNakhhaU5zR2E5Mi9LL1BhMzNjYXRtVENV?=
 =?utf-8?B?YVl3SWZMb3hhMXJBLzUzZCtpNFFzeHFjSEdOeDl5TEh1R3BFNURCNUkzVTRs?=
 =?utf-8?B?YWtzMXlZNU05c3pXMEJBNXJwV0RCcDdTb3B3MTFGZDZRdG5icVd6UDE0YjZP?=
 =?utf-8?B?cmZNbEpDbnc0OHQzVFJsTUZFNUQ1QzZHWkNsNVlicEV6YWsxUW5GNWVFSVc2?=
 =?utf-8?B?UHpnazZmcHZvSDkxaENNMmNhbUczRDgxamVobWF2OVlBcHMzUFBXblNvSG1T?=
 =?utf-8?B?MEkySXlFZUhLNlpxOGFyTlNUVC9JNEIyMi9NcnVWSjVzUFJSVkwxSm00ZGd0?=
 =?utf-8?B?clcwc0dMY2ZNR3ZBeWdBdUdCM3BybytjMDNXalFqSVZjVTNoeGE1aThwMmdr?=
 =?utf-8?B?SFJxVVVhNGhCWGRzeld2a3QyRzRVcEJJQVdyRFlPMVdXVHhpbVhJQVhoWXM3?=
 =?utf-8?B?Tkp5c0JoUGR3TlpTenlLYWhkSVcxYkxuNGpGVGhicXNKQVY0dHhPK3d1eVFD?=
 =?utf-8?B?MnNrSllUM3FBbWN2MW85S3ZPd25HeUVFVFJBWm1sdG9JYy9FTG03bk5qdmpy?=
 =?utf-8?B?aHRHVEd6OWYza2ZwalJzL2Zzcll1M1RDTTVjVmxCS252b3FEL1ZRMHlKWjMx?=
 =?utf-8?B?TlFQYytKamZ3cmFScmQwNy8yM3FVUE9hcG5lTWZNME9PSzVIUC9ZOE5ubDQy?=
 =?utf-8?B?TjFkaG05TjFWbEtXemE5ZDFiVjRmQk5FUUZMbi9NcjMwSEMxSFRrZlgwWEQ3?=
 =?utf-8?Q?3rluozK+egDGg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cdd143-a028-4bc5-21a6-08df4948fbcf
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:03:12.8295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYDP300MB360871
Subject: Re: [Buildroot] [PATCH 1/2] boot/uboot: point at official U-Boot
 documentation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRmlvbmEsCgpUaGFua3MgZm9yIHRoZSBmaXghCgrlnKggMjAyNi8xMS8yMyAxNzoxNiwgRmlv
bmEgS2x1dGUgdmlhIGJ1aWxkcm9vdCDlhpnpgZM6Cj4gVGhlIG9mZmljaWFsIFUtQm9vdCBkb21h
aW4gaXMgdS1ib290LXByb2plY3Qub3JnLCBub3QgdS1ib290Lm9yZy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPgoKV291bGQgaXQgbWFrZSBzZW5z
ZSB0byBhZGQgYSBGaXhlczogdHJhaWxlciBoZXJlIHRvIGluZGljYXRlIHdoaWNoCmNvbW1pdCBp
bnRyb2R1Y2VkIHRoaXMgaXNzdWU/CgpPdGhlcndpc2UsIGxvb2tzIGdvb2QgdG8gbWUuCgpUaGFu
a3MsCkZlbmd3ZWkgVGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
