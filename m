Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D0DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFE382446;
	Sun,  9 Jan 2022 21:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gMYEjcwP7Vq; Sun,  9 Jan 2022 21:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C522823E8;
	Sun,  9 Jan 2022 21:09:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9701BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BA02823E8
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQlJ6O-dLRn0 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:09:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3313823E2
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 21:09:10 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u13so37396898lff.12
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 13:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iaGSBs7BqwJEMIHKpa8K1g5qCbSEiIZ4WwvFtPLuhDU=;
 b=eoxiuv12T5D7BSSSyzDB97tPZJRXcigiaKdtrwwjovMUS9Aki8gIadQk1T0a9yC4Ls
 uW6hUDn3qUIWbMSUJyzhgGkPueNvKFtMnducL3T/3cFQDSJWrsyEIxm6ZVhCAhpu1zoS
 djSBEN3fkyhUOK5SWsmvGuRyGaxR+AIn6poaMxkjio4VtUqLqURw2fkjBUvNocZrQK0f
 KQTLvg9ZyjN30kH/Yy0r6itbW7v0pd1DijV3yOX/84h+BKD91WIxy9d9YO4uDMMLuPrP
 Wj2Dd/00ktGx0hElr6pSofftrma/KJPuTqWJukoQvgMPo35cNJiQP3VbElXunU2xzE0p
 ZJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iaGSBs7BqwJEMIHKpa8K1g5qCbSEiIZ4WwvFtPLuhDU=;
 b=m7Ajo4RCVMcQR2vD6Pqkmacd9mu+iLyV154wRCGseEA9M5Zhrgaf1M5Fg0E4arm98e
 QKFb+KLjEsU3DnKW3nnoD76N3EE5wvX19+rMcHA0o56TZLvk3LP/QLBswv3FkPReZ9IG
 whFKp9FEEEIQrrZIQfffGS7o5E1Tp67R0nLGLeGx1pZJGgEjlAP6xFlmePUhFXJVLaIJ
 6krkIhwk3gm5kQ/UKnhQPAzL1AGGDhc0B6ZzE6kS0MPk9bErLPu59qB4nk3565nmLv0O
 P9g3eKZiVkU3RoF6osuM78dN909Bu1kNINer6D7jotG8fLRpY5jM/v5Wrez3y/ssmILK
 qKWA==
X-Gm-Message-State: AOAM531XR656VyYQx9WYOqH0MWGxSL1Wlz6NJWEkJEJrb+NN1nF6GzSK
 Y4FHk5NHb0dyygS+o66Ze8gNS1BKyjolzF1BNH0=
X-Google-Smtp-Source: ABdhPJw/InQHVnSegCR0hJoWDpUZDsDmUwiwD9soSRYM0CAnKN0b5Wx3G0C0hVxYpgG7g7J+ZQ4sfB3Rke98U5rFNJc=
X-Received: by 2002:a2e:9119:: with SMTP id m25mr7740891ljg.378.1641762548365; 
 Sun, 09 Jan 2022 13:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20201017221743.160029-1-nolange79@gmail.com>
 <20201017221743.160029-2-nolange79@gmail.com>
 <20220109151653.GC1477939@scaer>
In-Reply-To: <20220109151653.GC1477939@scaer>
From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 9 Jan 2022 22:08:57 +0100
Message-ID: <CADYdroOukmBWuv749KyKoLe7=icsN3Cogp1EATm3RbjmwYMDMA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v2 2/4] package/gcc: use binutils wrappers
 for target libs
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am So., 9. Jan. 2022 um 16:16 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Nrobert, All,
>
> On 2020-10-18 00:17 +0200, Norbert Lange spake thusly:
> > This will use gcc-ar, gcc-nm and gcc-ranlib instead of the
> > normal binutils tools. The difference is that with the
> > wrappers, gcc plugins will be automatically picked up,
> > which might be necessary with some flags.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > ---
> > v1->v2:
> > *   Only set those wrappers if gc 4.7 or newer
> > ---
> >  package/gcc/gcc.mk | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> > index 114c2887a0..a24ffe3ee2 100644
> > --- a/package/gcc/gcc.mk
> > +++ b/package/gcc/gcc.mk
> > @@ -99,6 +99,9 @@ GCC_COMMON_TARGET_CFLAGS += -Wno-error
> >  endif
> >
> >  # Propagate options used for target software building to GCC target libs
> > +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
> > +HOST_GCC_COMMON_CONF_ENV += AR_FOR_TARGET=gcc-ar NM_FOR_TARGET=gcc-nm RANLIB_FOR_TARGET=gcc-ranlib
>
> So we were a bit skeptical about this one.
>
> First, we believe that only the final gcc should be using those. Indeed,
> we do not need much of the initial gcc, except libgcc.a, which anyway
> gets overwitten by the final gcc, so we do not care that the libgcc.a is
> built with LTO (and thus the gcc wrappers).
>
> Second, gcc initial is only used to build glibc, and as your patch 4
> states, glibc must not be built with LTO, we we also do not care that
> the initial gcc uses its wrappers to build libgcc.
>
> Third, shouldn't we be using the tupple-prefixed wrappers? Or does it
> just happens that gcc will internally add its build directory to PATH so
> that it can find the un-prefixed just-built ones?
>
> For that last point, I added gcc-ar, gcc-nm, and gcc-ranlib in my PATH,
> that are just simple wrapper scripts that trace their being called, and
> then call to the actual gcca-r et al.:
>
>     #!/bin/sh
>     me="${0}"
>     my_name="${0##*/}"
>     found=false
>     for i in $(which -a "${my_name}"); do
>         if [ "${i}" -ef "${me}" ]; then
>             found=true
>         elif ${found}; then
>             me="${i}"
>         fi
>     done
>     if ! ${found}; then
>         exit 42
>     fi
>     printf "YEM: wrapped %s\n" "${me}"
>     exec "${me}" "${@}"
>
> Turns out that the 'YEM: wrapped' string occurs nowhere in the build
> directory (so it does not end up in config.log or whatever), and it
> does not even appear on the stdout/stderr either.
>
> So I am wondering how we can exercise these... Any hint?

Can't tell anymore, I went to crosstool-ng for the compiler some time ago,
so unlike my other patches I dont use them anymore.

From my memory, it affected some of the additional libs gcc builds,
libstdc++, some sanitizers maybe.
there was not absolute paths or tuples as the various stages should
use the wrappers from the previous ones. I believe the final compiler
ignores PATH and uses the stage2-compiler with abs path to build the
included target libraries.

I am just sure it was very deliberately done *this* way.

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
