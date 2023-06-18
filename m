Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B5BEB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3451607D0;
	Sun, 18 Jun 2023 13:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3451607D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q4HuEMqYR_fI; Sun, 18 Jun 2023 13:43:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73916607E1;
	Sun, 18 Jun 2023 13:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73916607E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3201D1BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04C7340116
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04C7340116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0w06jSFXfL84 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:43:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FC54400FB
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FC54400FB
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:43:10 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35IDh9qT018817;
 Sun, 18 Jun 2023 08:43:09 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35IDh9vL104505
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 18 Jun 2023 08:43:09 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 18
 Jun 2023 08:43:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 18 Jun 2023 08:43:09 -0500
Received: from dasso (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35IDh8YK023500;
 Sun, 18 Jun 2023 08:43:08 -0500
Date: Sun, 18 Jun 2023 08:43:08 -0500
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230618134308.p3ehslp5s2j36dqi@dasso>
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-8-dannenberg@ti.com>
 <CAAE6iEWfhb46NsbC+4E9p24Dzcz_edGLxegJtQu4mFMp_yfBdQ@mail.gmail.com>
 <20230616120230.a4z5dfr4kzsz7i6u@dasso>
 <CAAE6iEW6xS1gqy2sbu_QeUU6W7KWvimkwn-j9nUeFjjSX8L+9Q@mail.gmail.com>
 <20230616221311.xlthgoct6lpko5kq@dasso>
 <02ac14ea-c3c9-9763-83ac-4a83efd534b3@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02ac14ea-c3c9-9763-83ac-4a83efd534b3@mind.be>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1687095789;
 bh=0N4IUQVi/xnbFZk6CquZm/HNuUNFL19aea9K34wj7RM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Vtgd5gc2DEOcfSTbGQ46fiIHyzmNx8QBDfC0Zpr/mptiPNj8NbN6IzokWufAFe5eN
 rSmujwAxgxqR7gnUshbn8uLkJaO+bK5sd484kmKIvkMFY6LkhQhyzHFBv9LZK+jfXM
 dL3xFtySnBIs/iIavYx0WgXAUwI9Ly0Jn2Hp7JX0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Vtgd5gc2
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

Hi Arnout,

On Sun, Jun 18, 2023 at 02:27:52PM +0200, Arnout Vandecappelle wrote:
> =

> =

> On 17/06/2023 00:13, Andreas Dannenberg via buildroot wrote:
> > Hi Fran=E7ois,
> > =

> > On Fri, Jun 16, 2023 at 06:40:35PM +0200, Fran=E7ois Perrad wrote:
> > > Le ven. 16 juin 2023 =E0 14:05, Andreas Dannenberg <dannenberg@ti.com=
> a
> > > =E9crit :
> > > =

> > > > Hi Fran=E7ois,
> > > > =

> > > > On Fri, Jun 16, 2023 at 01:15:04PM +0200, Fran=E7ois Perrad wrote:
> [snip]
> > > > > =

> > > > > core-secdev-k3 could be a host package and an optional dependency=
 of
> > > > uboot
> > > > > or atf
> > > > =

> > > > Good suggestion, I thought about same but wasn't quite sure how to =
set
> > > > this up, but I'll look into this based on your below starting point=
. It
> > > > would cover HS-FS device variants ("High Security - Field Securable=
"),
> > > > which is 90% of the use case, and 100% of the initial use case (som=
ebody
> > > > getting a board, evaluating), all when the custom keys were not yet
> > > > programmed into the SOC (which is what turns the device into a HS-SE
> > > > device, at which time custom signing keys will need to be provided =
as
> > > > part of core-secdev-k3).
> > > > =

> > > > Can a host package easily export/share and ENV variable
> > > > (TI_SECURE_DEV_PKG)?
> > > > =

> > > > =

> > > yes (we are in a Makefile fragment):
> > > export
> > > TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K=
3_VERSION)
> > > =

> > > when a package needed it, just add :
> > > FOO_DEPENDENCIES +=3D host-ti-core-secdev-k3
> > > =

> > > Fran=E7ois
> > =

> > Good point, using the make construct for 'export' should work, and in
> > fact it does. Just tried it out. Was able to largely carry over what you
> > came up with (thanks again!!). One change I had to made was to add a
> > 'host-' prefix to the line exporting the ti-core-secdev-k3 package
> > location. Below is my Makefile fragment. Will make this part of PATCH
> > v9 series I intent to send out next week (want to give it a few more da=
ys
> > to allow folks to add feedback).
> > =

> > =

> > --- /dev/null
> > +++ b/package/ti-core-secdev-k3/ti-core-secdev-k3.mk
> > @@ -0,0 +1,21 @@
> > +######################################################################=
##########
> > +#
> > +## ti-core-secdev-k3
> > +#
> > +######################################################################=
###########
> > +
> > +TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007
> > +TI_CORE_SECDEV_K3_SITE =3D https://git.ti.com/cgit/security-developmen=
t-tools/core-secdev-k3/snapshot
> > +TI_CORE_SECDEV_K3_LICENSE =3D TI TSPA License
> > +TI_CORE_SECDEV_K3_LICENSE_FILES =3D manifest/k3-secdev-0.2-manifest.ht=
ml
> > +TI_CORE_SECDEV_K3_SOURCE =3D core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSIO=
N).tar.gz
> > +
> > +# To allow the image signing process for various firmware artifacts to=
 work the
> > +# build process for TI K3 platform HS-FS and HS-SE device variants is =
using the
> > +# 'core-secdev-k3' tool provided by TI. Its location must be made avai=
lable to
> > +# the build process by exporting it through the use of an environmental
> > +# variable. From there on, other packages like ti-k3-r5-loader will pi=
ck up the
> > +# signing tools and keys that are provided in this package.
> > +export TI_SECURE_DEV_PKG =3D $(BUILD_DIR)/host-ti-core-secdev-k3-$(TI_=
CORE_SECDEV_K3_VERSION)
> =

>  I didn't follow the entire discussion; however, be aware that this export
> applies globally, i.e. _all_ packages will have TI_SECURE_DEV_PKG in their
> environment. IIUC, this is exactly what you want because you want the
> environment variable to be available to e.g. ti-k3-r5-loader. But it's al=
so
> going to be in the environment of busybox, libcurl, and all completely
> unrelated packages. Worse, it's going to be in the environment even if
> you're not using ti-core-secdev-k3 at all!
> =

>  Therefore, I'm not in favour of this export. I think it's better to just
> set the variable here, without exporting, and then in every package that
> actually needs it, include it explicitly in the build commands. E.g.
> =

> define TI_K3_R5_LOADER_BUILD_CMDS
>         $(TARGET_CONFIGURE_OPTS) TI_SECURE_DEV_PKG=3D$(TI_SECURE_DEV_PKG)=
 \
> 		$(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
> endef

Ok, makes sense to minimize polluting the global environment. Will
update this accordingly. It'll also better allow to find 'users' of this
in the Buildroot source tree by grepping for that variable, which is
always a nice thing to be able to do to understand how things work together.
 =

>  Note that you'll already need the explicit dependency in the packages us=
ing
> ti-core-secdev-k3, so I don't think it's a problem to add the environment
> variable explicitly as well.

Actually there is no unconditional hard dependency of anything on
ti-core-secdev-k3, as the use of this package is optional in some cases,
such as when building for General Purpose ("GP") device variants which
always have secure boot  disabled. Or in case of High Security -
Security Enforcing ("HS-SE") devices the user must provide their _own_
package containing _their_ private keys for signing purposes, probably
not something to be done by storing them in a package. I'll see that I
can set it up such that the ti-core-secdev-k3 Buildroot package is used
if enabled, but the user can override this by providing their own
TI_SECURE_DEV_PKG env variable through their shell environment, in which
case their "private" tool is used from their build system (instead of
what the Buildroot package contributes).

I'll see I can model this appropriately and explain in more detail as
part of PATCH v9. I'll probably also make the SoC type selection
(BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE, see "[PATCH v8 02/10]
boot/ti-k3-image-gen: new package") via multiple-choice Kconfig options
(as it was suggested earlier actually).

Thanks!

--
Andreas Dannenberg
Texas Instruments Inc

> =

>  Regards,
>  Arnout
> =

> > +
> > +$(eval $(host-generic-package))
> > =

> > =

> > --
> > Andreas Dannenberg
> > Texas Instruments Inc
> > =

> > =

> > =

> > > =

> > > > This will be needed not only by ti-k3-image-gen but also by uboot a=
nd
> > > > potentially other packages in the future.
> > > > =

> > > > Regards, Andreas
> > > > =

> > > > > =

> > > > > =

> > > > ###################################################################=
#############
> > > > > #
> > > > > # ti-core-secdev-k3
> > > > > #
> > > > > =

> > > > ###################################################################=
#############
> > > > > =

> > > > > TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007
> > > > > TI_CORE_SECDEV_K3_SITE =3D
> > > > > =

> > > > https://git.ti.com/cgit/security-development-tools/core-secdev-k3/s=
napshot
> > > > > TI_CORE_SECDEV_K3_SOURCE =3D
> > > > > core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz
> > > > > =

> > > > > =

> > > > TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV=
_K3_VERSION)
> > > > > =

> > > > > $(eval $(host-generic-package))
> > > > > =

> > > > > Fran=E7ois
> > > > > =

> > > > > =

> > > > > =

> > > > > > +
> > > > > >   Build:
> > > > > >   $ make
> > > > > > =

> > > > > > diff --git a/board/ti/am64x_sk/readme.txt
> > > > b/board/ti/am64x_sk/readme.txt
> > > > > > index fe83c675f5..51d0312726 100644
> > > > > > --- a/board/ti/am64x_sk/readme.txt
> > > > > > +++ b/board/ti/am64x_sk/readme.txt
> > > > > > @@ -12,6 +12,22 @@ $ make am64x_sk_defconfig
> > > > > >   Optional: modify the configuration:
> > > > > >   $ make menuconfig
> > > > > > =

> > > > > > +Required setup step for High Security HS-FS and HS-SE SoC vari=
ants:
> > > > > > +
> > > > > > +To allow the image signing process for various firmware artifa=
cts to
> > > > > > +work the build process for HS-FS and HS-SE device variants is =
using
> > > > > > +an external 'core-secdev-k3' package which can be obtained from
> > > > > > +https://git.ti.com/cgit/security-development-tools/core-secdev=
-k3.
> > > > > > +To prepare building for those device variants create a local c=
opy of
> > > > > > +the 'core-secdev-k3' and export its location through the
> > > > > > +TI_SECURE_DEV_PKG environmental variable. Use the package as-i=
s for
> > > > > > +HS-FS device variants such as populated on the SK-AM64B board,=
 or
> > > > > > +customize this package with your private signing keys when usi=
ng a
> > > > > > +HS-SE device variant.
> > > > > > +
> > > > > > +$ git clone
> > > > > > https://git.ti.com/git/security-development-tools/core-secdev-k=
3.git
> > > > > > +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3
> > > > > > +
> > > > > >   Build:
> > > > > >   $ make
> > > > > > =

> > > > > > diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defc=
onfig
> > > > > > index 2d05ddd96b..033101b735 100644
> > > > > > --- a/configs/am62x_sk_defconfig
> > > > > > +++ b/configs/am62x_sk_defconfig
> > > > > > @@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=
=3Dy
> > > > > >   BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> > > > > >   BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > > > > >   BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am62x"
> > > > > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> > > > > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
> > > > > >   BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> > > > > >   BR2_TARGET_TI_K3_R5_LOADER=3Dy
> > > > > >   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> > > > > > diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defc=
onfig
> > > > > > index a26e38a043..096dd77f6a 100644
> > > > > > --- a/configs/am64x_sk_defconfig
> > > > > > +++ b/configs/am64x_sk_defconfig
> > > > > > @@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=
=3Dy
> > > > > >   BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> > > > > >   BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > > > > >   BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=3Dy
> > > > > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x"
> > > > > > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> > > > > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x_sr2"
> > > > > > +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
> > > > > >   BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> > > > > >   BR2_TARGET_TI_K3_R5_LOADER=3Dy
> > > > > >   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> > > > > > --
> > > > > > 2.34.1
> > > > > > =

> > > > > > _______________________________________________
> > > > > > buildroot mailing list
> > > > > > buildroot@buildroot.org
> > > > > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > > > > > =

> > > > =

> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
