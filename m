Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63666C433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 23:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC4F82EA5;
	Thu, 20 Jan 2022 23:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLYcZkQrGo3q; Thu, 20 Jan 2022 23:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D883D82F77;
	Thu, 20 Jan 2022 23:57:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97E761BF289
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 23:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8231482F77
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 23:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t39c2F5HErrL for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 23:57:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D843882EA5
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 23:57:34 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso9684180otr.6
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 15:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c4MCg5+klInCAvV8mWM7BR9aXsoKb1QVs1EaeLGKsPI=;
 b=KW4n9hg4M2ylIR1VVady7IjTv+r//9oQXPAOqe9I7JSDj0zmQKqU2mdRbTRPreI8KF
 uwVjt55v6FarL7O2o2wUsiaP44TlHgCBsMnQtjVQOI0BeVZW9/r4KB1g7Az5MVCRojAX
 faagkQSYDPqJ979sl8yO8zGPEDh2bXO6DzKQvMhQXpSADSC83jYK56EY8fC5HcktWQTm
 ZsJAx5RtgmnKbLL0tvShWo43ojZPU5WGhpxQH/jCxbrTbJSOgqTzx9O4EYAWz7wukeUR
 kwfcgcZWJ8Pr/x22xLL7aHz2KvZzeM4O/J8N3xAhws7ZgCVkf9sNfjXFgBXH9Ys9qreZ
 viIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c4MCg5+klInCAvV8mWM7BR9aXsoKb1QVs1EaeLGKsPI=;
 b=wlbzshFgNn2aOXDclFl7dVksXAXVrsUtvOB96g9zyGsch1bLwDojn1ewsVRXnzY66l
 xAgirwgus/n4wEJXf5DNtjw+NORvO3dR0VYw4QESClZTpy+DCcpoE2ejvOkpdkDi+Mnw
 lGYfDUOyLdFsad/aTDCSOorD0k45dIGS6mtLKaa/sx1onO4Jgv16/kFpADQthrB+fgx5
 rS6ARUxL4AYc2gT4M3x4XPen4+8bHjYFD/s3gFsExYJeT4Jywn5zRqBWg0I9Pgc7erk4
 y08Fm5kfFrin1cymcmX5HXZGKKXQrtH8NqLiAdB98WBDi2eTLIXQpdKP95a8N6pS5pfb
 tTzg==
X-Gm-Message-State: AOAM533INCkNyy7JBNXmmds+UDIseD7zRLSa/HQyW7WFAODOe7XAhQIN
 iEVUdskvve3oJWssipBbrJK2B+aB7ChvA2WNER4=
X-Google-Smtp-Source: ABdhPJy9aw3Y1E9eQZHwSQm8FEqIha6myNDkTDyP0KvjEjZl7i8R4ef1lTppJAA110GHBUe0IUQNalxsmi8NpJ6Tpwk=
X-Received: by 2002:a9d:63c3:: with SMTP id e3mr976627otl.30.1642723053663;
 Thu, 20 Jan 2022 15:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20220119084545.3642950-1-james.hilliard1@gmail.com>
 <20220119204518.GC3095239@scaer>
 <CADvTj4q2AWnzpQbbQHFRUWnKki_uRCcDTOiT7pwRZ4-Ao0o3fw@mail.gmail.com>
 <20220120222936.6e7b5aba@gmx.net>
In-Reply-To: <20220120222936.6e7b5aba@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 20 Jan 2022 16:57:22 -0700
Message-ID: <CADvTj4rXQO8Kbe0sMA5YJdj6A2R98OELOB5sPD_xriZ_npkaFQ@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 20, 2022 at 2:29 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello James, Yann,
>
> On Wed, 19 Jan 2022 17:42:46 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > On Wed, Jan 19, 2022 at 1:45 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > >
> > > James, All,
> > >
> > > On 2022-01-19 01:45 -0700, James Hilliard spake thusly:
> > > > The cmake build appears to be missing features such as pkg-config
> > > > generation support, switch to the regular makefile based build
> > > > which appears to work better.
> > >
> > > Can't we just fix the CMakeList.txt and submit a patch upstream,
> > > instead?
> >
> > It looked like this had been brought up before and there was some issue that was
> > making this difficult to fix with cmake.
> > See:
> > https://github.com/google/re2/issues/349
> >
> > >
> > > Also, see below...
> > >
> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > ---
> > > >  package/re2/re2.mk | 30 ++++++++++++++++++++++++++----
> > > >  1 file changed, 26 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> > > > index b562d5d7ef..144c82339f 100644
> > > > --- a/package/re2/re2.mk
> > > > +++ b/package/re2/re2.mk
> > > > @@ -10,8 +10,30 @@ RE2_LICENSE = BSD-3-Clause
> > > >  RE2_LICENSE_FILES = LICENSE
> > > >  RE2_INSTALL_STAGING = YES
> > > >
> > > > -RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
> > > > -HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
> > > > +define RE2_BUILD_CMDS
> > > > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > > > +             -C $(@D)
> > > > +endef
> > > >
> > > > -$(eval $(cmake-package))
> > > > -$(eval $(host-cmake-package))
> > > > +define RE2_INSTALL_STAGING_CMDS
> > > > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > > > +             DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) install
> > > > +endef
> > > > +
> > > > +define RE2_INSTALL_TARGET_CMDS
> > > > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > > > +             DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) install
> > >
> > > The 'install' target will forcibly build and install static and shared
> > > libs:
> > >
> > >     https://github.com/google/re2/blob/main/Makefile#L297
> > >
> > >     296: .PHONY: install
> > >     297: install: static-install shared-install
> > >
> > > So, this is probably going to not play nicely for builds where a shared
> > > build is not possible.
> >
> > Sent a v2 which should fix this:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20220120003827.395469-1-james.hilliard1@gmail.com/
> >
> > >
> > > AFAICS, the cmake-based buildsystem got that one correct, though, so it
> > > would be a bit of a shame to regress on that point...
> > >
>
> Or keep the cmake build and do the following to install re2.pc (taken from #349, [1]):
>
> --- a/package/re2/re2.mk
> +++ b/package/re2/re2.mk
> @@ -9,9 +9,20 @@ RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
>  RE2_LICENSE = BSD-3-Clause
>  RE2_LICENSE_FILES = LICENSE
>  RE2_INSTALL_STAGING = YES
> +# keep original Makefile (for re2.pc install)
> +RE2_SUPPORTS_IN_SOURCE_BUILD = NO
>
>  RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
>  HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
>
> +# install re2.pc
> +define RE2_INSTALL_PKG_CONFIG
> +       $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) \
> +               libdir=/usr/lib includedir=/usr/include \
> +               common-install
> +endef
> +
> +RE2_POST_INSTALL_STAGING_HOOKS += RE2_INSTALL_PKG_CONFIG
> +
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
>
> Regards,
> Peter
>
> [1] https://github.com/macports/macports-ports/pull/9836#issuecomment-807868854

There's a problem with this approach, the makefile with common-install
gets overwritten
by the one generated by cmake if cmake is used.

>
>
> > > Regards,
> > > Yann E. MORIN.
> > >
> > > > +endef
> > > > +
> > > > +define HOST_RE2_BUILD_CMDS
> > > > +     $(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> > > > +             -C $(@D)
> > > > +endef
> > > > +
> > > > +define HOST_RE2_INSTALL_CMDS
> > > > +     $(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> > > > +             -C $(@D) DESTDIR="$(HOST_DIR)" prefix=/usr install
> > > > +endef
> > > > +
> > > > +$(eval $(generic-package))
> > > > +$(eval $(host-generic-package))
> > > > --
> > > > 2.25.1
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot@buildroot.org
> > > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > >
> > > --
> > > .-----------------.--------------------.------------------.--------------------.
> > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > '------------------------------^-------^------------------^--------------------'
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
