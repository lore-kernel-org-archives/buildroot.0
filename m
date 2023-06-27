Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26F7EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 22:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F42296076C;
	Tue, 27 Jun 2023 22:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F42296076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zrEF1Mm3wIsU; Tue, 27 Jun 2023 22:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE1C360797;
	Tue, 27 Jun 2023 22:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE1C360797
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5BD51BF32E
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 22:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C38B60797
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 22:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C38B60797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qpvpdjrPd6G for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 22:48:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A63D06076C
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A63D06076C
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 22:48:35 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RMmXr2125592;
 Tue, 27 Jun 2023 17:48:33 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RMmXQ6078102
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Jun 2023 17:48:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 17:48:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 17:48:33 -0500
Received: from dasso (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RMmXql018735;
 Tue, 27 Jun 2023 17:48:33 -0500
Date: Tue, 27 Jun 2023 17:48:33 -0500
To: =?utf-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>,
 <buildroot@buildroot.org>
Message-ID: <20230627224833.un2a3d2lkrbzjzjv@dasso>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-11-dannenberg@ti.com>
 <CAAE6iEVbgKo4FS7ofh_GbOi=tUDafp0sHkcthHskqaduiPb8zQ@mail.gmail.com>
 <20230623145945.kvxhcdbf2kycdyk5@dasso>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230623145945.kvxhcdbf2kycdyk5@dasso>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687906113;
 bh=cogPA9lcQukpIXKvmyZ9dSaglZxl9Hxn3rUVIoo/7F8=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=jnAXHo9pmWW+5Ergtpn879IgzjpwYzGpSlCv46JObfn6LoBziuoie0lVN6mW3R58P
 XM1Y9mkskazOtL0lam1MrqtmyWXvrKiwR3oVtq3L7DV+eL9ssusJw4uXY20/8lQaNC
 RTXz52ID8Z5kw6MY46EVis9ylNGzOohZ8ZKm1XI4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=jnAXHo9p
Subject: Re: [Buildroot] [PATCH v9 10/11] package/ti-rogue-um: new package
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fran=E7ois,

On Fri, Jun 23, 2023 at 09:59:45AM -0500, Andreas Dannenberg via buildroot =
wrote:
> Hi Fran=E7ois,
> =

> On Fri, Jun 23, 2023 at 09:30:39AM +0200, Fran=E7ois Perrad wrote:
> > Le jeu. 22 juin 2023 =E0 18:07, Andreas Dannenberg via buildroot <
> > buildroot@buildroot.org> a =E9crit :
> > =

> > > This package adds the userspace libraries for the Rogue graphics
> > > accelerator of the following Texas Instruments SoCs: AM62, J721E,
> > > J721S2, and J784S4.
> > >
> > > Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> > > ---
> > >  package/Config.in                             |   1 +
> > >  .../0001-all-drop-the-init-script.patch       | 832 ++++++++++++++++=
++
> > >  package/ti-rogue-um/Config.in                 |  52 ++
> > >  package/ti-rogue-um/ti-rogue-um.hash          |   3 +
> > >  package/ti-rogue-um/ti-rogue-um.mk            |  38 +
> > >  5 files changed, 926 insertions(+)
> > >  create mode 100644 package/ti-rogue-um/0001-all-drop-the-init-script=
.patch
> > >  create mode 100644 package/ti-rogue-um/Config.in
> > >  create mode 100644 package/ti-rogue-um/ti-rogue-um.hash
> > >  create mode 100644 package/ti-rogue-um/ti-rogue-um.mk
> > >
> > > diff --git a/package/Config.in b/package/Config.in
> > > index 96ef0d72de..0bff1135aa 100644
> > > --- a/package/Config.in
> > > +++ b/package/Config.in
> > > @@ -614,6 +614,7 @@ endmenu
> > >         source "package/targetcli-fb/Config.in"
> > >         source "package/ti-gfx/Config.in"
> > >         source "package/ti-rogue-km/Config.in"
> > > +       source "package/ti-rogue-um/Config.in"
> > >         source "package/ti-sgx-demos/Config.in"
> > >         source "package/ti-sgx-km/Config.in"
> > >         source "package/ti-sgx-um/Config.in"
> > > diff --git a/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > > b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > > new file mode 100644
> > > index 0000000000..4f3dd1cbb1
> > > --- /dev/null
> > > +++ b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > > @@ -0,0 +1,832 @@
> > > +From 99e0da8a1c08818c59680f726e11a84b26daf29f Mon Sep 17 00:00:00 20=
01
> > > +From: Randolph Sapp <rs@ti.com>
> > > +Date: Thu, 25 May 2023 18:59:26 -0500
> > > +Subject: [PATCH] all: drop the init script
> > > +
> > > +Nobody should be using this anymore. It's sysVinit and it's just a f=
ancy
> > > +wrapper around modprobe anyway. We'll be dropping it from our build
> > > +tools soon.
> > > +
> > > +Signed-off-by: Randolph Sapp <rs@ti.com>
> > > +---
> > > + .../wayland/release/etc/init.d/rc.pvr         | 196 ---------------=
---
> > > + .../wayland/release/etc/init.d/rc.pvr         | 196 ---------------=
---
> > > + .../wayland/release/etc/init.d/rc.pvr         | 196 ---------------=
---
> > > + .../wayland/release/etc/init.d/rc.pvr         | 196 ---------------=
---
> > > + 4 files changed, 784 deletions(-)
> > > + delete mode 100755 targetfs/am62_linux/wayland/release/etc/init.d/r=
c.pvr
> > > + delete mode 100755 targetfs/j721e_linux/wayland/release/etc/init.d/=
rc.pvr
> > > + delete mode 100755
> > > targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pvr
> > > + delete mode 100755
> > > targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pvr
> > > +
> > > +diff --git a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > > b/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > > +deleted file mode 100755
> > > +index 428cd86..0000000
> > > +--- a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > > ++++ /dev/null
> > > +2.34.1
> > > +
> > > diff --git a/package/ti-rogue-um/Config.in b/package/ti-rogue-um/Conf=
ig.in
> > > new file mode 100644
> > > index 0000000000..15257858c2
> > > --- /dev/null
> > > +++ b/package/ti-rogue-um/Config.in
> > > @@ -0,0 +1,52 @@
> > > +comment "ti-rogue-um needs udev and a glibc toolchain w/ threads"
> > > +       depends on BR2_aarch64
> > > +       depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC=
 \
> > > +               || !BR2_TOOLCHAIN_HAS_THREADS
> > > +
> > > +config BR2_PACKAGE_TI_ROGUE_UM
> > > +       bool "ti-rogue-um"
> > > +       depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> > > +       depends on BR2_PACKAGE_HAS_UDEV
> > > +       # pre-built binaries
> > > +       depends on BR2_TOOLCHAIN_USES_GLIBC
> > > +       depends on BR2_aarch64
> > > +       select BR2_PACKAGE_LIBDRM
> > > +       select BR2_PACKAGE_HAS_LIBEGL
> > > +       select BR2_PACKAGE_HAS_LIBGBM
> > > +       select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> > > +       select BR2_PACKAGE_HAS_LIBGLES
> > > +       select BR2_PACKAGE_HAS_POWERVR
> > > +       select BR2_PACKAGE_LIBFFI
> > > +       select BR2_PACKAGE_WAYLAND
> > > +       select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> > > +       select BR2_PACKAGE_TI_ROGUE_KM if BR2_LINUX_KERNEL
> > > +       help
> > > +         Graphics libraries for TI SoCs with Rogue GPU.
> > > +         This package supports AM62, J721E, J721S2, and J784S4
> > > +         SoCs only.
> > > +
> > > +         https://git.ti.com/cgit/graphics/ti-img-rogue-umlibs
> > > +
> > > +if BR2_PACKAGE_TI_ROGUE_UM
> > > +
> > > +config BR2_PACKAGE_PROVIDES_LIBEGL
> > > +       default "ti-rogue-um"
> > > +
> > > +config BR2_PACKAGE_PROVIDES_LIBGBM
> > > +       default "ti-rogue-um"
> > > +
> > > +config BR2_PACKAGE_PROVIDES_LIBGLES
> > > +       default "ti-rogue-um"
> > > +
> > > +config BR2_PACKAGE_PROVIDES_POWERVR
> > > +       default "ti-rogue-um"
> > > +
> > > +config BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT
> > > +       string "UM driver target product"
> > > +       default "am62_linux"
> > > +       help
> > > +         Select target product to be used for UM libraries. This nee=
ds to
> > > +         match one of the SoC-specific folders within the root/targe=
tfs
> > > +         folder of the ti-img-rogue-umlibs Git repository.
> > > +
> > > +endif
> > > diff --git a/package/ti-rogue-um/ti-rogue-um.hash
> > > b/package/ti-rogue-um/ti-rogue-um.hash
> > > new file mode 100644
> > > index 0000000000..a41bf33145
> > > --- /dev/null
> > > +++ b/package/ti-rogue-um/ti-rogue-um.hash
> > > @@ -0,0 +1,3 @@
> > > +# Locally calculated
> > > +sha256  2e1bd1a5ab0ad2db1b9164d028a94f8f9d20743131f337a817fd1c8f9ddd=
4cbe
> > > ti-rogue-um-5977e82b96028f783d39c7219f016c1faf8dc5f5-br1.tar.gz
> > > +sha256  37507b462edf97b59717d2d144daaac85fbca6080c3602b5128e446e97f9=
ad47
> > > LICENSE
> > > diff --git a/package/ti-rogue-um/ti-rogue-um.mk b/package/ti-rogue-um/
> > > ti-rogue-um.mk
> > > new file mode 100644
> > > index 0000000000..fa29638fa7
> > > --- /dev/null
> > > +++ b/package/ti-rogue-um/ti-rogue-um.mk
> > > @@ -0,0 +1,38 @@
> > >
> > > +####################################################################=
############
> > > +#
> > > +# ti-rogue-um
> > > +#
> > >
> > > +####################################################################=
############
> > > +
> > > +# This corresponds to SDK 08.06.00
> > > +TI_ROGUE_UM_VERSION =3D 5977e82b96028f783d39c7219f016c1faf8dc5f5
> > > +TI_ROGUE_UM_SITE =3D
> > > https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git
> > > +TI_ROGUE_UM_SITE_METHOD =3D git
> > > +TI_ROGUE_UM_LICENSE =3D TI TSPA License
> > > +TI_ROGUE_UM_LICENSE_FILES =3D LICENSE
> > > +TI_ROGUE_UM_INSTALL_STAGING =3D YES
> > > +TI_ROGUE_UM_PROVIDES =3D libegl libgbm libgles powervr
> > > +
> > > +# ti-rogue-um is a egl/gles provider only if libdrm is installed
> > > +TI_ROGUE_UM_DEPENDENCIES =3D libdrm wayland
> > >
> > =

> > useless built dependencies (nothing is built, blobs are copied), runtime
> > dependencies in Config.in are enough.
> =

> Understood, will fix it. Btw this was a carry-over from
> package/ti-sgx-um/ti-sgx-um.mk which I used to model this new package
> after, so opportunity for improvement there as well...

I experimented with this today, and removing either libdrm _or_ wayland
from TI_ROGUE_UM_DEPENDENCIES causes the build to fail in two different
ways. Note that I'm using my "test defconfig" that turns on the
following extras in configs/am62x_sk_defconfig...

+BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
+BR2_PACKAGE_PULSEAUDIO=3Dy
+BR2_PACKAGE_CHOCOLATE_DOOM=3Dy
+BR2_PACKAGE_DOOM_WAD=3Dy
+BR2_PACKAGE_SDL2_KMSDRM=3Dy
+BR2_PACKAGE_SDL2_OPENGLES=3Dy
+BR2_PACKAGE_WESTON=3Dy
+BR2_PACKAGE_ALSA_LIB=3Dy

=3D=3D=3DTest 1: Removing libdrm=3D=3D=3D
<snip>
In file included from /home/a0797059/git/buildroot/output/host/aarch64-buil=
droot-linux-gnu/sysroot/usr/include/EGL/egl.h:39,
                 from cairo-gl.h:130,
                 from cairo-gl-private.h:51,
                 from cairo-gl-traps-compositor.c:44:
/home/a0797059/git/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroo=
t/usr/include/EGL/eglplatform.h:134:10: fatal error: X11/Xlib.h: No such fi=
le or directory
  134 | #include <X11/Xlib.h>
      |          ^~~~~~~~~~~~
compilation terminated.
make[5]: *** [Makefile:2358: cairo-gl-shaders.lo] Error 1
make[5]: *** [Makefile:2358: cairo-gl-traps-compositor.lo] Error 1
make[4]: *** [Makefile:1955: all] Error 2
make[3]: *** [Makefile:910: all-recursive] Error 1
make[2]: *** [Makefile:761: all] Error 2
make[1]: *** [package/pkg-generic.mk:293: /home/a0797059/git/buildroot/outp=
ut/build/cairo-1.16.0/.stamp_built] Error 2
make: *** [Makefile:82: _all] Error 2

=3D=3D=3DTest 2: Removing wayland=3D=3D=3D
<snip>
/home/a0797059/git/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gn=
u/11.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/a0797059/git=
/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/l=
ibEGL.so: undefined reference to `wl_display_roundtrip_queue'
/home/a0797059/git/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gn=
u/11.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/a0797059/git=
/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/l=
ibEGL.so: undefined reference to `wl_proxy_marshal_constructor_versioned'
/home/a0797059/git/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-gn=
u/11.4.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: /home/a0797059/git=
/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/l=
ibEGL.so: undefined reference to `wl_display_create_queue'
collect2: error: ld returned 1 exit status
make[6]: *** [Makefile:1795: cairo-test-suite] Error 1
make[5]: *** [Makefile:8375: all-recursive] Error 1
make[4]: *** [Makefile:1736: all] Error 2
make[3]: *** [Makefile:910: all-recursive] Error 1
make[2]: *** [Makefile:761: all] Error 2
make[1]: *** [package/pkg-generic.mk:293: /home/a0797059/git/buildroot/outp=
ut/build/cairo-1.16.0/.stamp_built] Error 2
make: *** [Makefile:82: _all] Error 2

Note that for the tests I did a full build, starting out with a completely
clean state (rm -rf output/* before the build).

With this finding, I'm inclined to leave TI_ROGUE_UM_DEPENDENCIES as I
had it, unless there's a better way to deal with this build dependency?

Thanks, Andreas


--
Andreas Dannenberg
Texas Instruments Inc

>  =

> > +
> > > +PVR_BUILD =3D "release"
> > > +PVR_WS =3D "wayland"
> > > +
> > >
> > =

> > TI_ROGUE_UM_MAKE_OPTS =3D \
> >       TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
> >       BUILD=3Drelease \
> >       WINDOW_SYSTEM=3Dwayland
> > =

> > define TI_ROGUE_UM_INSTALL_STAGING_CMDS
> >      $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> >           $(TI_ROGUE_UM_MAKE_OPTS) \
> >           DESTDIR=3D$(STAGING_DIR) \
> >           install
> > endef
> > by this way, all variables are prefixed by TI_ROGUE_UM_.
> =

> Good idea, will factor-out the make options. Thanks for taking the time
> to review & improve this patch.
> =

> --
> Andreas Dannenberg
> Texas Instruments Inc
> =

> =

> =

> > =

> > Fran=E7ois
> > =

> > =

> > > +define TI_ROGUE_UM_INSTALL_STAGING_CMDS
> > > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> > > +               DESTDIR=3D$(STAGING_DIR) \
> > > +               TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PROD=
UCT) \
> > > +               BUILD=3D$(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \
> > > +               install
> > > +endef
> > > +
> > > +define TI_ROGUE_UM_INSTALL_TARGET_CMDS
> > > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> > > +               DESTDIR=3D$(TARGET_DIR) \
> > > +               TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PROD=
UCT) \
> > > +               BUILD=3D$(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \
> > > +               install
> > > +endef
> > > +
> > > +$(eval $(generic-package))
> > > --
> > > 2.34.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > >
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
