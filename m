Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443D6EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD13A40327;
	Fri, 14 Jul 2023 21:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD13A40327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LXLqulmKatEq; Fri, 14 Jul 2023 21:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0706C400E7;
	Fri, 14 Jul 2023 21:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0706C400E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39BAE1BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC6660E34
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC6660E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfakrEX4ynUw for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:44:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A4C60A7A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2A4C60A7A
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:44:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09DE5240002;
 Fri, 14 Jul 2023 21:44:41 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:44:40 +0200
To: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Message-ID: <20230714234440.46a85e82@windsurf>
In-Reply-To: <20230714064413.11433-3-kilian.zinnecker@mail.de>
References: <20230714064413.11433-1-kilian.zinnecker@mail.de>
 <20230714064413.11433-3-kilian.zinnecker@mail.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689371083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abK6m9rDQIUnyk/InBLDSj0Ob0Elmvxigilhp6esmgU=;
 b=Xt8AEzy38eI9REopzUZeFYLM+1YlUCQwfJX5zPKUUg88ksrzXqA0VzaMPEAQBe7Llx+zq/
 VtJ+yrwjOE7QLeM4WX3QZ3qlso+6LX1Ejz4ml8zUQbt5ZqUh1AvSrwV6WYaJqrXka6ZXS6
 Ie9IGsDTwUagbHw1+TFVGB3RZeBe1FFbWLGTn0Fj77WepQXsyEMzZRfFvDL2XINP/TZOkK
 jL4SBRl2vC8wO40PItDc+R0VDgFygwqw/nyqZRC/TFVfbCEylOGgLpIvoPTgAtdFdCQRDJ
 SVQvgYPhLQxdtCFFrnyB/Qqj35QHe5QEo67xCxl0Z71vQFH6em+H0OjvGp2ewg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xt8AEzy3
Subject: Re: [Buildroot] [PATCH v6 2/3] configs: add rock5b/rock5b_defconfig
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

The commit title should be:

	configs/rock5b: new defconfig

On Fri, 14 Jul 2023 08:44:12 +0200
Kilian Zinnecker via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> new file mode 100644
> index 0000000000..4a07dd5ebc
> --- /dev/null
> +++ b/configs/rock5b_defconfig
> @@ -0,0 +1,44 @@
> +BR2_aarch64=y
> +BR2_cortex_a76_a55=y
> +BR2_KERNEL_HEADERS_5_10=y
> +BR2_TARGET_GENERIC_HOSTNAME="rock5b"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_USE_WCHAR

Not needed, especially since it has probably no effect.

> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/radxa/kernel.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52f51a2b5ba178f331af62260d2da86d7472c14b"
> +BR2_LINUX_KERNEL_DEFCONFIG="rockchip_linux"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
> +BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
> +BR2_PACKAGE_AVAHI=y
> +BR2_PACKAGE_AVAHI_DAEMON=y
> +BR2_PACKAGE_OPENSSH=y

Please drop those 3 options, we want a minimal configuration.

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
> +BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_DTC=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_ROCKCHIP_RKBIN=y
> +BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION=y
> +BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE="78cbbc4f9c36b77a620132ad38d2c6823b4b25fe"
> +BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILE=y
> +BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin"
> +BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILE=y
> +BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.38.elf"

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
