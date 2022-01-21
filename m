Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B7BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 09:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50FDA41608;
	Fri, 21 Jan 2022 09:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGiOHIm3WWir; Fri, 21 Jan 2022 09:17:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ABA0415BD;
	Fri, 21 Jan 2022 09:17:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2D651BF31E
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 09:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1696415BD
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 09:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXBPGM2D-MdB for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 09:17:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAE44415A7
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 09:17:12 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 v8-20020a9d6048000000b005960952c694so10981308otj.12
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 01:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yj67q1K6rfovQ++01joL1Ff7E22prG56gLx265B1bE0=;
 b=jvrF4tIivMm1529mAU4nRCw9IYBhKEIIVFzGEnmjqDZe9791tVsNDiTECkq4ue0iAq
 pV4CnuqhZFoVr1Ql4O3zgWGA6zTNs1NIyuNt2u+0yc83ceVU6y3GLmIvfS6VjvBYG8+f
 PPJOWGTijDw6lUfszT/1gHLyIiJZ+r/bfEpBFD0PmGohfv7bVjde0fr4Yu5RwHaSLtTB
 F3ks+ACknnDo27Zb6EUcakkdQyGpRx0qOvZ9slEEBrhL0EHnvKnwnPonnwY7QLUHWTnu
 EM2OCIDRvVnVzVMmNq9fmE2jsVk8/F4tUQQlcDdCmLkxjGk5hFeaR0xdKjh+7PKJFuSN
 PU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yj67q1K6rfovQ++01joL1Ff7E22prG56gLx265B1bE0=;
 b=eKenY2f29upCas7mWZk9/ca1vkzd+KaCMYNG+eV7pg53kJEpkVEeiYg4kURmO+wX0I
 jo99Ug7+tSziWTTrZdKd6gydJBh7ksIrVlW8ycZoIESFUV+Jn+Ct/edBDboWyySL6Nrr
 FYquVSULaMw9mtRCA4sffvlw74xROVUC4Wmuv/7y6QLdkfrNFgUIS2lHEDyGUuD17N9z
 fD8rXtszu+7xaJfTmfo4kTPYZQGNKyXV0Zo4CoHukiSpZlDuqrqJtqM++YRECa7guxpA
 uyWaSoviix7yLDdX0C6d8J39lTEjZufpDbSloZE1P+BN8+hSCCYLS3wkpCDv/0SBrsU6
 7TFA==
X-Gm-Message-State: AOAM532mlSaES4FA/Y182yH++Rw4N7dOJCW7gMt0XIC2hrp7/KzMH9Q9
 9q+eWHNP1VxHzHf1el3snj8Dgj6PMaWUXYCWFrw=
X-Google-Smtp-Source: ABdhPJwzfvKpodKVec28Inltaq6HQRipuyWu42MpuTZOOgn9Y1pcGrdvDUgRk0jjm4VIlkqoJe+EtoNXn1VDHAbCJvk=
X-Received: by 2002:a9d:7ad9:: with SMTP id m25mr2165310otn.151.1642756631602; 
 Fri, 21 Jan 2022 01:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20220119084545.3642950-1-james.hilliard1@gmail.com>
 <20220119204518.GC3095239@scaer>
 <CADvTj4q2AWnzpQbbQHFRUWnKki_uRCcDTOiT7pwRZ4-Ao0o3fw@mail.gmail.com>
 <20220120222936.6e7b5aba@gmx.net>
 <CADvTj4rXQO8Kbe0sMA5YJdj6A2R98OELOB5sPD_xriZ_npkaFQ@mail.gmail.com>
 <20220121065850.GF3252931@scaer>
In-Reply-To: <20220121065850.GF3252931@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 21 Jan 2022 02:17:00 -0700
Message-ID: <CADvTj4oEcwduT7rdh1YeJORzRCRhv0pDgV3RN9fmhi2hGy0nQQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: switch to generic-package
 make build
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 20, 2022 at 11:58 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-01-20 16:57 -0700, James Hilliard spake thusly:
> > On Thu, Jan 20, 2022 at 2:29 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > Or keep the cmake build and do the following to install re2.pc (taken from #349, [1]):
> > >
> > > --- a/package/re2/re2.mk
> > > +++ b/package/re2/re2.mk
> > > @@ -9,9 +9,20 @@ RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
> > >  RE2_LICENSE = BSD-3-Clause
> > >  RE2_LICENSE_FILES = LICENSE
> > >  RE2_INSTALL_STAGING = YES
> > > +# keep original Makefile (for re2.pc install)
> > > +RE2_SUPPORTS_IN_SOURCE_BUILD = NO
> > >
> > >  RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
> > >  HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
> > >
> > > +# install re2.pc
> > > +define RE2_INSTALL_PKG_CONFIG
> > > +       $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) \
> > > +               libdir=/usr/lib includedir=/usr/include \
> > > +               common-install
> > > +endef
> > > +
> > > +RE2_POST_INSTALL_STAGING_HOOKS += RE2_INSTALL_PKG_CONFIG
> > > +
> > >  $(eval $(cmake-package))
> > >  $(eval $(host-cmake-package))
> > >
> > > Regards,
> > > Peter
> > >
> > > [1] https://github.com/macports/macports-ports/pull/9836#issuecomment-807868854
> >
> > There's a problem with this approach, the makefile with common-install
> > gets overwritten
> > by the one generated by cmake if cmake is used.
>
> It currently gets overwritten, because the build is done in-tree, but
> What Peter suggests is doing the build out-of-tree, with:
>     RE2_SUPPORTS_IN_SOURCE_BUILD = NO
>
> However, I can't say that I am very fond of this option either. Misinx
> the two buildsystems looks icky... What bothers me a bit, is that
> common-install also installs the headers, not just the re2.pc, so this
> could, even if unlikely, conflict with what the cmake-side would do.
>
> But when looking at the various bugs about this issue:
>
>     https://github.com/google/re2/issues/349
>      -> https://github.com/google/re2/issues/304#issuecomment-808219200
>          -> https://github.com/macports/macports-ports/pull/9836
>
>     re2: change to cmake build to support gprc, which currently needs a
>     cmake version of re2 to build. Try to make it work like the previous
>     autotools build worked.
>
> So, that last issue, against homebrew, is interesting: it seems that
> using the Makefile-based buildsystem is not enough, because it does not
> isntall the cmake equivalent of re2.pc, which breaks grpc.

That appears to have been fixed:
https://github.com/grpc/grpc/commit/45e413d2520795e7281e9a592af81620349bc186

>
> So, whether we keep the cmake build, or switch to the Makefile build, we
> would eventually still miss some pieces...
>
> Damn, back to square-one...
>
> So, I think that Peter's proposal is not so un-appealing, in then end.
> But then in such situation, I think it would be simpler for us to just
> apply something like:
>
>     define RE2_INSTALL_PC
>         $(INTALL) -d -m 0644 $(@D)/re2.pc \
>             $(STAGING_DIR)/usr/lib/pkgconfig/re2.pc
>         $(SED) 's,@includedir@,/usr/include,; s,@libdir@,/usr/lib,' \
>             $(STAGING_DIR)/usr/lib/pkgconfig/re2.pc
>     endef
>     RE2_POST_STAGING_INSTALL_HOOKS += RE2_INSTALL_PC
>
> And be done with it: minimal change to the re2 package, no dual-buildsystem
> situation and thus no install conflict on the headers, usual and simple
> post-install hook.
>
> Thoughts?
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
