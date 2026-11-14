Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AD3606A335
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MPJ5x5h6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=BB7RjUtU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1C44606F5;
	Sat, 14 Nov 2026 10:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7c6_r93sKlH8; Sat, 14 Nov 2026 10:42:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A96E66068F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652962;
	b=aUEtrbQicbgdXzhHbCTOqb5T0jN7TnmYrnIq8B4nPXKMVWiK8UmuEfWDRCOeoynE9lq6
	 iENlXE8Jfl5Z+jShIik1p8gELxQy3Mo5wZsUOdz7QbbeIqQoiNhDyAFemOjZMGGzjvPyq
	 mJL+wUXRa9H/yOi49eBvAZW/c1QDrKkNhtGr7zmrpikD0Jhr0KnmFh9ltIrV3YoQvOhzC
	 kJTL9aQ6KCKJXAuDPy1V5WvUws7GR0200A4bsgQuV73XwSdpzvmU3QCeWvyc4zMrRalbD
	 I2n4dxBLezHbxCoPfD0e4VVPeDS4RUFGRPgv4FnyV3zQg52wl6cd4Xm/bP3ujtEyZ4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652962;
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
	bh=Kir9WmNal9WSQa+0LQKVCXNrlx6EW+Rk50Xr2/K6n6Q=;
	b=r4XLpmXesgq6WC4duRIflK5+KgNkhpakWgR7kKhyU5+kv60AaASSGGOeS/OLoMIIKMvs
	 k0BM0zH8pWl5CEFZJOklURV9oKX7YMpkdwksmIa9WWttgg9kVAhd4ld0lvJRiyoZtTGsW
	 lTqYnd2+uxW9L8GN7wF4DsePX9ej2Te7Pwp59BoZyYN14V9htp3KA+AY/cv1edRy+hsG9
	 4na2xvf3Xn6+4pIzEocW2G8RJ6XhD9qJTnM18LwYrcc1rXNUosSSZma3+6k9es19svf/5
	 oBjSZF6rYTZSVuubddxCSW/4eh+Bmfk0krRN/NIDLTKcDQaU+32R1SgHRXzg6eLiMCQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652962;
	bh=Kir9WmNal9WSQa+0LQKVCXNrlx6EW+Rk50Xr2/K6n6Q=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPJ5x5h6iOd9tWbJLulY5Tmy2/zGXUqpHDnmzQa3rD/o0t39hrwYQHQkiGAJ5uQET
	 ePJ9qnD9XHSI4jCDT2tKfjOSzRS3csEgq+/SoZtYeQcHdh30784koM/Ai9IT5GmgZP
	 5+goUMb7U/Pdd/fXGFBKJ+sVxJdnIxiVlGXrAepeU4P/XZ23LVA0nChp2MwwUdgUHf
	 hA0mYHC1+gfoAqj1VTZoWWcbjp/XBAgAAu0/4PcOpqhhXrxymtImAxDCvsO+k/O+UI
	 MBUdTip2TWp0Bfja6+gtqfu50YjN4EvTNCRfmRpllZUzbIdX4rSw+Q620CBfMTfGLy
	 9r8pkylsvdGsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A96E66068F;
	Sat, 14 Nov 2026 10:42:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3846B9B6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A0B381801
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysLeGpNuMBdP for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E1740819D5
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=BB7RjUtU
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1740819D5
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuvfzzM5T4ezp+JbmoRTmuSsiHDCY+4fhCnHA65sG1M=;
 b=BB7RjUtUxtAzbjVncgQnj1yX3GywWuwqaXIhO4TGZKivKuB9m9MAz3R1pxb+dH0Q5hfMk7bYSMbUcfh3Pw2X2ENExiAUY8DX/WTH5AN3hdy1Cct1MVn8UNZe044ZzXoq/K4s6ZOoC+osUfjQXGfNZgB4Vbn9hB8DuPxBjgmaATbGNhnTc6BwA2tko5OcwJ+pGizQlSCSYkWqecdaqizWnMMOCzcrnLX9KW7v/jsBdf4fwMyHNHu/Q+UaROpIVgizI1Jge8CDc1veR6M6WS5lQwYNR20Wni44jWav9d8n1YxQV458sMJ4ANFZxFUo+3uYX8hcyC+GBpDQuJG0nyiB3A==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:33 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:32 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:23 +0800
Message-ID: <SY8P300MB0041405C1BD95760D750ECE7B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3234; i=tfx2001@outlook.com;
 h=from:subject; bh=Sy4/MdLROrPgKm8g4Lu0UAEtpD9Q+JX82Mf/kHsBdIU=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+DpZbbrNOPiNHIwVeTnYK6LqhCfLGw5IsSM9x
 yeeYml3u2qJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6WQAKCRAcD62l0/wL
 2rYKD/4x7I0u4lWh+fspqSRw7e7sCD56wTHhuHFDfdWKrD5ZYbJRiuSom93/K7FDSpaaSKABwV/
 AWLRRg2xHMl361SYTc9RmEc02uWg4hMe2SsXJrlYnBx5m2sy0l8M1M6NfpE3/zuVyXUMENtr1jG
 tw9A9uaPbH18LXo6VhpUOs82QylM+Wip0biBafuz4FHkce8WdYN8yv3FH7fi+RqZuYfcro2i4om
 Yb9S4nH7OH/PskWs5m6uzYz7UOCmvDD46x6PnsgMyEJOOPtoT227husfu9dxuzk/V8S7E6C8g8z
 KuREKrKivTqK11CsTDCQDmRW/9SS7Zca3X7zSxpk5UVjML7Yn/ymZEsl3Ed7VkVPEAo80N0LO1R
 lFe4f4X5cjEm077l9/3Fu06bwIzNnL9kAjvwzaGeA7BLRLh583+4EroeH6keL/lnrjuw7nMxDWi
 n2/1zeGCi9p/nCYvV8+2WFPtwDlD5WWPk0EAwesFn3RoebgMwtjqhgBx4t9lS4zTK5CmamlJgXr
 KDrMm6I7Z8TwpTkdHmn5vNJLSUP6ZJ619kivyfvb73+03oHy7hOaJDiYryQMCoqsavhX+GZMI35
 1gl48s36VcoUf1q8e8K9veYE1dVr85vfzPzH56WPCln4SEGV6nAa/wF/buYabRWReiwvhntxHBy
 u/4DxlsiaPoO/Yw==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-21-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: e823aed5-927c-4b1d-b850-08df423bfd05
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3d2MXBhendtU3MyaFpNVDlmUWJyM2w0RDBVNGdTRWdVU3BzNDQwL0RUeXVj?=
 =?utf-8?B?WWlsR0JuL0ZkQmtnZU1XTE5QRVRSL0RVV1J2YlI0T0xJenZSWG1aT1BWNk5M?=
 =?utf-8?B?UjBkQnRxYkIrdTE0YTRoUFdENEE3Q1dOOFhiOVZQQUp0TXR3VHV2Z1NucmdV?=
 =?utf-8?B?RUwwbXhRNVYxZDdka25wMlJLR2NSQ2N6WDhxN1YxVTk3SGFsdVZJYTk4a2ph?=
 =?utf-8?B?QWwrcDIzSVBTWlRWUWJCSmZrK0R4RVhaY25pamtBa3ZBNHE2b3A4Wm5RNm9F?=
 =?utf-8?B?SFQxRGNXQVM2L3NZZTZBeXloQWt5SWFzczlESjY1OHRjY21TUm1nbVJaWld5?=
 =?utf-8?B?YTZPaXhpaUsremVDUmVMTzJYMnhtM2s5bFRKS1JXTU9td2RxTEpvNW13Tm5k?=
 =?utf-8?B?M2ZUKzJtYkJ6L3U3cHFYV0tVNkpnYkVoOWZJTXVMWUN5MERwajF3cis5dmc5?=
 =?utf-8?B?azJqZ3VzZ3lpTW41K2xDejNJTm9zZkdqc09xWGNUa0kzZUdtRTVwY3J3ek45?=
 =?utf-8?B?NHpqL2VsR0Q4OTB0eVhEeVZkdFVoZmhJdThjSEtHaVVkWFRycEg2RGVJVDR5?=
 =?utf-8?B?dlJ4NTRvK1FzTXplVDE3bThRVGdQY2NYTHBHMG9vU3d6QWRCMTJrOWI5bnA5?=
 =?utf-8?B?QWNFWGRHN1d0YUdjRVpoUENlc2kwb3FFOXljMkswbTExckN1UVpBR1RUZXBS?=
 =?utf-8?B?Vlk0MURrR1UzaklLZzlVcm9jSE1RbTBobi9jcnpySUprOUthWWR6TXFuTkZU?=
 =?utf-8?B?WW5UOG55S3UvNEdEazVBdmNBZzBWWUxYWlRKWTFScVpCakg5dFNrOFY4N2ZB?=
 =?utf-8?B?ZzgxMXNaRWVVQVFzcVBUdCtTRGdmRkNPS29KR0p4UkxEcGNoUGw2TEJvY0xh?=
 =?utf-8?B?TTVMamRiVzNTTlo3Tk1lQXdtTml1TUYrYUxxS3huR1dma0cvOEQvNVI4d2dD?=
 =?utf-8?B?ZWhZZ01ZdERIWnhNQ29kNnhkSFpOWU9oNTF1ZjJxckRORmg0dEh4K3hIaVgx?=
 =?utf-8?B?QWZtVjV0eVEwRmVJMmVKamltMEZlUHljVmhNZFZCQ0pVc2NoYzFCMTF6anB0?=
 =?utf-8?B?K1dnRGxHVm1oT2xLdUZLT0M3dnoxUWZRWHIxTkZ3cFo5QlJMbWlyUmNqL3ds?=
 =?utf-8?B?bjNzdFp5emk1bENHa3JqZS9ObFdPY2RzaFNMUlZkUG9iNW9JUVB4czJXazh5?=
 =?utf-8?B?K29TUGNzd2NrNC8yU0VCYWNXbisydGVCaVNFUmVKdndISEppRlFOc2g0YjdR?=
 =?utf-8?B?WTZDVnNkQTRIcHVNNDlNYUpCOWVsUFlSR1hxOHZyZC8wWUNYVHppVk9NNzAw?=
 =?utf-8?B?cUFKd3VQbVlsRy9mTWpZRzJ6bkdNK29MNG94VHRnZUNQc0xaOGN6SjdvTUcy?=
 =?utf-8?B?MEppYklaN256clRjWTZiS3N2aEVPb0x3RWgvMHVmTStmYnpYVVoyMTVOMWs4?=
 =?utf-8?Q?+NDSXHvP?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXJVVTBtT0dnVDd4OW5OUmNWQ3JVNm12MlNlTDJneEc0cHljM3J4eU0xU3J3?=
 =?utf-8?B?c3pjNjIxdzJYZUJQOWFRQi90WU0xaEdQQjNtdHJ1Y2tKaGNkZTB5eXRQK2J3?=
 =?utf-8?B?dDVLNVNSekdneFg1Y0wzUWtHZE5KekM5ditKOUkwSlVqWVR2ZzNOSFJ2VzZK?=
 =?utf-8?B?NTF6aS8wLytCeVIvR1VaSG0wR2VmS2U1K0lLRSs5WFFDWGpQcXpHMzlzVG5v?=
 =?utf-8?B?NU1VaU5Ybnlua0FtWk5wRzBDQUI3ZHcrNjgxeDlHdk54SFR1d053OS9KVU9o?=
 =?utf-8?B?aFNlQ0lvYlNwWWlBQURsYWpOT2x5Tm9yMWRKYnQzM2lIN0pxVVF1MVZ3U0Mr?=
 =?utf-8?B?c2RYL2VQUlVPalpVMERLOEpVWFg2WEpOZW5nL0cvZDlCaWRsdGFHR3IzYVRB?=
 =?utf-8?B?ZE9kR2lYVzltS0lNRzl0cHNxSW0rdDJkSm5hamJKLzI5VS9EbTBtemVINk9Z?=
 =?utf-8?B?QmNIYWk1cWZpL3p5N0NxaUt6eEpaZUdKb0x2dW9VUW1LY0lDczlYRk81bHBm?=
 =?utf-8?B?WEZ1dnBYeVhNeU1Zd0tlQmlHUzh0TS9kTlZsOGxiZ0REcDRyVlVPNlVqdFNW?=
 =?utf-8?B?VjRMd1NSSTVCcStIZzRWWjFxM0JCbTErTkhydmFWdUFCVFhOSFI5M0xJdmls?=
 =?utf-8?B?dnplNTNUNWJxS0llcDEzRWlkR3JJeFNhVjhEMVZYOUEySGhWL1BQbUt2RmZN?=
 =?utf-8?B?VDJ0d1VWVXpyRndCL25ZbTdSeW9HVTJOSTFjdVpENUhqejJrVE5qck01RXNU?=
 =?utf-8?B?Q3FjVUtaQURPODNMZkJ3NFVyVjN0M3htZThhc3NucFd2SWZVY1poNXNWajhm?=
 =?utf-8?B?M1ljYkp2dm00VDJ0MjhBUmViOGZ3WnBYU3lrdXBxNEZVYzRCd1pDS0Q5c2dn?=
 =?utf-8?B?U2xTZmRyb0I3T0ZacHo2MXRRRmNscU1oR2NiWE9RRUdqOUsxcEg5ZmcxaFF5?=
 =?utf-8?B?YlpBNmhDM20zNGd3UTZLdTZhOE5yc1l5bTAwVTlsblpHM1h0TTVFUDRSNkJz?=
 =?utf-8?B?MGgwQWFXdDlrRXlqVERaTEpWUHN6UURwQlVRSjNnWU4rYTRrZWFQSFZ3eW4w?=
 =?utf-8?B?OUlLV0N1UVZkZWVSREIrKzVsTG5Pc3pkYVNkUGFuVCsxdEkvZm5EaU9wcmti?=
 =?utf-8?B?Y1dUUzQ0cVl4SGhwVyt4TlNqVmZ6M2J6WHR6a0NnVUxUWnBkQm9tNTlZeXQ1?=
 =?utf-8?B?VjlGamd4bGpoSS81dFlyY2M3WWtpaW1mR09UZU1EaXZ6TTJiMnR3TEV3TFM4?=
 =?utf-8?B?cHUwZ3d4cGxQSHlMZUNjUEVFRFlXT3VHZDVJYnNpRDhVR0M3bEYvUTJ3Vmk5?=
 =?utf-8?B?MFBVNEt3bmxxR1ZKbGVqeHp2M2lDdzNkdDJkRTlmZGtKTWxtM3Y4eU94V3Bx?=
 =?utf-8?B?eWorbFpEaGEwRE5aNmZQcnNpTW5LYncvVzFCd1h2SmJyNDN6bS9xa2hpUXZF?=
 =?utf-8?B?Q3dJQ3VzYVBYNG5VM04xTWpsdTh3NTVoMVBaUWZ5dGNjY0NRUkNnR0NKZ0FN?=
 =?utf-8?B?cmd3VzFWUFI1L0tDaWdDeXgvcFlISFBaUjlVbjZmUWwyUEZ4Tm1jVGw0R0RZ?=
 =?utf-8?B?V1NZNmN2NmhKWW0vS1lLRHdLRjF5MzNHSWg0eWQ0ZEppSUY2eWJabDAxQ2Fh?=
 =?utf-8?B?QkhZcjFhbDNLTUQ2ZDBGbUhzVUducnFLc2wvRExEb25RZjBNQTMraUFyRjk4?=
 =?utf-8?B?czRCQ1NrYjYvZTljNS9abnBaSk5GNzQzY3B4MnArNEpiSzF1b1d2VXNrSWFh?=
 =?utf-8?B?N1JPUTZpVGVuUXE5cFB0Mms2dnROcVVIa3pOdk8zUkVzdTlFUU84c2V6NzBr?=
 =?utf-8?B?YlByMy8wSWc4cWVsOHduYnZmQjhOWjVNQ3JsRWN6WVFxNWNkMzl3dnl3Njc4?=
 =?utf-8?Q?oopN/q0CHw02K?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e823aed5-927c-4b1d-b850-08df423bfd05
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:32.8435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 05/14] package/gstreamer1/gst1-plugins-base:
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the deprecated Meson options with glib_debug, glib_assert and
glib_checks [1].

Drop the explicit -std=gnu99 flag and use upstream's default of GNU C11,
with C11 as a fallback [2].

Drop the obsolete configure --help comment.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/84b3a0950debc467ce25aebdddd0d827e658252e
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f022eba452dc04d1cfefe4860a5f89bc261e194f

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash |  4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 12 ++++--------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index cbe3a00566..6689eec005 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.24.13.tar.xz.sha256sum
-sha256  31a4a34e02df0471274fd0e8016495475b670320d20a3349faf0634340166c42  gst-plugins-base-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.28.9.tar.xz.sha256sum
+sha256  c1fda668b520e6aef763c0eb962c032c9fe52bce322e8b00c69b4e9e847bddc1  gst-plugins-base-1.28.9.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index adfb407386..1c304ff25d 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,21 +4,19 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.24.13
+GST1_PLUGINS_BASE_VERSION = 1.28.9
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING
 GST1_PLUGINS_BASE_LICENSE = LGPL-2.1+
 
-GST1_PLUGINS_BASE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
-
 GST1_PLUGINS_BASE_CONF_OPTS = \
 	-Dexamples=disabled \
 	-Dtests=disabled \
-	-Dgobject-cast-checks=disabled \
-	-Dglib-asserts=disabled \
-	-Dglib-checks=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Dqt5=disabled \
 	-Ddoc=disabled
 
@@ -38,8 +36,6 @@ GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1 $(TARGET_NLS_DEPENDENCIES)
 
 GST1_PLUGINS_BASE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
-# These plugins are listed in the order from ./configure --help
-
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GST1_PLUGINS_BASE_CONF_OPTS += -Dintrospection=enabled
 GST1_PLUGINS_BASE_DEPENDENCIES += gobject-introspection

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
