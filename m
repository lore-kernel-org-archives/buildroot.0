Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67AD606D802
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UyU6mJQv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97AD06074C;
	Mon,  9 Nov 2026 13:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-X00VevckeY; Mon,  9 Nov 2026 13:42:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A199C6072A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794231749;
	b=oOKFHg0BjjNG7OyaXeDrJN+/mGBsVNrOm2EIfCq7YlKTh4GmIwkUdin/mU9L2qjjkwp6
	 UT1/mRdjAlbhrMNlly5+a9mFqlL52tvTSZgQRfSoV2XATY1vliCbMnSb8z9s3dKH72DDb
	 Zn1Q2MlEgUCpWJq7ibvt8jSh32jTNwYn2CUt+WN5KpWq2yWc12yK2hHDNfFLkndna+BnM
	 9yEaVcVlK2WCIicsgufBlKD/N9Rw4GOuDcUadWUcVXy0hqubTLjDIF97on11/3MNRateD
	 /2M6uvARPAVCd7LYwRDVYReg1IY90ASRnW/grB5BesMqCRAWu8rtlfJb5bULnida4gQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794231749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Message-ID:Date:User-Agent:To:References:Content-Language:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=0PIWRy5oMjWawYD/feySOM0MmQu0W8K4p7054WoZjrQ=;
	b=kNufte0k7tGa4iOYGnCEDf4ePBO6frIZV33FRzm+rQTZmxlMg2JoKWvAGmavsXQ/gOyO
	 EeJ9j3cKhBmS55botU6bVSxNlJQFST2lap+5w3oS08RKCSf2Bfm1RLQUgsigUB4JPM7lD
	 qqTe1auDVEwL7/U5BuQiAxCEHJxVsfBcmcKxasyVF5WHgsf9iIJBqUtoiJHNAIf1qkpvW
	 8Ncr2U7hqoPWWVUyl7i35+WuO+YV6pXYbRJMdTPnPZIHJqDc0+GD/PZ3pt+VNAOP1PoAI
	 BEtDOwNd2FxVroQE4KFDAKczNc9UsQeMisyJdK1HDxP9qUaAjJNGhmA88xuifG0JxRA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794231749;
	bh=0PIWRy5oMjWawYD/feySOM0MmQu0W8K4p7054WoZjrQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=UyU6mJQvd3UDuCP2/0xOw25tixvUcKXdrFuOeh0vlMEBVdalaaYo/tT+5Qhvb2hXz
	 b9FASxKGNZS5Kt5kr8cMN1uhLqTC7tKzcGLxRH6fyfoNxWR3ngT5aVTxd1ANsPuez/
	 uToYDklY+4GCOsnDFksUARa+3XQQYedDmm2wMF3MMTA6CauDZiDpdH28baZuhfOLUZ
	 wkxk9OMPahZJuq3KmH1rpmMARy62M65O6mHDoZdRY9f15hmH52PCSSKkikT8bwuU4r
	 z6nu3CboZEP/WHqWQEiSF41IE1yMIkEkFmw7YVmoS892I/ToJa1Wd6dAKYO1KNCIvQ
	 +8B8qbtA7yWTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A199C6072A;
	Mon,  9 Nov 2026 13:42:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 978A6361
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C78A6072A
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEg3FCiHXjTv for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 13:42:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F24506066C
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::1;
 helo=db3pr0202cu003.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F24506066C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:42:25 +0000 (UTC)
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by VI6PPF6686CC02C.eurprd04.prod.outlook.com (2603:10a6:808:1::3cf)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 13:42:19 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:42:18 +0000
Message-ID: <ed565657-1ebf-4733-8003-c40f2104e9dd@cherry.de>
Date: Mon, 9 Nov 2026 14:42:17 +0100
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
References: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
Content-Language: en-US
In-Reply-To: <20261109130533.4171508-1-angelo.compagnucci@gmail.com>
X-ClientProxiedBy: VIVP296CA0030.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:356::12) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|VI6PPF6686CC02C:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ef6443-e36e-441e-74ff-08df3e674615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|11063799006|261028144727099003|261102123227099003|261022105027099003|261022075727099003|56012099006|261021121427099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: 3IIIXhmO2jJk51VTm8+48ipWTrrdwMt3lvwXbxJUOFOUF49UjdIAg23foL9wWPDkrElWAdW8psPGCr9Y21YTxlZVuMo3RtXDJO6ht9fi2+KoUyybvMmziF2zyiFcK3lsGNXUtX3PDIDKrJcS3Vi4I3yjcfX6PnUBGWoH/hLqCau03eOpwnfkDUMQvg2I19HghBk5rolUQE8Sg7TTx2EsFFnXGhVpbZOeSjkdZE+S7wdwJ2upSNvh/PYmhVXCpSpRB8ndO4pF7N9OOX/3PMIIG97539ttGUZNSpekzM3dpuVAs3sT5QAYZUg1kU7wrA/rPTvoVHsKtKwMCUkboJQl6jXH25CK12Zz6xXrCwJnkXHA1ZJEKW8WewC+MQrOasMV+56nmVRfIrNV/iFD4Gaqepi+PCpLut1MqUWLWI/yDBnZhkDtDdmpTtTqQcRMxYnSMIPEBQucBm/WUtQsggN/Q/zCq4baUnUyOYdyR2lUW1hNHT5RS4jla3OjJWXl0CLueLTxrjgHpt1YEvFElUhzyLq/kZ4S/GqL3mqUinVOOPmTAs3FiORChYSf/lgEfqiL+qcLT4DeXB2f7tZM5+RAT/sMM8LSWgIa3pbeaQD1Uq1XWzIP7/g6+ix99IwPuGotY5ZvByrt3gYDSaQr7QNBqdW6wktkty7yqx3uJZDLQLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA3PR04MB11153.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SktQejR5NFBGNjdoWTMyQUV6eXA1OXIrWUNEUUgzYVg0bFl6bHBqd3N2NGV6?=
 =?utf-8?B?OWpPS1JvR3lPT1Q0OHo4b2JsVlAySzdjakRia3orenQ5Y3g2aUdJdEhqVm9n?=
 =?utf-8?B?R3ZWbHVPdVdRSm0xMFNJNCtqRVdpQXJWVFVHQkFibjUvNW9rSlJSaW1XWWVM?=
 =?utf-8?B?TE04alhhT3FBVWxQc0txaFYwdHhLUkFZaFQ0ai9RMXJsbTd4allxaXBiRHpV?=
 =?utf-8?B?TW81TGVPZVd2ajVyblhDY3RaUFFEaWF4UGtHTktKY2pLZ24vQ2JRYTdGUE5X?=
 =?utf-8?B?bWJHSndYenY4UEtsbkw5MkZqaGYrbkZOdjVwUk9ZZWhxaEFsYUIxRWZ3WGZs?=
 =?utf-8?B?SXBaK3BtNk0rN0IvTGZ4a3dwRnB2TW5TNkZ2RXlXTTBrbnRHY2hUSTg4SEVs?=
 =?utf-8?B?bE81UXdLR2V4ZCsxNUN3YllNYlB3VXRmelRpYUFPTTVCb3ZjQ1hnVzl6cXFD?=
 =?utf-8?B?YXFDeHR3U0tlQjQvRXYyQWJwc0wvNW8weGpJYUFjR3RVbGgwcWRENE56NUF0?=
 =?utf-8?B?bFlNSjZxeVhvZlhVKzgwTjZSRldtazk2REdFcXdBOVU2ZUhFaThYM2g2MjY2?=
 =?utf-8?B?aWxRLzV3MkJoUEF1UDdKcjduY0xBbjFpVUVHdEM4cGs5OCtrSUFBVk1Mai9K?=
 =?utf-8?B?NFhxNDJ0U2FqRkN0OUgyTzJHbTV5d3FXNzJkZytsblorWFBjN1hhODRYQWhS?=
 =?utf-8?B?SUZWVVYrb0NRR25ObzJMYkU5d0w0ZHRZMm9vM0lCN1p2VkZZcE9sM3QvUmtx?=
 =?utf-8?B?SW9CdlJ4QVJkWWJnQWR3d0hnZS9KL2hDUHFRNVFod2RsRk5iVlJpTnM4cDFv?=
 =?utf-8?B?YzUzdDNrVi9DSVJ4Q2F0SWVHejZuZFNhR1Q3Z2NoTVNCTkJpVVl6cHduajNz?=
 =?utf-8?B?dFd1bWhhZXVVSnpLM1FYSGNxREFJRm03Rkx2aW9rVUF5YjZOL0Y4djE3L1Ns?=
 =?utf-8?B?U2dqUzdsT2JFdXBHMGluMFV5a0VyMHh6aVkreURmcU5La214NWplbmFsYUND?=
 =?utf-8?B?NGZkbDZia2lKVmNONlR5QnhrSnhORVVQZ3dYK3ZRdzlra3BNQk5ockRGSFZI?=
 =?utf-8?B?T2I2Z3V5UDBPOHhxVko3WkVidDZjTGlkeC9pQWl6cElnVW1rSlFTbFdUYVk2?=
 =?utf-8?B?MGpTUlpZclB3bzY0WVpWMmpVME56Wlo3ODdJcDV3Wmc5YkYvS2hkL0dzVGZn?=
 =?utf-8?B?V0lLTFhFeHRWaEhtUFFKUkJ0T2pEZVByekMrN214U1d0aTRFSWx3Q290SW1D?=
 =?utf-8?B?TDROTngwVDJMbHlnc2xpVUF0MGVYNGJHM0lCRjlWdmRtaEZoRytBU3NYejJl?=
 =?utf-8?B?ZXVMN09RYjJZeTlvNS9BY094UnNBUXhrR0VhZk5RVUxaNHhkaXNxQmp1N0dV?=
 =?utf-8?B?ZXZkNzNFOWZKdjBQVVR3S3Y3aWJMRE5kN3VCK1o3czZTamhYWllLek9rMXJ0?=
 =?utf-8?B?S0I4NHk0MEd0eDRSajk4VDFCVGhHUWRBU081L0N2TE1ObW9VbjYrY2Z4Zk5X?=
 =?utf-8?B?Snd1SjFrZFlnRmdPT25QbnBJUUd6ZkR4Nm5aZmdIVFlHSUdyeDg0aG1XV2Rt?=
 =?utf-8?B?cmhOOWFiQ2NSUloxWUxkaTVER0kwMnVJcWdvaUNnR1M4VHpvVXlyc1pqSkVk?=
 =?utf-8?B?bUZ3QS93SUFGYitDMHU4enRVS2dTSmpENGRtMWMyS2daQTVDREoxNlIvTExG?=
 =?utf-8?B?NlFQRnc5L3ZId0YvVkR1TFlWWmJtNnFmRHBNbXp4YjZSUDR3WFR6VC9VdWk1?=
 =?utf-8?B?VTdjNTg0S01aUnF5cXgyN1VXMFhnUjZhNTlLMHRaNWNuc0w2QXJlZFpYZlVn?=
 =?utf-8?B?am5CQ0M0UTZHcGxUZTZmOHp5b0diSFhzTUpjN3VnbU5QRjdmUmpOUzI5UFhw?=
 =?utf-8?B?M21ESFp3UDVyZDJ2dlBmSFQ5aDd2QzVqZUZjeGRHbWNaVy9vclV5ZVVjdkRB?=
 =?utf-8?B?VUxtbnh2UVVqYmgwODJjU1p6ZlVMSlFyNUlRNE9BcEJ1UTFicUM4YWtDNGRw?=
 =?utf-8?B?K2NuMDdOcVhjWHpVcXJyeVArL2sxMHd1NSsvdE1ZU2JjdmlTRldYZklJTU5P?=
 =?utf-8?B?eWE1Z2N2Y0poZ3AyaXJZaTBac2pXOW5PTSs2d05iTDdYV24xOThJSjZBUnZG?=
 =?utf-8?B?UHdYYTlCa1luc1QxL1FDbGZ0VU5Ob2QrdU5QNDhiUHdDVWpjMVNPRlhULzhk?=
 =?utf-8?B?M1N1a2ZCdnVKbnhNRGFZMTBZTVZLRXhuVmtnMXhNN1dyZVVmdkcxdjBJb1ZY?=
 =?utf-8?B?UlhrRE95cGtkT3lEYzZSWVErWXlxUW04VHRVblljWFNYZ3AzazZ1ekVta3pz?=
 =?utf-8?B?SmJjZGtSbEl0b2Fzb3M1TXRVQndGNnZhY3FlVEp2QVgrMVQyNkF1QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ef6443-e36e-441e-74ff-08df3e674615
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:42:18.9179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAx8XYdPsqRR5s2/UQx78qoFymCNmrUmSAhZlFDb7ejefPmxdZAsTmPCk9ZkKQN83IBpT0LsEX3j3B/R7SvpMeB5shntuWYRQP3EHcB9r4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF6686CC02C
Subject: Re: [Buildroot] [PATCH 0/2] package/qt5: security bump to version
 5.15.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

Thanks for working on this! I'll try to find time to review this soon.

On 11/9/26 2:05 PM, Angelo Compagnucci wrote:
> This bumps the qt5 packages to Qt 5.15.19, from the kde/5.15 branch of
> KDE's Qt5 Patch Collection, which is now rebased on it. qt5webengine
> is bumped in its own patch, as it drops and refreshes some patches of
> qt5webengine-chromium.
> 

I don't think this warrants separate patches, c.f. ff4243147d54 
("package/qt5: bump packages to latest 5.15 kde submodule version") for 
the previous bump. Please do not send a v2 only for this, unless a 
Buildroot maintainer requests it explicitly.

> This should be the last Qt5 bump: Qt 5.15.19 is the very last Qt 5.15
> release, and the Qt Company ended its support of Qt 5.15 after 26 May
> 2025 [1]. KDE keeps its Qt5 Patch Collection only for the open source
> projects still on Qt 5.15 until they move to Qt 6, and only for very
> critical fixes [2]. Qt5 users should plan their move to Qt6.
> 
> FYI: I am working on a series moving the Qt5 users to Qt6 and removing
> Qt5 from Buildroot. Before sending it, I would like to get feedback on
> this: would the removal be welcome, and when (for example after the
> next LTS)?
> 

If upstream is not going to fix CVEs, I'm not sure it makes sense to 
have support for qt5 in the next LTS. But maybe the LTS maintainers have 
a different opinion. The cleanup will likely not be straightforward and 
will remove a lot of Kconfig symbols, ifdefery in packages and even 
packages and defconfigs making use of qt5. Someone will need to do it at 
some point though :)

As far as I'm concerned, if I still need qt5, then it's my burden to 
maintain it in a downstream fork.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
