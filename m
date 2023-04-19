Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF063C77B73
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 22:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B91160FD7;
	Wed, 19 Apr 2023 22:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B91160FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OfYnNEpeuG5E; Wed, 19 Apr 2023 22:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7118E60FB1;
	Wed, 19 Apr 2023 22:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7118E60FB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB4461BF421
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 22:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91E3660FB2
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 22:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91E3660FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bn4AtuGd8PHO for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 22:27:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6439A60FA7
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6439A60FA7
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 22:27:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id z6so2030071ejc.5
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 15:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681943262; x=1684535262;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pIih7t7qO7BZ22va6KqZZRIVI+x+OR/zx9dLeuvbsNs=;
 b=hB9wIUGbQRnFqJeV/CtCfCB6x/mXz0GYW0SelNHxxdSqChrXwJ/BskA3sJKQoK/NHq
 AP4BNIjF33hpDf/LmQJVOGfZ5QzFYoxBCO17QwfD5WSHzxT0ZnaVqpyJq5fXS9fV3OoK
 oVGSwjpf9H72VDJP6Fifpb9tjQfizQ1jnbx6lI9GObWlu1xGEDngB2u6IMpNa+skWC1o
 8nHBteRcP5eeL4hB0FWtsxiwmAXBhjmGNfoCMDdcYdJt/3w+KiU2Z3pr8bAdw/zva9qj
 v7Q3jiS76WEHZOrJlgHscxYDbZjA31+woHZaPEl1yaXxbfz9yDouqtXOWZ9HkcNDh80X
 CeCw==
X-Gm-Message-State: AAQBX9cndM+UvtefZM5LmgZ+Akbfi4bvlnH8vyIo11GtQEPZ5zbzv1zy
 ZAZatvG9HXuPhjFl+8hgtsdbCULbXtE6wZh6Q9I=
X-Google-Smtp-Source: AKy350bZHn0BIskfIEn0QD8sye5GAJSadpViga6bulfHb5x19gxqqYw3lBGaVFXXKf5zDsNccrTjIeQBwIjsFmjFYDs=
X-Received: by 2002:a17:906:924b:b0:94f:3045:2255 with SMTP id
 c11-20020a170906924b00b0094f30452255mr13167035ejx.50.1681943262572; Wed, 19
 Apr 2023 15:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230417191447.2439214-1-pevik@seznam.cz>
 <20230417193924.GM2819@scaer>
In-Reply-To: <20230417193924.GM2819@scaer>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 20 Apr 2023 00:27:37 +0200
Message-ID: <CAB1t1CzzjvXbe0Gq2QFoJAMFjG-a_gUSkKgwhHBR2E41_suAfg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681943262; x=1684535262;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pIih7t7qO7BZ22va6KqZZRIVI+x+OR/zx9dLeuvbsNs=;
 b=FMsDqJ9TEiBppPUwYrCfS/o1msA+YbE9IEt0vmYWQK8HWCiciAr96+ieJVOynvhXsv
 BQGeoiuLCBOCdWrx+5vgVsSixyatGPN50okUfMFYX5P1xm1z4Ief67PsvRi+ZrvSM51v
 B0n+9J0bAhJCcLKSzEDhyfRq8+OQw5nN0Eb77d15Ea6OEToMEY3l9NLfIMTi8/vJNAGx
 EOm8zrO9t4A5X9pD+mxncYPPb89ubV7QET1mvMFBOKWiTSVi4Lw6w3MRGpYw/q7Se8oC
 VSp7lIwdr/LZnMqoBSlwZ3XZZ592htjbJqT9BZlxpinDd2SA6MhkLax/R43G2v+TEV+r
 y6gA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FMsDqJ9T
Subject: Re: [Buildroot] [PATCH] package/ltp-testsuite: remove 5.11 headers
 requirement for musl
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Anders Roxell <anders.roxell@linaro.org>, Petr Vorel <pevik@seznam.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Apr 2023 at 21:39, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Petr, All,
>
> On 2023-04-17 21:14 +0200, Petr Vorel spake thusly:
> > From: Petr Vorel <petr.vorel@gmail.com>
> >
> > 5e1c238b72 ("package/ltp-testsuite: require 5.11 headers for musl")
> > added a 5.11 headers requirement for musl, which contains fix
> > a85cbe6159ff ("uapi: move constants from <linux/kernel.h> to <linux/const.h>").
> >
> > This effectively disables LTP on all musl based toolchains from
> > toolchain-configs.csv:
> >
> >       bootlin-armv7-musl [ 7/45]: SKIPPED
> >     bootlin-riscv64-musl [19/45]: SKIPPED
> >      bootlin-x86-64-musl [26/45]: SKIPPED
> > br-i386-pentium-mmx-musl [31/45]: SKIPPED
> >
> > But these toolchains are based on 4.9.255 kernel headers, which have
> > backported fix as 834d8b96cd85 in 4.9.250 and LTP can be compiled with
> > them. Because there is currently no way to specify also older stable
> > releases with fix, it's better to remove this requirement. If people are
> > really using unfixed kernels we can reintroduce the workaround which was
> > removed in 5e1c238b72 or even ask upstream to carry it.
>
> There is no way to know whether a toolchain with headers earlier than
> 5.11 wil have the fix or not, as we do not have dot-release information
> for the headers version. E.g. 4.9 covers the whole range of kernel 4.9,
> some with the fix, some without. The only kernel headers version we know
> for sure has the fix, if kernel 5.11 and alter.

Sure, I understand current BR2_TOOLCHAIN_HEADERS_AT_LEAST_* check
functionality. Also understand that nobody will implement check for
stable releases just because single LTP issue. Therefore I'll might give up and
on next LTP release provide the patch again so that I can remove this check
(unless Bootlin musl toolchain(s) happens to be updated with major version bump
in a near future).

BTW even we count mainline releases as the official one, in reality most of
distros (not just embedded ones, actually all, but enterprise distros) use
LTS/stable kernels without much of patches. Therefore stable releases really
matter and no longer comparing only major version is enough.


>
> There are also toolchains with a lot of backported *features* (that's
> especially true among chip-co provided toolchains), where some features
> of later kernel headers are in fact present in older versions.
>
> We can't have a lernel headers check that is more lax than the actual,
> official, major kernel it was released in.
>
> So, I still think that what we currently do is absolutely correct:
> building ltp-testsuite requires kernel headers 5.11.
>
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi,
> >
> > I'm sorry for not checking the build properly. v1 and v2 of LTP update
> > were without this because I did check them properly and saw that 5.11
> > version requirement for musl was not needed (thanks to Thomas, who in
> > the past after my asking for that had found a time and updated toolchains).
>
> So yes, Bootlin is now provided updated toolchains, but it does not
> prevent people from using previous ones without the fix, even with an
> updated Buildroot.
>
> It also does not prevent people from having built their own toolchains
> in the past, with headers without the fix (or with it, we can't know),
> and keeping using those toolchains, becasue they have qualified them in
> their environment, and rebuilding those is just not possible.
>
> So, NACK from me.

Understand.

>
> I'll leave it open for other maintainers to have a look, in case one has
> another opinion and decides we want it.

Thank you.

Kind regards,
Petr

>
> Regards,
> Yann E. MORIN.
>
> > Kind regards,
> > Petr
> >
> >  package/ltp-testsuite/Config.in | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
> > index b42082e2cc..272c2ede37 100644
> > --- a/package/ltp-testsuite/Config.in
> > +++ b/package/ltp-testsuite/Config.in
> > @@ -12,7 +12,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
> >       bool "ltp-testsuite"
> >       depends on BR2_USE_MMU # fork()
> >       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> > -     depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
> >       depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
> >       select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> >       select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
> > --
> > 2.40.0
> >
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
