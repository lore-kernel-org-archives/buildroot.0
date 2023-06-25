Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCBAEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 09:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF5EF404B4;
	Sun, 25 Jun 2023 09:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF5EF404B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gv7hJ-wBeSsa; Sun, 25 Jun 2023 08:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF698404D3;
	Sun, 25 Jun 2023 08:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF698404D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 570691BF27C
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 08:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F04541506
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 08:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F04541506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LoZgPzkjnbsu for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 08:59:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A8BE414C9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A8BE414C9
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 08:59:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 89AADB005A4;
 Sun, 25 Jun 2023 10:59:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 10:59:50 +0200
Date: Sun, 25 Jun 2023 10:59:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20230625085950.GJ24952@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-10-dannenberg@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622160212.2063472-10-dannenberg@ti.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687683592;
 bh=c0MoyjYLCrdy0QTLLJB06QhZdO4qmmiJVb68zTODtlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ex0h8vVs3v41ONbTebiTiYBoVzVCIRJOMs26xUW+pFaOWCFw3yfMXu4eTUHlIgKb9
 VF3aXYRMtHzmghWOoGnQTXXswWx7XySXR1zrHCCyjqDeS0zfdJLisu8uAoLnuYEswR
 7gEkmzLaDWu0zKVJUlu7yPRpZ6/jZHxp2obDTVeB9JzHgRnC12gUAAr/QdRFfnkWWu
 p9uExn9bRwTl92zXdiGrmbS87rUQ/Y8keyXieP7hMeaJ/Gy1BIVhCtQkMN9e0ZPwFI
 pYckgni9QJFMw7kKWEotrd+ybkU4ymeaIsr7Wcp945vMXb5LyAwq2OXu2TQ+OsoAXa
 cAmeUPgm1/bMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ex0h8vVs
Subject: Re: [Buildroot] [PATCH v9 09/11] package/ti-rogue-km: new package
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

Andreas, All,

On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
> This package adds the kernel module for the Rogue graphics
> accelerator of the following Texas Instuments SoCs: AM62,
> J721E, J721S2, and J784S4.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
[--SNIP--]
> diff --git a/package/ti-rogue-km/Config.in b/package/ti-rogue-km/Config.in
> new file mode 100644
> index 0000000000..b1565929d5
> --- /dev/null
> +++ b/package/ti-rogue-km/Config.in
> @@ -0,0 +1,28 @@
> +comment "ti-rogue-km needs a Linux kernel to be built"
> +	depends on BR2_aarch64
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_TI_ROGUE_KM
> +	bool "ti-rogue-km"
> +	depends on BR2_LINUX_KERNEL && BR2_aarch64
> +	select BR2_LINUX_NEEDS_MODULES
> +	help
> +	  Kernel modules for TI SoCs with Rogue GPU.
> +	  This package supports AM62, J721E, J721S2, and J784S4
> +	  SoCs only.
> +
> +	  Note: it needs a TI specific kernel to build properly.
> +
> +	  https://git.ti.com/cgit/graphics/ti-img-rogue-driver
> +
> +if BR2_PACKAGE_TI_ROGUE_KM
> +
> +config BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT
> +	string "KM driver target product"
> +	default "am62_linux"
> +	help
> +	  Select target product to be used for KM driver. This needs to
> +	  match one of the SoC-specific folders within the build/linux
> +	  folder of the ti-img-rogue-driver Git repository.

If you go with the choice option I suggested in my review of patch 2,
then this is going to be trivial to implement without asking the user:

    config BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT
        string
        default "am62_linux" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
        default 

> +endif
> diff --git a/package/ti-rogue-km/ti-rogue-km.hash b/package/ti-rogue-km/ti-rogue-km.hash
> new file mode 100644
> index 0000000000..4a08efbb98
> --- /dev/null
> +++ b/package/ti-rogue-km/ti-rogue-km.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  ef50124b3e79fb1d28d3a2b4135032505abbb5c6b337b24a9bed7223d521dcc1  ti-rogue-km-1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2-br1.tar.gz
> +sha256  c878f4e43e468329d3dcf4db09054e94472bfeee9f8ab2d69a122b978e9f773e  README
> diff --git a/package/ti-rogue-km/ti-rogue-km.mk b/package/ti-rogue-km/ti-rogue-km.mk
> new file mode 100644
> index 0000000000..7b0a595c71
> --- /dev/null
> +++ b/package/ti-rogue-km/ti-rogue-km.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# ti-rogue-km
> +#
> +################################################################################
> +
> +# This corresponds to SDK 08.06.00
> +TI_ROGUE_KM_VERSION = 1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2
> +TI_ROGUE_KM_SITE = https://git.ti.com/git/graphics/ti-img-rogue-driver.git
> +TI_ROGUE_KM_SITE_METHOD = git
> +TI_ROGUE_KM_LICENSE = MIT or GPL-2.0
> +TI_ROGUE_KM_LICENSE_FILES = README
> +
> +TI_ROGUE_KM_DEPENDENCIES = linux
> +
> +PVR_BUILD = "release"
> +PVR_WS = "wayland"
> +
> +TI_ROGUE_KM_MAKE_OPTS = \
> +	$(LINUX_MAKE_FLAGS) \
> +	KERNELDIR=$(LINUX_DIR) \
> +	BUILD=$(PVR_BUILD) \
> +	PVR_BUILD_DIR=$(BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT) \
> +	WINDOW_SYSTEM=$(PVR_WS)
> +
> +define TI_ROGUE_KM_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TI_ROGUE_KM_MAKE_OPTS)
> +endef
> +
> +define TI_ROGUE_KM_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR) \
> +		M=$(@D)/binary_$(BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT)_$(PVR_WS)_$(PVR_BUILD)/target_aarch64/kbuild \
> +		INSTALL_MOD_PATH=$(TARGET_DIR) \
> +		modules_install
> +endef

Can't we use the kernel-module infra instead?
    https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules

i.e. something like:

    TI_ROGUE_KM_MODULE_MAKE_OPTS = \
        PVR_BUILD_DIR=$(BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT) \
        WINDOW_SYSTEM=wayland

I'm a bit concerned about the hoops the Makefile goes through to end up
with a path like:
    (@D)/binary_$(BR2_TARGET_TI_ROGUE_KM_TARGET_PRODUCT)_$(PVR_WS)_$(PVR_BUILD)/target_aarch64/kbuild

so maybe it is more complex than that... In any case, it would be good
to explain in the commit log why we can't use our kernel-module infra.

Regards,
Yann E. MORIN.

> +$(eval $(generic-package))
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
