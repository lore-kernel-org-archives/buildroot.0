Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B0606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n6tmvs5X;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=0+jOW1Nb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D09274058C;
	Thu, 19 Nov 2026 13:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8T1ihnxok8o; Thu, 19 Nov 2026 13:57:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C0E9F40873
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795096634;
	b=B41ARE1Ha8pyP+iOS0n8HZOHcJ/SsRrNCqytVB7Q/jmp8MZHWRBfNln2P3Jc97xEghVk
	 Hsl0yeI2NJ8bvpf8fOcjhe/tPkLTlWNaD2haCMNS1k+o3lpAlHWauP72D6sa45AB1Qgkv
	 OBTJBJBEDYwTCat6ZoN5ii74EfEOjIi5RPtWe5q4NJHdhTyY/y5rchMOLnynrUs5pAnkr
	 7pQkz0BGmKPSXVXxUiwU+710psy2Iw4GH9j5oviwqHmyrXOY242Wvgks7LCtbV79iNYMJ
	 zVCOzFl7XJrBH5Qj5Av+4ItGVxWapof16H6JZmdkaXQEuWs/XZS7QOJl8B1sq8Q3IAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795096634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
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
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JtfTeV3U8FWpzJD+DJpTBwvdySJxd90/2kyIDm2rsW4=;
	b=f8nOfCLHDqa911z4DPb4607MXB1eG5ERknOZfVHlsTv4pLQn9vZTg/yEpg9Ck9EdyzDL
	 oSEGLu5tyy/QrUBVuv+1DILDikb0uOU0ThvwMk5Xx7EbEZ4d++8fe9OcYr65UKtC6UICh
	 B5DejiOBsxmi2ftvScJyp2deLnNWnt1ppv0sdd5E8hUtp/oDIXwBYEvOTd5Oi2U2+FrnJ
	 1A6/nrVHBY7qOqNkt90RAl+9blk5Dj5m8EURwHGyBGWntcIjNdRK6mz2XlempHd10bIY2
	 tYbjGBspxgKsVX3P5QmyLQcfL8b7jk5ZIHu9JBhvk4Ujp/7TwWnA+iTs4GPxkPPsagQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795096634;
	bh=JtfTeV3U8FWpzJD+DJpTBwvdySJxd90/2kyIDm2rsW4=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n6tmvs5X7tDaX0Gh2CvHMGVTmc3lVoDBF/0HD30LLC99SSUmlbEWFb74pVeFot4Ej
	 eI+hKfddyFcd/NdIuaiNr8kTTg8XO9dP8suviJL5kavj6uIBx+CYu05EKT4dvhiXFF
	 fic+2Fw1W6Oe9tImh21osCF2FGzStQ4m9atNr81CE8Yejy6d955YrZgsHFa9+AjJl/
	 mgwGvfPcpBgp5H9sXFKc/MfK1uzRRIgd4+6yRV2fxKLEtghnKn/Xi26O596dgb3NNX
	 hk0W5pIGALvTUbSw/xCxTVnS4qV6NxywozYi+lkVNFtjrQea6p2ky+L/uq98chVaYU
	 tTtGCi6L8z+MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E9F40873;
	Thu, 19 Nov 2026 13:57:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4996422B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FE5D40542
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6C1qoPLmVqOA for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 13:57:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 922C64052F
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::606"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::606;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=0+jOW1Nb
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0606.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::606])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 922C64052F
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 13:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShClK7LzUCesckC9StK6qbJwrfqwiGdKhm6yDIB2zmo=;
 b=0+jOW1NbBWUv/9qwwsALBBXSOQZN+cYsA7dsS3R7ItcQ5FVsGpM+qJluv3NaClmzUaWgoaNZARYdHzHCi6/7R76Tgqxi1aHGtbecb1q2jEODdx2BC1otVG8VE65O3N1AAUNkH2J6PjRxmLlzLNWocNzlQe5Yk39jCT7NqvkeKXCHJ17VbzyBaAnHH9+Mv6MRUQ6M86NDaEwmsk3NybwEmBXwLgVeXP4thmvb+3ztKGGifOml8+Ha3TOS1Y0apTfJFDsJQj5dpicHMohRyiqZUXFiYJ7bAdq6QKbu6ubtBZfAT/ey6iw163v8AwR6DnKxdW3WIFAdxWm2TzkNYdCYFw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN4P110MB2594.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:64a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.17; Thu, 19 Nov
 2026 13:57:05 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.21.0569.016; Thu, 19 Nov 2026
 13:57:04 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bernd Kuhls <bernd@kuhls.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Marcin Niestroj <m.niestroj@grinn-global.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/python-dbus-next: remove package
Thread-Index: AQHdeC3bjiFIWQXuHkyWDytkByTUhQ==
Date: Thu, 19 Nov 2026 13:57:04 +0000
Message-ID: <PH1P110MB16031574ADC53906263EB2CE9F79A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261104210728.3839438-1-bernd@kuhls.net>
In-Reply-To: <20261104210728.3839438-1-bernd@kuhls.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN4P110MB2594:EE_
x-ms-office365-filtering-correlation-id: e3ded943-f1ca-47f7-77d2-08df4644fe30
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|41320700013|366016|22082099003|18002099003|55112099003|261009223027099003|260925021911599003|56012099006|260925021311599003|261022105027099003|260925022911599003|261026140227099003|261028144727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: HDbmRRsLwVfuBpucDLn/nLUpwITLohu12IlWsG694CgLFq8nOD/yP69X/RxDW2bHstcaLybAPYyh8xABhBJL3hEPIChRa6xZcaKakydji8XlpwaojnYA6mxTCfFkNKNlLNz+3rjm7NU+mpgEGgedKKyLwnytzasRrmCKI4nLb4H8ulR1N0NNc7KpRqlmS+T6FF4hahwQQiH+5j4rALwXD8g9/Jvi087LQbyUnYsXV7kDxVczdftNLNvaCnm7qYeh1KgfjUZT7up/pc/B6HQpzxccXJ6DUTy4+a9ejQsw7LkZbvi/RV6hV34oj3UHWOj+Ya3uo6nvoYuUqTKPRM9EbKvn8RGNeqh487SO7CylS4JUcayI/GnRTcWAzbzDiYDkH4haWt4Fo2ulCuTBhy5cZODWSAJZXYx61Gab88TbeoMZC8ryU/w267MXWYblt69oCIDDvd+9avOQ+PS+fazwAFVhSINFw/r/PljvezBFNR2JX/gAfYlLdZbSUfpbPTesPRsMgAvN8/x2/knqdWWX5Bcq0v/8aFzxIRwkD2U+P0MLFgqEbYJ9xm2dH5QfkDGxd7KgbG37DMty6K2V5TaP2JDRTbHo3V2nsr39OGvq9RFT2eefhSuG6zVUCr4qtgBLuTRlYiriuiLsJlgDZO43ompMIlpBz6HAEI2Pqa/JyInEUucRcViwPM1QWfDyu13SKu0P2NEt+2FtbmoAkciFBrB/A76HAKOTurSwvTVUn+o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(41320700013)(366016)(22082099003)(18002099003)(55112099003)(261009223027099003)(260925021911599003)(56012099006)(260925021311599003)(261022105027099003)(260925022911599003)(261026140227099003)(261028144727099003)(38070700021)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UtAJNee8WSJnekYZ6j8lzPaPjDKdVq2CWxriNacd0jxcpCFR1Qu838RA5f7x?=
 =?us-ascii?Q?BXxmUFAxKYABhDcizSFnFR6JpUPV5ZUnY4MWx1CV0l8hnjhpHJPuzHwkUY8P?=
 =?us-ascii?Q?ldI2odHw2QzGJ2fz3AlWis3hJeNXgP4RQrEhaXZOD/GKNPV5kyKRRhxDv4nR?=
 =?us-ascii?Q?zFEM8ZXPYwpNMJ419oSwz4E/BF3r4oi2o193wQasSxWewOe5gYBup3GX9ypy?=
 =?us-ascii?Q?IkPtnOpE4o/csMoARDX0GEjc9ZQiZG3L8rg5+m6RibHZ0oW9hzlNb3Pj7FSX?=
 =?us-ascii?Q?V20cwaqwNtGDm0AUhtOODn2L1GdimBPBL6FXiMp8Ox4Oc35AOtID1/X2eCzJ?=
 =?us-ascii?Q?QTnhzkHE8fYuk5QjBjB11+1npSMlmtjugSSPiCkHPeqZKs7wG7G6SlYB+ZgS?=
 =?us-ascii?Q?wGtgjq19oSg1j5mzNbF6RVAaTbkrTR9cC5Srhl56L0FydvDgrg1n64pnVytC?=
 =?us-ascii?Q?mev4I0IBQeBdxiUJZXCQScGJAPtP+o1zgnDKv9VFA96yYqGsF7XZt+zIaaj0?=
 =?us-ascii?Q?Bwnp7rNhvM/uhZKeOKWqNL3h5kreVRp6PFmLpMGrvKOaQuqYq85hnCaGZrDs?=
 =?us-ascii?Q?PuPe0zD1GmEuZZwPTXrigoAIqx5YhPZC2z5fDs6nO1UzGIegUSrOTP6ClJPR?=
 =?us-ascii?Q?kT2BiTEsb1nnxJCY+BC+ftr1aXTijlBa0Tm/Btokprzo1zrlje9lgHhUaf5T?=
 =?us-ascii?Q?vSPGSfH/Yj4tMVH44zpejqqoZcG+hrEy/rIESGyK+bheqsLyJdeDDxa9NLhR?=
 =?us-ascii?Q?jyEjn+lC2owlhHjy3P6Cz/n3psh5h8ynB+X6gKiZ2kjFjdtjGi2bhPhGQCYp?=
 =?us-ascii?Q?jBki1zQmLKUhIqWuzRb3qNhKIdhUFlGMklpF4LMMKbHikRTT5DdA9FD1tBN9?=
 =?us-ascii?Q?4rjOePBAVoPxjfKGeoOjfuMZxG3QHJyP9WOIe7SSmxtN3LvO113n1x9WLc1j?=
 =?us-ascii?Q?4wcPlpe8b1tR4ZpZiEKaWI63hsUOx/817ZN8c297zqbsjPnacOGm4tQdZ/sH?=
 =?us-ascii?Q?9Wo/FRg3eTedxnZNvlTHSdFhXTvP/hLP81fOs0qjNqIXJjg2kwrsGjdl/gWF?=
 =?us-ascii?Q?wyk09IBzE8uv/fJSj4XQyw145zAbj5eGnMth2ryiURrqP3G3/0OOy30MwHMb?=
 =?us-ascii?Q?c3MAs1SafPO4z7yGCC2B3z7eMHAIDkbflT1dz3mmx99fycx2kX2vsDEUxKfH?=
 =?us-ascii?Q?iCjI/BV2G+HUJhi3W/gq3yOtaGcfErnXjhXWqYlM9OiU0teQ67n97ZX6HNnE?=
 =?us-ascii?Q?T59DltKPr/smbgZV2GIbSiPMQ85kGOVvUVL2gPYPId/eJ+oaNfv1aFrqlsvX?=
 =?us-ascii?Q?+tDYZnQwpUrh2Lg88RqNcRjzVcvKNjxT5tsuNUvq1eHcWWIxHrk3xWxMDQL2?=
 =?us-ascii?Q?/BiYOuhjL6ocHxwkjkuURsr7ayutQq9EUJmRXAi5wV9VsYRTzgIUEUtJYaPn?=
 =?us-ascii?Q?dM5n+oE/ORMpN7A5JB20qbDWXOfhUawC3GXgDNaj0L5HhoyTk1Evz9ZVj6+T?=
 =?us-ascii?Q?Gr5+krtb1IiMqQC5p8+6+5aHAkeI0NqqgXVeBhy9dTD/wAaIf9PsvK5Ym9f2?=
 =?us-ascii?Q?sXG2A/asG2LqEuB7nhGesb/8kVNOzLcNxrsTdyta6ufkdt/Nmmdc9PgoMFqi?=
 =?us-ascii?Q?0RwpD6AD9HgOmDuKXfQZ8BkON6JO8E/FDrsekEB5J3L6?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ded943-f1ca-47f7-77d2-08df4644fe30
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 13:57:04.6178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN4P110MB2594
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-next: remove package
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FORGED_SPF_HELO,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Bernd Kuhls
> Sent: Wednesday, November 4, 2026 3:07 PM
> To: buildroot@buildroot.org
> Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
> Subject: [External] - [Buildroot] [PATCH 1/1] package/python-dbus-next: remove
> package
> 
> The package is incompatible with the upcoming bump of python3 to 3.15
> and it is unmaintained upstream:
> https://gitlab.com/buildroot.org/buildroot/-/work_items/193#note_4029177660
> https://github.com/altdesktop/python-dbus-next/issues/168
> https://github.com/alebastr/sway-systemd/issues/36
> 
> Gitlab pipeline failed:
> https://gitlab.com/bkuhls/buildroot/-
> /commits/39c8bb9cb08820626e367a21fb146efa6c6b1750
> 
> ImportError: cannot import name 'no_type_check_decorator' from 'typing'
>  (/usr/lib/python3.15/typing.pyc)
> 
> We select python-dbus-fast as replacement.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Marcin Niestroj <m.niestroj@grinn-global.com>

Acked-by: Vincent Fazio <vfazio@xes-inc.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
