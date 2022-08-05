Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E1CC00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 06:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B1283336;
	Fri,  5 Aug 2022 06:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B1283336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMQ5cGL57nld; Fri,  5 Aug 2022 06:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D35E832C6;
	Fri,  5 Aug 2022 06:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D35E832C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6F131BF418
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 06:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF955408E0
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 06:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF955408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lG6hVrjCUc85 for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 06:05:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69B4F40128
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69B4F40128
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 06:05:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h13so2078299wrf.6
 for <buildroot@buildroot.org>; Thu, 04 Aug 2022 23:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jKQxgCECNWD5L6rmLmYHjXnzQrfENnLYHknm4tFce4g=;
 b=upirAnIyYWDoAz/ImWmVppF67PUxo61KTmOwy6czRpNxo8fFivoeAjwn3hzD/coH2A
 bvhmV3pkF3m3RQRTvBE309h4mw9UzCX7Cd6f2jcntSDHtHzRMIdOdlXjRl/6SBQ+/Mm1
 CKduP+kH3HQpPhjucFI0BEPrS4Bjn1z/zVZ/dI8Yipk23HVNARvCWx3cr1PUjI8fW0ox
 ydxaeIjpIGjIi9XyekYQtotQ854aVDvDKb9mGqcowWwWDm5BDld1qYJJsDgmEF3iU9Ui
 5wpLIulfGXz22D5+ac5G3L7Ht1O3scl2ParoP3A7jmyKeRyWxyQ1sWV5uatZneFgYeEs
 jH6w==
X-Gm-Message-State: ACgBeo2XMsKF+zb5n+hB5KfJV0WRU3DKkWlwLDwxSokcNKjXNq+bRYNJ
 LfBeEb3Ihm28vVZaizJZ1LzopQOSBWfTYiZT4q0=
X-Google-Smtp-Source: AA6agR4QqjhyNyMXIHWTW5WgeXsiqf68tpG/tjZZMmjdMszlrxaTC/QxGuYd5xtzCeduRXeCw8PY6r+bezxKEHiJD04=
X-Received: by 2002:adf:d1e2:0:b0:21d:bca6:2371 with SMTP id
 g2-20020adfd1e2000000b0021dbca62371mr3191663wrd.315.1659679530535; Thu, 04
 Aug 2022 23:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-2-joel@jms.id.au>
 <20220729211755.GE1554632@scaer> <20220803232221.691911fe@windsurf>
In-Reply-To: <20220803232221.691911fe@windsurf>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Aug 2022 06:05:18 +0000
Message-ID: <CACPK8Xf9E5L6iUqdPwiHzkWYTdnB2DWSzRuFTQyBwAyWAXyuAA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=jKQxgCECNWD5L6rmLmYHjXnzQrfENnLYHknm4tFce4g=;
 b=nplIPM7dputY0lYlfBKkS6bl4EkRdgRu8FS0t/RsNopfCxNzgmG68juDiTIea5URRO
 kmK5AkEcwomRlVdObLCSjhSbGfwZ08U2BM40PCVwL0YgjpVSVC7PcgJAhi3SWyNdpy4J
 7k4h1yhQOQXzBkbBBFg/B2/t6Ex67jAEudR10=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=nplIPM7d
Subject: Re: [Buildroot] [PATCH 1/9] arch/powerpc: Hide SPE ABI behind CPU
 type
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 3 Aug 2022 at 21:22, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 29 Jul 2022 23:17:55 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > I don't understand this change. Currently we have:
> >
> >  1. If BR2_POWERPC_CPU_HAS_SPE=y:
> >     BR2_powerpc_CLASSIC is not selectable
> >     BR2_powerpc_SPE is the only choice
> >
> >   2. if BR2_POWERPC_CPU_HAS_SPE is not set:
> >     BR2_powerpc_CLASSIC is the only choice
> >     BR2_powerpc_SPE is not selectable
> >
> > This means that the choice was really nt a choice, because the value of
> > HAS_SPE implies which option is settable or not.
> >
> > With your change, the BR2_powerpc_CLASSIC will never be selectable at
> > all, and BR2_powerpc_SPE will be forcibly set when
> > BR2_POWERPC_CPU_HAS_SPE=y
> >
> > So we should just drop the choice altogether, and use the SPE ABI when
> > the CPu has SPE.
>
> I agree with your analysis here. I would like to go one step further:
> SPE is only used by two PowerPC cores:
>
> config BR2_powerpc_8540
>         bool "8540 / e500v1"
>         depends on !BR2_ARCH_IS_64
>         select BR2_POWERPC_CPU_HAS_SPE
> config BR2_powerpc_8548
>         bool "8548 / e500v2"
>         depends on !BR2_ARCH_IS_64
>         select BR2_POWERPC_CPU_HAS_SPE
>
> and SPE is no longer supported by upstream GCC. For now, we have kept
> GCC 8.x around just to support this SPE ABI, but it is clearly not a
> future proof solution.
>
> Can we drop support for SPE entirely?

I vote for dropping support. Given the lack of GCC support it's only a
matter of time before our hand would be forced.

I'll drop this patch from my series for now, as it isn't related to
the ppc64le fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
