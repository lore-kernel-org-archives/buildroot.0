Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6323E606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SyZ9ee3s;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=VaAw/yEO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 400788123C;
	Fri, 27 Nov 2026 15:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2pCQKNkCvtn; Fri, 27 Nov 2026 15:16:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 17C2081288
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792569;
	b=Yvm8r2giexzitRhPjbv+pNPUVpk4lYQdIfkTAfjIB4bD9gs2ETwDayC50fyxZwAU4Bzv
	 2A7UxUCN33LApMAmE5GiWDGXP8Wlmkro/xPQeNg/I0VvTBTcDp0+3/4SSaEdWbfi+fqOF
	 Z+HxAlfg86+EFP1O7r0JOXmg26vPRnPgSCiP9XHEE6TpTP22E+KIRqysU0qo3MnTnyB08
	 dZd3aPhONby4JkjncRrJnKY/b/BIcaq9ziaZNM2gjq/j1ShinTm7u6xpRpVvL8wyAzMfy
	 fCi/pZ3bxYYm66wkWOycOkdxgCK+L/5KmFxhVYw1qrqJ8HLzeQZOM3o/aSpLFXemBeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792569;
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
	bh=LPWVrwbWAgMx2H/77HdgpaatteDeVJtWi63W94sEsu0=;
	b=Lq4SUxMB1QGd2N/SVDt8rxZzkyZgpD0UtJeorYB39L92jiW+M4TmGN6u5DvJvJP9/QeI
	 2SvQr9TILGYXf2qVuT9tvoUAIppR/jO/cDzpOSPU9dygNhRiJXLcXjxUsw7xcD2tLclqT
	 IiXTn3vQc1BlBcg/vEKf+x+0Vsz+5EbTPJdpsAQp/0PtBusoyb/xBg+NSyJNHlh0tugGG
	 0u29yIfNTStWHNUXi5oCo6HOH0S93mOadLMf0Z0vCSCRHIM1DaDYdjjqYbw9jlWdUqdq2
	 zPl6QCtqkrTLz0OR0dktIqhMJVWJ81CpZfAUkQVcl+uZjf/tFQYoEhSDNFlnRbtSu5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792569;
	bh=LPWVrwbWAgMx2H/77HdgpaatteDeVJtWi63W94sEsu0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SyZ9ee3so1Rg2xd0+SgIVDLr2mkFZ3Pht3g2CX6hWdozQbI7kW++Hj3ZUvb5uGfO6
	 SQCOaN6jlQcWQ551OUSl8T06ce1U1T5I6RguKj9zgEXuVVfu/1Net58A8T2HXGnz/H
	 s6x6lFZKXx8xl5J3gs6Jcn+gdsHWEoXEEKndjCvWd3gdhjyeDBb22vWydEEEbewtyO
	 Okuck5V+V/ypXYzu89NqVfIfKSJ3IL6wcyGlWeDZuVESVXbhs7e3uUuZqZCu30hQr2
	 R74LFg1q1Bj8czP0XW8doVwi6ByxSBPIMuz5GZH8Vc5sqKh9mxc47dGdHK/6sqba37
	 nYy7Urk6au37g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17C2081288;
	Fri, 27 Nov 2026 15:16:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A0F373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC90140836
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CK6xqjE30ZZm for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:16:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 42F8E4091F
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=VaAw/yEO
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42F8E4091F
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCMf3kL6IZN/BIq6jlWw8qUOKL78UdDnmB2ruTqQ7Xs=;
 b=VaAw/yEO/R8RcSaa3HARftDXoIhtZ+MeP2wPv3h5Q+b/j5hmWZ/iPX/4vsKg+m6tc2SZNloHZEY79F4iVapBfTx469U56O2grcIcpxKgQFERWBdFFJ+dLPkRLYZJfGUzPvszoZGEdnK+7PZYww5U68XysAWkuxB/S1A8DogssVdgBbcA22ANwRhqVK1O5+exi0Ltf+TwW49AnDiaATZ6cNckBywsfIE5ekiSnDfxpGATL/sADlXFuCsX6JPPPy/hqLYgOdIgUFmwY6QHF9Y3ZSOjSHmp79hCH1+N3VrqtcLB/idTVEfToAiUur8IIxJEi/mw1yXcu2WddM1qJUFYDA==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:15:57 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:15:57 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:07 +0800
Message-ID: <MEUP300MB0045CF4BB1C0503B02F0648EB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3234; i=tfx2001@outlook.com;
 h=from:subject; bh=PYszOAOyWAi4NDgLAB3+jW76f6lzgDNqdEUh4HpLUbQ=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ49E7jLLI9IP6+iEGd5zABvSIfOjsJj2xA05
 qrEDg96W9GJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmePQAKCRAcD62l0/wL
 2v6lEACRehIjA1E2mc8/+gcc/ZHsSgBoUGy5AYYS/XxpB/cs144tFQh2w2YbWH1ZPzxhi6HGh6/
 L0AyFdZGZPBJtaaE8ivF4X4HHXH+kBh9lKmA6TMMuYX2ZjUzNU+F5JzXqM8c8X9zjGI4OD7JGOf
 2lxzpUqpakgnUO2EdQSQvXviakEAPuFn50dCSXKP8WXxB404CuMTzrFtJ5S7WqywcUUEYK6Rm6y
 x4zTGNOY6dPxIR3CsTfOBgYod9uVc5aqRQ5TEBIWMGazjc2mwbx6BNfB5UTfovBKNuUuSPHlArV
 w+3RnionL0TyJFlosiAI43mJKexaR9oeDNnnaZq8NQ8NstP1+xR1Pn9MjMRX+Y8N4kBj3LoAr0b
 QA2VcayNwJbGIlCBUOwN+oXhFRi+QB+oDx9pq+esPSj+w2IMiYDGLuj+449BUr608UvEK0AsmTP
 Vh+aCp6M72xHoiukcDrhg69Uq25GRPPCua8OmL/XPgbqzlMLTGD2G1yJM+tdTVdaD1wMFY1gASe
 c8XdXVrfBP1zPjafGKSsGGgsLI3QDYQiVltwksVRvLFsVMzsFv8b0kmdnlWrw7yOuM6wXQZC2AD
 0zlAEbp09m2m73ywcbrhIF1NxXFG12sGZSfH1mQ7Loyj3yAHr97wY1n6jHSQNww09fSkC+gQrkB
 XODswrVFuJwQ9HA==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-21-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb194d8-e361-4a79-3459-08df4c995607
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|8060799015|19110799012|25010399006|260925184616899003|51005399006|6090799003|15080799012|23021999003|41001999006|5072599009|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEhMMWJ1aWZoSEZMTStWK2ZiNGtUaHZCL2EzMTBEM2FBQVBnVWh5UldmaGx2?=
 =?utf-8?B?TWxTQVFmQWhrMHR5R0xiUUJsTWkyR3dCb3N0UTBOUWdqcEpuMkJtbkZ5M3N4?=
 =?utf-8?B?czVWdytaTXk1REhlcTl1V3Z6ckxmbWwrQ2JCVlNlVVZvNUFFMFVhNFlHWHlO?=
 =?utf-8?B?L1ZhdHdUMUQyb0RhT2t0dUFKNE9KQ0ExNjRXbnowS2xLd2hQd0pidWNSMk1l?=
 =?utf-8?B?T1ZyaDJTWUFZNStCN1FZOTFFZHQ1ak9FdFdUM3ZBVUwwa1dtcW5YbHh0T2M5?=
 =?utf-8?B?K2djL3MzeG1WMk1Tdlp3Sm0xVzQ5SEk4ZmVmTVcvbjVPU0taRllBWU55Y3Rn?=
 =?utf-8?B?M0dPb2xFdEswMkloQnRldXJ4MnRCL05EWFpmdXVRTlJaM2NzMmF5b09VbWJw?=
 =?utf-8?B?VGd0YkNLQTdja2l0WE4vL3VESHB3VXdsbWtnOEJHd2cwUHNhLzRGeFNNc0xT?=
 =?utf-8?B?MUFDOHhLcWRiNmN2Qi9JejZyNHhoUVFlTjV4bVhMR2trSDM1VWd0YmhjQ2FF?=
 =?utf-8?B?ZDdpaUhUSXBBZWxaUnBXaDJEZmNNOXlIVEtEVlZEUDkvRDVITmZyRHE4QWdW?=
 =?utf-8?B?R1hoUVQvSm9hNXpxZXZyUEJoTXF1V0VualhBM0kvQ0EvZXRSSm1lTVNOMnQx?=
 =?utf-8?B?UDVzWngvUmRhcTFuN3h3R1Bma2htNnp2TnRYY0FSVDFyOUFBSVdmdjQ1ejBN?=
 =?utf-8?B?MGxBanlJZVkrbDFITVRGbTEzYWNvNGM2eDdRK0p3aU5KSGJZZkF5R3Yxc0Fr?=
 =?utf-8?B?RXdNYUZEeWxiUW1NQ1FRS0d2Ym5QT1ZjUFNKa3dSc05sanBvckdDcW5GT2Ni?=
 =?utf-8?B?dC9mR2hqTGFITkFka21WZGx2eXhFZEhPOWVEOTJCYnJwRTFIcEo0RWtZdGlD?=
 =?utf-8?B?MHRsdjlobnd2VkZXTXBCdThEQ0I3aVFaTHo3MHNlbnIyQWQ0SEwxTHh4SEl0?=
 =?utf-8?B?Q3d6VDJWNnpYajNSUjAyc2NsZmJQVDdORStBUmZHNDI0Z1ZZT3pTZE1vR0x6?=
 =?utf-8?B?L2pnV2dNbGh2RVViYnpoRW94eFl0N0lBS2tKSVlzNmNjWVRzZnNwLzFIWUlm?=
 =?utf-8?B?aUhDb0xseU5ya0xYM3NzR0MzZVpxeFJzTjZnYy83VEs1eTNMdG9GNVAzbjhp?=
 =?utf-8?B?dzE4ZUV0SUtMY2hVMXhMTlFBcW0ySXJ3S05FZXgvOVBZUU1nMmk4cDZZUVZw?=
 =?utf-8?B?NytDSS9vRnI5cXJETU9kbmRoV1Bxc2p3dTE1MkV5UzRSWTJBUmZ0LzlJZFFZ?=
 =?utf-8?B?dThPbW5HOE14TnV3SmdxOHRsWG13SlQrWFQ2Ny9zRGJzYkIvMG5tOFNzVExJ?=
 =?utf-8?B?dWJONStacHg5azgxT2FjWGtncEh3Q0lKS0x0czZpVFkzVUV2ekFhQzl5azNo?=
 =?utf-8?B?MjlSeE0xLzk2SXBsMHhLd1ZxdUY2NldXS3BiMFlOMUFVcUtwUy9pZ3BtL2Fs?=
 =?utf-8?Q?4bXF3vnP?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NCtGRk1XTGxYRGwxV1Z5Ny9hanA4OEU0SnJnNyswKy9kVTN6a1BlRVNlOTd0?=
 =?utf-8?B?Z0hlcU4rK3pXUktMamlOMDh2UnpiTUNhZWtkUDIzTVNteGtOSXM4MDFGZHZa?=
 =?utf-8?B?eStxZ21Xc01UWlF3MDhlbmkxOW1KUE5hdFZZMEZKdDVWb2o4WmdSdnFnNk1F?=
 =?utf-8?B?dCtYOGsvVTFVS045ZThxVWlvbGkrQUEzN3FIb1JQaS9yQlZSNHUzNWRjcHkr?=
 =?utf-8?B?cUVSaThueXQyam1ZRXFhVUgzZnBSdEVtcUovdnNhVXFqOVl3eHZadlJacnNB?=
 =?utf-8?B?NytkVXp4LzBKSFdEMzFhTm1ZVWpKYXhPc3loTXBuZld3TTg0NE5ycFhHWUpD?=
 =?utf-8?B?TkdrVDhQcnB4ZFJyYml2dG9YcUd6T08rT0tuTzE3L2RwNHdJTmw1TEVkV0Nh?=
 =?utf-8?B?am1TS0VtSWVOZUcvSEs3Qk94RUlhQlNwSVNJSllQbDd6eEtiY05nc0g4L2RQ?=
 =?utf-8?B?Z3FRdHN2K1BFWVhJVW92elJ1YnpQT3NjdFFVc3YxVTFMWjB5bWpaTU5ONWhU?=
 =?utf-8?B?UTFoUGIxT211eG85UnlCTjd4WWdyTXdnMFBab1drcGlkQWNOL2N5WkVqSisy?=
 =?utf-8?B?ajFLQnMwdzRNajBtVWh6SVlqdzdDRjZ1SlgwY3dyTDNnWFczNUZGVlZGbDFz?=
 =?utf-8?B?Z1paVnJxckxPVUw2T2dudm5aQ1lPR2NTRHJkNFdlVnUvR2ozVXEzeWpnVjlF?=
 =?utf-8?B?bENYNm91MFpnZUFCTlFHR2FVekV5Um81UUR3M2poV216R1VVSUdxQ3VoSTM4?=
 =?utf-8?B?ZTlXdCtmU2EwRC80OUdtTi9kUnNiTmMxSzJVUEkvZ0dlTjJURks5Z2U1d1BX?=
 =?utf-8?B?OUJ1OVc4T3lpQ1pkc3U2YVoxUWxKTTZEeldFRWIyb0F2K1pRUUJ3R2dvZVEx?=
 =?utf-8?B?RC9IaUZHamZMdGRLNjN4QWJ2MjBaRElaNER4alNRa2QwWHB3U2syNTlydTE5?=
 =?utf-8?B?UFNCSGtLbnY3bjdWdis4VUk2NmJGTUZGRzlxUHdLU2FEZEZUa0pDanRJdkZs?=
 =?utf-8?B?dis0SmFrdTdtUjNGMFI4Q0hTdmtjNzZJZmtBUmFtZnRGa1ZtMnZMUEZDRWg2?=
 =?utf-8?B?akdzeEdVUGZnQzUzQVhFVFB4a3lXNDhyQzVCWnBpVFFKVmYyNDBOMktpVTRj?=
 =?utf-8?B?eHlmUkcxYTdpM0p2cG5wT1djVGh6SThUN2JBT0IwL0Y2ZXkyYnhEUVRtNE5h?=
 =?utf-8?B?SlRtd1ViTS9vZkpmekt5V2JSUjRlMUxJKzNqd3pYZTcwYm5FUUszVHdoUmtT?=
 =?utf-8?B?T1l0VHZQVE45aVA3OVZNMTRkczcyaEdzZVdlZlNFZ21GbCtVSGFCaWZQREZh?=
 =?utf-8?B?dGQxMlIvVHpha0d3Q1Njc1oxbWpldlJlQkdNb3g1b1lyZzlCZU1yZ3VlUnhY?=
 =?utf-8?B?dGxudThXdFBxVnRId05TUWV0djRJbE14UndJc2VSMlk2b29vSHlhL0IyQmdt?=
 =?utf-8?B?UGJYaWd4Q1ZCUm1QaEo4N1gxemNCUjI4V2phcE1iVW9qVXQ1SHRVd2ZaZXR1?=
 =?utf-8?B?Nit4VnVrWGNmeWNEcloxWXREUUdWUlRQcmtiWWlmL09VdnV4SU9vRjQ4dERZ?=
 =?utf-8?B?TGRTY1kvK3FvdEJNTzRXMVR1S1lEOHFpK09uTm91dGtpMEZGcHlrTVd2a29h?=
 =?utf-8?B?V2J1QzRtRDRldklTanJVZGxwMXJMVVpTdHRXQ1VpLytlUVMySnNnQkhYZ1BG?=
 =?utf-8?B?NnNhYUtTckxxeDQxOVgzS0RKU2tHZ3JqaWNzWHpxV3grVFBpcGVycWxYR0ln?=
 =?utf-8?B?aGlWQ2VYaE5vNm1oMEduUDc1K1htKzBROU9SUWZYNXZ2NFMrNUh1MzF3dGcv?=
 =?utf-8?B?ckdlMC9rRktyOS9OQ3Y5emF2aW9pWkdmZWUvTkV1ZlNTaG1mdG01NzZCSjFE?=
 =?utf-8?Q?W4TClBqOh1ANt?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb194d8-e361-4a79-3459-08df4c995607
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:15:56.9788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 05/14] package/gstreamer1/gst1-plugins-base:
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
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
