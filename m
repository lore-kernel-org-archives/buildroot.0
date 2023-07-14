Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE25EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 544C040164;
	Fri, 14 Jul 2023 21:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 544C040164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0n6FqdDEeuX; Fri, 14 Jul 2023 21:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DA92400E7;
	Fri, 14 Jul 2023 21:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DA92400E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 559D71BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FE92400E7
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FE92400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wg3Zbm-RpMd4 for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:43:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FC23400D1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FC23400D1
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:43:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89FD5C0006;
 Fri, 14 Jul 2023 21:43:27 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:43:26 +0200
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Message-ID: <20230714234326.1ab918e8@windsurf>
In-Reply-To: <20230714064413.11433-2-kilian.zinnecker@mail.de>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
 <20230714064413.11433-2-kilian.zinnecker@mail.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689371008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaERvF+66UhoXYWNje2E+Npd9WpuFjRQhcGPUS6lCS4=;
 b=ZkHHfwtHzBvffMCCe+DECWhYbAmj0NTs5hvGPrTzsztSuGaZ5gMWB/7QgTLTdoFuBYvuY2
 jSOdhDSWJIgcsSf+zpQtTK7apJaxnCf0n4+QcKPY8CzHi4BRFJ1WnAV8R2Dy/REX+NYXJw
 uOJ7L22t9dDfZ2J4wB7snLGB641nq3K160YuHII5uQLnE6z4fsKzCtzq34Y3PFfWksg+24
 7dTwMRNoW2blt4JIddX0KIAQUjQfwwzh5hNdG/GgDvTRxb7v6cyNg0HEF3znn+nUPTZOZ8
 G5gBV16pQm2Izx2psJbsxTujiQGg7C8+zOekblRia1raKjAutn9hsX/MfnKkCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZkHHfwtH
Subject: Re: [Buildroot] [PATCH v6 1/3] package: add rockchip-rkbin package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kilian,

Thanks for your work! See below some comments.

On Fri, 14 Jul 2023 08:44:11 +0200
Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

> This patch adds a package for the Rockchip ATF binary blobs. These
> binaries are needed to build U-Boot for some Rockchip SoCs (e.g.,
> RK3588). One can config a custom version and manually define which
> blobs (for bl31, tpl and tee) to use from the repository. The
> U-Boot package is modified so that it takes the chosen binaries and
> uses them during build.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

Nit: the commit title should be:

	package/rockchip-rkbin: new package

> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 085397d03d..7733f8501f 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -262,6 +262,15 @@ config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
>  	  This option makes sure that the i.MX firmwares are copied into
>  	  the U-Boot source directory.
>  
> +config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
> +	bool "U-Boot needs rockchip-rkbin"
> +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN
> +	help
> +	  For some Rockchip SoCs U-Boot needs binary blobs from
> +	  Rockchip.
> +	  This option makes sure that the needed binary blobs are copied
> +	  into the U-Boot source directory.
> +
>  menu "U-Boot binary format"
>  
>  config BR2_TARGET_UBOOT_FORMAT_AIS
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 4eae8e95c3..f9f50539e5 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -207,6 +207,23 @@ endef
>  UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
>  endif
>  
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
> +UBOOT_DEPENDENCIES += rockchip-rkbin
> +define UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
> +	$(INSTALL) -D -m 0644 $(@D)/u-boot-rockchip.bin $(BINARIES_DIR)/

We need a full destination path here: $(BINARIES_DIR)/u-boot/rockchip.bin

> +endef
> +UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
> +UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31${suffix $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))}

What is this ${...} ?

> +endif
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
> +UBOOT_MAKE_OPTS += ROCKCHIP_TPL=$(BINARIES_DIR)/ddr${suffix $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))}
> +endif
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE),y)
> +$BOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee${suffix $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))}

   ^^ typo, should be UBOOT_MAKE_OPTS


> +endif
> +endif
> +

These changes to boot/uboot/ should be in a separate patch, after the
patch adding rockchip-rkbin.

> diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
> new file mode 100644
> index 0000000000..0f2126654e
> --- /dev/null
> +++ b/package/rockchip-rkbin/Config.in
> @@ -0,0 +1,70 @@
> +config BR2_PACKAGE_ROCKCHIP_RKBIN
> +	bool "Rockchip rkbin binary blobs"

Just:

	bool "rockchip-rkbin"

> +	depends on BR2_arm || BR2_aarch64
> +	help
> +	  This package provides Rockchip SoC binary blobs for U-Boot.
> +
> +if BR2_PACKAGE_ROCKCHIP_RKBIN
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +	bool "Use a custom version"
> +	help
> +	  This option allows to use a specific version.
> +if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
> +	string "Rockchip rkbin version"
> +	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +
> +endif # BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION
> +	string
> +	default "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c" \
> +		if !BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
> +	default BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE \
> +		if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION

Is it really likely that a different version, but from the same Git
repository will be needed? I see in your defconfig you're using a
different version than the default used here. Why?

> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
> +	bool "Rockchip rkbin tpl file"
> +	default n

"default n" is never needed, as it's the default.

> +
> +if BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
> +	string "ddr.bin file path"
> +	help
> +	  Full path to the tpl file inside the rkbin repository. The
> +	  specified file will be copied and used by U-Boot as tpl.
> +
> +endif # BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
> +	bool "Rockchip rkbin bl31 file"
> +	default n
> +
> +if BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME
> +	string "bl31.elf file path"
> +	help
> +	  Full path to the bl31 file inside the rkbin repository. The
> +	  specified file will be copied and used by U-Boot as bl31.
> +
> +endif # BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE
> +	bool "Rockchip rkbin optee file"
> +	default n
> +
> +if BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME
> +	string "tee.elf file path"
> +	help
> +	  Full path to the TEE file inside the rkbin repository.
> +	  The specified file will be copied and used by U-Boot as
> +	  TEE.
> +endif # BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE

For those 3 files, do we really need a boolean + a string option? Can't
we simply rely on string options: if the value is empty, there's no
TPL/BL31/TEE, if the value is non-empty, use the file provided.

> diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
> new file mode 100644
> index 0000000000..5659ecf719
> --- /dev/null
> +++ b/package/rockchip-rkbin/rockchip-rkbin.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  6f7b58fe35108101031ebfd3cc6eb7a186f258a1cdbd93c4256888997ab52c8f  rockchip-rkbin-d6ccfe401ca84a98ca3b85c12b9554a1a43a166c-br1.tar.gz
> +

Nit: useless empty new line.

> diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
> new file mode 100644
> index 0000000000..7b2f17f7e2
> --- /dev/null
> +++ b/package/rockchip-rkbin/rockchip-rkbin.mk
> @@ -0,0 +1,49 @@
> +################################################################################
> +#
> +# rockchip-rkbin
> +#
> +################################################################################
> +
> +

Nit: only one empty new line.

> +ROCKCHIP_RKBIN_VERSION = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION))
> +ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
> +ROCKCHIP_RKBIN_SITE_METHOD = git

Any reason not to use:

ROCKCHIP_RKBIN_SITE = $(call github,rockchip-linux,rkbin,$(ROCKCHIP_RKBIN_VERSION))

 ?

> +ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
> +ROCKCHIP_RKBIN_REDISTRIBUTE = NO

This is the problematic part I believe. What is the license of this
stuff? Without any license, nobody is allowed to redistribute it. So as
it is, all images produced by Buildroot with this package cannot be
redistributed, making them quite useless, unless it's used by a
hobbyist building his own images for his own usage, without any
redistribution.

We have the same issue with some Amlogic blobs I believe. Blobs are
annoying, but they are even more annoying when there's no license
attached to them that allows redistribution.

> +ROCKCHIP_RKBIN_INSTALL_IMAGES = YES
> +ROCKCHIP_RKBIN_INSTALL_TARGET = NO
> +
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE),y)
> +ROCKCHIP_RKBIN_BL31_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
> +BL31_EXTENSION=${suffix $(ROCKCHIP_RKBIN_BL31_FILENAME)}

All variables must be prefixed with the package name. Again this
${suffix ...} thing, weird.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE),y)
> +ROCKCHIP_RKBIN_TPL_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
> +TPL_EXTENSION=${suffix $(ROCKCHIP_RKBIN_TPL_FILENAME)}

All variables must be prefixed with the package name.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE),y)
> +ROCKCHIP_RKBIN_TEE_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))
> +TEE_EXTENSION=${suffix $(ROCKCHIP_RKBIN_TEE_FILENAME)}

All variables must be prefixed with the package name.

> +endif
> +
> +define ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS
> +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE)), \
> +		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME) $(BINARIES_DIR)/bl31$(BL31_EXTENSION))
> +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE)), \
> +		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME) $(BINARIES_DIR)/ddr$(TPL_EXTENSION))
> +	$(if $(filter y, $(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE)), \
> +		cp $(@D)/$(ROCKCHIP_RKBIN_TEE_FILENAME) $(BINARIES_DIR)/tee$(TEE_EXTENSION))

The filter y construct is a bit useless, you can just do:

	$(if $(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILE),\
		do something)

> +endef
> +
> +ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION),y)
> +ifeq ($(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE)),)
> +$(error No custom rockchip-rkbin version specified. Check your BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE setting)
> +endif
> +ROCKCHIP_SOURCE = rockchip-rkbin-$(ROCKCHIP_RKBIN_VERSION)-br1.tar.gz

Hum, I wonder why this needs to be defined. It seems to work for U-Boot
without having to define UBOOT_SOURCE in uboot.mk, the infrastructure
does it for you.

> +BR_NO_CHECK_HASH_FOR += $(ROCKCHIP_SOURCE)
> +endif

This check should be enclosed in a:

ifeq ($(BR_BUILDING),y)
...
endif

condition.

Overall, mostly cosmetic comments that I could have solved myself, but
the licensing problem is much more significant and I cannot resolve it.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
