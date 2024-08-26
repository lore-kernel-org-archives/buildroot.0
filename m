Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81426C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2205960748;
	Mon, 26 Aug 2024 16:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLcRYtsJT9G3; Mon, 26 Aug 2024 16:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2B5D6077C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2B5D6077C;
	Mon, 26 Aug 2024 16:42:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B58F41BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A209F40315
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alp7kEXCIrYs for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3933C402FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3933C402FB
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:42:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23D468649A; Mon, 26 Aug 2024 16:42:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 18:42:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 60da48c3b70d8ed8dcc9d77143c1462bdf839ab6
X-Git-Newrev: ff6a4f27b4a8475c49fe4514d23c7a23b38e671b
X-Patchwork-Hint: ignore
Message-Id: <20240826164240.23D468649A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/mx6udoo: update U-Boot
 and kernel
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ff6a4f27b4a8475c49fe4514d23c7a23b38e671b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to U-Boot 2024.07 and kernel 6.10.6 versions.

As kernel 6.10 fixes the USB kernel hang, remove the original patch.

Also convert it to use extlinux.conf file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../patches/linux/0000-udoo-disable-usbh1.patch    | 26 ----------------------
 .../rootfs_overlay/boot/extlinux/extlinux.conf     |  4 ++++
 configs/mx6udoo_defconfig                          | 15 +++++--------
 4 files changed, 10 insertions(+), 36 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 778e3b8651..8ce5047ae6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -91,7 +91,6 @@ board/synopsys/axs10x/post-build.sh Shellcheck
 board/technologic/ts4900/post-image.sh Shellcheck
 board/toradex/apalis-imx6/post-image.sh Shellcheck
 board/udoo/common/post-build.sh Shellcheck
-board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch lib_patch.Upstream
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch lib_patch.Upstream
 boot/optee-os/3.13.0/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch lib_patch.Upstream
 boot/syslinux/0001-bios-Fix-alignment-change-with-gcc-5.patch lib_patch.Upstream
diff --git a/board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch b/board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
deleted file mode 100644
index d151a40d6e..0000000000
--- a/board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] ARM: dts: imx6qdl-udoo: Disable usbh1 to avoid kernel hang
-
-Currently the kernel hangs when USB Host1 is enabled due to the lack of
-support for controlling the USB hub clock and GPIO reset line.
-
-Peter Chen has made several attempts to fix this problem, but his series
-has not been applied yet, so better disable USB host1 for now to avoid
-the kernel hang.
-
-Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
----
-
-diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
-index 828dd20cd27d..c9e122865312 100644
---- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
-+++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
-@@ -292,7 +292,8 @@ &usbh1 {
- 	pinctrl-0 = <&pinctrl_usbh>;
- 	vbus-supply = <&reg_usb_h1_vbus>;
- 	clocks = <&clks IMX6QDL_CLK_CKO>;
--	status = "okay";
-+	/* currently USB support causes a kernel hang. Disable it for now */
-+	status = "disabled";
- };
- 
- &usbotg {
diff --git a/board/udoo/mx6qdl/rootfs_overlay/boot/extlinux/extlinux.conf b/board/udoo/mx6qdl/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..cbb284f91b
--- /dev/null
+++ b/board/udoo/mx6qdl/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx6qdl-udoo buildroot
+	kernel ../zImage
+	fdtdir ../
+	append root=/dev/mmcblk2p1 rootwait rw
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 5092ef0fd1..6c84a41bfd 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -3,27 +3,26 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_GLOBAL_PATCH_DIR="board/udoo/mx6qdl/patches"
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/udoo/mx6qdl/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.84"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.6"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-udoo imx6dl-udoo"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-udoo nxp/imx/imx6dl-udoo"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 # required tools to create the SD card image
@@ -31,5 +30,3 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/udoo/common/boot.scr.txt"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
