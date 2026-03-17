Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3315FED9E7
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 15:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C18E82E95;
	Tue, 17 Mar 2026 15:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVn8YaLjtfy0; Tue, 17 Mar 2026 15:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9053D83EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773762034;
	bh=7MDkQEegstltNJmPFiGoBsqyPwEtbRjITHLauH+vHgE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fWxyDj+G5UbmefQSuiooxBTBQAj8LaC2/dEfO0FENo+uHcSl01zvp3Gi7h+I1hJ7u
	 +irdRKKHKPqR+2ppP0K/eBOewFyvJn1AHQaYvl8CT+xQKqGbvcEYMPJzqcfmwPq/8U
	 SOotjDqKT+FKkYRGRIxJy/vcN1XI5Tpec4534JoHgzi9MSiP+0CvyvkqqW0OJ8qDwP
	 vbFutsRynB46gJFl78qorzb8SNY7V00/+0qwWyqJI+IQEDt6KPQZRDfQx2qAdK0DKh
	 Ad9wPZ88s2gjmlzwlUlJaaTL+RNmMZ8kknQntJW+vX5RCaywXMwlENS9mtwSXGar14
	 Wglmt8LIYduWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9053D83EEE;
	Tue, 17 Mar 2026 15:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCE451B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 970D2613A1
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTv3_QuJjj6S for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 15:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD8D560F60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD8D560F60
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD8D560F60
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDcEp3lw3lokyXGJ2bA+eCG0CVOJfgSyiXEOe59uqWvcpuGCP1lde+vFkfZnkOmgS4tC/xNptb0ySpW8M9xGcfcbwoZnOoIv6Qfy3drBPmSJVyNwNOF8yHW/rA5qrT9WnKDa9GF7qrTBR1aTMd2Kf2bhk15lBKKv8YZopBRBQqGDnekiBNRrAM+5vKuRaFYM6+doyNX+fHFrJQKAbrR/X4SSeGtDkxgMnfeQtDPH4leeF/I0zC4t9JyN5XAxqXCbBSosd6sTuTZD+dZbuUF3JKZ2rPLmUqwJnDu1Re2CHKYkfYRXW0oBuloyuEXkkLLB2tpuG7jT9R7mpiCptxY4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=450rStEaifBtoG0UmJ6BIblo8zwOAuMCsS1C8LT+ufk=;
 b=ZVkiGTjQI3PLYDR4NX5muxa0aqBnkkGCFTLTd6UaBUKkIOURiMbHv2uWm6+w9ExCGtR4ezBe5SnKRtQWirPxh12VIscuXVw7Smi+qxaHqwaGuGCPZv6I1UOlqJgwBgf+Du6wlATiA023kpN6PhZu/fMKx5+xepHNEZS/TzqdJPp1ycfMS+dN/l/06mOAGdDOgjRdcgcrAFD9vtgfJVMHS2b614pnxPEeNAO0fE8VQ4lCRg64uEquE/+tCc040wO5Ay4QTAyQPYhn6adXV9jrV3YjYZBNtosytKwAueea0xeXTpe5/zSSVpR+vD0FfSAXNbz7BUOz42mtJuGeZeQKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB8270.eurprd04.prod.outlook.com (2603:10a6:102:1c7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 15:40:08 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9700.018; Tue, 17 Mar 2026
 15:40:26 +0000
Message-ID: <21cf5db5-5627-4601-b4ea-9c6a7b9c6055@cherry.de>
Date: Tue, 17 Mar 2026 16:40:25 +0100
User-Agent: Mozilla Thunderbird
To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Guenther Harrasser <Guenther.Harrasser@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
 <d703edf5-c644-453d-a3e3-7e2024d1890e@cherry.de>
 <DB9PR09MB4987B2E35A2A300EEA66889DF641A@DB9PR09MB4987.eurprd09.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <DB9PR09MB4987B2E35A2A300EEA66889DF641A@DB9PR09MB4987.eurprd09.prod.outlook.com>
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1e5ffe-8319-4ec7-1ddd-08de843b82bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: 1ukuRQWXBKORP7hKLUm5rkg49uvoR2hmhGhz+lKbA/VcpHB/BsGTCaynibi58qGQfGmmrj1BmcVr6QDq48EDRunZr5ZYOHiAXK+m01PvtaNit4JuCZmi2JZpYS3+ucnDmIGpDkJBHTxdeTIRKlHEixBCF5k5GCLug3v6cQXNpxkZNelSZgd1H1hAmZ2yc5/oLoI5C5TQJ71Q32tsRrNud9AZUkn4WyJdauHnqvMIwYwpOEQJFtoAGHjXGQWGiDj5UmM1tEy8Zku9a+jaouIBlfMlLOtvG4b2jPcpWgxlstGF1aLsn1ERpe/oTymc8OfduTBrSI7ESpKA/os6vsS8+3lki0E/zyEzOiJR1d87OMpJ4/jeUpQAbula2wXzSZhs+gp+j/5J+rXg9NbwMzlZg+h7BXfjGmE920Zl/+FiYxM1ILbDlhloSlddsbNxfdKB7XQG7DoE7f6ONdB497kDTlxNd4SkWacRJHn5+8z/jigBromghQN5J6+RHeDMmO92Q2y2AEvFGRej95TgpGzur93f3XSIsCI7CImk5gPF/BGn9YUQo88m28EzKUIv7WD1vJxFbC0/WCJ83QC/ILWh7zcpyZ6JZjhnZrbRvY4qiYJTdtbbDYsFzM4DNWZ435pa/3KnaQMHge3qwR5Ek5g5j57SsdGIWJ8PaWY35t1W4RxNkHigIT+jPKvtCqMTMPkz6I15WyVgUyEc/rZVBQiKlBoMTkcWSkpu7TcgdPnQ+E8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1pLUFFOOUdjZSs5cStJYU9leUVhcWpVYjlDZks5V0NMKzRucjZrb2gvSm1x?=
 =?utf-8?B?L1ZqL3JmSW8rN2hnMFlYTGVRem85a3hNNTB6dHBXZ2xyVUlIOFI5NkFRb0RC?=
 =?utf-8?B?a0d4SXZUMi9YS0k3bVlkazl6dmx1eTdXeDVlSnJ0cTN3T0Fza3RXL0JzTzJS?=
 =?utf-8?B?dzVvR2NIMENDMGp6WkZMdTZ3TVh0TE1ZVHZKMDhBSzVteEJjbnM3RUpDZjhj?=
 =?utf-8?B?a29jNHZ3UFVuYkZIUTRBeGJpbjB3bzFtRVY4bnlqQVpKa1pRdzIwYnMzMjBk?=
 =?utf-8?B?MW1PRFhMbVJwUCtjNjdsdUlKdytvcTFVdGpDRlhPTzdJV3pkZWo1UUw0Q2RW?=
 =?utf-8?B?dEt6VHdBeVkvQzNZRXh6anpTa05mVENGdlZQVWFVKzUyUzhlZ1FzRjA3TGRW?=
 =?utf-8?B?VDhWVWpKNy9TL3d0YlpTQzdINEtKVStUejJ0eU51bDJFdEZDOXJ6MzQrMm9m?=
 =?utf-8?B?U1Y1L09UK2ZNa3RtMDZUbzVEd3V2VFhvaE95STNxSVREVEIyd1BCL2U3UGtj?=
 =?utf-8?B?NE9keWVuRW9QT3FTa2h0RnIvWk1uaWRyeGNKYjExSzQ1QTFiTjdSeFRaS1lI?=
 =?utf-8?B?QWgvbm1Jc0hEcTdPS2EyM0JWSjRmcjBvTEk0SkVxRWtkM1VaQy9oYk13Zk84?=
 =?utf-8?B?TUQ5NVFmOUQrckR1MXJiL3lMbmc1MEptM2c0bnJQeXBDWG1kNk8rckdrd2ti?=
 =?utf-8?B?WHFSeXhPZnozaml5bkorNThLOWpiMCsvVnlZR0lVUzh0TVpTUk8wMExPQ3lI?=
 =?utf-8?B?THJ4RVM5WEZqTm9aMm9tQ25waEJhbGFvdUl5djBraVUweTgwczR2WXNLSnho?=
 =?utf-8?B?eWdTTEJCL1hZWDIxSHMyY0ZUTXBKdUR0K2lWcTNXTlR3Z0Rkam1kR1AzclNY?=
 =?utf-8?B?dmtuMXFGcXlkR0dnWkwvMk8wNCs1YSt3ZVZIZVJ0QXdXOXBkS0JaVGEzSnFU?=
 =?utf-8?B?Nm5rZVdiNEQ3dEwyR3F4TkZFRjZrRkdBSVdIbW9NN1gzUlJjYmVJNmpYd2Rr?=
 =?utf-8?B?U1pHVVBnWS9rNGVwVmNFSWNidldWcXorL1RLRCtyU0RhTEgyQ21ObDhGZ1pq?=
 =?utf-8?B?V25sZmZKZy9yWmdLU3VxU0doVXFaeTQ4SHJkRlkwakVuMXk3emIxR2VSWE83?=
 =?utf-8?B?TnA1WG1EazNPdWdpNUN6cGhKbS9xbUpGMFh3eVFsK0d3WlI3SkpDakE1cEwz?=
 =?utf-8?B?Y3BrcVB5M2FJcm1YN2pHbFlraVQvSGpRaEsreVJkZWtWL2NxYXk1YUFJSTdU?=
 =?utf-8?B?anRrcWk4QkxsNHZvS1p2TURxMEZWeVpaeW9qVkV6UjRxR0NINUNPeXlJOWkr?=
 =?utf-8?B?VHBwYlJWYjEzUlBRVVh0UTk3REZOV2htOVhuVVdndzRlUzZTaHVDK0c1dlBi?=
 =?utf-8?B?L3FibWxKREdudlk0Y20rS21mUEhrTjczUytLeHlmeEJtaGtvUFpVbzQ2ZGRU?=
 =?utf-8?B?MnB3SGN3UXh2dk1nQlpNWkl5dG1HbE0ybW9yT2pzZDhSWm5jd0t1aGlqa25K?=
 =?utf-8?B?a2o0V1JKTEc3cklmam13Rjl6U0RkaWlieE5ta3hnYnNQbnJud0JtdktEdXM2?=
 =?utf-8?B?K1VhZXhGTG9QU1RiamJGQmJCbmxBN0xWR1dVQkpFOCttd2JZRFdRdXNROVA1?=
 =?utf-8?B?ejc2Y2hiRXJEZkwrbDZoMzVkQm5XYVIwbkFmSSt0bVBTWnJZWkVWaUNRNHg1?=
 =?utf-8?B?QS9PaEFXR05aQ0ZIWCtoSWdQWU9NTEl5V0VVM0NqSndXRXVuUVBmRDRzakxJ?=
 =?utf-8?B?WHFtNktka21YOGpJSzhjQmw3bXVOQldTNk51MHFzV2o0TFJCTmFrSkVrbVM4?=
 =?utf-8?B?VzkySEVKSGorbDdHVGZoNS9RWkd6T1c5czVhWGlrMFVkOVRuMmhGaFRHMkRX?=
 =?utf-8?B?cUNPWFRUT3F6cndMckN2WkZzQ0NmejZOSEkwY0xxOWZyRjE4QTVSdE9qK3Fq?=
 =?utf-8?B?Nk8yMG45Vkc3Qkw3dWU0cUZxYzRHYW5hQWZOeUJvb2FqMXNWSllBRDFSTmZo?=
 =?utf-8?B?RU5EUzZXSmdXeE0zN3hteEYrREI5ay9tUmxrcFNPRXlnampRQ2dTK0d2blRI?=
 =?utf-8?B?ZmI4UXdpbzNhYjREYmx0bXl2T3h2WTU2ZXhMeXlUTXFmdzFXajUyVTVReGdT?=
 =?utf-8?B?Y2I5Vk9lNk5lWXBUZ0JFcGN4R25LRlNKeW1aazdLYVlIL2IzR2FIb1ppUEg5?=
 =?utf-8?B?ZUhNcGtPVkVSeDlMRCtRK3BZTGdmWU5ZOHpFaEVSRW9DNVFPL1NlazF6bkY2?=
 =?utf-8?B?Qk9BeXRiK0lQcEdhQThlL2RwUTQ4NXV5YXJnRlJBcXUxbTl3QW9HWjBwemlv?=
 =?utf-8?B?QjRHcW9uWVFpTmhFaHRQdmdBV3Y3TjVIYkJlMXNWSEtxUG9JbkhJdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1e5ffe-8319-4ec7-1ddd-08de843b82bf
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:40:26.6097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqOYo81Lq7OtDJMAWnYXD9uqKka7uH2tCD0PLyw9CrCq5OLz74n6r+XZ0LY7rpiCfqjtNAB9jm2jnfN9BlGmpedI9huHQdf3P1yeJsnkq0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=450rStEaifBtoG0UmJ6BIblo8zwOAuMCsS1C8LT+ufk=;
 b=m/1BiIK4wVmyp5ZbnJQdEkkFXdRYzZnLR3t6qOJdOyYps1GcsVbeGXzFDS8w7+plrP2a+SyyzHDBXAn/8IjLJt/5Qih0jb9RBrpYfpnDmjg9PRohvZTMl5WK/6cjdQprVFfPETH5XZ0bmJC9H1uHKh8E1du64TFZ3fo136c2aXM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=m/1BiIK4
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 1/5] package/libopenssl: bump version to
 3.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jimmy,

On 3/17/26 4:24 PM, Jimmy Wesolowski wrote:
> [You don't often get email from jimmy.wesolowski@mobileye.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hi Quentin,
> 
> 
> Thank you very much for the feedback!
> I will create a cover letter for v2, thank you!
> 
> The timing is perfect, since I could finally run the CI. I was concerned that this

If it's the link you provided on IRC, are you sure you meant to run the 
openssH tests and not openssL? (I have no experience with Buildroot CI 
in GitLab so maybe that's a valid usecase for testing OpenSSL).

> might take time, and I wanted to allow anyone interested in the patches to be
> able to pick them as needed.
> 

I don't think we are in such a hurry that we cannot wait a day or two 
for the testing to be done :) Especially since 3.4 is still supported 
upstream and 2025.02.x has the latest available version for that release 
series. Stable releases (anything but master) are intended to be stable 
(hence the name :) ) so care should be taken to not introduce 
regressions, therefore testing is even more important than in master.

> I could bump the version to 3.5.5; from my understanding of that 22.5.4 section,
> I should do it for master as well.
> 

You cannot as master has moved to 3.6.1 already, same for 2025.11.x. So 
this only applies to 2025.02.x (since every other release is either 
already unsupported or has moved to OpenSSL 3.6).

So you must follow the "some bugs may apply only to a specific release" 
part of the instructions (even though it's not a bug).

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
