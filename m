Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06D606A323
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KH2MnRMi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=f7MHGGUq
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C999981C40;
	Sat, 14 Nov 2026 10:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55tb6auZdysY; Sat, 14 Nov 2026 10:43:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C509581AEA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652985;
	b=A/HU+fL3yow5b4jvxSvK+T+iWbjvvCVXtTPG8tfw4Q+qu2F5uDay61y75MMHWbskNa+Q
	 odN0aTZqiiVCEqmEc3+GpPSGTUEZmMu6B8hbea2ErDN43lolVLUY3QubUiCRhWaLqgP6E
	 v8Y6qI1R+vu2LzLhPzZ3I3QuchZ2WrrzVMUOFb8j65KVb6UkgkC00zpmeLp+Edv++Tq9X
	 xTRnxvOekKkGt/g25OwhO4Z6XMWT12jZUEfKs9zfO9Bg7/m5EHif0xWKokK40AVl5ROZG
	 iOM51fx4yc+3HYAI91njAZjW1pyOPhuLRYItbsXmQBQW356KGL/D3w+FewkS3PNNoHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652985;
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
	bh=D4ccSqHkClc/Lh+5jCQerzpTtx77Mvr/gf1KWCIvFIs=;
	b=sBiI61SwM6uMxtV6hgKpsfwwCUTtc/CgfJsxShs2TONu9r1CFH0XGeKbIqesxP108UNK
	 MVnulnk/2YgjC32zRTeI+sLCjXLtEZjAlltZnk9oZ/M8qdqNu7UYBx4C5DIpi+FKqQ3qu
	 p5lYIPy1alNnitRNYvEUf2VdpOJlY+KwIzxP4LggaPVsp66cDYntSQEGsBJkoqqEliWa0
	 N+IUbPJJVyCyMiacyZW3kl+GO6S2+AQE0XBkpqYt64p1uNeBpXYyWAHWfPgLqQzu4Mw0y
	 cvG3bBvJyfqhyeWaND7fWqUdVBCosB8/8r8ThOvONoPKOGMT1BsaWRFPwT6V5fneXbA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652985;
	bh=D4ccSqHkClc/Lh+5jCQerzpTtx77Mvr/gf1KWCIvFIs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KH2MnRMi9kJwvsnFdPNtst/ZQQy9Z9PKcParfXy5OcdbMOnqxOOQxTM7g0zkIozUk
	 Esa7epyhVtF7PcIOwR0lxAkKG3lFZNoGp9tsjrbOgkndW7YqPEkLbZr49i2m29X3kv
	 FpxS9eOw6Qtp8NNHnLqwejY2gBhYCqccx3OlztVmhj351T9QfHs3iQM1C5OqglmCTP
	 9oJO2RPVFewdEi6KoaHmjgZThjg1Y9pRcgxQXZDDvvRwrTN5TX91/IEw3zy8F2bd3w
	 IuZwfKOwsgGEenguVNywYaD6W8VnEJNkrnAjI/y3rcVhz3B75UL6GZJn3Gbz2K41uf
	 jM2VxNJFA6T8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C509581AEA;
	Sat, 14 Nov 2026 10:43:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A6F272D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28034401C8
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OB2FCnUVkooV for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1B4CF4018D
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=f7MHGGUq
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B4CF4018D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkJV1YAti1+jDrF8JjD5xqY0aR9cipZiminl0gopJlk=;
 b=f7MHGGUq5nALJ4TEjGAhuHdsnmOXaHwF/kZbm3gcPQv1pRvrabRHo1j1E8j0zG2csCbf9RanJwMhPPZ53ibtZXJkmtN1ZOQ4lLz02jAnQATUdZPZX5VvHyMV5KJnQ6Qh3/2Br1GAzBKZ9msj5ZipjBdJ/XCYJLJPkCmpfU7BPic9AU37f0yxT2YIJGZ69lNc3N0BAeHHB7Mgruzg7KY0d9Mmr07kwCMeSC0D/cQeiATkSC4PsvB61Kj/JeKmYRMzAdN1TWWkZmDjxygeVPHg2XP6WyV+352ArKTQxLdA0hbK7Qnco0YPaft82nlSr4UMkq1/Jc+EhLkBNLR1OzXavg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0425.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:229::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:49 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:49 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:29 +0800
Message-ID: <SY8P300MB0041489069A2D97631D49BF8B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3750; i=tfx2001@outlook.com;
 h=from:subject; bh=st8mD+8kuyHyg1CoogIQVqJGsTK50xBUi9vqRIYIF68=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+Dpdggmr22kmX8UzTTwpO5091QJ/FfrmmY5Qt
 5/jof4DnRWJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6XQAKCRAcD62l0/wL
 2mpFD/9N8W4Wa8ZCXGilAjy1f8UdH5AIL72yDNBTw2Nv8oKw+egDomkwH2O4+hnXVOjMXbBFFDl
 flyZa/uxz0zqvcJgqxgFh3uStZVGYeUblOLOxciGNd5QcmWKbjgEjk5a6qFm/s8AO8vEOwxrI6y
 oCR9vbhwb2u867lz5wBuA0IKFm8APphimfS8+ywy2+Pxqzu8DkRxlHmyLyMsLcvEvBlObbo8IcB
 38K1p4FPDIhap9eRc4kiMBwc9MXbxZ1rYelFfx18nITrj9l4cXZUJNCBRFWU2LOQmxq9Y4avY1v
 TFq5FAnHhC+NQJ1qUMyHhXt4zZfStqZkDFptQDnGmFsRTQ+JMt5Ps6Kxos/gjgKl2mqtufnskzB
 fRTJPZmV1Zn2mTfS2RUIjUdAmukdr1aoAKciB/tDDRmrGpKSkOGwrXDxj0c9rXkYNrESTKin5Gf
 l8NO3A4X/8UYFug0UHSkaE4MnnkfVZFC0Becthyu0VvN/mwMAjXGoTdx1cCAiAVDf6gdC54M0uN
 RKPi9zrEOQ/b9IWSrDdAq5vY7RhWxqJLX7GGgVN+pV3BUjX2+BNdxQ+qJ957dXqFDPsGxa0OFph
 0mpEZdNmi2/iaVoWTm5+grzda5lDUcmVKIz+zpr94CpWIVtgmQc9+ml36gQpMOb5JJKe3UvYaGZ
 +7tQlV7mdHVnxdg==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-27-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0425:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ac6803-582b-48c7-4cad-08df423c0701
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|16051099003|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dU56cXNaNkJLZWM0Vm96U2VwbTRvUitieVNybHErNHlTWEtXenZaMWEwT1l6?=
 =?utf-8?B?TkxtU3RUWTBENm1QRjhpMVFEOUdZMkg5cVhiYnJ5NmhubzVCaGQ2WVFFanNa?=
 =?utf-8?B?ZEtMdzF3WE1TQTNFT1lLZ3pGK0VNRGxHT0tsM28zWVovbFJJLzg4eVZCcnQ5?=
 =?utf-8?B?Yk16TVQ4ZkJ0UGdxa1J6eXRXeXlxL0JLVmwxRlRBRHJnVUp2VkpBYThLclky?=
 =?utf-8?B?RXU5Z3hBSW9OZlUzSzZreVhvVENDOStiZ3BMaW1TdE9ZTEV0WFg0ODFKZmI2?=
 =?utf-8?B?SHl5U0VISjNNdFV0TXBXSGpvQ2tKQmp6RDBlellFUmsyREg5SGFVeGU0M2FQ?=
 =?utf-8?B?R0Y5a29Xa0RZbWtERm1GREdtK3JvUytjTjNCeUUzMVplTWZsVkQ5Q3hqWUJn?=
 =?utf-8?B?ZDZOTWdxbk5DdUc1eVQzRTZMZWdibUlHUmNyQ2MzR2g5akprTXFwa01YYitL?=
 =?utf-8?B?ME1ibGhQUXZRcklrTUZUSkNIMnhCYjVSajRWOVdEWkFMU2x3SVRhZjljN09x?=
 =?utf-8?B?elJ4SlJwZmJDb2tYeExFRUhrejdjdEQ0RDRhVnRMaVpkNEJCeFY2enpZeWdq?=
 =?utf-8?B?Z21sUXV2WE5RVytZK2Z4aXM2bDJSZDhIK0JDUlFEVzlVb1N0YmZVTDRlTGZC?=
 =?utf-8?B?ZUJibFU4N2dQTDEzNWpsVGx4YTkzbEtKd09rNkhnK2x3eG1zbXFXd0hockxX?=
 =?utf-8?B?WnJuU1FCaWpwenRKdENpUVhSazE2bmZnbU85NFlFSE93OERGUVJSM1M0WHp6?=
 =?utf-8?B?elBGeEN4bEdWcnYzaElhak53ZlN5NFRUNjdRa1E3aGlUaWlFZkRRbVp4V3d4?=
 =?utf-8?B?RDg0anROeXhhR2lTczdSbGRpMTZNemZvTHZnR1FDcGpzWnBUcFpldzY5eHJq?=
 =?utf-8?B?M0RLd2lRTEl3dWM1MjR3REUySmRuM29JYzZodjZNQ054N1ZkMlhGUTRXN0xP?=
 =?utf-8?B?Z1JMRFBCUnowM2hHNkJhNG9ZWlgwOWRGUVE4eEtSSVZ1L05OQXhqWkQwNURs?=
 =?utf-8?B?cSthSjh2L0JyV205N0swTTlRdnBYck1uMnpJc2tZY2tJMnlIWEo3aHdYOFdk?=
 =?utf-8?B?SlFJRzQ1VmVkSEFpa20wWUUzOWhmaVNIK1lHcXkrVEdDbUVuSmw4anYzZW5J?=
 =?utf-8?B?WVExcmFkKzlKZmxoVDRNT25PQzVOY0JjTklKSmNjdjdoVEhJRmRuUnFyUGxx?=
 =?utf-8?B?WUhRb1E5VEZKTytGK2dkUHJTdm1OajFQb0p5ZktsLzN4b2I1dWkvc1lrdjhZ?=
 =?utf-8?B?Y2xkNi9KRldaK2kzaHBBeUEyUDBybEZaOWE5dldka2llR2dJVlZsVFNlRGpl?=
 =?utf-8?B?M0RRM01aajhjVEh3NkUvWmhGVEVHTis3Tzg0bEFMejNvZGR3UFczVitrTW5E?=
 =?utf-8?B?ZkJicCt2akNxMUk2KzNuWGltTDdYTFlQNkJjaDNTRkZjTGFHeUVRMmNFQUM2?=
 =?utf-8?B?UXloQ3o4U2Y2ckp4TU9wc04rbWVXbzVaU3dLUDNOOTdsOFh6MExuS0pZKzR3?=
 =?utf-8?Q?OKGOuE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjRRZVpFZEtqTTdoRzFmSEtXMlNESkZLNjdlMXZ1MWk2c0FGTER5L1lRbWZJ?=
 =?utf-8?B?TFJLN1BONkxwbmg0djJkRkhlb3lhRmRFM01uWUI4M082WlZ0WDlWd3dJTEg1?=
 =?utf-8?B?TXNzU2dJWFpMdVp1RENWSEIxRVNlR3RxZmJINk5odkw0RUZpeXlvSTZDY3pP?=
 =?utf-8?B?eDdsdHpwTUZuQzgya1I1ZVM4ejhzMEZqQlNyYThaQmFONVl1WWJmYS9PV3d6?=
 =?utf-8?B?S0JhaW55Nk5KNTFFd2U2cWlYa3JrQWNyekp4OWQvTExmakdyTFFpeDBwUVFj?=
 =?utf-8?B?L2VnaGVPcTRFK3BmM3dHcG1PRUdvTlhBQk1MZDgwdDZOSTFkZW0rUEpIUDdO?=
 =?utf-8?B?Y250SkdUOHpvRE1jS0FxL0U1dWRnM2wvTDlDTW1nT0dmYnc4VmlydlFIeFdk?=
 =?utf-8?B?bG15dG5jTXJFQWNsVWFIUzNqaDBCekFZc25kaE1lVC9jZ0RGa0ptTC9lY0RD?=
 =?utf-8?B?WjJ6bEFuNC9sQ0t5R1o3MisvQ2NES29mUjF5aGd1dmovSmVUbWxvQVVJRTI3?=
 =?utf-8?B?ZWNmSFRreERKN3AvUUpBaERyei9wOUNPYmxmZUYvT290MEhtYWNKVWRRVGF0?=
 =?utf-8?B?UDRodXJoZHJYY2VSWnlVN1daRmcvVzZMU21JWER6dU5kMXBiNkZBOXpTckp5?=
 =?utf-8?B?aHk0WWlPbS92VE4xamkxRDVKQkhESmZxaEUvbThQbmpmMDdLbEloYmJKTUY1?=
 =?utf-8?B?Vk1WdW11SzBqSHIrL3NoM0NUMjFRbjdqUmMzeGkzZFFkcDZWUmZGQ0hqZE5u?=
 =?utf-8?B?eU1sZEY1MGxxa2l1SldSRmJWMDk2VFZLV2FQdTZ4Z0lvL1grb3dvbjN5UUsv?=
 =?utf-8?B?TVFmYjhocHBrUnE0QjhtbUIyYUpDOTJpaFM0VXNpb21PQzJTSTlpbVphWW5N?=
 =?utf-8?B?Q0Y1bU5LQWdrdDlYRzJFSFlkMVJEUzluaXVtZ1NCcnZDWi9sY1VEaXZFd3A4?=
 =?utf-8?B?QXJRNzJnQlVDN29GTFB1WHZGOEFBaENNWE9iaVd1QkQxOFBNL1gwQ1FkMmM0?=
 =?utf-8?B?WkhuTkdIT2QyaTUyUEw3SVUrRXQyVnJMN0s2T1lGc0hiYWh6YktVTWxrSG9u?=
 =?utf-8?B?OUtXajFCWFRQUGZTL0FySzM5ZEluQ2w0OEJjV3V4aUdHdm1KcVdOV0JEYjJN?=
 =?utf-8?B?MWxJcUNMdzE2MU5SaVFEUVQ2R0tTb3VmVTJ0S2NnTHZCd2lCWjB1Q2prNmMv?=
 =?utf-8?B?cnBaUjZCajhwSit4amlkZUM2QlBnMDZicWVBV0pQRXdYTlp6RGtUWG15Nmhl?=
 =?utf-8?B?TWNyQXovK09idVo3ek1qZTd5ejc5S244U0w3VWVYem5GODlKR1g1SG05RitK?=
 =?utf-8?B?MW5BUUtpSnZNRTVmUytpSzZmdXpyZFZUWjZGeDRyRDhxY1RtRDVNc1pyV0Jh?=
 =?utf-8?B?ZWp3eWFueDZVbEQ0cVQvRlpCcE5lTkxDa0tzcUpzU2hnWFRyR0V6WE1FeVhv?=
 =?utf-8?B?Mkh4czRUQndqZU5VTjk3UE1CZndhTlFtVXpOdXFWNUo4Q0RmWHdZY3VMWWxG?=
 =?utf-8?B?Wi9wNllrQlNqOXB1alBYNU4zRmlkdkpWdXYwemcvSTR4bjJkbzFpaFJoWFVm?=
 =?utf-8?B?Z0t1WnZyVysrNzlLVVVkQm93b2lNaU1ZSG8wNDkrUUVZWTFKRnlBYkZEL1hj?=
 =?utf-8?B?M1V3OXI5YWx0aEY5MmlaUEJwOGUwMU9kcnhqSWQyaTllTnFhYkM3SzVSQm1V?=
 =?utf-8?B?QVlVN0d1OEQ1bFkzT3hUMm9lS0hXVjBwMVhySU9MVUVIdGE1VWhMUElZSXVr?=
 =?utf-8?B?LzVqbGM2UEFHb3hiYThaWFhzcE1QNW9rY21NdkZEOVNRclk3U2cyUWJtNFJ1?=
 =?utf-8?B?UWN5WFozT3RtSVhWM01YWCtLS0Jud0hXalhvZjVTanVKdmtKOVN4U1hJWGp0?=
 =?utf-8?Q?5kUcr4oOxY0p1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ac6803-582b-48c7-4cad-08df423c0701
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:49.6340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0425
Subject: [Buildroot] [PATCH 11/14] package/gstreamer1/gst1-python: bump to
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The analytics overrides now require gstreamer-analytics-1.0 [1]. Add the
gst1-plugins-bad dependency and its C++ toolchain constraint.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/e294b1b7735b91314c490c410e7960f7359c2052

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-python/Config.in        | 7 +++++--
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 3 ++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-python/Config.in b/package/gstreamer1/gst1-python/Config.in
index d2671266a0..752240f4e1 100644
--- a/package/gstreamer1/gst1-python/Config.in
+++ b/package/gstreamer1/gst1-python/Config.in
@@ -3,10 +3,12 @@ config BR2_PACKAGE_GST1_PYTHON
 	depends on BR2_USE_MMU # libglib2, gobject-introspection
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
+	depends on BR2_INSTALL_LIBSTDCPP # gst1-plugins-bad
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
 	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PYTHON_GOBJECT
@@ -19,8 +21,9 @@ config BR2_PACKAGE_GST1_PYTHON
 comment "gst1-python needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
 
-comment "gst1-python needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "gst1-python needs a glibc toolchain w/ C++, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_8 || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 917ec1e6dc..a3d97d7053 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.13.tar.xz.sha256sum
-sha256  abb9a1edc11d67a463b6cef7b74a8b10ea6c342760c012d597102a7bfb7e09da  gst-python-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.28.9.tar.xz.sha256sum
+sha256  e6ad2658fad5b96d99af72ceec7e48995ff792fbda438d34486d189ce047718a  gst-python-1.28.9.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 87120fbc74..a3abdcb298 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.24.13
+GST1_PYTHON_VERSION = 1.28.9
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
@@ -12,6 +12,7 @@ GST1_PYTHON_LICENSE_FILES = COPYING
 GST1_PYTHON_LICENSE = LGPL-2.1+
 
 GST1_PYTHON_DEPENDENCIES = \
+	gst1-plugins-bad \
 	gst1-plugins-base \
 	gstreamer1 \
 	python-gobject

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
