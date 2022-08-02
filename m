Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A51C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 16:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BBD94091A;
	Tue,  2 Aug 2022 16:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BBD94091A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmxUcsYofZEc; Tue,  2 Aug 2022 16:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F203640914;
	Tue,  2 Aug 2022 16:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F203640914
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C36E21BF390
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 16:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA4E540912
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 16:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA4E540912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Muy7oein-Ffs for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 16:24:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4114090C
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E4114090C
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 16:24:01 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IugYoDDYeij11IugZoK56C; Tue, 02 Aug 2022 18:24:00 +0200
Message-ID: <75c770ac-442a-feec-2d8d-c1708c300737@benettiengineering.com>
Date: Tue, 2 Aug 2022 18:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-3-x-shi@ti.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220728164006.16652-3-x-shi@ti.com>
X-CMAE-Envelope: MS4xfJaGVgkorE8J7wIB75AbE6jqWi0TaRr3TMgqBAkiUtqiS4g2guNm296tcAbiWofX7UxWLRZdO1UURqXvow05VU/BjL8wgyh5NkicL9b+voTe+kbti4Mu
 IP4Cdu7h65eiohcLXQ6hyFjpNBUwyfW3VDE+9WdgvR84BlVpIZsSzjSh3BzFQzBLX7kk1FxnGN98KFk+odnjRMHCAOuYSz7seNpD0kJsxEhiygZ4hDcwfMts
 JOqgLwoDKk9UEeBVcdKmyETnpz3AK7o7m4L3Z21eGsYHQ6XNARS6/+tsRryljIU+fYMd7ybRXPPjns20c2e79Ya8eZUBJRhAeLJFlaDWSDBZUoUNz9ZtMj3d
 jUn1gFfb
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659457440; bh=2y0wDjHZWrf1BqObmyHLlx/050/xSk3q59po1lIcRWc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=nUdG95CqyO/yPC27InZpq93i93Xr+xhPFBY1aMVjBhDlTvslAYrWy6hRX3K/StEO0
 qnWoyf5YBocN4bpyXrU3TcTwc1Y46sTITAX4w/Ai/nipGz06LIPn1gV2jBBLV2zVME
 r9DCQG43/h4ZvbJjY5Hr3RKgxTHXTMW95ObVUa23U+fzVvkIiDuJ9PTsVlF4MwvmGB
 L5AQz++4kDki7w0SHmLWeuC2lS75eU79GXAODroU0s8r4y3isdQsov6pxXunUCoBDG
 wlPXtPr9HMVDpYf4LcML7PBJHXwAa7qybDaUnZr3COScpKWVjj/LtUPzlPHM0WTluS
 KyCiHibPwzRMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nUdG95Cq
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

Hi Xuanhao, Anand, Thomas, All,

I've built with buildroot/utils/docker-run the 2 defconfigs with this
package enabled and there is something missing, see below

On 28/07/22 18:40, Xuanhao Shi wrote:
> This is a separate U-Boot package that would build
> the intermediate spl binary for the R5 core on TI's k3 boards.
> Usually, the resulting spl will be used for k3-image-gen
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
> +	host-arm-gnu-toolchain

host-openssl is required on this uboot version so please add it here ^^^

> +
> +TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
> +TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
> +TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
> +	toolchain \
> +	$(BR2_MAKE_HOST_DEPENDENCY) \
> +	$(BR2_BISON_HOST_DEPENDENCY) \
> +	$(BR2_FLEX_HOST_DEPENDENCY)
> +
> +TI_K3_R5_LOADER_BOARD = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD))
> +TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(TI_K3_R5_LOADER_BOARD)_r5_defconfig
> +TI_K3_R5_LOADER_MAKE_OPTS += \
> +	CROSS_COMPILE=$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi- \
> +	ARCH=arm

host-openssl is used to build host tools so here you need to pass to 
TI_K3_R5_LOADER_MAKE_OPTS also:
HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem 
/,$(HOST_CFLAGS)))" \
HOSTLDFLAGS="$(HOST_LDFLAGS)"
the same way u-boot already does

> +
> +define TI_K3_R5_LOADER_BUILD_CMDS

Here you need:
$(TARGET_CONFIGURE_OPTS) \
while calling make, otherwise host bison and flex won't be found.

You have encountered these problems because you had bison, flex and 
openssl installed into your pc, but we need to test the worst case
where hosts don't provide such utility, so Buildroot can build them.
This to reduce the initial dependencies for Buildroot.

> +	$(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
> +endef
> +
> +define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
> +	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> +endef
> +
> +$(eval $(kconfig-package))

Wait for V2 with the rest of things I've listed except what Thomas
pointed.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
