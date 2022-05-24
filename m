Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6B2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 19:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2729D61259;
	Tue, 24 May 2022 19:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IMkShlZZn65K; Tue, 24 May 2022 19:16:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1825C61254;
	Tue, 24 May 2022 19:16:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E59581BF28C
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 19:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0DFB84051
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 19:16:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRQ25b5bryFD for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 19:16:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6A7984050
 for <buildroot@buildroot.org>; Tue, 24 May 2022 19:16:13 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 c17-20020a4ac311000000b0040ea8bf80f2so380181ooq.1
 for <buildroot@buildroot.org>; Tue, 24 May 2022 12:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=poYrD59OUDBRtqNYunGUEisma2ys14P45Ep1b+Hcs4g=;
 b=Ekox7FBPX0ZR2aoZRRiheTO5tTihp2PuoW+Imz++b5E+tSLc22Gqi8r3J4lFuSBCia
 1yjjeF5s7UucNQ6yO6SDezIGhOxTrNADh6PPf55UR5iIvX1/AdYnM1mv9A6Zoe2QSipt
 HbdKbILEmtRVOSNI0LPMlu1mFrDn+7F7TOZ7V8zifWKEwHe9AQJSRRb3Oxw56BFuV9r9
 HkLvo1DQeqIHTsEkJ7XxAvc7y1rHrwAQg/fe6ordoXqc9jx2bLym2fyOYmcNjO9/tvvC
 5PZu5hs/a4cPsvLrvFQMZJFPa1bCu+M53xjaasGf3biRqrYpSkQ9V2ia+3lLIYYZFxDW
 RrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=poYrD59OUDBRtqNYunGUEisma2ys14P45Ep1b+Hcs4g=;
 b=VuJV8yDLFmAxIfVJGA/EMZ69wX7kju1tnw93BDQwhx7bt1OX8trT5OQ1Y/hlkI9XBk
 lq0psEN0/R1GUMqfdrkhtcIoT2TVbogzRf2rS+jsJYpJQGahxNTktzOnTcOG0E58jLsE
 RmEoG4POHrq7qrvVdEi6mtueoz4pOP9EX3aKwAwf5ZQO5apT3o83j7XN8WxbwhMNJ4Pe
 5yVtSWwFsE8gxXajpG5H08Vr9avF/Thq3GlreM2i6QLqyDQJfNxQ5So0uMV5hOtfWhNa
 UCE/uwByldS36dO0Crr8NWl6Rud1urizg/ae54Q8QGB9ykodQecPKxYwiQRoFvGEsguY
 ELkQ==
X-Gm-Message-State: AOAM533/RcVf3p01rylRM30KH5fsZF5Cd66imontJRoJCxTGXWZCCIEz
 udkHpCIHyz6gAztS5uZYLegSQH1yzAoyFtCNJCI=
X-Google-Smtp-Source: ABdhPJzOriw2Ulvjjrv1l7uyuSHEbrgB6jGorALACuCIh03KaBNUCkyMKul/H6azF7hgHVpPFJRa3Z/KXpMV79Xz0Ss=
X-Received: by 2002:a4a:ba81:0:b0:40e:7cd9:afa1 with SMTP id
 d1-20020a4aba81000000b0040e7cd9afa1mr5894994oop.22.1653419772647; Tue, 24 May
 2022 12:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220514222811.3925140-1-james.hilliard1@gmail.com>
 <5a0bb1b8-b671-e85b-1942-3b17f31f0547@mind.be> <20220524190138.GB2500@scaer>
In-Reply-To: <20220524190138.GB2500@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 May 2022 13:16:01 -0600
Message-ID: <CADvTj4q77jiin-pcvecnfKC_KR+gxPR=7jYov2WgG=ZT5hGO7A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/midori: add missing
 !BR2_PACKAGE_GNUPG dependency
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 24, 2022 at 1:01 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, Arnout, All,
>
> On 2022-05-18 21:17 +0200, Arnout Vandecappelle spake thusly:
> > On 15/05/2022 00:28, James Hilliard wrote:
> > >The !BR2_PACKAGE_GNUPG needs to be propagated from BR2_PACKAGE_GCR.
> > >
> > >Fixes:
> > >WARNING: unmet direct dependencies detected for BR2_PACKAGE_GCR
> > >   Depends on [n]: BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && !BR2_PACKAGE_GNUPG [=y]
> > >   Selected by [y]:
> > >   - BR2_PACKAGE_MIDORI [=y] && BR2_PACKAGE_MIDORI_ARCH_SUPPORTS [=y] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_HOST_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_USES_GLIBC [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_LIBGTK3 [=y] && (BR2_PACKAGE_LIBGTK3_X11 [=y] || BR2_PACKAGE_LIBGTK3_WAYLAND [=n])
> > >
> > >Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > >---
> > >  package/midori/Config.in | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > >diff --git a/package/midori/Config.in b/package/midori/Config.in
> > >index 715295e5a6..54e19d4d34 100644
> > >--- a/package/midori/Config.in
> > >+++ b/package/midori/Config.in
> > >@@ -25,6 +25,7 @@ config BR2_PACKAGE_MIDORI
> > >     bool "midori"
> > >     depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
> > >     depends on !BR2_STATIC_LIBS # webkitgtk
> > >+    depends on !BR2_PACKAGE_GNUPG # gcr
> >  You forget to add a comment for this.
> >  Applied to master with that fixed, thanks.
>
> Unfortunately, as Romain noticed, this is causing a circular (aka
> recursive) kconfig dependency:
>
>     $ make distclean; make defconfig
>     [...]
>     package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
>     package/gstreamer1/gstreamer1/Config.in:5:      symbol BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
>     package/webkitgtk/Config.in:90: symbol BR2_PACKAGE_WEBKITGTK_MULTIMEDIA depends on BR2_PACKAGE_WEBKITGTK
>     package/webkitgtk/Config.in:24: symbol BR2_PACKAGE_WEBKITGTK is selected by BR2_PACKAGE_MIDORI
>     package/midori/Config.in:28:    symbol BR2_PACKAGE_MIDORI depends on BR2_PACKAGE_GNUPG
>     package/gnupg/Config.in:1:      symbol BR2_PACKAGE_GNUPG is selected by BR2_PACKAGE_PYTHON_GNUPG
>     package/python-gnupg/Config.in:1:       symbol BR2_PACKAGE_PYTHON_GNUPG depends on BR2_PACKAGE_PYTHON3
>     package/python3/Config.in:5:    symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_JACK2_DBUS
>     package/jack2/Config.in:35:     symbol BR2_PACKAGE_JACK2_DBUS depends on BR2_PACKAGE_JACK2
>     package/jack2/Config.in:1:      symbol BR2_PACKAGE_JACK2 is selected by BR2_PACKAGE_FLUIDSYNTH_JACK2
>     package/fluidsynth/Config.in:38:        symbol BR2_PACKAGE_FLUIDSYNTH_JACK2 depends on BR2_PACKAGE_FLUIDSYNTH
>     package/fluidsynth/Config.in:1: symbol BR2_PACKAGE_FLUIDSYNTH is selected by BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
>     package/gstreamer1/gst1-plugins-bad/Config.in:438:      symbol BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH depends on BR2_PACKAGE_GSTREAMER1
>
> James, can you look at it, please?

Yeah, already sent a patch that should fix this:
https://patchwork.ozlabs.org/project/buildroot/patch/20220519045549.2320246-1-james.hilliard1@gmail.com/

>
> Regards,
> Yann E. MORIN.
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
