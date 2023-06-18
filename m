Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A23EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 12:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9527240911;
	Sun, 18 Jun 2023 12:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9527240911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCq4Ex7_RNkd; Sun, 18 Jun 2023 12:37:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBD33405FB;
	Sun, 18 Jun 2023 12:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBD33405FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A31A1BF5A8
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F001360C0A
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F001360C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWfI2Zs26Q2G for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 12:37:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1198760BB8
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1198760BB8
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 12:37:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35ICbdoF052384;
 Sun, 18 Jun 2023 07:37:39 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35ICbdE6029900
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 18 Jun 2023 07:37:39 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 18
 Jun 2023 07:37:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 18 Jun 2023 07:37:39 -0500
Received: from dasso (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35ICbdXY011333;
 Sun, 18 Jun 2023 07:37:39 -0500
Date: Sun, 18 Jun 2023 07:37:39 -0500
To: =?utf-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
Message-ID: <20230618123739.ok2jmeanhv5w5gfp@dasso>
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-8-dannenberg@ti.com>
 <CAAE6iEWfhb46NsbC+4E9p24Dzcz_edGLxegJtQu4mFMp_yfBdQ@mail.gmail.com>
 <20230616120230.a4z5dfr4kzsz7i6u@dasso>
 <CAAE6iEW6xS1gqy2sbu_QeUU6W7KWvimkwn-j9nUeFjjSX8L+9Q@mail.gmail.com>
 <20230616221311.xlthgoct6lpko5kq@dasso>
 <CAAE6iEWpz44wfhZEd7n_tJo=QrCvy_s-DOkMgZiQXJ+nOehU8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAE6iEWpz44wfhZEd7n_tJo=QrCvy_s-DOkMgZiQXJ+nOehU8A@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687091859;
 bh=j77bi1wS3C9a13tQtpY793MQGjC30gRtoslGHrJrcSQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Ue4ho3yWyTI42F8lb6cqu7Ewnsnlcq8DU33+aUKW8Lu5EXCKCNKvlRbYYyeeNcXPK
 2QZuP5Z0jauh5gX/F4GbdyRT145KDfN7GggLoQfMb3vtpLa2elns1bj17zjM6axkFf
 JL6PkTef18jltOrUMKmWjOKw56MR/Y0TUeuXq5MQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Ue4ho3yW
Subject: Re: [Buildroot] [PATCH v8 07/10] board/ti/am62x_sk|am64x_sk: switch
 to HS-FS device variants
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

On Sat, Jun 17, 2023 at 11:37:28AM +0200, Fran=E7ois Perrad wrote:
> Le sam. 17 juin 2023 =E0 00:13, Andreas Dannenberg <dannenberg@ti.com> a
> =E9crit :
> =

> > Hi Fran=E7ois,
> >
> > On Fri, Jun 16, 2023 at 06:40:35PM +0200, Fran=E7ois Perrad wrote:
> > > Le ven. 16 juin 2023 =E0 14:05, Andreas Dannenberg <dannenberg@ti.com=
> a
> > > =E9crit :
> > >
> > > > Hi Fran=E7ois,
> > > >
> > > > On Fri, Jun 16, 2023 at 01:15:04PM +0200, Fran=E7ois Perrad wrote:
> > > > > Le ven. 16 juin 2023 =E0 02:38, Andreas Dannenberg via buildroot <
> > > > > buildroot@buildroot.org> a =E9crit :
> > > > >
> > > > > > Current starter kits for AM62x (called SK-AM62B, see [1]) and A=
M64x
> > > > > > (called SK-AM64B, see [2]) both contain High Security - Field
> > Securable
> > > > > > (HS-FS) device variants, and those are really the recommended
> > > > production
> > > > > > device variants and boards TI will provide moving forward. Henc=
e,
> > > > switch
> > > > > > the defconfigs for those boards over to accommodate those
> > now-shipping
> > > > > > device variants and boards.
> > > > > >
> > > > > > [1] https://www.ti.com/tool/SK-AM62B
> > > > > > [2] https://www.ti.com/tool/SK-AM64B
> > > > > >
> > > > > > Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> > > > > > ---
> > > > > >  board/ti/am62x_sk/readme.txt | 16 ++++++++++++++++
> > > > > >  board/ti/am64x_sk/readme.txt | 16 ++++++++++++++++
> > > > > >  configs/am62x_sk_defconfig   |  2 +-
> > > > > >  configs/am64x_sk_defconfig   |  4 ++--
> > > > > >  4 files changed, 35 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/board/ti/am62x_sk/readme.txt
> > > > b/board/ti/am62x_sk/readme.txt
> > > > > > index ccbb24896b..9c7c8818af 100644
> > > > > > --- a/board/ti/am62x_sk/readme.txt
> > > > > > +++ b/board/ti/am62x_sk/readme.txt
> > > > > > @@ -12,6 +12,22 @@ $ make am62x_sk_defconfig
> > > > > >  Optional: modify the configuration:
> > > > > >  $ make menuconfig
> > > > > >
> > > > > > +Required setup step for High Security HS-FS and HS-SE SoC
> > variants:
> > > > > > +
> > > > > > +To allow the image signing process for various firmware artifa=
cts
> > to
> > > > > > +work the build process for HS-FS and HS-SE device variants is
> > using
> > > > > > +an external 'core-secdev-k3' package which can be obtained from
> > > > > > +https://git.ti.com/cgit/security-development-tools/core-secdev=
-k3
> > .
> > > > > > +To prepare building for those device variants create a local c=
opy
> > of
> > > > > > +the 'core-secdev-k3' and export its location through the
> > > > > > +TI_SECURE_DEV_PKG environmental variable. Use the package as-is
> > for
> > > > > > +HS-FS device variants such as populated on the SK-AM64B board,=
 or
> > > > > > +customize this package with your private signing keys when usi=
ng a
> > > > > > +HS-SE device variant.
> > > > > > +
> > > > > > +$ git clone
> > > > > >
> > https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> > > > > > +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3
> > > > > >
> > > > >
> > > > > core-secdev-k3 could be a host package and an optional dependency=
 of
> > > > uboot
> > > > > or atf
> > > >
> > > > Good suggestion, I thought about same but wasn't quite sure how to =
set
> > > > this up, but I'll look into this based on your below starting point=
. It
> > > > would cover HS-FS device variants ("High Security - Field Securable=
"),
> > > > which is 90% of the use case, and 100% of the initial use case
> > (somebody
> > > > getting a board, evaluating), all when the custom keys were not yet
> > > > programmed into the SOC (which is what turns the device into a HS-SE
> > > > device, at which time custom signing keys will need to be provided =
as
> > > > part of core-secdev-k3).
> > > >
> > > > Can a host package easily export/share and ENV variable
> > > > (TI_SECURE_DEV_PKG)?
> > > >
> > > >
> > > yes (we are in a Makefile fragment):
> > > export
> > >
> > TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_=
VERSION)
> > >
> > > when a package needed it, just add :
> > > FOO_DEPENDENCIES +=3D host-ti-core-secdev-k3
> > >
> > > Fran=E7ois
> >
> > Good point, using the make construct for 'export' should work, and in
> > fact it does. Just tried it out. Was able to largely carry over what you
> > came up with (thanks again!!). One change I had to made was to add a
> > 'host-' prefix to the line exporting the ti-core-secdev-k3 package
> > location. Below is my Makefile fragment. Will make this part of PATCH
> > v9 series I intent to send out next week (want to give it a few more da=
ys
> > to allow folks to add feedback).
> >
> >
> >
> in order to support the creation of a relocatable SDK, it will be better =
to
> install the stuff somewhere in $(HOST_DIR), like that:
> =

> export TI_SECURE_DEV_PKG=3D$(HOST_DIR)/opt/core-secdev-k3
> =

> define HOST_TI_CORE_SECDEV_K3_INSTALL_CMDS
>      mkdir -p $(TI_SECURE_DEV_PKG)/keys
>      cp -dpfr $(@D)/keys/* $(TI_SECURE_DEV_PKG)/keys
>      mkdir -p $(TI_SECURE_DEV_PKG)/scripts
>      cp -dpfr $(@D)/scripts/* $(TI_SECURE_DEV_PKG)/scripts
> endef

Makes sense, will update it accordingly! Thanks for the suggestion.

--
Andreas Dannenberg
Texas Instruments Inc



> =

> Fran=E7ois
> =

> =

> > --- /dev/null
> > +++ b/package/ti-core-secdev-k3/ti-core-secdev-k3.mk
> > @@ -0,0 +1,21 @@
> >
> > +######################################################################=
##########
> > +#
> > +## ti-core-secdev-k3
> > +#
> >
> > +######################################################################=
###########
> > +
> > +TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007
> > +TI_CORE_SECDEV_K3_SITE =3D
> > https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snaps=
hot
> > +TI_CORE_SECDEV_K3_LICENSE
> > <https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snap=
shot+TI_CORE_SECDEV_K3_LICENSE>
> > =3D TI TSPA License
> > +TI_CORE_SECDEV_K3_LICENSE_FILES =3D manifest/k3-secdev-0.2-manifest.ht=
ml
> > +TI_CORE_SECDEV_K3_SOURCE =3D
> > core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz
> > +
> > +# To allow the image signing process for various firmware artifacts to
> > work the
> > +# build process for TI K3 platform HS-FS and HS-SE device variants is
> > using the
> > +# 'core-secdev-k3' tool provided by TI. Its location must be made
> > available to
> > +# the build process by exporting it through the use of an environmental
> > +# variable. From there on, other packages like ti-k3-r5-loader will pi=
ck
> > up the
> > +# signing tools and keys that are provided in this package.
> > +export TI_SECURE_DEV_PKG =3D
> > $(BUILD_DIR)/host-ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION)
> > +
> > +$(eval $(host-generic-package))
> >
> >
> > --
> > Andreas Dannenberg
> > Texas Instruments Inc
> >
> >
> >
> > >
> > > > This will be needed not only by ti-k3-image-gen but also by uboot a=
nd
> > > > potentially other packages in the future.
> > > >
> > > > Regards, Andreas
> > > >
> > > > >
> > > > >
> > > >
> > #######################################################################=
#########
> > > > > #
> > > > > # ti-core-secdev-k3
> > > > > #
> > > > >
> > > >
> > #######################################################################=
#########
> > > > >
> > > > > TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007
> > > > > TI_CORE_SECDEV_K3_SITE =3D
> > > > >
> > > >
> > https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snaps=
hot
> > > > > TI_CORE_SECDEV_K3_SOURCE =3D
> > > > > core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz
> > > > >
> > > > >
> > > >
> > TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_=
VERSION)
> > > > >
> > > > > $(eval $(host-generic-package))
> > > > >
> > > > > Fran=E7ois
> > > > >
> > > > >
> > > > >
> > > > > > +
> > > > > >  Build:
> > > > > >  $ make
> > > > > >
> > > > > > diff --git a/board/ti/am64x_sk/readme.txt
> > > > b/board/ti/am64x_sk/readme.txt
> > > > > > index fe83c675f5..51d0312726 100644
> > > > > > --- a/board/ti/am64x_sk/readme.txt
> > > > > > +++ b/board/ti/am64x_sk/readme.txt
> > > > > > @@ -12,6 +12,22 @@ $ make am64x_sk_defconfig
> > > > > >  Optional: modify the configuration:
> > > > > >  $ make menuconfig
> > > > > >
> > > > > > +Required setup step for High Security HS-FS and HS-SE SoC
> > variants:
> > > > > > +
> > > > > > +To allow the image signing process for various firmware artifa=
cts
> > to
> > > > > > +work the build process for HS-FS and HS-SE device variants is
> > using
> > > > > > +an external 'core-secdev-k3' package which can be obtained from
> > > > > > +https://git.ti.com/cgit/security-development-tools/core-secdev=
-k3
> > .
> > > > > > +To prepare building for those device variants create a local c=
opy
> > of
> > > > > > +the 'core-secdev-k3' and export its location through the
> > > > > > +TI_SECURE_DEV_PKG environmental variable. Use the package as-is
> > for
> > > > > > +HS-FS device variants such as populated on the SK-AM64B board,=
 or
> > > > > > +customize this package with your private signing keys when usi=
ng a
> > > > > > +HS-SE device variant.
> > > > > > +
> > > > > > +$ git clone
> > > > > >
> > https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> > > > > > +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3
> > > > > > +
> > > > > >  Build:
> > > > > >  $ make
> > > > > >
> > > > > > diff --git a/configs/am62x_sk_defconfig
> > b/configs/am62x_sk_defconfig
> > > > > > index 2d05ddd96b..033101b735 100644
> > > > > > --- a/configs/am62x_sk_defconfig
> > > > > > +++ b/configs/am62x_sk_defconfig
> > > > > > @@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=
=3Dy
> > > > > >  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> > > > > >  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > > > > >  BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am62x"
> > > > > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> > > > > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
> > > > > >  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> > > > > >  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> > > > > >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> > > > > > diff --git a/configs/am64x_sk_defconfig
> > b/configs/am64x_sk_defconfig
> > > > > > index a26e38a043..096dd77f6a 100644
> > > > > > --- a/configs/am64x_sk_defconfig
> > > > > > +++ b/configs/am64x_sk_defconfig
> > > > > > @@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=
=3Dy
> > > > > >  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> > > > > >  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > > > > >  BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=3Dy
> > > > > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x"
> > > > > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> > > > > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x_sr2"
> > > > > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
> > > > > >  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> > > > > >  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> > > > > >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > > > _______________________________________________
> > > > > > buildroot mailing list
> > > > > > buildroot@buildroot.org
> > > > > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > > > > >
> > > >
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
