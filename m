Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EEDC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 10:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C5AD847D7;
	Fri,  1 Dec 2023 10:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C5AD847D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlRxmakw1vG9; Fri,  1 Dec 2023 10:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 179F4847E0;
	Fri,  1 Dec 2023 10:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179F4847E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 140481BF345
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD5624028D
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 10:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD5624028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luqO08y2jx2C for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 10:04:14 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8312E4021C
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 10:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8312E4021C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4c68:322b:52a4:6805])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 465D7200410;
 Fri,  1 Dec 2023 11:04:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 01 Dec 2023 11:04:05 +0100
Date: Fri, 1 Dec 2023 11:04:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bram Oosterhuis <dev@bybram.com>
Message-ID: <20231201100405.GL3177259@scaer>
References: <20231104220152.3252635-1-dev@bybram.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231104220152.3252635-1-dev@bybram.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701425051;
 bh=Q5dwdmU3X9jPm3/BeM/pQRLZbEiKgPWtFh6rOdGim7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SP2CuZ6hHfJTKZJIa3NwYG7dZMY7kHWOm3aWLLQDNrBE7CKuUfBTHDJbvYEcY4yUy
 K2LDYp+/0KciimQk4G6Q6cYbpcAEGCvIIz38pS1SSuOopU40mQwnjlAL3H6iV4uSCN
 MEC3eHAgYwcxfmMYlox4yYIpHBIfYjPOFG9TN9RslEfYB4ruOkcOaduaOY/ivOmgXf
 VeXu0LQMTQoEbTxRTDQHUfxzCILIxgb+ACW/7WbYSSRm22lEAWwluVysj9T9k4TNcI
 V3NuTfUJaG4fWbMUbSlAb4HHpUUDAnhcUOEpGfqqBSYuSNxR2SuJ9CejibmI2HkYhq
 zVlSOkSjuVVjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SP2CuZ6h
Subject: Re: [Buildroot] [PATCH 1/2] configs/raspberrypi: bump Linux version
 to 6.1.61
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bram, All,

On 2023-11-04 23:01 +0100, Bram Oosterhuis spake thusly:
> Linux 6.1 has been marked LTS for a long time now. Time to bump
> Linux for RaspberryPi's to the latest 6.1.61 Since April 2022
> the RaspberryPi defconfigs have compressed kernel module enabled
> by default. (see [1] and [2]).
> 
> To load compressed kernel modules kmod and xz packages are needed
> because busybox doesn't support it.
> 
> For testing I used RaspberryPi 2, 3(32+64bit) and 4(32+64bit), all with mdev enabled.
> 
> [1] https://github.com/raspberrypi/linux/commit/c45b4223a4e4a8cfe39edbb4949329ea478fa4e2
> [2] https://github.com/raspberrypi/linux/issues/4966
> 
> Signed-off-by: Bram Oosterhuis <dev@bybram.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/raspberrypi0_defconfig        | 13 ++++++++++---
>  configs/raspberrypi0w_defconfig       | 13 ++++++++++---
>  configs/raspberrypi2_defconfig        | 13 ++++++++++---
>  configs/raspberrypi3_64_defconfig     | 13 ++++++++++---
>  configs/raspberrypi3_defconfig        | 13 ++++++++++---
>  configs/raspberrypi3_qt5we_defconfig  | 13 ++++++++++---
>  configs/raspberrypi4_64_defconfig     | 13 ++++++++++---
>  configs/raspberrypi4_defconfig        | 13 ++++++++++---
>  configs/raspberrypi_defconfig         | 13 ++++++++++---
>  configs/raspberrypicm4io_64_defconfig | 13 ++++++++++---
>  configs/raspberrypicm4io_defconfig    | 13 ++++++++++---
>  configs/raspberrypizero2w_defconfig   | 13 ++++++++++---
>  12 files changed, 120 insertions(+), 36 deletions(-)
> 
> diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
> index 4506e94bce..6bff1ebf81 100644
> --- a/configs/raspberrypi0_defconfig
> +++ b/configs/raspberrypi0_defconfig
> @@ -2,14 +2,14 @@ BR2_arm=y
>  BR2_arm1176jzf_s=y
>  BR2_ARM_EABIHF=y
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  
>  # Build the DTBs for A/B from the kernel sources: the zero is the same
> @@ -37,3 +37,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
> index 7a35794c2d..ac72d49f92 100644
> --- a/configs/raspberrypi0w_defconfig
> +++ b/configs/raspberrypi0w_defconfig
> @@ -2,14 +2,14 @@ BR2_arm=y
>  BR2_arm1176jzf_s=y
>  BR2_ARM_EABIHF=y
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
> @@ -32,3 +32,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index 9b484c5588..dee9a0b23f 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -7,12 +7,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> @@ -39,3 +39,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> index 4d838ae0e8..6871dc0fe0 100644
> --- a/configs/raspberrypi3_64_defconfig
> +++ b/configs/raspberrypi3_64_defconfig
> @@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
>  
>  # Build the DTB from the kernel sources
> @@ -37,3 +37,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 0a59ab42a9..f0e7b82191 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> @@ -37,3 +37,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> index 40d0c0f888..532b3ed686 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -7,12 +7,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> @@ -51,3 +51,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="400M"
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
> index 5942f7c4e1..453bbe9440 100644
> --- a/configs/raspberrypi4_64_defconfig
> +++ b/configs/raspberrypi4_64_defconfig
> @@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> @@ -36,3 +36,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
> index 4e5580c140..1ed5d34b56 100644
> --- a/configs/raspberrypi4_defconfig
> +++ b/configs/raspberrypi4_defconfig
> @@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> @@ -36,3 +36,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index cca53f9b37..01b4353b84 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -4,14 +4,14 @@ BR2_ARM_EABIHF=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  
>  # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
> @@ -38,3 +38,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
> index 29cb0472d7..d53711c3a7 100644
> --- a/configs/raspberrypicm4io_64_defconfig
> +++ b/configs/raspberrypicm4io_64_defconfig
> @@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> @@ -39,3 +39,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
> index 017aecc0dd..4b50dc9ef9 100644
> --- a/configs/raspberrypicm4io_defconfig
> +++ b/configs/raspberrypicm4io_defconfig
> @@ -6,12 +6,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_SYSTEM_DHCP="eth0"
>  
> -# Linux headers same as kernel, a 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, a 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> @@ -39,3 +39,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
> diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
> index 2ea503ca24..1bf335c076 100644
> --- a/configs/raspberrypizero2w_defconfig
> +++ b/configs/raspberrypizero2w_defconfig
> @@ -2,14 +2,14 @@ BR2_arm=y
>  BR2_cortex_a53=y
>  BR2_ARM_FPU_NEON_VFPV4=y
>  
> -# Linux headers same as kernel, 5.10 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +# Linux headers same as kernel, 6.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6.1=y
>  
>  BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> @@ -34,3 +34,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
> +
> +# Enable compressed kernel module support
> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +BR2_PACKAGE_KMOD_TOOLS=y
> +BR2_PACKAGE_XZ=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_HOST_KMOD_XZ=y
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
