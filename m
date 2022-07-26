Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBA0C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 18:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A1C6063B;
	Tue, 26 Jul 2022 18:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A1C6063B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XaXuug1kJEVP; Tue, 26 Jul 2022 18:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A98C0605A6;
	Tue, 26 Jul 2022 18:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A98C0605A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C41801BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B2054092C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B2054092C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmWQoDVmcsh3 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 18:55:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD287408E5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD287408E5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 18:55:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8774220005;
 Tue, 26 Jul 2022 18:55:30 +0000 (UTC)
Date: Tue, 26 Jul 2022 20:55:29 +0200
To: Xuanhao Shi <x-shi@ti.com>
Message-ID: <20220726205529.0e85e2de@windsurf>
In-Reply-To: <20220726165041.17584-3-x-shi@ti.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-3-x-shi@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658861730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5jZ22C4f2HSfUb3cl3YsEwJRDqa8iYlXAEQle/V7Bo=;
 b=KGiJib/VzNI6dC+VMh5k9OFxon/l+pOksamiryfTw91cK7AqEs3UMmy9AlroB283I4jcaW
 mlYqUPGthhfiF+gg/GN1uRwtQHWAvwM1mpXuDei7quEle8F4dyMhggoK8Jyu7PRLCz44x3
 xnLHVlXZnwBMORUTz8kjChl661ddbuffPQ18+jRqLe/elZ1YmdNRihaqx0Gjoznx+k5Ln7
 wMkjm9U2fvfJqtvOx0l8lHB7OujWxBaJL4latWKkLcugq98JKDiFumSMmtVVXOMqDsdNLo
 j8ga6QXQK80AFA4FuMn0+ZqfOGEQMmnYsgavICATBzMbXiiddiogpt74suU/tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KGiJib/V
Subject: Re: [Buildroot] [PATCH 2/4] package/k3-image-gen: new package
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your contribution. However, as you will see below from my
review, this will require significant rework, the approach you're
taking is really not good.

On Tue, 26 Jul 2022 11:50:39 -0500
Xuanhao Shi <x-shi@ti.com> wrote:

> k3-image-gen is a package that helps support TI's k3 SoCs
> by building a separate boot binary, tiboot3.bin, on the R core.
> 
> https://git.ti.com/cgit/k3-image-gen/k3-image-gen/about/
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> ---
>  package/Config.in                      |  1 +
>  package/k3-image-gen/Config.in         | 37 ++++++++++++++++++++++
>  package/k3-image-gen/k3-image-gen.hash |  2 ++
>  package/k3-image-gen/k3-image-gen.mk   | 43 ++++++++++++++++++++++++++
>  4 files changed, 83 insertions(+)

A new package needs an entry in the DEVELOPERS file.

Also, I think this package should probably go in boot/ instead of
package/.

> diff --git a/package/k3-image-gen/Config.in b/package/k3-image-gen/Config.in
> new file mode 100644
> index 0000000000..3522382677
> --- /dev/null
> +++ b/package/k3-image-gen/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_K3_IMAGE_GEN
> +	bool "k3-image-gen"
> +	help
> +	  Using TI's k3-image-gen to build a separate bare metal
> +	  boot binary from a separate spl. Currently supports
> +	  version 08.04.00.004 as default.
> +
> +	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
> +
> +menu "U-Boot SPL Build Options"
> +	depends on BR2_PACKAGE_K3_IMAGE_GEN
> +
> +config BR2_PACKAGE_K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG
> +	string "U-Boot SPL defconfig for image gen"
> +	help
> +	  This is the defconfig without the suffix for the separate SPL.
> +	  For example, "am64x_evm_r5" for AM64X boards.

Do you need two U-Boot builds, one for the main U-Boot running on the
Cortex-A cores and one U-Boot running on the Cortex-R5 core ?


> diff --git a/package/k3-image-gen/k3-image-gen.hash b/package/k3-image-gen/k3-image-gen.hash
> new file mode 100644
> index 0000000000..393c7726cd
> --- /dev/null
> +++ b/package/k3-image-gen/k3-image-gen.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 8446d4f169b894304593f0c325028f25e401d0b793d6fd3aa9efa3da937222d2  k3-image-gen-08.04.00.004.tar.gz
> diff --git a/package/k3-image-gen/k3-image-gen.mk b/package/k3-image-gen/k3-image-gen.mk
> new file mode 100644
> index 0000000000..5449a2d0a5
> --- /dev/null
> +++ b/package/k3-image-gen/k3-image-gen.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +#k3-image-gen
> +#
> +################################################################################
> +
> +K3_IMAGE_GEN_VERSION = 08.04.00.004
> +K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
> +K3_IMAGE_GEN_SOURCE = k3-image-gen-$(K3_IMAGE_GEN_VERSION).tar.gz
> +K3_IMAGE_GEN_LICENSE = GPL-2.0+

Do you have a license file ?

> +K3_IMAGE_GEN_MAKE = $(BR2_MAKE)
> +
> +K3_IMAGE_GEN_UBOOT_SPL_ARCH = arm
> +K3_IMAGE_GEN_UBOOT_SPL_CROSS = \
> +$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi-
> +K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG = \
> +$(call qstrip, $(BR2_PACKAGE_K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG))_defconfig
> +
> +K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_PACKAGE_K3_IMAGE_GEN_SOC))
> +K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_PACKAGE_K3_IMAGE_GEN_CONFIG))
> +
> +K3_IMAGE_GEN_DEPENDENCIES += host-arm-gnu-toolchain uboot
> +
> +K3_IMAGE_GEN_MAKE_OPTS += \
> +	SOC=$(K3_IMAGE_GEN_SOC) \
> +	CONFIG=$(K3_IMAGE_GEN_CONFIG) \
> +	CROSS_COMPILE=$(K3_IMAGE_GEN_UBOOT_SPL_CROSS) \
> +	SBL=$(BINARIES_DIR)/u-boot-spl.bin \
> +	O=$(BINARIES_DIR) \
> +	BIN_DIR=$(BINARIES_DIR) 
> +
> +define K3_IMAGE_GEN_BUILD_CMDS
> +	$(UBOOT_MAKE) -C $(BUILD_DIR)/uboot* ARCH=$(K3_IMAGE_GEN_UBOOT_SPL_ARCH) \
> +	CROSS_COMPILE=$(K3_IMAGE_GEN_UBOOT_SPL_CROSS) $(K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG)
> +	$(UBOOT_MAKE) -C $(BUILD_DIR)/uboot* ARCH=$(K3_IMAGE_GEN_UBOOT_SPL_ARCH) \
> +	CROSS_COMPILE=$(K3_IMAGE_GEN_UBOOT_SPL_CROSS)

This clearly is not acceptable. You can from k3-image-gen mess up with
the build directory of U-Boot. $(BUILD_DIR)/uboot* can point to
something else than U-Boot, and even in principle doing the build of
one package in another is wrong.

Could you explain what you are trying to do? Is it because you need to
build two different U-Boot configurations?

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
