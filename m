Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8005DEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 23 Jun 2023 14:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 107AC60BC1;
	Fri, 23 Jun 2023 14:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 107AC60BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9kq6NExKS0pC; Fri, 23 Jun 2023 14:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B0F860F32;
	Fri, 23 Jun 2023 14:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B0F860F32
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAF9B1BF21A
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 14:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C50E740570
 for <buildroot@lists.busybox.net>; Fri, 23 Jun 2023 14:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C50E740570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxTU4zCyCdZ1 for <buildroot@lists.busybox.net>;
 Fri, 23 Jun 2023 14:59:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CB4840116
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CB4840116
 for <buildroot@buildroot.org>; Fri, 23 Jun 2023 14:59:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35NExjf4105616;
 Fri, 23 Jun 2023 09:59:45 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35NExjil067748
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 23 Jun 2023 09:59:45 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Jun 2023 09:59:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 Jun 2023 09:59:45 -0500
Received: from dasso (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35NExjBn007027;
 Fri, 23 Jun 2023 09:59:45 -0500
Date: Fri, 23 Jun 2023 09:59:45 -0500
To: =?utf-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
Message-ID: <20230623145945.kvxhcdbf2kycdyk5@dasso>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-11-dannenberg@ti.com>
 <CAAE6iEVbgKo4FS7ofh_GbOi=tUDafp0sHkcthHskqaduiPb8zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAE6iEVbgKo4FS7ofh_GbOi=tUDafp0sHkcthHskqaduiPb8zQ@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687532385;
 bh=F5dUft4LznM/0b0oMWzYwMCS5+9Z8sw/x57HviIZdyU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=DqSAgkC58mE7mcdd/3qQn6keezaISpCWnBn1sYJnk3CleQFsA9QHjPAOxvREwOip1
 XyOduRuzWmJ1ys9yaYmLJS86ofg1DOYtDTZmJHOJFKQJ0aoJ5DuQc5nvOlVyVepKcz
 kRpmHpFA4HHxdwsuYfUaomdJNOjJ/fgKAFQo/ahU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=DqSAgkC5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fran=E7ois,

On Fri, Jun 23, 2023 at 09:30:39AM +0200, Fran=E7ois Perrad wrote:
> Le jeu. 22 juin 2023 =E0 18:07, Andreas Dannenberg via buildroot <
> buildroot@buildroot.org> a =E9crit :
> =

> > This package adds the userspace libraries for the Rogue graphics
> > accelerator of the following Texas Instruments SoCs: AM62, J721E,
> > J721S2, and J784S4.
> >
> > Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> > ---
> >  package/Config.in                             |   1 +
> >  .../0001-all-drop-the-init-script.patch       | 832 ++++++++++++++++++
> >  package/ti-rogue-um/Config.in                 |  52 ++
> >  package/ti-rogue-um/ti-rogue-um.hash          |   3 +
> >  package/ti-rogue-um/ti-rogue-um.mk            |  38 +
> >  5 files changed, 926 insertions(+)
> >  create mode 100644 package/ti-rogue-um/0001-all-drop-the-init-script.p=
atch
> >  create mode 100644 package/ti-rogue-um/Config.in
> >  create mode 100644 package/ti-rogue-um/ti-rogue-um.hash
> >  create mode 100644 package/ti-rogue-um/ti-rogue-um.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index 96ef0d72de..0bff1135aa 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -614,6 +614,7 @@ endmenu
> >         source "package/targetcli-fb/Config.in"
> >         source "package/ti-gfx/Config.in"
> >         source "package/ti-rogue-km/Config.in"
> > +       source "package/ti-rogue-um/Config.in"
> >         source "package/ti-sgx-demos/Config.in"
> >         source "package/ti-sgx-km/Config.in"
> >         source "package/ti-sgx-um/Config.in"
> > diff --git a/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > new file mode 100644
> > index 0000000000..4f3dd1cbb1
> > --- /dev/null
> > +++ b/package/ti-rogue-um/0001-all-drop-the-init-script.patch
> > @@ -0,0 +1,832 @@
> > +From 99e0da8a1c08818c59680f726e11a84b26daf29f Mon Sep 17 00:00:00 2001
> > +From: Randolph Sapp <rs@ti.com>
> > +Date: Thu, 25 May 2023 18:59:26 -0500
> > +Subject: [PATCH] all: drop the init script
> > +
> > +Nobody should be using this anymore. It's sysVinit and it's just a fan=
cy
> > +wrapper around modprobe anyway. We'll be dropping it from our build
> > +tools soon.
> > +
> > +Signed-off-by: Randolph Sapp <rs@ti.com>
> > +---
> > + .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
> > + .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
> > + .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
> > + .../wayland/release/etc/init.d/rc.pvr         | 196 ------------------
> > + 4 files changed, 784 deletions(-)
> > + delete mode 100755 targetfs/am62_linux/wayland/release/etc/init.d/rc.=
pvr
> > + delete mode 100755 targetfs/j721e_linux/wayland/release/etc/init.d/rc=
.pvr
> > + delete mode 100755
> > targetfs/j721s2_linux/wayland/release/etc/init.d/rc.pvr
> > + delete mode 100755
> > targetfs/j784s4_linux/wayland/release/etc/init.d/rc.pvr
> > +
> > +diff --git a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > b/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > +deleted file mode 100755
> > +index 428cd86..0000000
> > +--- a/targetfs/am62_linux/wayland/release/etc/init.d/rc.pvr
> > ++++ /dev/null
> > +2.34.1
> > +
> > diff --git a/package/ti-rogue-um/Config.in b/package/ti-rogue-um/Config=
.in
> > new file mode 100644
> > index 0000000000..15257858c2
> > --- /dev/null
> > +++ b/package/ti-rogue-um/Config.in
> > @@ -0,0 +1,52 @@
> > +comment "ti-rogue-um needs udev and a glibc toolchain w/ threads"
> > +       depends on BR2_aarch64
> > +       depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC \
> > +               || !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +config BR2_PACKAGE_TI_ROGUE_UM
> > +       bool "ti-rogue-um"
> > +       depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> > +       depends on BR2_PACKAGE_HAS_UDEV
> > +       # pre-built binaries
> > +       depends on BR2_TOOLCHAIN_USES_GLIBC
> > +       depends on BR2_aarch64
> > +       select BR2_PACKAGE_LIBDRM
> > +       select BR2_PACKAGE_HAS_LIBEGL
> > +       select BR2_PACKAGE_HAS_LIBGBM
> > +       select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
> > +       select BR2_PACKAGE_HAS_LIBGLES
> > +       select BR2_PACKAGE_HAS_POWERVR
> > +       select BR2_PACKAGE_LIBFFI
> > +       select BR2_PACKAGE_WAYLAND
> > +       select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> > +       select BR2_PACKAGE_TI_ROGUE_KM if BR2_LINUX_KERNEL
> > +       help
> > +         Graphics libraries for TI SoCs with Rogue GPU.
> > +         This package supports AM62, J721E, J721S2, and J784S4
> > +         SoCs only.
> > +
> > +         https://git.ti.com/cgit/graphics/ti-img-rogue-umlibs
> > +
> > +if BR2_PACKAGE_TI_ROGUE_UM
> > +
> > +config BR2_PACKAGE_PROVIDES_LIBEGL
> > +       default "ti-rogue-um"
> > +
> > +config BR2_PACKAGE_PROVIDES_LIBGBM
> > +       default "ti-rogue-um"
> > +
> > +config BR2_PACKAGE_PROVIDES_LIBGLES
> > +       default "ti-rogue-um"
> > +
> > +config BR2_PACKAGE_PROVIDES_POWERVR
> > +       default "ti-rogue-um"
> > +
> > +config BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT
> > +       string "UM driver target product"
> > +       default "am62_linux"
> > +       help
> > +         Select target product to be used for UM libraries. This needs=
 to
> > +         match one of the SoC-specific folders within the root/targetfs
> > +         folder of the ti-img-rogue-umlibs Git repository.
> > +
> > +endif
> > diff --git a/package/ti-rogue-um/ti-rogue-um.hash
> > b/package/ti-rogue-um/ti-rogue-um.hash
> > new file mode 100644
> > index 0000000000..a41bf33145
> > --- /dev/null
> > +++ b/package/ti-rogue-um/ti-rogue-um.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256  2e1bd1a5ab0ad2db1b9164d028a94f8f9d20743131f337a817fd1c8f9ddd4c=
be
> > ti-rogue-um-5977e82b96028f783d39c7219f016c1faf8dc5f5-br1.tar.gz
> > +sha256  37507b462edf97b59717d2d144daaac85fbca6080c3602b5128e446e97f9ad=
47
> > LICENSE
> > diff --git a/package/ti-rogue-um/ti-rogue-um.mk b/package/ti-rogue-um/
> > ti-rogue-um.mk
> > new file mode 100644
> > index 0000000000..fa29638fa7
> > --- /dev/null
> > +++ b/package/ti-rogue-um/ti-rogue-um.mk
> > @@ -0,0 +1,38 @@
> >
> > +######################################################################=
##########
> > +#
> > +# ti-rogue-um
> > +#
> >
> > +######################################################################=
##########
> > +
> > +# This corresponds to SDK 08.06.00
> > +TI_ROGUE_UM_VERSION =3D 5977e82b96028f783d39c7219f016c1faf8dc5f5
> > +TI_ROGUE_UM_SITE =3D
> > https://git.ti.com/git/graphics/ti-img-rogue-umlibs.git
> > +TI_ROGUE_UM_SITE_METHOD =3D git
> > +TI_ROGUE_UM_LICENSE =3D TI TSPA License
> > +TI_ROGUE_UM_LICENSE_FILES =3D LICENSE
> > +TI_ROGUE_UM_INSTALL_STAGING =3D YES
> > +TI_ROGUE_UM_PROVIDES =3D libegl libgbm libgles powervr
> > +
> > +# ti-rogue-um is a egl/gles provider only if libdrm is installed
> > +TI_ROGUE_UM_DEPENDENCIES =3D libdrm wayland
> >
> =

> useless built dependencies (nothing is built, blobs are copied), runtime
> dependencies in Config.in are enough.

Understood, will fix it. Btw this was a carry-over from
package/ti-sgx-um/ti-sgx-um.mk which I used to model this new package
after, so opportunity for improvement there as well...
 =

> +
> > +PVR_BUILD =3D "release"
> > +PVR_WS =3D "wayland"
> > +
> >
> =

> TI_ROGUE_UM_MAKE_OPTS =3D \
>       TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUCT) \
>       BUILD=3Drelease \
>       WINDOW_SYSTEM=3Dwayland
> =

> define TI_ROGUE_UM_INSTALL_STAGING_CMDS
>      $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>           $(TI_ROGUE_UM_MAKE_OPTS) \
>           DESTDIR=3D$(STAGING_DIR) \
>           install
> endef
> by this way, all variables are prefixed by TI_ROGUE_UM_.

Good idea, will factor-out the make options. Thanks for taking the time
to review & improve this patch.

--
Andreas Dannenberg
Texas Instruments Inc



> =

> Fran=E7ois
> =

> =

> > +define TI_ROGUE_UM_INSTALL_STAGING_CMDS
> > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> > +               DESTDIR=3D$(STAGING_DIR) \
> > +               TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUC=
T) \
> > +               BUILD=3D$(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \
> > +               install
> > +endef
> > +
> > +define TI_ROGUE_UM_INSTALL_TARGET_CMDS
> > +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> > +               DESTDIR=3D$(TARGET_DIR) \
> > +               TARGET_PRODUCT=3D$(BR2_TARGET_TI_ROGUE_UM_TARGET_PRODUC=
T) \
> > +               BUILD=3D$(PVR_BUILD) WINDOW_SYSTEM=3D$(PVR_WS) \
> > +               install
> > +endef
> > +
> > +$(eval $(generic-package))
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
