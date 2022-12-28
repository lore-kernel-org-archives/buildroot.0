Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B16C10F1B
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 01:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1302660AA0;
	Wed, 28 Dec 2022 01:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1302660AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A-71dYJGGd_f; Wed, 28 Dec 2022 01:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6841060A98;
	Wed, 28 Dec 2022 01:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6841060A98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D95F1BF3DF
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 01:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC3C1408AC
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 01:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC3C1408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBE2ukYyhf_h for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 01:42:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5FEA4089E
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5FEA4089E
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 01:42:27 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id 2D5C424E206;
 Wed, 28 Dec 2022 09:42:16 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 09:42:16 +0800
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 09:42:15 +0800
Received: from EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c]) by
 EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c%15]) with mapi id
 15.00.1497.044; Wed, 28 Dec 2022 09:42:15 +0800
From: EnDe Tan <ende.tan@starfivetech.com>
To: =?iso-8859-1?Q?Stephan_M=FCller?= <smueller@chronox.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [1/1] package/libkcapi: Fix symver build error on non-ELF
 platforms
Thread-Index: AQHZF1LA5pg79hczEkiLGl02W02+Ha6BoQoAgADohkA=
Date: Wed, 28 Dec 2022 01:42:15 +0000
Message-ID: <58665f46a34548a3a8cc904375b45de3@EXMBX161.cuchost.com>
References: <20221224044616.3909215-1-ende.tan@starfivetech.com>
 <2665585.mvXUDI8C0e@positron.chronox.de>
In-Reply-To: <2665585.mvXUDI8C0e@positron.chronox.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [180.75.241.180]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
Subject: Re: [Buildroot] [1/1] package/libkcapi: Fix symver build error on
 non-ELF platforms
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Stephan M=FCller,

> -----Original Message-----
> From: Stephan M=FCller <smueller@chronox.de>
> Sent: Wednesday, 28 December, 2022 3:39 AM
> To: buildroot@buildroot.org; EnDe Tan <ende.tan@starfivetech.com>
> Cc: EnDe Tan <ende.tan@starfivetech.com>
> Subject: Re: [1/1] package/libkcapi: Fix symver build error on non-ELF
> platforms
> =

> Am Samstag, 24. Dezember 2022, 05:46:16 CET schrieb Tan En De:
> =

> Hi Tan,
> =

> =

> > The following error is observed on Microblaze [1] build:
> > ```
> > error: symver is only supported on ELF platforms ``` due to using
> > __attribute__((symver)) on non-ELF platform.
> > So, revert to using .symver in such case.
> =

> Can you please help me what you want me to do? Does the patch you
> provided not work for you?

Nothing to do, I Cc'd you just to inform that I submitted this Buildroot pa=
tch corresponding to my merged pull request that day (https://github.com/sm=
uellerDD/libkcapi/pull/147). Thanks :-)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
