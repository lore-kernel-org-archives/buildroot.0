Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0A3C19F28
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 01:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96A3860E73;
	Sun, 31 Jul 2022 01:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96A3860E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Diwg6KiXV5Sd; Sun, 31 Jul 2022 01:01:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B6660E61;
	Sun, 31 Jul 2022 01:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B6660E61
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C362F1BF968
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 01:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E2AB60E61
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 01:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E2AB60E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XETsjpFF4o-6 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 01:01:15 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF9A160B43
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF9A160B43
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 01:01:14 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HxDeoWxPz9RZ3HxDeoer9Q; Sun, 31 Jul 2022 02:54:10 +0200
Message-ID: <f8d347ce-9c81-6ffd-a44e-ccfd72af7739@benettiengineering.com>
Date: Sun, 31 Jul 2022 02:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-3-x-shi@ti.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220728164006.16652-3-x-shi@ti.com>
X-CMAE-Envelope: MS4xfGl0SR/R/ameOorwWMHJhUCj6qorcHRbbGhZ03MkKOO5mSeKS0an7i001nSN9wNw9IRB2PPq21g8j7HbChEgayBiOufkTj2XGRkq1xuFgHoYWsSl47Ln
 dSuF4zt3jDJinZUZfpb0B06vkB86ym8BprN4WKwnUeEqlyIShnRW7UOxsfNt2QcU4aHNWEe6v3kItYQYZVwREsG3JiVNPUreBf0ymFzmK7cDAom+1+ahL0Ef
 hAWX5O5aTk9aIRlNx8Ma8Fr/Ih4a50Qw/g/WlREYswfmGtR4fFXs8fMgKTeuBScGkUZNSpNw8xdJMd/s3wgM5phAd2bXKAmAABwiwc+jGlpYAxcKeeoFZBbd
 lk48+F4w
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659228850; bh=Xi22YngKISUCjggtYvie2D4cIwLY8MiP6eLGanh69a4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=VVEGC6f34YESQvpUIhEGTWgqyrVdPtZ8X5WNwcvqHlXV0RYeJy6IBJC0g5Lx/M45X
 gCxH4GM06uzZF6oElb8r2CoEZ6vxUQNEhs09dciKFwWKno8R1XAcsZagz/iBg4Rk7L
 j8rjRa13qZJ9Lp92uZTPjOUgqEXeuJnK5H+Fxf4ymoo6ZM9qORPvFzzVw2IFjNIqHK
 H9tvunqnewveWuySNmS3vYiyPBXhkzVTIGIbDzrd41Mf26m9HzyNbWbmez5SG+e+ZA
 /Rgaa9quqZBAiKTaAe5odOam41RKhFCjHAOhlMMt4v66Xc+O+6QJKq7AKAihivQ93Z
 rA02dashWYqlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=VVEGC6f3
Subject: Re: [Buildroot] [PATCH v2 2/4] boot/ti-k3-r5-loader: add new package
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Xuanhao,

On 28/07/22 18:40, Xuanhao Shi wrote:
> This is a separate U-Boot package that would build
> the intermediate spl binary for the R5 core on TI's k3 boards.
> Usually, the resulting spl will be used for k3-image-gen

			...will be used by k3-image-gen ^^^

> to build the full R5 boot binary tiboot3.bin.
> 
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> ---
>   boot/Config.in                            |  1 +
>   boot/ti-k3-r5-loader/Config.in            | 13 +++++++
>   boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  2 ++
>   boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 42 +++++++++++++++++++++++
>   4 files changed, 58 insertions(+)
>   create mode 100644 boot/ti-k3-r5-loader/Config.in
>   create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
>   create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> 
> diff --git a/boot/Config.in b/boot/Config.in
> index 40472ae07d..ce17b2df6b 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -22,6 +22,7 @@ source "boot/s500-bootloader/Config.in"
>   source "boot/shim/Config.in"
>   source "boot/sun20i-d1-spl/Config.in"
>   source "boot/syslinux/Config.in"
> +source "boot/ti-k3-r5-loader/Config.in"
>   source "boot/uboot/Config.in"
>   source "boot/vexpress-firmware/Config.in"
>   
> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
> new file mode 100644
> index 0000000000..7f5fa0b4c8
> --- /dev/null
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_TARGET_TI_K3_R5_LOADER
> +	bool "ti-k3-r5-loader"
> +	help
> +	  Separate U-Boot build for R5 cores on TI's k3 boards.
> +	  Usually used to build tiboot3.bin with k3-image-gen.
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_BOARD
> +	string "Board to configure for"
> +	depends on BR2_TARGET_TI_K3_R5_LOADER
> +	help
> +	  Specify the board to configure the bootloader for.
> +	  This should be the name of a board under board/ti
> +	  For example, "am64x_evm".

Here ^^^ I would substitute "config" with "choice", this way everything
is easier from the user point of view. On patch 4/4 you're adding 2
boards, so I think it makes sense to add every possible choice(2 for the
moment).

> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> new file mode 100644
> index 0000000000..fb6ce7c2a6
> --- /dev/null
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  6d69d5e4635cb3fa7852bf15f88ca342ef7740196e71961d3572deb58ba44bea  u-boot-2022.10-rc1.tar.bz2
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> new file mode 100644
> index 0000000000..ee88053392
> --- /dev/null
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# ti-k3-r5-loader.mk
> +#
> +################################################################################
> +
> +TI_K3_R5_LOADER_VERSION = 2022.10-rc1

-rc1 version is the possibly buggiest version you can pick. There are
other 2 possible solutions:
1. use 2022.07 and backport all needed patches on a dedicated
repository instead of using official u-boot repository
2. wait a bit for at least rc2/3(soon) and later when 2022.10 is
released, bump it

> +TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
> +TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
> +TI_K3_R5_LOADER_LICENSE = GPL-2.0+
> +TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
> +TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
> +TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
> +TI_K3_R5_LOADER_INSTALL_IMAGES = YES
> +TI_K3_R5_LOADER_DEPENDENCIES = \
> +	host-pkgconf \
> +	$(BR2_MAKE_HOST_DEPENDENCY) \

What is this ^^^ needed for?

> +	host-arm-gnu-toolchain
> +
> +TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)

This ^^^ looks superflous, you can directly use $(BR2_MAKE) below

> +TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)

Same here ^^^
In general you'd need this only if you modify it later depending
on other variables like:
TI_K3_R5_LOADER_MAKE_ENV += blah blah
and so on

> +TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
> +	toolchain \
> +	$(BR2_MAKE_HOST_DEPENDENCY) \
> +	$(BR2_BISON_HOST_DEPENDENCY) \
> +	$(BR2_FLEX_HOST_DEPENDENCY)

"toolchain" should imply all above _HOST_DEPENDENCY. But here you're
using host-arm-gnu-toolchain, so toolchain shouldn't be needed, or yes?

> +
> +TI_K3_R5_LOADER_BOARD = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD))

This ^^^ can be avoided too since you use it one line below with a
suffix only

> +TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(TI_K3_R5_LOADER_BOARD)_r5_defconfig
> +TI_K3_R5_LOADER_MAKE_OPTS += \
> +	CROSS_COMPILE=$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi- \
> +	ARCH=arm

What is the reason why you need to use arm-gnu-toolchain to build u-boot 
SPL? Can you please explain it in commit log?

> +
> +define TI_K3_R5_LOADER_BUILD_CMDS
> +	$(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
> +endef
> +
> +define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
> +	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> +endef
> +
> +$(eval $(kconfig-package))

Why do you use kconfig-package? You reimplement anyway BUILD_CMDS and
INSTALL_IMAGES_CMDS, so generic-package should be fine.

Thanks for contributing!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
