Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD694C433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 21:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2344E4032B;
	Thu, 20 Jan 2022 21:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NeQAhH7fBbrV; Thu, 20 Jan 2022 21:29:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B797340420;
	Thu, 20 Jan 2022 21:29:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6AC1BF2B5
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E67F60EBE
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyqFy4U9jRWh for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 21:29:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6786C60011
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 21:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642714178;
 bh=wlj4eat2ErTwYRHzt/oHeoQJr/jzvkfdWz1DUdsuOIo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GnxVvx0kk48aHXtjCJnqOeAdFmziNJa74Bebyb/ypm3EjpV0Uc2ykaXVwOf/6Ov2D
 +yNYhPfAgjflyWp7XbXcQ9eOHTVwEPsnPkEdBUBrLUcwNzqzM2gjHrljaSm+9tMLMW
 0v3C6T6hS1f0Bnsy6ODvxZARHTeDYNnyYff8QKBM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUGeB-1mkVPe3DPv-00RLpA; Thu, 20
 Jan 2022 22:29:37 +0100
Date: Thu, 20 Jan 2022 22:29:36 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220120222936.6e7b5aba@gmx.net>
In-Reply-To: <CADvTj4q2AWnzpQbbQHFRUWnKki_uRCcDTOiT7pwRZ4-Ao0o3fw@mail.gmail.com>
References: <20220119084545.3642950-1-james.hilliard1@gmail.com>
 <20220119204518.GC3095239@scaer>
 <CADvTj4q2AWnzpQbbQHFRUWnKki_uRCcDTOiT7pwRZ4-Ao0o3fw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:jRCKa52D714qrqzrxx5YfHZMcLhI1iUHi5rMli/o/DI9JN8FgDV
 yFIQMOySS68auBXqk+iet7XquXvPGXCVwyFgZb75n1hAVInsTgLDusBN6sUVDQr+jin3jY6
 rvCAGjFd1C4LE7Eus/foKPS4c9UbJqPTrkILKvoIBDT33+tMGZ+8QBMn0dSjLrygjF26NG9
 a7kzDnIxEchtlmt7vf7yA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uumYCODC+mY=:m7FDJgXBD2K+HG5F6vlLMg
 P0LSIfX6qs4GnggJiAqbANZqWWxYu5onW+zJNdAJZlxHLPb5A9Ov4dbQ/uBtcIMlaMoN1g5rj
 0Shj4YyyFlz7tucsg3YbVtt401uwQwPfz6rHPAs6A5hu5mbp5U8QshEvQ5Kf0OfCem87+TYow
 Fj6405kZ+lc/2e+0YJAX0uMdCz1NjEGlKEcGMNcx4PPT/XejYczFa3gSRJbePHDRp2QQq08kh
 D5+b8eM1XSnmSToosPRD1MojVQhLxF73wo+Y5EaFGmChKj5jMWLOgpgzHmKIDBWTHm67YWsNq
 3TeAvIx20/3wr2i4+4cOthY8QGibFTQHDsdmj5aZ1Xeib0wuHuxCvDwLaF3+QeFYCET5beuZ3
 3gCmplytS1wZjDNOszhfA6hOYLBuwom3hSrn9lA3OUqEEhgFaymw0nK1Y4ct6jp3TP1Ah3/co
 JyauA+quamoIdxOhKXSPXDC13KsZwfaDwicNbKL5Q3m3l0XhqjIAgg32qT5yvbL64vN+kPCbu
 rCWxPErfv1cKvoFtiPMIVf7o7KShEWq2Y5sNIFqGIly/0aVWyxoryWwbp1V6LBD61pT434284
 AW0I6/o1sJr4vzJ60iG3dJyUInABJGlXIVWYFFO0RUYZfgXW9rmEPH6Gg/8J7Lq1fe+6vZR3e
 8h/Qgq979SMj+HJJ4/Nxbd7cNVzqpm0bfRg42vSFkZ382/3FZ4XVZHRAvFvlGq90qqOYG1sf1
 nDEk7mGH5vbIIeHNJamrLOvwqZ7a3XXS22Rn5x3wDhLODzxobEG/BPvDqB8d2neUCmbe/cyWw
 N9C0cATSsdB/s4WCR1Fm5NfO1sBoU2hAuk3sc3qVkGE/X8NXlGFaiXoAQvE1EK8TF1EoBhX1W
 yasJ1Ma0mZuClZ+ne07YVVKOJM98ctl4QoYFq0ylCR5/QmDgDQ/h9rPoT27rqRZ4QbokC/pBs
 trrwEx6tiQbSg7H7P/3BNsR7tlG8KKR9TG7jbYsytsWKzQLR1sQ+DoNQ9Trn3cjcnQ8s/3AAf
 SJ/3DsHeaZIThL1vailZYEvP5FZtwV5Sp2O8XZV+Q0dvGw32uwz1OpqmrPLahUPJymVUxkm8t
 2oB60SFqOO15bc=
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

Hello James, Yann,

On Wed, 19 Jan 2022 17:42:46 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:

> On Wed, Jan 19, 2022 at 1:45 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > James, All,
> >
> > On 2022-01-19 01:45 -0700, James Hilliard spake thusly:
> > > The cmake build appears to be missing features such as pkg-config
> > > generation support, switch to the regular makefile based build
> > > which appears to work better.
> >
> > Can't we just fix the CMakeList.txt and submit a patch upstream,
> > instead?
>
> It looked like this had been brought up before and there was some issue that was
> making this difficult to fix with cmake.
> See:
> https://github.com/google/re2/issues/349
>
> >
> > Also, see below...
> >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  package/re2/re2.mk | 30 ++++++++++++++++++++++++++----
> > >  1 file changed, 26 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> > > index b562d5d7ef..144c82339f 100644
> > > --- a/package/re2/re2.mk
> > > +++ b/package/re2/re2.mk
> > > @@ -10,8 +10,30 @@ RE2_LICENSE = BSD-3-Clause
> > >  RE2_LICENSE_FILES = LICENSE
> > >  RE2_INSTALL_STAGING = YES
> > >
> > > -RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
> > > -HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
> > > +define RE2_BUILD_CMDS
> > > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > > +             -C $(@D)
> > > +endef
> > >
> > > -$(eval $(cmake-package))
> > > -$(eval $(host-cmake-package))
> > > +define RE2_INSTALL_STAGING_CMDS
> > > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > > +             DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) install
> > > +endef
> > > +
> > > +define RE2_INSTALL_TARGET_CMDS
> > > +     $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > > +             DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) install
> >
> > The 'install' target will forcibly build and install static and shared
> > libs:
> >
> >     https://github.com/google/re2/blob/main/Makefile#L297
> >
> >     296: .PHONY: install
> >     297: install: static-install shared-install
> >
> > So, this is probably going to not play nicely for builds where a shared
> > build is not possible.
>
> Sent a v2 which should fix this:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220120003827.395469-1-james.hilliard1@gmail.com/
>
> >
> > AFAICS, the cmake-based buildsystem got that one correct, though, so it
> > would be a bit of a shame to regress on that point...
> >

Or keep the cmake build and do the following to install re2.pc (taken from #349, [1]):

--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -9,9 +9,20 @@ RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
 RE2_INSTALL_STAGING = YES
+# keep original Makefile (for re2.pc install)
+RE2_SUPPORTS_IN_SOURCE_BUILD = NO

 RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
 HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON

+# install re2.pc
+define RE2_INSTALL_PKG_CONFIG
+	$(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) \
+		libdir=/usr/lib includedir=/usr/include \
+		common-install
+endef
+
+RE2_POST_INSTALL_STAGING_HOOKS += RE2_INSTALL_PKG_CONFIG
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))

Regards,
Peter

[1] https://github.com/macports/macports-ports/pull/9836#issuecomment-807868854


> > Regards,
> > Yann E. MORIN.
> >
> > > +endef
> > > +
> > > +define HOST_RE2_BUILD_CMDS
> > > +     $(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> > > +             -C $(@D)
> > > +endef
> > > +
> > > +define HOST_RE2_INSTALL_CMDS
> > > +     $(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> > > +             -C $(@D) DESTDIR="$(HOST_DIR)" prefix=/usr install
> > > +endef
> > > +
> > > +$(eval $(generic-package))
> > > +$(eval $(host-generic-package))
> > > --
> > > 2.25.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
