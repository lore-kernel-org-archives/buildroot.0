Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47643C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 09:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8E8660FD3;
	Thu, 16 Dec 2021 09:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y65n1NbqTZhK; Thu, 16 Dec 2021 09:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D59C060FB0;
	Thu, 16 Dec 2021 09:30:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 765D51BF405
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 09:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 644984166A
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 09:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdYcniuWRHNc for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 09:30:48 +0000 (UTC)
X-Greylist: delayed 00:05:21 by SQLgrey-1.8.0
Received: from smtp.ex10.biz (ikhexhub04.ex10.biz [178.170.125.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F27B141661
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 09:30:47 +0000 (UTC)
Received: from IKHEXMBXC02N01.ikhex.ikoula.com ([fe80::cde4:a1f9:1383:b44c])
 by ikhexhub04.ikhex.ikoula.com ([178.170.125.68]) with mapi id
 14.03.0487.000; Thu, 16 Dec 2021 10:25:20 +0100
From: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [PATCH 1/1] package/qt5: fix parallel build qmake package
 (qt5) doesn't build when using parallel build.
Thread-Index: AQHX8L9yl/kCTeQkd0qHN9smmL9+iaw0E/SAgADGhsA=
Date: Thu, 16 Dec 2021 09:25:19 +0000
Message-ID: <FAABCD35A3EE5E419EC2DCD8792107CABC6F998E@ikhexmbxc02n01.ikhex.ikoula.com>
References: <20211214075133.4482-1-florent.aumaitre@medianesysteme.com>
 <20211215232839.22ae07a9@gmx.net>
In-Reply-To: <20211215232839.22ae07a9@gmx.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [178.170.125.119]
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5: fix parallel build qmake
 package (qt5) doesn't build when using parallel build.
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Naumann Andreas <ANaumann@ultratronik.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter

> -----Message d'origine-----
> De=A0: Peter Seiderer <ps.report@gmx.net>
> Envoy=E9=A0: mercredi 15 d=E9cembre 2021 23:29
> =C0=A0: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
> Cc=A0: buildroot@buildroot.org; Naumann Andreas <ANaumann@ultratronik.de>;
> Julien Corjon <corjon.j@ecagroup.com>
> Objet=A0: Re: [PATCH 1/1] package/qt5: fix parallel build qmake package (=
qt5)
> doesn't build when using parallel build.
> =

> Hello Florent,
> =

> On Tue, 14 Dec 2021 08:51:33 +0100, Florent AUMAITRE
> <florent.aumaitre@medianesysteme.com> wrote:
> =

> > Signed-off-by: Florent AUMAITRE <florent.aumaitre@medianesysteme.com>
> > ---
> >  package/pkg-qmake.mk           | 22 +++++++++++++++++++++-
> >  package/qt5/qt5.mk             |  4 +++-
> >  package/qt5/qt5base/qt5base.mk | 13 +++++++++++++
> >  3 files changed, 37 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk index
> > deb033c1d6..55b3594f32 100644
> > --- a/package/pkg-qmake.mk
> > +++ b/package/pkg-qmake.mk
> > @@ -20,6 +20,23 @@
> >  #
> >
> >
> #################################################################
> #####
> > ##########
> >
> > +# When per-package is enabled, and qmake project is configured to
> > +generate # pkg-config compatible package, absolute path are generated
> > +for "prefix" field # of .pc files. In order to keep per-package
> > +isolation with sysroot'in, it is # needed to remove those absolute pat=
h. Same
> apply for mkspecs files.
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> > +define PKG_QMAKE_FIXUP_ABSOLUTE_PATH
> > +	$(Q)find $(STAGING_DIR)/ -name "*.pc" \
> > +	| xargs --no-run-if-empty \
> > +	$(SED) "s:$(STAGING_DIR)::g"
> > +
> > +	$(Q)find $(HOST_DIR)/ -name "*.pri" \
> > +		| xargs --no-run-if-empty \
> > +		$(SED) "s:$(STAGING_DIR):\$$\$$\[QT_SYSROOT\]:g"
> > +endef
> > +endif
> > +
> > +
> >  #
> >  # Hook to sync Qt headers
> >  #
> > @@ -89,6 +106,8 @@ define $(2)_INSTALL_STAGING_CMDS  endef  endif
> >
> > +$(2)_POST_INSTALL_STAGING_HOOKS +=3D
> PKG_QMAKE_FIXUP_ABSOLUTE_PATH
> > +
> >  #
> >  # Target installation step. Only define it if not already defined by
> > # the package .mk file.
> > @@ -103,9 +122,10 @@ endif
> >  # We subsequently rsync only the files from the temporary staging dir
> > and that  # way exclude files for the build host from target.
> >  #
> > +# Qt Package (declarative at least) does not install in parallel due
> > +to improper make rules
> >  ifndef $(2)_INSTALL_TARGET_CMDS
> >  define $(2)_INSTALL_TARGET_CMDS
> > -	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE) -C
> $$($(2)_BUILDDIR) INSTALL_ROOT=3D$$($(2)_BUILDDIR)tmp-target-install
> $$($(2)_INSTALL_TARGET_OPTS)
> > +	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE1) -C
> $$($(2)_BUILDDIR)
> > +INSTALL_ROOT=3D$$($(2)_BUILDDIR)tmp-target-install
> > +$$($(2)_INSTALL_TARGET_OPTS)
> =

> Which failure? Does it happen with per-package enabled or without (would =
like
> to avoid the forced MAKE1 for all qt packages install) too? In case it ha=
ppens
> with per-package disabled it should go to an extra patch...

I observe a race condition with some install target
2021-11-04T12:43:36 Makefile:886: recipe for target 'install_do_install_qml=
types' failed
2021-11-04T12:43:36 Makefile:400: recipe for target 'sub-wavefrontmesh-inst=
all_subtargets' failed
2021-11-04T12:43:36 make[4]: *** [sub-wavefrontmesh-install_subtargets] Err=
or 2
2021-11-04T12:43:36 make[4]: *** Waiting for unfinished jobs...

Qt5declarative generated makefile (qt5declarative-5.15.2/src/imports/wavefr=
ontmesh/Makefile) install twice /usr/qml/Qt/labs/wavefrontmesh/plugins.qmlt=
ypes in target install_qmlfiles and install_do_install_qmltypes.

Regards
Florent


> One qt5declarative failure for parallel install was fixed by
> 'package/qt5/qt5declarative:
> fix parallel install' ([1]) some time back...
> =

> Regards,
> Peter
> =

> [1]
> https://git.buildroot.net/buildroot/commit/?id=3Da96277a93d36a1828de87b01=
10
> 22ae389a549cbd
> =

> >  	rsync -arv $$($(2)_BUILDDIR)tmp-target-install$$(STAGING_DIR)/
> > $$(TARGET_DIR)/  endef  endif diff --git a/package/qt5/qt5.mk
> > b/package/qt5/qt5.mk index 3ffb7b0063..eced7e2564 100644
> > --- a/package/qt5/qt5.mk
> > +++ b/package/qt5/qt5.mk
> > @@ -27,4 +27,6 @@ endef
> >  endif
> >
> >  # Variable for other Qt applications to use -QT5_QMAKE =3D
> > $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
> > +QT5_QMAKE =3D $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ \
> > +	PKG_CONFIG_SYSROOT_DIR=3D$(STAGING_DIR) \
> > +
> >
> +PKG_CONFIG_LIBDIR=3D$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr
> > +/share/pkgconfig
> > diff --git a/package/qt5/qt5base/qt5base.mk
> > b/package/qt5/qt5base/qt5base.mk index ba2971dc08..3750d4547e 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -334,4 +334,17 @@ endef
> >
> >  QT5BASE_POST_INSTALL_STAGING_HOOKS +=3D QT5_INSTALL_QT_CONF
> >
> > +# CMake config files generated by Qt5 might break per-package
> > +isolation because # of absolute path generated.
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> > +define QT5BASE_CMAKECONFIG_FIXUP
> > +	$(Q)find $(STAGING_DIR)/ -name "*.cmake" \
> > +		| xargs --no-run-if-empty \
> > +		$(SED) "s:$(STAGING_DIR)::g"
> > +endef
> > +endif
> > +
> > +QT5BASE_POST_INSTALL_STAGING_HOOKS +=3D
> QT5BASE_CMAKECONFIG_FIXUP
> > +
> > +
> >  $(eval $(qmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
