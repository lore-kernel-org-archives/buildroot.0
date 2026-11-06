Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5E606D83C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FKAFFOt0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=icsLH4XR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F0FC608A7;
	Fri,  6 Nov 2026 14:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-b0o1xT1Fk9; Fri,  6 Nov 2026 14:03:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A049608A1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793973796;
	b=S8bqT7ydVUOqygzzJpOkurMlk0VhHu9UFkueFRHA958GKnNB3EOuyL5zyaMGXeuoPu71
	 tEndfey0HJfXGhQdksGL3jd6ftocNURlr1xnHbyirQJCuDl5po5Yy739Egrg8O9fqCj/Z
	 YgB4yLEkkLEM3iCfxEHRpv7AUnb8QsBT2+1wRVszpD+Ix8d7eTsRjlzSdglyQEi4VvdTy
	 B6QsM28veW7RIEC65PLxQ4kYYkPCynbJqlPtQ7iw1cMP1uSJLoQl1pgz93lLSfQAP7Xvy
	 RAJn63izODMh0DpIC1D8At2+JMzVQNODhtIdwl63i1N2NObJxx32RKwUYP+DoTFyQhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793973796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:To:
	 References:Content-Language:Cc:From:In-Reply-To:X-ClientProxiedBy:
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
	bh=iTG3WBflxtOu4nk28obalazLrjASS/r/U6lTuF8M1iQ=;
	b=FVBblNTfeYv0iSvFJz4zK9KRE7fA/CuZfsiNuO1am5teOSvo6Mk/Su/hh9JLwdMpkPZu
	 8uo11fd2zBotvEN5rO2XiMCX/EC0QjxOeeuIER3pKalwpySRbmyYqkYQyNcioPspjFB6r
	 2zET5zs5LEIwsS+bbmZKVA+hwL5piZpsmGJ4jjjWj1MA3FzxQ3nUpgbtxdbJFdzGVriW6
	 o6y5Gs+xpvozFXM2I0k3qRZDtNxU9EwSfHH3aptCyzGs9DDG65kE1pU3zjTM8ZSQLo7Nb
	 WzK11gkzR5IQ3pMgkly96Jr50jO4QvplIiuYYhUMjJUbcgwXmSuHhnZuf2R+tTl4FKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=icsLH4XR;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793973796;
	bh=iTG3WBflxtOu4nk28obalazLrjASS/r/U6lTuF8M1iQ=;
	h=Date:To:References:Cc:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FKAFFOt0N0z5Bhle0c7tYjBQiqzfdDG0d0VtT80N4i/OEilG0/N8f31UIu1n9ckNf
	 1obCeeFB0e6lX8PXeI1YKNrPXnmCpisB2I3b/2cjllM4/hYo4Pzi25pFcghAZiUgF3
	 o6ABR3r/xIXvJZL7pOzfwstbYd+EOnTN2UQmutyRaSKurPyIJdHAFzGHx/h8mKooIY
	 /S+KXCSJ12BFVu7y1c7OjPpwFELBOu6NDw0Zzi2Uwbosa5CYYKgopiPTMSvUoIJ6Bh
	 r9oqPGHaC1c6xJRWWczCyugjCyKKPVW7HLLAGOzIHhcPrPmaL9Hybivhqk9zaP9I/u
	 dF9C08eT6NZCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A049608A1;
	Fri,  6 Nov 2026 14:03:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2B652AC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 14:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF4A3608A1
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 14:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id im2-IkEO_-3I for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 14:03:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8F3936069B
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=icsLH4XR
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F3936069B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOBqWOuBfxbVn2iX6y8tcgkMN25d8fa5rtu/d1OTxNs=;
 b=icsLH4XRvVl34TFRvER7GwYkoyZ0cbJBIs9BkSGVn4iqN0Pes6Fvui5T2nV+q2y61urUYsomGcHWEPcesVm1qq511jLQO39XZuDyrF5qiN8JmKpdy1ZK+QiYD+18xRN4LtvDDoGXOn1tt9qx0qyCpHYJMMYAgSl7QsgDZG9+Xdknv1zK9kfWca9f5uEoKu4uvb7apWudLW8Fj1e86mrZli3cI2JDUSMVpqcFEuZ79EK52BNF9b/dHTzjfJzsBE1UJgpxum2mKdl0RLhjp8QjFL5WYuX1kqsqzwlPGHwmIrHwatwUuLoORUHhRJ46fnwzyoEXEDFCp5rTe8C8iAtBBw==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB1311.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:249::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.11; Fri, 6 Nov 2026 14:03:04 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 14:03:03 +0000
Message-ID: <SY8P300MB00411E7C51CDFC3DC0EE3A3FB5762@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
Date: Fri, 6 Nov 2026 22:02:57 +0800
User-Agent: Mozilla Thunderbird
To: David Luca <davidluca3000@yahoo.com>
References: <1461151393.479397.1793964135398.ref@mail.yahoo.com>
 <1461151393.479397.1793964135398@mail.yahoo.com>
Content-Language: en-US
Cc: buildroot@buildroot.org
From: Fengwei Tan <tfx2001@outlook.com>
In-Reply-To: <1461151393.479397.1793964135398@mail.yahoo.com>
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <cd858f4c-1997-42d0-9dd6-766d503403b7@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB1311:EE_
X-MS-Office365-Filtering-Correlation-Id: e95db223-17d6-4f37-285c-08df3c0eaca9
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|12121999013|24021099003|25010399006|4140399003|6090799003|23021999003|5072599009|15080799012|19110799012|8060799015|41001999006|10035399007|1602099012|40105399003|52005399003|26104999009|440099028|4302099013|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajVYNzVUMmk5SytsYTdVZW9FdUIwWUJKZEtzWVVsanlpaVdFeFZSQTFTWnpR?=
 =?utf-8?B?K0cxNWd3REp0L2NpbE9LKzIyM00xdGQ1YlVrb1hNaVZsdmt4V21GOHhXTXdv?=
 =?utf-8?B?UE00RzRxRWpnbkMyV0FxVGErMmNUZVlianp6NzltVkFUbFg0TWpoYURnbmZN?=
 =?utf-8?B?d2FXREdsY25SM1pmT29DM1JBNjQvbE5iaDRtOUtXZk53YlRUOTQrTW13cGo2?=
 =?utf-8?B?OVREQkNweFFYZWFZK2dseG1NNVR5Q283UVlOekNhb3NWSWUwaGFFem1OeEo5?=
 =?utf-8?B?WUtIZWJ4bDZveE54Zk5EMlV6THVaYmZsVkNXTEFmMVdQRG9QWVZJSXZhN2xr?=
 =?utf-8?B?dmIwRmFPR0tJVktPMFJmcWhoUHZseEtjMU1xWmxZaGwvSThXempuR243am5k?=
 =?utf-8?B?WHY3ejV4MzVpQmlnVGdxRVg4RFBvR3doQUI5bGY1SmxiWHU2dVVBbUVLNXlj?=
 =?utf-8?B?eloxcmV3c3JMUjViVmNsZXBiejRIa01mRlZaTVo5eWNtY3hPSUhhM1VQZ3dR?=
 =?utf-8?B?MzRQRit5dVVFKzhSSTlJTW9SeHVzNW5jQVZ4SWR6ZlZPNW9VNlRmcGEzaEQz?=
 =?utf-8?B?V0NKRjJiVkdjZTRya1hDWTh2UWVEbXljQVVRL3UxZTVNQVNkbWM2dXJpOEYx?=
 =?utf-8?B?d3lrRldpZjgzMSszNEk0QkFsRWxIQlpiVWxNZ1NibjRFak0zamZoK1pYUjY1?=
 =?utf-8?B?bFppSFU4QVhxVURSaDdOM2krRktxaXl5VFMxVncwVVo0YUVIYVRIeXBybDhh?=
 =?utf-8?B?bXdybDRKRnNNakZzZVJwWThlNzV1SmlZNWRqODd4TDNzODlpbDI1YXBFU2pu?=
 =?utf-8?B?TksybE1Hd05NKzlzb1ppOFp2WStrNUt6cHQrTVpsaXl2UjczcEYybGgyS0tk?=
 =?utf-8?B?QkY0bU5SbXViZzZtQ2RhV3ZheXlwREFCZjMyc0ZIb1hnUFhiOFZKWkx4dksz?=
 =?utf-8?B?azBzQjNlS0M3TGNkUzIxVkQ0bzUrcFRnVlEyWXJKakpNbjExaTY2eDB3dkVQ?=
 =?utf-8?B?U2ZWaFV1cVVYUS9Ydzc5MHFtS1VhNk83eVlJRWNiT0czQ1I3aEtZM01OWkl2?=
 =?utf-8?B?bk9vQlNqT1h3N2VXcm1XSTFMM1RGcjFNZExnYUp1UmJscWtHRE5tRHpmc3Ex?=
 =?utf-8?B?cEhMU1hpSk1renZaeG1JYWxEelJ6aXI3NmVYb2J1b3BFMmozR3ovVWlxYkNI?=
 =?utf-8?B?Sm9aNWNTSldxaVJpRlh2dEREa0NwMUplT0dybVpra1JWZmFFM2xJKzZ2dmhW?=
 =?utf-8?B?SDlKcW1ya2ZrVUFCRkpyVHdwaEVVamtkRmNpTkphcGdJWGt3VnQ1VGtqK2Qy?=
 =?utf-8?B?UE1EbnVTNnJPdWJweDVidGxMeTBqOEt6RWIxNUpySXRHZ0RIT1dQYVpRMEtr?=
 =?utf-8?B?RjdWRHA4dFRVUGtSS0hhc2QyUmhxS0pHVy8yQ0Fjd1JJc1pVZkhjYyt6Ly9U?=
 =?utf-8?Q?Ja/HOUBw?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NURBNjhWSk1rTVdNbmtLd1UyQUhCazlsdXpDR0pzK3BjbnVjaldtYkVZSUxX?=
 =?utf-8?B?S3h5R3lwSzU2ejhDall5MUUrQzU2WEhseWpNZ1pxSXJidlBjR1BrejgvbEdT?=
 =?utf-8?B?d0ozaWRmL2orMTN3amtJYlZLSWM2eFVlb2laRXFZT28yUE0zZnI1TEkwQ1RI?=
 =?utf-8?B?cTVCREFIcWNybzBZcEFBSERLeEpEWnFBOGUyVEJTR3JrdWIvQW05QzE4aDBT?=
 =?utf-8?B?Q3ZjQjVOaVRvMGVVelo0V1pzYUV2S1NpblRtMm12cTFtQ2NPNUlEWjZaWGdC?=
 =?utf-8?B?dkRzOHBNMVljNSsvTmJzQ3dtNTVleEJrVjhoQmpJQVI5ZmV6bk9IRkl6cUh5?=
 =?utf-8?B?MWRXQ05IcjhpcmUvMW1TNXY3SzdjRExYQ2NzOHVaVFFXOFN0WEJJZ0N1WWZN?=
 =?utf-8?B?dnRYS1RxSVdFT2ZaRFBuQzlyQVgxVnQ3UUk1L2RrMkNVblpBNmJ4Z0MrRGJE?=
 =?utf-8?B?dWRoc3MvdDZUNHUzUlI1Zi85SzM1UHNRSmRDMUFNUnl3UGdwSWxHU2d6d2dB?=
 =?utf-8?B?ZWFsdzZpZ1N4a2JaQUpKVGlLYllkQU5UWnhwZks2bncyN2U2UHVWeGwwb0RR?=
 =?utf-8?B?Zk55MXA1ZEltZTU1WC94emhtbGRvTEtHc1VXYUdxRnpmSFkxMVhsNzA3T2NC?=
 =?utf-8?B?a0lLeTVWc2RtcjNCeDcvVXo1bzVuZldkd3d5OHlaUFFFaUg4eFFnSlk4QkFt?=
 =?utf-8?B?aVJmL1MwaHlpNlFYZ2RhcFBrYU5KNnZ2bHZzNG84ZWZueUZ5TE1vWktyOUlS?=
 =?utf-8?B?REczQ291VXl2Y0VxdmtMNlNMa2FwWTdIN2ZEUTVpUXFjUUUzaVM1YnVoemUv?=
 =?utf-8?B?dXVlNGkweHZ1a3kwZHhGR1p1MFVZeTdxSDB2dDNwbm5HUGV1UTAvQ3pEZHBT?=
 =?utf-8?B?UEFaOEpibGgxeU9TOUdSNTF1SjcxUC9xZlRKZkx2aDhUbm1IQ21JVzRyTXhv?=
 =?utf-8?B?eXYreEZrNy8rVkdtQnMvcXpuK1dZVGdhMmVBYnJxWThLelRoTWhUZ2tMdW9L?=
 =?utf-8?B?UzFqelo3NVV5YTg1MWxSMFFmRkxTVHVqZ1FQK2xvQU96bnhaSit3QXVXYWNV?=
 =?utf-8?B?cW5BMDgrVUpwQTBqZFhtRmtNalBxUFZrTWJtY1VtODFkSnVla2svZDVsY3Fa?=
 =?utf-8?B?K3l4dTZsNlVZN2VoVklWN05UOUlWQ05ZQ2c1ck1tWkNIN2VVeFEzM084TnhH?=
 =?utf-8?B?ZFBzOEVvY2pyYlVDNURyMGhkVks1N1JEbDhtczROYUMzNklFMHJtY2pSTlVX?=
 =?utf-8?B?NFkyMVpvVkFadXV2VThTSElGZGt3SEpEbERQazN1ZTJYNnlDSnhMMi9ONXZx?=
 =?utf-8?B?ck5iZlJGRDBONDlMSUdjNjFFOW1pd0ZjQ2s4V004MnpVU1hiRGNKOXlVelhJ?=
 =?utf-8?B?ZFBwazJLU0VQRy9TZmNVeHY3YUEvbmhpaUlHY28wRWpxWHFnVVY4SGVES3l2?=
 =?utf-8?B?eE5GMjFSNE9mZlV2Y0NEajJOWWFDMXBncGpHSTIyNWU4WS9jcVE4N1E0RitQ?=
 =?utf-8?B?MVhPUUhZaTFMMzEybjNVV1FaN1hmYlJKdzJ5Wk1rbWhpUGtnNFkrM3pSN3R0?=
 =?utf-8?B?Yk5WeWZKMk5wQld1dUliTW84NVpjOWI3TnZ4UlhwaW51MEdNWlI0T3l1eTBv?=
 =?utf-8?B?K3JUZmh3RDc2R3l2TWIrWUdwRVRiNTFvdHFDWVdkSnBuYSszT2V6UTA1ME50?=
 =?utf-8?B?UXo2Yy84QUlRMWphOVNpczQrTGxJZE5XVkR3eHUxTXRiY3BWTHZXbjR2aW1h?=
 =?utf-8?B?OGN4NW9xdEJralJGV3o4NFFYWHhxQXZlN0R4TVJqTzNoQXhzVzBLRDV1Wm9j?=
 =?utf-8?B?SFRPM3Nuem1QUjJBODRXTjBlNkJka0tkUmxWc3ZmWHBvd0NmYlYxZ0dDSkVs?=
 =?utf-8?Q?Br4WYMvFDbPjE?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95db223-17d6-4f37-285c-08df3c0eaca9
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 14:03:03.6829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB1311
Subject: Re: [Buildroot] NetworkManager not available
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRGF2aWQsCgrlnKggMjAyNi8xMS82IDE5OjIyLCBEYXZpZCBMdWNhIHZpYSBidWlsZHJvb3Qg
5YaZ6YGTOgo+IEhlbGxvLCAKPiAKPiBXYXMgdXNpbmcgQnVpbGRyb290IDIwMjQuMDIgYW5kIGhh
ZCBOZXR3b3JrTWFuYWdlciBhdmFpbGFibGUgZm9yIG5tdHVpIGFuZCBubWNsaSBjb21tYW5kcyBv
biB4ODZfNjQgcGxhdGZvcm0gd2l0aCBHQ0MxMi4zLjAsIExpbnV4IGtlcm5lbCA0LjE4LgoKVGhl
IG1vc3QgbGlrZWx5IHJlYXNvbiBpcyB0aGF0IHlvdXIgdG9vbGNoYWluJ3MgTGludXgga2VybmVs
IGhlYWRlcnMKZG8gbm90IG1lZXQgTmV0d29ya01hbmFnZXIncyByZXF1aXJlbWVudHMuIEluIEJ1
aWxkcm9vdCAyMDI2LjA4LjEsCk5ldHdvcmtNYW5hZ2VyIHJlcXVpcmVzIGtlcm5lbCBoZWFkZXJz
ID49IDUuNC4KClRoZSBtaW5pbXVtIGhlYWRlciB2ZXJzaW9uIHdhcyByYWlzZWQgdHdpY2UgYmV0
d2VlbiBCdWlsZHJvb3QKMjAyNC4wMiBhbmQgMjAyNi4wOC4xLCBmaXJzdCB0byA0LjIwIGFuZCB0
aGVuIHRvIDUuNDoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2NvbW1pdC8wOTdmYWVhZDRhNDZlMGZhZWU5ODY4NGNlMTI4NDcyNzc0ZmU5OTMzCmh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9mZjg1MTEwNzAxY2Y4
ODQ4NjlmMDdiMDRiZDA0MWUwNmRjYWMzMDE4CgpJZiB5b3Ugd2FudCB0byB1c2UgTmV0d29ya01h
bmFnZXIgd2l0aCBCdWlsZHJvb3QgMjAyNi4wOC4xLCB5b3Ugc2hvdWxkCmNvbnNpZGVyIHVwZ3Jh
ZGluZyB5b3VyIHRhcmdldCBrZXJuZWwgdG8gTGludXggNS40IG9yIGxhdGVyLCBhbG9uZyB3aXRo
CmEgdG9vbGNoYWluIHVzaW5nIHN1aXRhYmxlIGtlcm5lbCBoZWFkZXJzLgoKVXBkYXRpbmcgdGhl
IGhlYWRlcnMgYWxvbmUgZG9lcyBub3QgZW5zdXJlIGNvbXBhdGliaWxpdHkgd2l0aCB5b3VyCmN1
cnJlbnQgTGludXggNC4xOCBrZXJuZWwsIHNpbmNlIHRoZSBuZXdlciBOZXR3b3JrTWFuYWdlciBy
ZWxpZXMgb24KbmV3ZXIga2VybmVsIGZ1bmN0aW9uYWxpdHk6CgpodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvTmV0d29ya01hbmFnZXIvTmV0d29ya01hbmFnZXIvLS9ibG9iLzEuNTYuMC9z
cmMvbGlibm0tc3lzdGVtZC1jb3JlL3NyYy9saWJzeXN0ZW1kL3NkLWV2ZW50L3NkLWV2ZW50LmMj
TDE2MjYKClsuLi5dCgo+IFRoZSBkZWZjb25maWcgc3RpbGwgc2hvd3MgIkJSMl9QQUNLQUdFX05F
VFdPUktfTUFOQUdFUj15Igo+IEFueSBpZGVhIHdoYXQgSSdtIG1pc3Npbmc/IAoKSGF2aW5nIEJS
Ml9QQUNLQUdFX05FVFdPUktfTUFOQUdFUj15IGluIHlvdXIgZGVmY29uZmlnIGRvZXMgbm90IG92
ZXJyaWRlCnRoZXNlIGRlcGVuZGVuY2llcy4gQ291bGQgeW91IGNoZWNrIHdoZXRoZXIKQlIyX1RP
T0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfND15IGlzIHByZXNlbnQgaW4gdGhlIGdlbmVyYXRl
ZCAuY29uZmlnPwoKUmVnYXJkcywKRmVuZ3dlaSBUYW4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
