Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04643C38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 07:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A111B60A6F;
	Wed,  7 Sep 2022 07:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A111B60A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlH7a-sAvm6V; Wed,  7 Sep 2022 07:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BA17605B7;
	Wed,  7 Sep 2022 07:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BA17605B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB51A1BF365
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C234F40237
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C234F40237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIGux9Vjl9IX for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 07:58:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4DD7401BD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4DD7401BD
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 07:58:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f72e:cac9:64c4:382d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3D7FA13F88D;
 Wed,  7 Sep 2022 09:58:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Sep 2022 09:58:11 +0200
Date: Wed, 7 Sep 2022 09:58:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220907075811.GI1490660@scaer>
References: <20220906161557.2645766-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906161557.2645766-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662537494;
 bh=4gHf0fMT8gauvDoa5OzuN/IbfL1J63ctQwsCeSySNU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ANbN48t758uiDui5ikgybb1YNaCurZAdyx0b1jdw9WFy7tyBkb8siwW7NZKXarsdr
 h8UzN9FmiCZkkVOi+3hwO3k+Eedws+GnuQZsi183R8KcL5ATFUb9f8K7pY7JgS8wQ/
 KzU/roWRRcXJSBAQmx3/uKPjFKay6dLxaV9YcSiD/GZklVj5H664eyTEh8hP9WR20l
 wiGDy2qUH/P0T+S6/XihPDtMG6oFYsZQWJmiKeNYr5A9JPyV1+Nca+5c4V2yNCuwGQ
 3BJJUj1vxRKcheh3xVY92jFRjYcM2ga5ZCwXJ4alkQJdZACBYbo2MZojZtbdoofTo6
 OZHfEei02/4VA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ANbN48t7
Subject: Re: [Buildroot] [PATCH-next 1/2] nezha_defconfig: bump opensbi,
 u-boot and linux
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

Peter, All,

On 2022-09-06 18:15 +0200, Peter Korsgaard spake thusly:
> Opensbi is now based on 1.1, U-Boot on 2022.07-rc3 and Linux on 5.19-rc1.
> We don't yet support 5.19 kernel headers, so use 5.17 instead.
> 
> The incompatibility between opensbi and u-boot is now fixed, so drop
> 0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch.
> 
> The updated device tree in the kernel tree no longer specifies a memory node
> (and the board exists in 512M/1G/2G variants, so instead use the (otherwise
> identical) device tree provided by u-boot, where the memory node is fixed up
> based on the detected memory size.  Keep the kernel build configuration in
> place so host-{bison,flex} is built.

Thus mystery has been solved, now, so:

Series of two patches applied to next, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../nezha/overlay/boot/extlinux/extlinux.conf |  2 +-
>  ...port-building-u-boot.toc1-for-nezda.patch} |  0
>  ...un20i-d1.dtsi-adjust-plic-compatible.patch | 36 -------------------
>  configs/nezha_defconfig                       |  8 ++---
>  4 files changed, 5 insertions(+), 41 deletions(-)
>  rename board/nezha/patches/uboot/{0002-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch => 0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch} (100%)
>  delete mode 100644 board/nezha/patches/uboot/0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch
> 
> diff --git a/board/nezha/overlay/boot/extlinux/extlinux.conf b/board/nezha/overlay/boot/extlinux/extlinux.conf
> index 02232f4d16..91b2298628 100644
> --- a/board/nezha/overlay/boot/extlinux/extlinux.conf
> +++ b/board/nezha/overlay/boot/extlinux/extlinux.conf
> @@ -1,4 +1,4 @@
>  label linux
>    kernel /boot/Image
> -  devicetree /boot/sun20i-d1-nezha.dtb
> +  # use devicetree from u-boot
>    append console=ttyS0,115200 root=/dev/mmcblk0p1 ro rootwait
> diff --git a/board/nezha/patches/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch b/board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
> similarity index 100%
> rename from board/nezha/patches/uboot/0002-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
> rename to board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
> diff --git a/board/nezha/patches/uboot/0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch b/board/nezha/patches/uboot/0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch
> deleted file mode 100644
> index 3524f44a61..0000000000
> --- a/board/nezha/patches/uboot/0001-arch-riscv-dts-sun20i-d1.dtsi-adjust-plic-compatible.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 99cf8f37ceb1def9e7bbaccc395cf2275723e03d Mon Sep 17 00:00:00 2001
> -From: Peter Korsgaard <peter@korsgaard.com>
> -Date: Thu, 4 Nov 2021 22:15:13 +0100
> -Subject: [PATCH] arch/riscv/dts/sun20i-d1.dtsi: adjust plic compatible to
> - match opensbi
> -
> -The T-HEAD PLIC is by default not accessible from S-mode, and access must be
> -enabled by opensbi to make it accessible to Linux.
> -
> -The DTB is used both by U-Boot and opensbi (but the PLIC node is ignored by
> -U-Boot), so change the compatible to match what opensbi expects to fix a
> -crash during Linux boot:
> -
> -https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd
> -
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - arch/riscv/dts/sun20i-d1.dtsi | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/arch/riscv/dts/sun20i-d1.dtsi b/arch/riscv/dts/sun20i-d1.dtsi
> -index 280e0336d4..56d02c33b0 100644
> ---- a/arch/riscv/dts/sun20i-d1.dtsi
> -+++ b/arch/riscv/dts/sun20i-d1.dtsi
> -@@ -1136,7 +1136,7 @@
> - 
> - 		plic: interrupt-controller@10000000 {
> - 			compatible = "allwinner,sun20i-d1-plic",
> --				     "sifive,plic-1.0.0";
> -+				     "thead,c900-plic";
> - 			reg = <0x10000000 0x4000000>;
> - 			#address-cells = <0>;
> - 			interrupts-extended = <&cpu0_intc 11>,
> --- 
> -2.20.1
> -
> diff --git a/configs/nezha_defconfig b/configs/nezha_defconfig
> index 2d66d6cb4a..7a7e86ceab 100644
> --- a/configs/nezha_defconfig
> +++ b/configs/nezha_defconfig
> @@ -1,12 +1,12 @@
>  BR2_riscv=y
>  BR2_GLOBAL_PATCH_DIR="board/nezha/patches"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
>  BR2_ROOTFS_OVERLAY="board/nezha/overlay"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/nezha/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,012f5a3d01be6d44e32c74bb3637ec281790b297)/linux-012f5a3d01be6d44e32c74bb3637ec281790b297.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,linux,fe178cf0153d98b71cb01a46c8cc050826a17e77)/linux-fe178cf0153d98b71cb01a46c8cc050826a17e77.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="nezha"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-nezha"
> @@ -16,14 +16,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_OPENSBI=y
>  BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
> -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,b9125c6f8909d1cc0417795737fc13cb6297ff11)/opensbi-b9125c6f8909d1cc0417795737fc13cb6297ff11.tar.gz"
> +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
>  BR2_TARGET_SUN20I_D1_SPL=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,62392d3b8a624a80646c1876533336f90140088d)/uboot-62392d3b8a624a80646c1876533336f90140088d.tar.gz"
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,u-boot,d1-2022-05-26)/uboot-d1-2022-05-26.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nezha"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> -- 
> 2.30.2
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
