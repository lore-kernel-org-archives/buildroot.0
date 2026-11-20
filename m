Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD922606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ru70QQur;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com header.a=rsa-sha256 header.s=selector1 header.b=othsrP5m
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8795060773;
	Fri, 20 Nov 2026 07:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuEGApQSyRKX; Fri, 20 Nov 2026 07:49:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 94313606CE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795160991;
	b=lgQ41krcV0GGIHOY1ka4TxcQAjLvP3u4su8cqVBY6gWMwg24NTJ86N5LRPzeLh6Ei4ax
	 O8po1wNDiOC1wDkBz63ADsNYuc6/1ahbzGU0pbIe5gf5FZL3ktgAcYuEa9nLLFV2bt7bQ
	 ef88bgxblitwxrZ/mkM4Gb1UEADg0ZUAeAbIya03fnokvMjw1umdQJkQ6I5ndePsVRFE/
	 rqiTlhg7lEbEi/WY8xh/sHDEOCPCq7zjIBGiO92Y1BwsgbUWgIvXkR/ev+qBC81LA8FH+
	 YGl6iHB603LeDo67ytUqCSf7BWzjb/LkMi4sSb81PhLy53Vk9ddqoEWai8hJDpHtQAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795160991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-ID:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kp+CRVJGiHsttgyxKEAIkxH50i7uLk0+N+JvP26hrjA=;
	b=VPDCXCdsBVWuFXJELawgdt/c5U7GjcmPTHwV+BnpCDswDFUcKqk3lnzyUF6bdu37zxOv
	 vmfsD96acRCCuK9TG1DHm8HMQQOLDOvglxv+WOqcRIFEP0s3IbJlicLtjUVBzkCTI6G8V
	 uH19dmjOL0wV5aTGLDnRNtI3FLIhI23xtZDBzCc6OYfBcB0MMBgJquZWcyLHbz/GAPMs+
	 wYABiZ9cVuR8aewptcX6oPJmJlXPq5Hsi41ofQDxL+u8z861rs3X+WV1kYjVOgco2RVeS
	 ANe4qwHUe5+K7d1nNM8EikNcnhlcdr+Di6rn86SfTsC7BfwD76uoPfJ0Imc/FzoX5bg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795160991;
	bh=kp+CRVJGiHsttgyxKEAIkxH50i7uLk0+N+JvP26hrjA=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ru70QQuryUOqjRMPAFXeJb+n6dWr60Fa4Fn1gmRorANWCtsb3a+KAc2BPcyWnmPz5
	 bLa8PZ3iZ7gAZKsyqIpY18rhuGP1BltT1/z1fw2x5kR1VHGrLHzcbZ0moqhkqS5hjz
	 pza2rMls5lOR2wRgcSY4Xq1k8ViR0z+vYOB8V1InmretKFxJ6hovKE66/A3Bb26O2S
	 g7mdmRPjsgMfzh3AbiYGxq0CwF76dVPuMUnsnfDWqJ/1Vns1qviZChPnXOI5Nu/Qgg
	 9GBAOqXyclfWi3y4te3S3X1wi7NM2+RsazF4Rl0l7Nzb5qtfyMRfEbZHu3oxXq+K//
	 qL6HdoJ12s6IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94313606CE;
	Fri, 20 Nov 2026 07:49:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DD1279D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5397580E35
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeBb18Vh7n1Y for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 07:49:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B83380CA9
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c207::1"
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a01:111:f403:c207::1;
 helo=mrzp264cu002.outbound.protection.outlook.com;
 envelope-from=slaveze@smartandconnective.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=smartandconnective.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com
 header.a=rsa-sha256 header.s=selector1 header.b=othsrP5m
Received: from MRZP264CU002.outbound.protection.outlook.com
 (mail-francesouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B83380CA9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 07:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartandconnective.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89qjA+Y0sz4HeuxHG3mCJtVedMhpE0TVsi9vMMuEjpA=;
 b=othsrP5mT97AqfiqxSmEMZdt5Z3l0Ha0XKBgzllajnEUN2QBTWrYQwfkuoAX/t0+1SzVEr00KI4+gTWttPnwxKNj/duXi+gWd/jyr4RRwwD4yTthZkG60eFoeLXdcI708BmkONMHr5UNapm5hcJ5VblIh2wTCBlwYPxa6CZhiG9nYzobHPt/hEM1E3S/lETc9gyu0DhXhMTjaHkBkUD250Qn5Go5mjwum7tw94YN9uL9w7WEgHpqkf5KLLS/woF2zi3HVagiMe1AVc2lY+T/kMZk0XuNTgttpiIF+YsP9ck31K5i700fXHSFFp42xjSZFVdRYnuqWYsrYfSjZeb1Eg==
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:23::6) by
 PR0P264MB3308.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:258::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Fri, 20 Nov 2026 07:49:42 +0000
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1]) by MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:49:41 +0000
From: Sebastien LAVEZE <slaveze@smartandconnective.com>
To: Bernd Kuhls <bernd@kuhls.net>
CC: buildroot <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/{rust, rust-bin}: bump version to 1.100.0
Thread-Index: AQHdeE8Tz2tQcmOWwEe2osGXdD6QVLc2lsiA
Date: Fri, 20 Nov 2026 07:49:41 +0000
Message-ID: <935489f930dbc7c8cecb793a97b895b53ce04a08.camel@smartandconnective.com>
References: <20261119075949.253474-1-slaveze__42668.8676512399$1795075221$gmane$org@smartandconnective.com>
 <5dee1fc6-6dc1-4142-9c1a-02d06be822c8@kuhls.net>
In-Reply-To: <5dee1fc6-6dc1-4142-9c1a-02d06be822c8@kuhls.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartandconnective.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB3425:EE_|PR0P264MB3308:EE_
x-ms-office365-filtering-correlation-id: 98f638ee-8e68-41db-d064-08df46dad602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|260925021311599003|260925021911599003|260925022911599003|56012099006|4143699003|10067099003|261028144727099003|261022105027099003|261009223027099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: R6cmexfMHRM3Wj0LpyzW/qdAOOtXwnE/OvQaDaVMUj4wubGA+Dvm4kWHGzcsF56Nb2euA48AHrHPs45GlLxJKKO/ayZl0RUQoKsq+SrWA0tF42j8iIPxbZmB9V54+ZClxcvb/vO/j8BEpbsW8aAseWzYvH2YkcNeKPQ9LDVOXmh18xieEV+b8vHQY1lVfBLXxCfi3bEKT2WiTFj4V+bNtLI9/duTpiDN69FheOSEsMPMrJB2XwwC1kpUqEqbTmagcGlFF0jtJBA1cqEXWREWf4RB34/8QtbOqsVys/c0fPhl3nyP4Eu+iZqeSuxdAOhilRi3K0/hakjGZOK1CLbnEkMW7r0emClDSTWxHofHPz4LmYaNxH3f4iUOWmUTv3n93taPit7g482VI+MQhZ4IpJaAAb5wKXom5iwpLN4ARViVIB/4j11ovTFR+mEkpdRuiaQFWarp51gInW5DhpQfrmkBFvF0cM0+TWwHCF6hlOfqPuNPlx0DDgeqTX/nXkPHTrHssEpUVoiI/RARY7l+IZZKLtMYWew3d8q8YJmkQ9CDYKh781n8pphkEy9MvuAboB44Jsi8dYAW2zO16pjucYtTWcDMOYyU7hWAO/XL5NuexpSlkueIe66EQOOYqzGfYlIXR0xFT92PHNB/RnJjVXiEluxNks/ciMXAft12JmMAOMkQUpSa8wFiTOTVyuHoWJzlbQRcjlNuEvSBoIZsl/exERht3+CSLWxOSquGeeE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(4143699003)(10067099003)(261028144727099003)(261022105027099003)(261009223027099003)(261026140227099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkxoOElhZTdWSFlwa1h0NWN6R2tVMmVXbUhHNFl6SDhUUWZzMzNYTituR3Nj?=
 =?utf-8?B?OXhUMjJST2hpcDNjbDRJZEo5TkJIb0VxcmQ5cEtEbkhjK2JPbFNRR2w2MFh1?=
 =?utf-8?B?VzhYdjJhTkZpMGZ5Wk92MzVlUU45YzJGblZYVFdxT1RWeTkxcHlMRnAzdEFP?=
 =?utf-8?B?YnZkNklOaEVWbnRBM240d1hRYkFhQnl2SFpDMkxIRGYzSVJ6OEhLbkJTbzh4?=
 =?utf-8?B?Qk9TMlNpd05pbHN0WGVvcjlZRU8zOS9ocWtQOWVWZG1XNVRkM0J6ejZISm1Q?=
 =?utf-8?B?dXN0d0MrR0J3TXFOZ1hTUHpMb0FpYUE3STRtMHRiY2RndWdHUm9iaE1idEds?=
 =?utf-8?B?dC8yUXJOcmhPb0UwN3NqcHVqRjFXSkhBOWhkMlRLNVFDcDh3a256ckM0akMv?=
 =?utf-8?B?YWNqZFNQMDBGY2t4VVhaaGUzT3Uzb21zZzR2b0RsdWZ1RDhKM0hjSWZ0amxB?=
 =?utf-8?B?QjBYK0JMbDNlYzVSQjIwYTgvV0RvNkc4Z0RVSWl0NDRXRlNidmVpTVgvYmtH?=
 =?utf-8?B?OCtaMStJWU5CUVRQQ0JQS2UrK2pXOE44eDNuTmJGcUk4QkRkVVRFNnhheTAy?=
 =?utf-8?B?RXhJb1dWTHVoSTJzME1kWVJNYXJuZVZqUG80ZXVuK0g4UGVodGRBa2pmZ2ZQ?=
 =?utf-8?B?a1o1cFpGQjBiRlVaQVcwU2lBMFhjZEtVZHBNYjQ5bXAxZndmNkZXUm1lR0do?=
 =?utf-8?B?MnpuK3hmbVNlemhaUTMxaTNYODVDQWswaUJqdFBzWmZHZmtmOHJwbU4wUFR6?=
 =?utf-8?B?Um4yMUxnSDVMVmgzWEpsdC9ab2RVR1RzZnArSlFXREdqeFgwdDFVS1JqSVI1?=
 =?utf-8?B?R0N5c3FBSUF0UE0reG0wQzBxQ3NYa1Z1VDdMdjR2TjI0VEdQVFNkOVRUbVJO?=
 =?utf-8?B?MU1EZzFoK3U0L1lsZHlxcTU0OUluL3VMTzhmOFhIZXRMT1hGdzJaOTRvbmhC?=
 =?utf-8?B?YWVDUFRSUEEvZ3RNbktuSk1NUHRmdStBYjJ1TG9HQU5uQnV4cXBDeE9SUEFB?=
 =?utf-8?B?UTBDQXhIeGI5dndpeWJ3VTlFTng5QnFsd1pxNmtMSjVwelZDYmpMcU9yQ0p4?=
 =?utf-8?B?WUwrWGl5NEZJVVVRY0xXUnVuN2VsM2lTbVdkYXVlcVMySXVhd0crM2tZRXNv?=
 =?utf-8?B?S3JQQU50VnFZUnhBOFYwUjJtK3ByeWhCYTN3aHdzN1NPcVJyRm5mSkJubHg2?=
 =?utf-8?B?WWZQYTZwM0IvdHNNMWoxTmpsWlhWWXNmVlBUTmdTV0MxL3ZsREFYcXdhRWQ5?=
 =?utf-8?B?QXNIZ2xNN0xCK0NvZlNXK3ovSXBrcFNmT2t2VzNub3crdDVpUmNaRTdXY0tw?=
 =?utf-8?B?SkNBNVRhcGpwOCtTNnduTWVoWkg5V3VkN3FjZmtzT2ZIUVJOZ3dSeHJTWkw5?=
 =?utf-8?B?MHppOENyQm12RGVZTEVVZjVsMG93dnE2RHd1Ym9wQnlFVUJmTG04WFVRNlpP?=
 =?utf-8?B?NGVJTkpzK2pxTlEzSkV1T2dWOHRvZG5WY29NTkRhMWVTNzkvR1JTVmpzU3hw?=
 =?utf-8?B?djlJSVhDdTQra2lUMHNyWUkvNyt0S00zTTc2TnhkYis0WDREZXNOYVoyN0hs?=
 =?utf-8?B?eEt5L0luQUVQaWlQdlorMzBCT2ptL3pyMzB0RG5JMGhRWkdqSzRET09vNk95?=
 =?utf-8?B?K3MvbmgxRUVSUmtkUXZIVHVKVEZKR0gxKzhYcTR0WkF4V0V3QjRNUUFuTW9p?=
 =?utf-8?B?UTF6U0dLWjhqbHl6OE13aUVWYUdjSmIxMGZ4NGRWQjJCUm5iaFVESGtmNFVH?=
 =?utf-8?B?YWNtWDllVXBRcDhOYUlLT2dzNnBrWHBvUjZudmVtb3U5eWdISHlobnZFeG5M?=
 =?utf-8?B?ZnVZN3pTUENubXQxVXBEc0FjRzZUaEorZElQR2d1d0tYVDNXTmNDQXh2bExQ?=
 =?utf-8?B?U2tHbzRCdUYvR2lKTVJmRHdEMnFsQStWZHhUcnlSKzJ6cUtYVXZkOUJ6enlX?=
 =?utf-8?B?T29HVm9KdFpqSHZLZlNYVTdpc0FBaEpYRlZLZjNUL3NHeW9FK3pHQkRicmhz?=
 =?utf-8?B?clBXaDZrUGlOazhXdDZJZWRQd0V4VDRRdytib0pRZ3JsSnd2QWNEUHAxbk9R?=
 =?utf-8?B?ZkxoUm5USlN4a09yWnRmbElrNDBFSUkxaGt0ZVFobUxlMVAxSlllUlRKcWd1?=
 =?utf-8?B?ZDhQZlZKWmlmS0tyc1ZUUUcvWmxhdDVleDBvc3Q3SzhkMFIwbTBvOEU3dkFH?=
 =?utf-8?B?VHZ3dnBQQkMwMXhYczFEMGl3TVFMNVhvOW1KWkpVdElPaU5hSTVqZTZmalor?=
 =?utf-8?B?blloOU9wMUg4c1g4SGc2MTIwMjFIa0Q5TGtZYkVOZFJZbmRnN05pZDVpelV4?=
 =?utf-8?B?dWkrTElIcWl2VjVIckFsSGlOR0QzNTVXMkJPZjFOK0dVMDF3d21ZSnlsSXNB?=
 =?utf-8?Q?c8SgbHc0zgGQPGsM=3D?=
Content-ID: <BB277CB31C538F428FB6268F8062A7D7@FRAP264.PROD.OUTLOOK.COM>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: smartandconnective.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f638ee-8e68-41db-d064-08df46dad602
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 07:49:41.6768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7f3dead9-eeef-44dc-ad5d-e14fabd26082
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hV9k9pgVJEtiOacAMPUCSrgvPlmLM/dRY5kWBAoN9diAFv+ebC9Y+jDpXKFDrZOqOjHBEKei1BFr3KoF0B4StoYR7l96hmqV5sejQtYBrBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3308
Subject: Re: [Buildroot] [PATCH] package/{rust,
 rust-bin}: bump version to 1.100.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> trying to run the bump through the Gitlab pipelines showed a run-time
> error: https://gitlab.com/bkuhls/buildroot/-/pipelines/3066872318
> 
> Regards, Bernd

Hi Bernd,

As you may know, rust 1.100 has an unused-deps check now.

The issue is on rustc-main side which has some unused deps and
generates a warning when rustc is compiled from sources. I didn't catch
the issue on my side since I use the pre-built binaries.

https://github.com/rust-lang/rust/commit/daa24324904fa6aa460a22de733068c8dcb0323d

I guess we either wait for a 1.100.1 with a fix or I add a source
patch.

Thanks,
Seb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
