Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBC5C2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 09:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55D7541BDE;
	Fri, 28 Jun 2024 09:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2VbLyIi7DdAM; Fri, 28 Jun 2024 09:36:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C746841BDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C746841BDB;
	Fri, 28 Jun 2024 09:36:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC5571BF3B5
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 09:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 981D2818CA
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 09:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22UvgtHIjap6 for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 09:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03F4C814A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F4C814A9
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03F4C814A9
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 09:36:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4A725C68BA
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 09:32:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D4C31C000A;
 Fri, 28 Jun 2024 09:32:34 +0000 (UTC)
Date: Fri, 28 Jun 2024 11:32:33 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240628113233.2d8f765f@booty>
In-Reply-To: <20240618074922.3555070-1-neal.frager@amd.com>
References: <20240618074922.3555070-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719567155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdhXNwRqy3WN7ZfqY9BJ3Y/AeoeW8pey/tdomcfpJl4=;
 b=pwiZkjGvVTtUtpNfWCOtOrG+CD82UY7yTbLxOXQvR6CnoXuD9pdOREynIM7SXzAllj1vek
 +Dl16Se+KwHohEdtj63rYD6qTz0oLo2t+VC/ETlzGkIQRvvDek4j1h/nuhVgkil7G8IBtZ
 +UX0E3wk6h3EqyiAcYoIvTuWDD5l7EQnA+M937ZhcxdPr2hcl1EgMNqyDfvN5icZIiWR70
 k3AAZwwme3ZfWKwcOLo2BKmyyfHw3Q3WhWRdhRs8YVpeMr/2CWjy8mFwbLclVdI13rBzQS
 D6mCrboASRDGYiYabqYa/mscnyQ3GbPXq+6uC6K+8nujvfqgnrJY1YWsG2mX+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pwiZkjGv
Subject: Re: [Buildroot] [PATCH v3 1/4] boot/xilinx-source: new boot package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Tue, 18 Jun 2024 08:49:19 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new boot package for building boot firmware for Xilinx
> versal, zynqmp and kria targets.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - add make dependency to be sure bare-metal toolchain is built before trying
>   to use the toolchain for building the xilinx-source firmware
> V2->V3:
> - fix copy paste error that causes build failure
> ---
>  DEVELOPERS                            |  1 +
>  boot/Config.in                        |  1 +
>  boot/xilinx-source/Config.in          | 45 +++++++++++++++++
>  boot/xilinx-source/xilinx-source.hash |  2 +
>  boot/xilinx-source/xilinx-source.mk   | 70 +++++++++++++++++++++++++++
>  5 files changed, 119 insertions(+)
>  create mode 100644 boot/xilinx-source/Config.in
>  create mode 100644 boot/xilinx-source/xilinx-source.hash
>  create mode 100644 boot/xilinx-source/xilinx-source.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8bfd36f1d8..adfd9520ea 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2340,6 +2340,7 @@ F:	board/xilinx/
>  F:	board/zynq/
>  F:	board/zynqmp/
>  F:	boot/xilinx-prebuilt/
> +F:	boot/xilinx-source/
>  F:	configs/versal_vck190_defconfig
>  F:	configs/zynq_zc702_defconfig
>  F:	configs/zynq_zc706_defconfig
> diff --git a/boot/Config.in b/boot/Config.in
> index 25a50265d2..da22f15e8a 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -22,5 +22,6 @@ source "boot/ti-k3-r5-loader/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
>  source "boot/xilinx-prebuilt/Config.in"
> +source "boot/xilinx-source/Config.in"
>  
>  endmenu
> diff --git a/boot/xilinx-source/Config.in b/boot/xilinx-source/Config.in
> new file mode 100644
> index 0000000000..bf87ff4178
> --- /dev/null
> +++ b/boot/xilinx-source/Config.in
> @@ -0,0 +1,45 @@
> +config BR2_TARGET_XILINX_SOURCE
> +	bool "xilinx-source"
> +	depends on BR2_aarch64
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
> +	help
> +	  Build boot firmware from source for Xilinx boards.
> +
> +	  https://github.com/Xilinx/embeddedsw

It would be useful to add here a few words about what gets built and why
versal requires BR2_TARGET_XILINX_PREBUILT while zynqmp and kria require
!BR2_TARGET_XILINX_PREBUILT.

> +comment "xilinx-source needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
> +
> +if BR2_TARGET_XILINX_SOURCE
> +
> +config BR2_TARGET_XILINX_SOURCE_VERSION
> +	string "source version"
> +	default "xilinx_v2024.1"
> +	help
> +	  Release version of Xilinx firmware.
> +	  Must be xilinx_v2023.1 or newer.
> +
> +choice
> +	bool "family variant"
> +	default BR2_TARGET_XILINX_SOURCE_ZYNQMP
> +
> +config BR2_TARGET_XILINX_SOURCE_ZYNQMP
> +	bool "zynqmp"
> +	depends on !BR2_TARGET_XILINX_PREBUILT
> +
> +config BR2_TARGET_XILINX_SOURCE_KRIA
> +	bool "kria"
> +	depends on !BR2_TARGET_XILINX_PREBUILT
> +
> +config BR2_TARGET_XILINX_SOURCE_VERSAL
> +	bool "versal"
> +	depends on BR2_TARGET_XILINX_PREBUILT
> +
> +endchoice
> +
> +config BR2_TARGET_XILINX_SOURCE_USER_CFLAGS
> +	string "optional user cflags"
> +	help
> +	  Add optional config flags when building xilinx boot firmware.
> +
> +endif # BR2_TARGET_XILINX_SOURCE
> diff --git a/boot/xilinx-source/xilinx-source.hash b/boot/xilinx-source/xilinx-source.hash
> new file mode 100644
> index 0000000000..ed6a165574
> --- /dev/null
> +++ b/boot/xilinx-source/xilinx-source.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  733fdb09b2525c1fa322242b97f015122aaf9e32530a824dec71d6328be83850  xilinx-source-xilinx_v2024.1.tar.gz
> diff --git a/boot/xilinx-source/xilinx-source.mk b/boot/xilinx-source/xilinx-source.mk
> new file mode 100644
> index 0000000000..4352b07eed
> --- /dev/null
> +++ b/boot/xilinx-source/xilinx-source.mk
> @@ -0,0 +1,70 @@
> +################################################################################
> +#
> +# xilinx-source
> +#
> +################################################################################
> +
> +XILINX_SOURCE_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_SOURCE_VERSION))
> +XILINX_SOURCE_SITE = $(call github,Xilinx,embeddedsw,$(XILINX_SOURCE_VERSION))
> +XILINX_SOURCE_LICENSE = MIT
> +XILINX_SOURCE_LICENSE_FILES = LICENSE
> +XILINX_SOURCE_INSTALL_TARGET = NO
> +XILINX_SOURCE_INSTALL_IMAGES = YES
> +XILINX_SOURCE_DEPENDENCIES = toolchain-bare-metal-buildroot
> +
> +XILINX_SOURCE_USER_CFLAGS = $(call qstrip,$(BR2_TARGET_XILINX_SOURCE_USER_CFLAGS))
> +ifeq ($(BR2_TARGET_XILINX_SOURCE_KRIA),y)
> +XILINX_SOURCE_CFLAGS = "-Os -flto -ffat-lto-objects -DK26_SOM $(XILINX_SOURCE_USER_CFLAGS)"
> +else
> +XILINX_SOURCE_CFLAGS = "-Os -flto -ffat-lto-objects $(XILINX_SOURCE_USER_CFLAGS)"
> +endif
> +
> +ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
> +define XILINX_SOURCE_BUILD_VERSAL
> +	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(XILINX_SOURCE_CFLAGS)
> +		
> +	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(XILINX_SOURCE_CFLAGS)
> +endef
> +else # BR2_TARGET_XILINX_SOURCE_VERSAL
> +define XILINX_SOURCE_BUILD_OTHERS
> +	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(XILINX_SOURCE_CFLAGS)
> +endef
> +endif # BR2_TARGET_XILINX_SOURCE_VERSAL
> +
> +define XILINX_SOURCE_BUILD_CMDS
> +	$(XILINX_SOURCE_BUILD_VERSAL)
> +	$(XILINX_SOURCE_BUILD_OTHERS)

We are always building either for versal or for "others", so only one
of these two variables is ever defined. So you could use only one
variable name (XILINX_SOURCE_BUILD?), or even define directly
XILINX_SOURCE_BUILD_CMDS inside the ifeq/else/endif clause above.

> +endef
> +
> +ifeq ($(BR2_TARGET_XILINX_SOURCE_VERSAL),y)
> +define XILINX_SOURCE_INSTALL_VERSAL
> +	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf \
> +		$(BINARIES_DIR)/plm.elf
> +	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf \
> +		$(BINARIES_DIR)/psmfw.elf
> +endef
> +else # BR2_TARGET_XILINX_SOURCE_VERSAL
> +define XILINX_SOURCE_INSTALL_OTHERS
> +	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf \
> +		$(BINARIES_DIR)/pmufw.elf
> +endef
> +endif # BR2_TARGET_XILINX_SOURCE_VERSAL
> +
> +define XILINX_SOURCE_INSTALL_IMAGES_CMDS
> +	$(XILINX_SOURCE_INSTALL_VERSAL)
> +	$(XILINX_SOURCE_INSTALL_OTHERS)

As above.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
