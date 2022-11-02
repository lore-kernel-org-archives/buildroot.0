Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A471C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 16:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D8460BBE;
	Wed,  2 Nov 2022 16:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D8460BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4ui5omlw1uy; Wed,  2 Nov 2022 16:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC02160AFC;
	Wed,  2 Nov 2022 16:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC02160AFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 327141BF307
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C8C041676
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C8C041676
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGayUSmfFwU7 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 16:44:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5056E41675
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5056E41675
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 16:44:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D8554000B;
 Wed,  2 Nov 2022 16:44:08 +0000 (UTC)
Date: Wed, 2 Nov 2022 17:44:07 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221102174407.4b29cba1@windsurf>
In-Reply-To: <20221024142216.31273-1-neal.frager@amd.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667407451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RADYgBzBmNb3606YjeNMbXy8+FAkO3uEL55yHjj36qM=;
 b=D+iK5XQaUDNp0/egUtNmtkfnwwicEZNoQX+/R3lZvytEhY1atm0iBpXr2v2YfuiKRzcgfA
 vcJBCqbcq6M29GTgSkxmM56uG0BjHYHD7SKrIWsfRy0y/mz/6Z1Rxu0UDMEGRi/FvxTap8
 vIdrTJthaJEB4eroulkfpl6x093iwa2ywn6muri1SChioM1rk2ZxT3bWxXjQj0Fb+MrUDG
 eoJSukoGyrFmstBtQGBC5Nx1RCWFvsY+YGccekyZ67FoF74r5L72QICTPypotFKnkC1Hv5
 zNSyec2qObl6DtMDQ+kd8BNaNrYI7yLmPYEIA2AyTbLH8cpj5rgEncuZ4jin7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D+iK5XQa
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Commit title should be:

	package/versal-firmware: new package

On Mon, 24 Oct 2022 08:22:14 -0600
Neal Frager <neal.frager@amd.com> wrote:


> diff --git a/DEVELOPERS b/DEVELOPERS
> index c8183b2290..ed696f4cd0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2176,6 +2176,7 @@ F:	configs/zynqmp_zcu102_defconfig
>  F:	configs/zynqmp_zcu106_defconfig
>  F:	configs/zynqmp_kria_kv260_defconfig
>  F:	package/bootgen
> +F:	package/versal-firmware

Final / needed here.

> diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
> new file mode 100644
> index 0000000000..e184ba1925
> --- /dev/null
> +++ b/package/versal-firmware/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_VERSAL_FIRMWARE
> +	bool "versal-firmware"
> +	depends on BR2_aarch64
> +	help
> +	  Pre-built firmware files for Xilinx Versal boards.
> +
> +	  https://github.com/nealfrager/buildroot-firmware
> +
> +if BR2_PACKAGE_VERSAL_FIRMWARE
> +
> +config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
> +	string "versal firmware version"
> +	help
> +	  Release version of Versal firmware.

Does it make sense to have the version configurable? If the version is
configurable, then probably the location (Git repository) should also
be configurable.

How do we expect this to be used by people who design their own boards
based on this SoC? Will they fork this repository? Do they have the
source code to create their own firmware?

Should the version have a default value?

> +config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
> +	string "versal board name"

Should the board have a default value?

Think of what happens when people just enable this package, without
using a specific Buildroot defconfig. In particular, our autobuilders
generate random Buildroot configurations, so they should build.



> +	help
> +	  Name of Versal target board.
> +	  Used for installing the appropriate firmware boot.bin.
> +
> +endif # BR2_PACKAGE_VERSAL_FIRMWARE
> diff --git a/package/versal-firmware/versal-firmware.hash b/package/versal-firmware/versal-firmware.hash
> new file mode 100644
> index 0000000000..7a8ea04c91
> --- /dev/null
> +++ b/package/versal-firmware/versal-firmware.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  14c505cac0216637ab2d08590acffb4861446e480bdbf7417e699816048ab39b  versal-firmware-v2022.2.tar.gz

Having this hash value is a bit useless when the version is
configurable.

> +sha256  f9796efcd98f47fb3e1d5d4c23e224613e91c70207b759a2087de368be50c315  LICENSE
> diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
> new file mode 100644
> index 0000000000..35dfbaa512
> --- /dev/null
> +++ b/package/versal-firmware/versal-firmware.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# versal-firmware
> +#
> +################################################################################
> +
> +VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only
> +VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
> +
> +VERSAL_FIRMWARE_INSTALL_TARGET = NO
> +VERSAL_FIRMWARE_INSTALL_IMAGES = YES
> +
> +define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_plm.elf \
> +	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_plm.elf
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_psmfw.elf \
> +	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_psmfw.elf
> +	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_vpl_gen_fixed.pdi \
> +	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_vpl_gen_fixed.pdi

Please indent the continuation line. But maybe this could be handle in
a slightly better way:

	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f) \
			$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f)
	)

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
