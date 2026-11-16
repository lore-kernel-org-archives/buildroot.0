Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55800606A88F
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 17:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Amw9rNGu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=PoWd/Fjx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FED2810EA;
	Mon, 16 Nov 2026 17:56:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhUMLCz8z_gq; Mon, 16 Nov 2026 17:56:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0395D810E2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794851797;
	b=ax/r+2EGscl1biTr+uiMFsZZS6+kHHTQ/w/xfWWdrYOOf9uoYluzgxcMxaKsASJmH9pm
	 +jpqxY1yC/oY5DPh/Xc1tv3GXVmuFPDDjxKccAHUTsud6WCd/5I4hP0/2ZciI8qQwOdLy
	 hAI8WUIDhHEaOmLLAO5LdK/pcavy5Vi4HioM7d0Z2vhG/qzYbnQR3XAsNFmj7W3o4ozK0
	 fM7jPRfor0RqXLC+tmSbUuqcAIg/f4IzOka5012gxqyoYlta8PBO2YjLesIBGp2H2Wzwp
	 pme0J15tG7xaKDnHJDst8ezH53G0U1MvGdVtemCpbSqeINAfau3S2IyNwADPL2+p8yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794851797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Go2RDGLEN4vmLJxoQS5VTbv5ycRjRacqZPfur+yl5cY=;
	b=ml5mcmCwhvIuyuVx+uq5uc4p5Ied2w3OH6vAumWY02motEiKKjO24vgTc2eLQudnvhK3
	 6ueLZ/Tys0gaFZvxuAE1wVw9fyOGb2b8P4m0quraTgudAhAjgPSboiXXggrWUm3UvljDP
	 NkDuHepJZLM+v79fJladVvzlPyBvpEJqIbT7c7WqWx7wY8rgfPNEcx7fcS90w/U/gsiA2
	 JlzVIZq+dB1Zd1998IdynBmxRmjnAihC3hYvrzUQ47sh52Pf3mR0edSZSWqKaku78u8So
	 f7s6uyuoZSTdXV86SsHzj7bQHAluQlly9XS69M3bCwi2fnLxNIy2gBuuJ63oN4TA2Xw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794851797;
	bh=Go2RDGLEN4vmLJxoQS5VTbv5ycRjRacqZPfur+yl5cY=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Amw9rNGuit2kKz6Kw3Ouiw5jBqgNCWDpNtu5UN87TnUNn6JCpLzUjvD5JeRvmX5wA
	 3hffjPxxPUWAk9acICUBVepgtN+jUedFGPw/qota6D9LNKx9nkgs1b4mU756EDvdsw
	 1LKV7ljyXk4Y9fk0CjL6vraOcoEwMWJxVsN5mELzUl7kKENkkEYx1SvDthX2HyuKUg
	 ukizKy/bd/SC/9mN22Vj5zNg7eeyjCL1rahkft9NK+dJP3IEXa8gZv78lm7UOyzk//
	 SdD66dDXFHXm+HfSAlH2mZY9JZwR29/SEWy150TWGzyhO1eLGf1qd5YjppBPmYdtDT
	 d/G6M2rLOXthw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0395D810E2;
	Mon, 16 Nov 2026 17:56:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 607D2169
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4642C40779
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r41lz94lv5Zs for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 17:56:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9DB2C40774
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::616"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::616;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=PoWd/Fjx
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0616.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::616])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DB2C40774
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Prmmg3E54MLU6/ZyggsR29B92D46ZxR6SNU/kw0Sc4=;
 b=PoWd/FjxkH70iP5LjGV42q3XghinKv65hij51OW4MDoens5NkZTky+ml/ufiKgs1Q3e8T1VqYs+qZxdcl2rb8Wz7ACdYSsp/9iWKXvQLEWkSckKjcYXDdT6UherdCupXFSht8ndPnxxjY0seEhvYUHHesQcQbAd4Lp2fINgFT079VlYRoJY6+QOafxwoouAUJoJUQQUXtwVAnlx7IDiQ6M8KTfu8AEhfU4ycwFWX5nc+y7qCNvQg4kq9trjZv33apf6JX0h6nLNp5TfBmRVVa1GLIViz54sGh7VqNKrAR4Mt+/v+/L3iO/rD+gkU3dNnoIh0y9X+I+hSVdFVMZwGng==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN4P110MB2754.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:649::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.17; Mon, 16 Nov
 2026 17:56:28 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.21.0569.015; Mon, 16 Nov 2026
 17:56:28 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bernd Kuhls <bernd@kuhls.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] [PATCH 1/1] package/python3: fix
 non-NPTL build
Thread-Index: AQHdZ8uaFfLg7J2MA0i1+n6NhhL3t7cxEAWQ
Date: Mon, 16 Nov 2026 17:56:27 +0000
Message-ID: <PH1P110MB1603D4EBA0679F6A1CCA234E9F7CA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261029173309.1785913-1-bernd@kuhls.net>
In-Reply-To: <20261029173309.1785913-1-bernd@kuhls.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN4P110MB2754:EE_
x-ms-office365-filtering-correlation-id: f52c5a03-f381-4887-1b7b-08df440af030
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|366016|23010399003|1800799024|22082099003|18002099003|261009223027099003|55112099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261028144727099003|261102130727099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: g73TiLNnWiWAhf7uMJFUieHZMlLUSFjpoU/Pwmft03DHweueG8RdbYULPJo3z3wtSMcMA8kjcDjsbAKElQVcQ0BIYqY0bj6Cr04u3qaTUHjzDjtXyKtCCOwW5RHUG0wE1UNEJgvFa5rtORIVwaVr+kJxE+2S+5cDHXPOftpuPBvENqfBJROV8FP4gBjZyngfWd4RuJ+SrKOFw00aK07bviVzcSN4YusawAHoWEXFl2rLVR7XxU1Cs2WWinv6t46WpXhPHr0iWUhp9HvZQ2CrHgLDizCsW+30ivKSFcfQWi+mR2qtrH9w138NhXuEX8BltPQVJzHkLJuiwqG4HVThmpX7AMXUao3w8YeDBINyPunnsLwXZXNnfLq7J8ZJDKVxRK1Y8ix/TjgeKZxzM6sLhKfUR0UtKcnh+4CBDrxJfHwss4Xgkooks4NLjCAYYHK+KRHDFn+W3zKlDsgcl+l4SLrjkBoHqzqaXnpj5E+vd7pw8eM+GqL1p+VVhP8c7agb/Fdmw5YJuuCDAHPcIB933XDV+Ao9TrReidAOSQSJbpxVV2WkDUfbF6oQNkm1x2V927Fg/uTlQTf7v3vc8WznEGGIhekxf9YStLUyBZ46QR61iLdxxI5PMw8A9+moWRbj1zuZKZ+iBJjWPdYsL2fojviSHEh0uF544xi2f8i4HsY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(261009223027099003)(55112099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261028144727099003)(261102130727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yEhqhusNQGd49NjUdaWKbza6LaO1yr1JT/2OaPSCaDAVMJnkCWgwHDUrl+dp?=
 =?us-ascii?Q?TEafsrnR/SryerOpUGwTLN2dMsBAsUYpXsfdgIiq+4Nez0VOjWVWYqLbSIlH?=
 =?us-ascii?Q?s6QtQK4v4MT3dKvJG8g/SejNJ6pIQMPlI52OpsDA5S4uvZ4wQqygN99tXxjQ?=
 =?us-ascii?Q?gkyoVnnKpB5RoStHDByxM81gDb9YjlJyWatPQWkxGB2qK3b6eyAXaIPXh4Fb?=
 =?us-ascii?Q?C8PKbDkOsE81mxE6s10neBPCGseYqsh3iM1qZcsjkDL82DqfjSoKvc3sxe6x?=
 =?us-ascii?Q?yaTU1T72VsHQ7Ai7702h9C9MFCr7CjLvZUA06mxw9Uh2bmBm+SAy1fGUAsRO?=
 =?us-ascii?Q?etLGPTzhg+4AYvg6oC0T5qYf1jvL5ivK8+q0UFBlQ+ZcwmHO6Q2hF4gCCkcx?=
 =?us-ascii?Q?ckj2mX2oQybSvxpt88yaV93T2SSDhP6wuwKuh80tatU2pDAvVn8q3oW6NKtl?=
 =?us-ascii?Q?D3OGeK9m13SPqD4dfyTt/XmwN285olPR+I9RWii9UH8HmKfUoE6P+hZC/eRN?=
 =?us-ascii?Q?mY4W/mDl1ntuLgt59vDq0Gs4mYj38QkFU5YNqSIKXl18nweglcFsCzJ7R0vm?=
 =?us-ascii?Q?9BUmttIrsrs4kCVTYtLpuvWaR41+ebafNSe06RA3OHXoAiauEPZo86I6VTyR?=
 =?us-ascii?Q?f3g8+a+9HmMOVfu4wET45A/DSfRR+k+ae+xnIoWGGvCeP5YZgPI6CJfo0FtM?=
 =?us-ascii?Q?5ynsMvrITq4z5VIDQvwsrUYf/GKIaPqe9yJdBjXRssQeIsRty/qN9IpRyj3O?=
 =?us-ascii?Q?GgyFfVaiW874H+T6o2OHV3ZrhHIeNG4lxezwewMYYrvv62G4GoyAKa/cg7fc?=
 =?us-ascii?Q?dnf6NEN82bue8hDdwQgmaHUkYlBLMMbqlptZM8fkyG658WtB7wGHbCdj3miv?=
 =?us-ascii?Q?8YxgBH+tGQ4KpYFCLCkpaxDDmlbpk4ui3y+BLtx7/fp9BwA0oL6W9uZPvvNJ?=
 =?us-ascii?Q?IY9HGf5HBRfpNqZWzxH1jvMPx5bMw9Hh4Fz0mFRULfo1U+I6ODAmBaEE05ao?=
 =?us-ascii?Q?vPox+YgGT3sK36wDcVjTSk+SjHoBHE50nt/BrGsTAG9g7fsoop8vQVgUzr/b?=
 =?us-ascii?Q?/IczbbBN4UEBOLucKLsIKYgNLM0PefcXavXG8LH2zjRg31t6X/U/75PiXmtD?=
 =?us-ascii?Q?nIzO1EYjgfJRz/Yg6iKTQN0DDWRNsjyvKKqcW9hV98a8pkRFvFD3eQ/7Oydv?=
 =?us-ascii?Q?8mD+ws3ZS/u4Zo5/6uarac7BylNyESwLYHm5eB/LnvithSbeYyFjNb8jlwvP?=
 =?us-ascii?Q?qkVe31mFdcqsiGCKXxpU949dYaoLS3oNcSZLl5nzSiKCiK7z0fXCTZt+78k6?=
 =?us-ascii?Q?fo7aG8732JOD5tmpCSoyDhF5kVu08pXkPU6TY+gKFYC+Kwp+6+cW8mEXMAUI?=
 =?us-ascii?Q?oX0GTYQompVYY3KCy4P7j3Yk8MXRPD+Vub8h3uID5NFEHv3Ozh6pzglQbYSn?=
 =?us-ascii?Q?vIHS/TNignMwRG6Ap8hmWZ85WmgiDkRSnCQLTMFwVMDm+21Wyhjg7DnkdIgf?=
 =?us-ascii?Q?3+1mEPQCoAQSLx6tlGaQzf6CArSzGHB2dAFhRKPw+Rl8DsQqw6kjyQcNid3b?=
 =?us-ascii?Q?zCn28V9vJrXAQlyo8Ac+SbrK/FzksivjaNnrAskXH/+C+eyf3F7eLxDWovKa?=
 =?us-ascii?Q?A81roz2QbpZ18wLQnEeiwd1cBNifh0zOLvQAOks4IUTF?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f52c5a03-f381-4887-1b7b-08df440af030
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 17:56:27.9517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN4P110MB2754
Subject: Re: [Buildroot] [External] - [PATCH 1/1] package/python3: fix
 non-NPTL build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Bernd Kuhls
> Sent: Thursday, October 29, 2026 12:33 PM
> To: buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>
> Subject: [External] - [Buildroot] [PATCH 1/1] package/python3: fix non-NPTL
> build
> 
> Upstream commit
> https://github.com/python/cpython/commit/1bcc0d165ae66f5d88db5c5bcab82
> 908d9a49537
> first included in version 3.14.10 added the usage of
> __builtin_thread_pointer which is only available with NPTL and causes
> build error with linuxthreads:

I noticed this when testing 3.15 as well.

`mimalloc` is not the default allocator for Python unless you're using a GIL-less build, which we don't support (yet).

I think we have a few options:

1. Squelch the error by configuring `--without-mimalloc` since the allocator isn't used by default

2. Patch the included mimalloc to guard with `__UCLIBC_HAS_TLS__`. My guess is running with PYTHONMALLOC=mimalloc [0] as is would lead to failures even with this fix due to use of offset registers [1] since uClibc exports __GLIBC__. If we patch in a `__UCLIBC_HAS_TLS__` guard it could fall back to a non-TLS solution.

3. Require `BR2_TOOLCHAIN_HAS_THREADS_NPTL` for Python builds. I tried running the Python unit tests (python -m test) on a build with linuxthreads and got a number of errors [2], so I'm not sure if we can really expect Python to work with linuxthreads or without thread support at all. I'm sure people's use cases differ (maybe they don't need certain aspects for their specific build)

Open to ideas and input from maintainers and people that use Python on uclibc.

[0]: https://docs.python.org/3/using/cmdline.html#envvar-PYTHONMALLOC
[1]: https://github.com/python/cpython/blob/3.14/Include/internal/mimalloc/mimalloc/prim.h#L151
[2]: https://gitlab.com/buildroot.org/buildroot/-/work_items/193#note_4232557339

-Vincent

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
