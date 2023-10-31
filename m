Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3B8C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 12:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F215F42C31;
	Tue, 31 Oct 2023 12:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F215F42C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VC2g0zoj8nko; Tue, 31 Oct 2023 12:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 128764289E;
	Tue, 31 Oct 2023 12:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 128764289E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1663B1BF2F2
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E400883A4B
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 12:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E400883A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7H3LKFjWEEH5 for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 12:57:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6916D83A3A
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 12:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6916D83A3A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65CB160005;
 Tue, 31 Oct 2023 12:57:11 +0000 (UTC)
Date: Tue, 31 Oct 2023 13:57:10 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20231031135710.7fd653b1@windsurf>
In-Reply-To: <20231020114236.4129636-8-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-8-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698757031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xlOyPyzlQjKbzjE/jLKBO+YYMQdJSZkt/zNeJhFrzY=;
 b=VwAGTxeFWyyObiIW/ib/2IyWdJckIwsx5XceRnJr22CEMCfcr0DTi32h3Qmoe5FZuFu2Kf
 w7IynQi8WbbHJ3oTc+ntpDGaIcyWQYxlYhIbTSUUMVRCRENBQd2UxhcAk+RobWOCVOyJjU
 gIXjdRbuiDZK5EvFaLcsPe2+iGD/DTqmO40K9CZ9VxImXlPfDm5YatqSWlDr0IGIuxb8Pc
 aiVa1o4cZPveVwgFTY/HBAHMs+Hb7IR7/H632lrEfrQv0RbljWUYlOGawdPy1Q7SgP1kFt
 AWTDNhY1vah9/wMz6Jc/g1KevnTgT5c4OGZ/8hVVgWph7PGj6sdOuPLMBqkqwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VwAGTxeF
Subject: Re: [Buildroot] [PATCH v6 08/10] boot/versal-firmware: new boot
 firmware
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 20 Oct 2023 12:42:34 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/boot/versal-firmware/Config.in b/boot/versal-firmware/Config.in
> new file mode 100644
> index 0000000000..b7ca7b866f
> --- /dev/null
> +++ b/boot/versal-firmware/Config.in
> @@ -0,0 +1,38 @@
> +config BR2_TARGET_VERSAL_FIRMWARE
> +	bool "versal-firmware"
> +	select BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT

Selecting host packages is not really needed, and this case it doesn't
even really make sense because this package anyway needs to be
configured to be told for which architecture the bare-metal toolchain
should be compiled.


> +VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_SITE = \
> +	$(call github,Xilinx,embeddedsw,$(VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_LICENSE = MIT
> +VERSAL_FIRMWARE_LICENSE_FILES = license.txt
> +VERSAL_FIRMWARE_INSTALL_IMAGES = YES
> +VERSAL_FIRMWARE_INSTALL_TARGET = NO
> +VERSAL_FIRMWARE_DEPENDENCIES = host-newlib-bare-metal

host-toolchain-bare-metal-buildroot

> +
> +CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS))

Please prefix all variables with the package name, i.e VERSAL_FIRMWARE_<something>.

> +VERSAL_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"

Please prefix all variables with the package name, i.e VERSAL_FIRMWARE_<something>.

> +
> +VERSAL_FIRMWARE_PDI = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_PDI))
> +
> +ifneq ($(findstring ://,$(VERSAL_FIRMWARE_PDI)),)
> +VERSAL_FIRMWARE_EXTRA_DOWNLOADS = $(VERSAL_FIRMWARE_PDI)
> +BR_NO_CHECK_HASH_FOR += $(notdir $(VERSAL_FIRMWARE_PDI))
> +PDI_PATH = $(VERSAL_FIRMWARE_DL_DIR)/$(notdir $(VERSAL_FIRMWARE_PDI))

Please prefix all variables with the package name, i.e VERSAL_FIRMWARE_<something>.

> +else ifneq ($(VERSAL_FIRMWARE_PDI),)
> +PDI_PATH = $(shell readlink -f $(VERSAL_FIRMWARE_PDI))

Please prefix all variables with the package name, i.e VERSAL_FIRMWARE_<something>.

> +endif #VERSAL_FIRMWARE_PDI
> +
> +define VERSAL_FIRMWARE_BUILD_CMDS
> +	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(VERSAL_CFLAGS)
> +		
> +	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
> +		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
> +		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
> +		CFLAGS=$(VERSAL_CFLAGS)
> +endef
> +
> +PLM_PATH = $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf
> +PSMFW_PATH = $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf

Please prefix all variables with the package name, i.e VERSAL_FIRMWARE_<something>.

> diff --git a/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch b/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
> new file mode 100644
> index 0000000000..84fffc1d82
> --- /dev/null
> +++ b/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
> @@ -0,0 +1,157 @@
> +From 245509f87776c7727973480f08ead6f293a2f3b2 Mon Sep 17 00:00:00 2001
> +From: Neal Frager <neal.frager@amd.com>
> +Date: Mon, 4 Sep 2023 07:08:02 +0100
> +Subject: [PATCH 1/2] sw_apps:versal_plm: add support of parallel build

No patch numbering (reported by "make check-package")


> +Subject: [PATCH 2/2] sw_apps:versal_psmfw: add support of parallel build

No patch numbering (reported by "make check-package")

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
