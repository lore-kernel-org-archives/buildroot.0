Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4511C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 01:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1BA407BE;
	Tue, 20 Feb 2024 01:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YD0808mnfTjP; Tue, 20 Feb 2024 01:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EB02407E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EB02407E3;
	Tue, 20 Feb 2024 01:28:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E24021BF330
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 01:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8753407E3
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 01:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l2AZZ8Oqy9H6 for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 01:28:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54C8D407BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C8D407BE
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54C8D407BE
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 01:28:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41K1Smcq009691;
 Mon, 19 Feb 2024 19:28:48 -0600
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41K1Sm5Z024688
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Feb 2024 19:28:48 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Feb 2024 19:28:48 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Feb 2024 19:28:48 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41K1SmGj129114;
 Mon, 19 Feb 2024 19:28:48 -0600
Date: Mon, 19 Feb 2024 19:28:48 -0600
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240220012848.76amyog5pecsgld4@dasso>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-19-dario.binacchi@amarulasolutions.com>
 <3aa236a2-d78d-42aa-881d-72747eaffe70@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3aa236a2-d78d-42aa-881d-72747eaffe70@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1708392528;
 bh=jIs9Ep9sTLEm/MYFOh+Y586pNLCMmgcixkBAtp0e0yo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uLiJI0JMedxGzQ7vF3NbEN6kramc6eVBBp3dvldFyH2sRpUYXgbD7AYmchnMLPHXC
 MB7tW7p4Mpf1P512KMydMEtVhngEPM6e47cUQ4pidiMvY/ED76sQQAikqt2ytHJjdn
 yHY+brtJ4T+1vQ2Qfy/taqZG08MzhhnIkKbUOpbw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=uLiJI0JM
Subject: Re: [Buildroot] [PATCH v4 18/20] boot/ti-k3: move TI_K3_{SECTYPE,
 SOC} out of the image-gen scope
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, Dario,

On Mon, Feb 19, 2024 at 11:28:59AM +0100, Romain Naour wrote:
> Hello Dario,
> =

> Le 17/02/2024 =E0 17:02, Dario Binacchi a =E9crit=A0:
> > Recent versions of U-Boot can use Binman to compile and sign the genera=
ted
> > binaries, thus making the use of custom tools like ti-k3-image-gen no
> > longer necessary. In ti-k3-image-gen, options such as SECTYPE and SOC w=
ere
> > configured and used outside of it. This patch allows setting such optio=
ns
> > even if the package is not enabled.
> =

> I'm agree that Buildroot doesn't provide any "Platform selection" as the =
Linux
> kernel and I'm not sure where those TI_K3_{SECTYPE,SOC} should belong.

There were discussions/suggestions around this before by Yann E Morin
[1] and Thomas Petazzoni [2]. I think the gist of it was to move the
selection to a new package like BR2_PACKAGE_TI_K3_PLATFORM containing
all the K3 SoC specific selections. And then other packages and Kconfig
menues can depend on it more cleanly. Like it's currently done with
package/freescale-imx/Config.in.  This would also bring some consistency
in how those NXP and TI device families are managed, which will make for
a better end-user experience I think.



--
Andreas Dannenberg
Texas Instruments Inc

[1] http://lists.busybox.net/pipermail/buildroot/2023-June/669342.html
[2] http://lists.busybox.net/pipermail/buildroot/2023-August/673292.html


> =

> Best regards,
> Romain
> =

> =

> > =

> > ---
> > =

> > Added in v4
> > =

> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >  boot/ti-k3/Config.in                          | 46 ++++++++++++++
> >  boot/ti-k3/ti-k3-image-gen/Config.in          | 63 ++-----------------
> >  boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk |  6 +-
> >  boot/uboot/Config.in                          |  7 +--
> >  configs/ti_am62x_sk_defconfig                 |  2 +-
> >  configs/ti_am64x_sk_defconfig                 |  2 +-
> >  6 files changed, 59 insertions(+), 67 deletions(-)
> > =

> > diff --git a/boot/ti-k3/Config.in b/boot/ti-k3/Config.in
> > index 06dda2f156a9..9e508326c9c8 100644
> > --- a/boot/ti-k3/Config.in
> > +++ b/boot/ti-k3/Config.in
> > @@ -5,6 +5,52 @@ config BR2_TARGET_TI_K3
> >  =

> >  if BR2_TARGET_TI_K3
> >  =

> > +choice
> > +	prompt "SoC family"
> > +
> > +config BR2_TARGET_TI_K3_SOC_AM62AX
> > +	bool "am62ax"
> > +
> > +config BR2_TARGET_TI_K3_SOC_AM62X
> > +	bool "am62x"
> > +
> > +config BR2_TARGET_TI_K3_SOC_AM64X
> > +	bool "am64x"
> > +
> > +config BR2_TARGET_TI_K3_SOC_AM65X
> > +	bool "am65x"
> > +
> > +endchoice
> > +
> > +choice
> > +	prompt "Security type"
> > +	help
> > +	  The target SoC security type option.
> > +
> > +config BR2_TARGET_TI_K3_SECTYPE_GP
> > +	bool "gp"
> > +
> > +config BR2_TARGET_TI_K3_SECTYPE_HS_FS
> > +	bool "hs-fs"
> > +
> > +config BR2_TARGET_TI_K3_SECTYPE_HS
> > +	bool "hs"
> > +
> > +endchoice
> > +
> > +config BR2_TARGET_TI_K3_SOC
> > +	string
> > +	default "am62ax" if BR2_TARGET_TI_K3_SOC_AM62AX
> > +	default "am62x"  if BR2_TARGET_TI_K3_SOC_AM62X
> > +	default "am64x"  if BR2_TARGET_TI_K3_SOC_AM64X
> > +	default "am65x"  if BR2_TARGET_TI_K3_SOC_AM65X
> > +
> > +config BR2_TARGET_TI_K3_SECTYPE
> > +	string
> > +	default "gp"    if BR2_TARGET_TI_K3_SECTYPE_GP
> > +	default "hs-fs" if BR2_TARGET_TI_K3_SECTYPE_HS_FS
> > +	default "hs"    if BR2_TARGET_TI_K3_SECTYPE_HS
> > +
> >  source "boot/ti-k3/ti-k3-boot-firmware/Config.in"
> >  source "boot/ti-k3/ti-k3-core-secdev/Config.in"
> >  source "boot/ti-k3/ti-k3-image-gen/Config.in"
> > diff --git a/boot/ti-k3/ti-k3-image-gen/Config.in b/boot/ti-k3/ti-k3-im=
age-gen/Config.in
> > index 38d1598d9fc0..2d53d62dd4ee 100644
> > --- a/boot/ti-k3/ti-k3-image-gen/Config.in
> > +++ b/boot/ti-k3/ti-k3-image-gen/Config.in
> > @@ -2,7 +2,7 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
> >  	bool "ti-k3-image-gen"
> >  	depends on BR2_TARGET_TI_K3_R5_LOADER
> >  	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
> > -	select BR2_TARGET_TI_K3_CORE_SECDEV if BR2_TARGET_TI_K3_IMAGE_GEN_SEC=
TYPE_HS_FS || BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
> > +	select BR2_TARGET_TI_K3_CORE_SECDEV if BR2_TARGET_TI_K3_SECTYPE_HS_FS=
 || BR2_TARGET_TI_K3_SECTYPE_HS
> >  	# We need FIT support in uboot-tools, which is why we select a
> >  	# host package
> >  	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> > @@ -14,65 +14,12 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
> >  	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
> >  =

> >  if BR2_TARGET_TI_K3_IMAGE_GEN
> > -choice
> > -	prompt "SoC family"
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
> > -	bool "am62ax"
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
> > -	bool "am62x"
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
> > -	bool "am64x"
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
> > -	bool "am65x"
> > -
> > -endchoice
> > -
> > -choice
> > -	prompt "Security type"
> > -	help
> > -	  The target SoC security type option for image gen.  Valid
> > -	  options are "gp" for General Purpose devices, "hs-fs" for
> > -	  High Security - Field Securable devices, or "hs" for High
> > -	  Security - Security Enforcing devices.  Note for all High
> > -	  Security device variants the TI_SECURE_DEV_PKG environmental
> > -	  variable must be defined at build time pointing to a valid
> > -	  core-secdev-k3 folder location, otherwise the build will
> > -	  fail, see
> > -	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
> > -	bool "gp"
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
> > -	bool "hs-fs"
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
> > -	bool "hs"
> > -
> > -endchoice
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
> > -	string
> > -	default "am62ax" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
> > -	default "am62x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
> > -	default "am64x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
> > -	default "am65x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
> >  =

> >  config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
> >  	string
> > -	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
> > -	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
> > -	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
> > -	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
> > -
> > -config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE
> > -	string
> > -	default "gp"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
> > -	default "hs-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
> > -	default "hs"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
> > +	default "ti-fs"  if BR2_TARGET_TI_K3_SOC_AM62AX
> > +	default "ti-fs"  if BR2_TARGET_TI_K3_SOC_AM62X
> > +	default "ti-sci" if BR2_TARGET_TI_K3_SOC_AM64X
> > +	default "ti-sci" if BR2_TARGET_TI_K3_SOC_AM65X
> >  =

> >  endif
> > diff --git a/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3=
/ti-k3-image-gen/ti-k3-image-gen.mk
> > index 74b4fcb4bf89..834d8f7d5cd5 100644
> > --- a/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk
> > +++ b/boot/ti-k3/ti-k3-image-gen/ti-k3-image-gen.mk
> > @@ -26,10 +26,10 @@ TI_K3_IMAGE_GEN_DEPENDENCIES =3D \
> >  	$(BR2_MAKE_HOST_DEPENDENCY)
> >  =

> >  TI_K3_IMAGE_GEN_FW_TYPE =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN=
_FW_TYPE))
> > -TI_K3_IMAGE_GEN_SOC =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC=
))
> > -TI_K3_IMAGE_GEN_SECTYPE =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN=
_SECTYPE))
> > +TI_K3_IMAGE_GEN_SOC =3D $(call qstrip,$(BR2_TARGET_TI_K3_SOC))
> > +TI_K3_IMAGE_GEN_SECTYPE =3D $(call qstrip,$(BR2_TARGET_TI_K3_SECTYPE))
> >  =

> > -ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP),y)
> > +ifeq ($(BR2_TARGET_TI_K3_SECTYPE_GP),y)
> >  TI_K3_IMAGE_GEN_SYSFW =3D \
> >  	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IM=
AGE_GEN_SECTYPE).bin
> >  else
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index beafb38930db..1a9d21e7c6d1 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -244,8 +244,7 @@ config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
> >  	bool "U-Boot needs TI K3 Device Manager (DM)"
> >  	# We use the SoC selection defined for the ti-k3-image-gen
> >  	# package
> > -	depends on BR2_TARGET_TI_K3_IMAGE_GEN
> > -	depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_=
IMAGE_GEN_SOC_AM62X
> > +	depends on BR2_TARGET_TI_K3_SOC_AM62AX || BR2_TARGET_TI_K3_SOC_AM62X
> >  	help
> >  	  Some TI K3 devices need the Device Manager (DM) firmware to
> >  	  be available for the U-Boot build.
> > @@ -254,8 +253,8 @@ if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
> >  =

> >  config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
> >  	string
> > -	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
> > -	default "am62xx"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
> > +	default "am62axx" if BR2_TARGET_TI_K3_SOC_AM62AX
> > +	default "am62xx"  if BR2_TARGET_TI_K3_SOC_AM62X
> >  =

> >  endif
> >  =

> > diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defcon=
fig
> > index cd26235342e4..cfefce0a77a4 100644
> > --- a/configs/ti_am62x_sk_defconfig
> > +++ b/configs/ti_am62x_sk_defconfig
> > @@ -24,8 +24,8 @@ BR2_TARGET_OPTEE_OS=3Dy
> >  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3-am62x"
> >  BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=3D"am62x"
> >  BR2_TARGET_TI_K3=3Dy
> > +BR2_TARGET_TI_K3_SOC_AM62X=3Dy
> >  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=3Dy
> >  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=3Dy
> >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE=3D"2024.01"
> > diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defcon=
fig
> > index 1befeb4ab96c..daf78dbffff8 100644
> > --- a/configs/ti_am64x_sk_defconfig
> > +++ b/configs/ti_am64x_sk_defconfig
> > @@ -24,8 +24,8 @@ BR2_TARGET_OPTEE_OS=3Dy
> >  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3-am64x"
> >  BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=3D"am64x"
> >  BR2_TARGET_TI_K3=3Dy
> > +BR2_TARGET_TI_K3_SOC_AM64X=3Dy
> >  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> > -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=3Dy
> >  BR2_TARGET_TI_K3_R5_LOADER=3Dy
> >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=3Dy
> >  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE=3D"2022.10"
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
