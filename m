Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541F1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 17:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA791400D9;
	Thu, 13 Jan 2022 17:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HepUy65Z87E; Thu, 13 Jan 2022 17:02:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF18D400F2;
	Thu, 13 Jan 2022 17:02:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4709D1BF4DB
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 337E241643
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBp3n8WOr3vE for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 17:02:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2930841626
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:02:45 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id t24so7780157qkg.11
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 09:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oTWyPjaa9aZGM2SnljeCNHLkI4gqTIIoMc0H/AzJQX0=;
 b=RS4pOVPkGvnLjFc5aJ6eW84gBEaIx7KK3wwkL9vUPW4H6ES7U2DxTQDAf7cSsuFFTG
 gH9S9j7e7yC/+POrFiDdJ6NtL/rwVPmw9PjHQcGzsAYpgHp/k0BaEJs3O3Bz0BCdQ/J8
 FmkK5JTXJ9sNE6M8hZRYD0fsSt790xJ5Qn3omlsQgKfU2aasIXogriTx3Jw7A8hrlWrX
 J5WLi6SSUU16txE6ocGxaMPBJF+NTBI4dqUvXMQkTa2IE8KK4XpR2nQ9cX3McfmEqNyA
 seQCIDXvSF3AJI0byeJWEI9Jn37J5Lggp1+alqco54t/rvlR4vq0gAilnvjEDSnm6Tws
 JxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oTWyPjaa9aZGM2SnljeCNHLkI4gqTIIoMc0H/AzJQX0=;
 b=QI4J15A/Jdf7HR3h5cgJNBQP1NsyDFnDeodPqbWGIdUI7O3GtkExh0cGJy/2ce60Ve
 ayJXTk3YsjjuyTOdHWuo3UJrmJYPDpipi4fwAPjVUOdetycS3eYNbYbz7/bMkLOamBYt
 qHyfpE2sBpQsZVmcG7hw0tLv7WqCVNhMCiMwQi0i5ehGuMTT58LrG6WE9GU17u/AJu3J
 bTjWkXjhXQXOe31LjIB7TzQGrStodvupG7R6dwvA8/KV3cw41Ul0w8thicCBjozs6ykL
 JMw25l8oetT3FclPPvCmYt3E1Sh/oc+AwoFWmHHXuyacP/R6TSaNkqNZJY8Wm+yO8nKY
 UvKA==
X-Gm-Message-State: AOAM532oPHQ4rjl8w1ZbFT8O496LclI7Gby3TopMwAtO0Vw3x08esNKf
 QGvNtdJWJOtp5e7JQuCHddLmSIhrMy/VfSrJDBs=
X-Google-Smtp-Source: ABdhPJxPpjZD1i5UG2sRlq78E03vTL0ZRSiLZTufFldKedqUkwVHX7tEKn1wLksiXUQsEOEP4qF/7e8q/Oq3cNoPzvk=
X-Received: by 2002:a05:620a:1496:: with SMTP id
 w22mr3724903qkj.463.1642093363794; 
 Thu, 13 Jan 2022 09:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20201023093641.619746-1-raj.khem@gmail.com>
 <20220109000312.6b307c17@windsurf>
In-Reply-To: <20220109000312.6b307c17@windsurf>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jan 2022 09:02:17 -0800
Message-ID: <CAMKF1sonf_9RsMYvpB4zxUYLJs7N99iOeiypLmTDpfK6wtBbMA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] external-toolchain: Detect linux/version.h
 via cross compiler
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas

On Sat, Jan 8, 2022 at 3:03 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Khem,
>
> On Fri, 23 Oct 2020 02:36:41 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
>
> > Using linux/version.h is assumed to be hardcoded inside sysroot but this
> > does not consider the case where toolchains might be built with
> > --with-native-system-header-dir which means the header directories will
> > not be under <sysroot>/usr/include but customized, archlinux, debian
> > built cross toolchains use these install settings ( due to multiarch )
> > they have the headers installed like /usr/aarch64-linux-gnu/include and
> > not /usr/aarch64-linux-gnu/usr/include
> >
> > This patch adds logic to use cross compiler to compute the path to
> > linux/version.h on the fly, it means we do not really need to assume the
> > install structure
> >
> > Fixes built when using external toolchains provided by archlinux e.g.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  support/scripts/check-kernel-headers.sh           | 15 ++++++++++++++-
> >  toolchain/helpers.mk                              |  2 +-
> >  .../toolchain-external/pkg-toolchain-external.mk  |  3 ++-
> >  3 files changed, 17 insertions(+), 3 deletions(-)
>
> We finally took some time to review and discuss this patch. As you can
> probably imagine due to the delay, we are (at least in its current
> form) not going to apply it.
>
> While it would be nice to not hardcode /usr/include/linux/version.h, we
> would need:
>
>  - To account for CFLAGS, as they can affect which sysroot is used by
>    the toolchain in case of multilib toolchains.
>
>  - A solution that also uses the cross-compiler to detect where
>    <linux/version.h> is in the case of the internal toolchain backend.
>
> However, overall, the motivation of using distribution toolchains is
> dubious. We still believe that it cannot work, because distribution
> toolchains can contain any number of random libraries. The sysroot of
> those toolchains (including the random set of libraries that have been
> installed) will be copied to Buildroot STAGING_DIR, causing confusion
> with the packages that Buildroot will build.
>
> So overall, we feel that the benefit of the patch is not sufficient
> compared to the extra effort to fix the remaining comments that we have
> on it. If you're still interested in pursuing this, we would welcome a
> new patch that addresses the above two issues.
>

 I think its fine to drop this patch. I was trying to prove that how
easy and fast it
could be to build buildroot but this is not a real world usecase.

> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
