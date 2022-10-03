Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C8DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 08:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 521F560B06;
	Mon,  3 Oct 2022 08:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 521F560B06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4AYCxksZ3TfJ; Mon,  3 Oct 2022 08:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62C8E60AEC;
	Mon,  3 Oct 2022 08:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C8E60AEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 387B81BF312
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 08:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2177060AFE
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 08:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2177060AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRpngLAilnnj for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 08:00:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E9FC60AEC
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E9FC60AEC
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 08:00:32 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3560e81aa1dso76238357b3.2
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 01:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6VYagIjTmGUhX9gl8O5kF8vWDWIYvHIF9ayrncdbwo=;
 b=1C+cUd4SxWkkSQ5TdKj35Ne+92kGDRoETb3ZopWWxb4vjFSyQ9KKk6Fd4O+gze9p5Y
 burCuaagc9Ub9wBku2zVdW2dCMXJVN/8oumCIA96OXUKfzVHVz1VIqf3TVZ0mcfEKpP8
 qN3epOprcA9ftA4de1ix7VKbg7sderRWu5vWf67Ps+Hn6JFhlsHaopDsXyekXjHxoD2A
 dC35ZO1QNhhsXKh2wzIQs5zs6M3IH3wIck8j4tEUG+4SbER1k3UO/oH3/l/nPGOciJQT
 Lit5oA6SBWrGLaHnUGrcgjVNMA55brVRZ8o3KM+C9Pj22noEeh7xme1IR1RQLfVu6rbu
 +SLw==
X-Gm-Message-State: ACrzQf0MT4eCvU3u+la3MsYAgkh+kHr8Upcp7nGbh1Qta6e2rGRHwYth
 gkwVl8Ij1JippfrM909slU+JZVXBfySNLvkWnA0=
X-Google-Smtp-Source: AMsMyM6VM+Tckmh6lby4MmiOY9s85b64GJeS1OhBM1pg/QCu2bMb7TcwzZXTRm3iJQRY10xzmGahnhlWxPcJixe8g54=
X-Received: by 2002:a0d:cdc2:0:b0:34d:101b:53c with SMTP id
 p185-20020a0dcdc2000000b0034d101b053cmr19021561ywd.444.1664784031117; Mon, 03
 Oct 2022 01:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220927105829.760755-1-nunes.erico@gmail.com>
 <20221001205354.GV30794@scaer>
In-Reply-To: <20221001205354.GV30794@scaer>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Mon, 3 Oct 2022 10:00:19 +0200
Message-ID: <CAK4VdL3MPxP_LzuJXpNaMXBWWqVQYJVbqZU_izzMt8fDnucrGw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/6VYagIjTmGUhX9gl8O5kF8vWDWIYvHIF9ayrncdbwo=;
 b=l3nSi422QgRKAkR76wABlyiHVsmeZ9OW2Mhbe9iSP175uGdS/1liQVOVxSE75DAnXU
 9Ku9aX4JeyNwze+CH/XZz9OOHOY30M1UXfqUEwPFa6zhQHUNz62802Wzcvg88oEsbkX5
 KldLcNWKerMDApQWLS73qLu6Hj9R0Y3P7hLszfFQq2/pQmaMNjZ2oxo6+aQHkdiX8/dU
 QZ1M8Ydn9mDGxuRA9ELPVf6t/4W6DE3dJouD4Hn/Q7WaA1GhJZmuckrbujMo/u9a+tzZ
 9GeYQ/b6G1gNxWAyHUqCYDtX5uNBwWPb9gHWggDiZH9KfdkcgeimyEbJ0okXQyLkpEj9
 ZPnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l3nSi422
Subject: Re: [Buildroot] [PATCH] package/efivar: bump to version 38
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 1, 2022 at 10:53 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> On 2022-09-27 12:58 +0200, Erico Nunes spake thusly:
> > Drop backported patches and rebase the ones that are still relevant.
> >
> > From version 37 to 38, there is a new build system in place, which is
> > still custom Makefiles.
> > It is not cross-compilation friendly and includes host tools, so a
> > few workarounds are required to prevent things being built or rebuilt
> > wrongly for host or target.
> [--SNIP--]
> > diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
> > index 8708057b18..aaea33c01d 100644
> > --- a/package/efivar/efivar.mk
> > +++ b/package/efivar/efivar.mk
> [--SNIP--]
> > @@ -21,16 +21,36 @@ define EFIVAR_BUILD_CMDS
> >       # $(HOST_CC), otherwise it gets cross-built.
> >       $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
> >               CFLAGS="$(HOST_CFLAGS) -std=gnu99" \
> > -             $(MAKE) -C $(@D)/src gcc_cflags=  makeguids
> > +             TOPDIR=$(@D) CFLAGS_GCC= \
> > +             $(MAKE) -C $(@D)/src makeguids
> >
> > +     # util.o needs to be rebuilt for target
> > +     mv -v $(@D)/src/util.o $(@D)/src/util_host.o
>
> This dual build commands hint at the need for a host-efivar package that
> builds makeguids, and patch src/Makefile to use an existing $(MAKEGUIDS)
> e.g. (mock diff for the sake of ilustration):
>
>     +MAKEGUIDS ?= makeguids
>
>     -$(MAKEGUIDS_OUTPUT) : makeguids
>     -$(MAKEGUIDS_OUTPUT) : guids.txt
>     +$(MAKEGUIDS_OUTPUT) : guids.txt $(MAKEGUIDS)
>
>     -./makeguids $(LD_DASH_T) guids.txt ...
>     +$(MAKEGUIDS) $(LD_DASH_T) guids.txt ...
>
> (yeah, this is very borked, but it's just to explain what I have in
> mind).

I considered something like this, but did not go for it due to the
additional trouble of having to patch the Makefile to not try to run
makeguids from the local directory... I can give it a try in this way
to see how it goes.

>
> > +
> > +     # Some workarounds for cross-compilation:
> > +     # MAKEGUIDS_SOURCES is undefined so it doesn't pick host flags for
> > +     # util.o or attempt to build makeguids again.
> > +     # SUBDIRS is redefined so it skips building docs.
> > +     # LD_DASH_T is redefined as the linker detection fails with Buildroot.
> >       $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
> >               AR=$(TARGET_AR) NM=$(TARGET_NM) RANLIB=$(TARGET_RANLIB) \
> >               $(EFIVAR_MAKE_OPTS) \
> > +             TOPDIR=$(@D) \
> > +             MAKEGUIDS_SOURCES= \
> > +             SUBDIRS=src \
> > +             LD_DASH_T=-T \
>
> Those should probably go into EFIVAR_MAKE_OPTS, as EFI_VAR_MAKE_OPTS
> is already used for EFIVAR_BUILD_CMDS, EFIVAR_INSTALL_TARGET_CMDS, and
> EFIVAR_STAGING_INSTALL_CMDS.
>
> >               all
> > +
> > +     # skip 'all' in install so in staging/target installs it won't try
> > +     # to build everything again due to the workarounds above
> > +     $(SED) 's/install : all/install :/g' $(@D)/src/Makefile
>
> This sed is not conditional, and it munges an existing, static file, so
> it should be done with a patch.

I'll work on a v2 with these changes. Thanks for the feedback.

Erico
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
