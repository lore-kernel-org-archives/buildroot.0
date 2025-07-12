Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25383C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 15:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2EB80BB6;
	Sat, 12 Jul 2025 15:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-fAnKoEHLar; Sat, 12 Jul 2025 15:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34CF80B71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34CF80B71;
	Sat, 12 Jul 2025 15:27:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F28E1CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2102140D22
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jz0rtfcx48Nu for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 15:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3908840CC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3908840CC8
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 15:27:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2550A863DE; Sat, 12 Jul 2025 15:27:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Jul 2025 17:24:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f427b78a922b32d2b81d3a28b66ef27933fe417
X-Git-Newrev: 051d145137ae86f040742478ece1529c65123a1f
X-Patchwork-Hint: ignore
Message-Id: <20250712152745.2550A863DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imxrt1050-evk: bump U-Boot and
 switch to use extlinux.conf
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=051d145137ae86f040742478ece1529c65123a1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to extlinux instead of built in U-Boot script.
Drop custom U-Boot fragment and genimage config.
Update U-Boot from 2024.01 to 2025.07. This new U-Boot now
requires BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y in the defconfig.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien:
 - mention U-Boot bump in commit log
 - add BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/freescale/imxrt1050evk/genimage.cfg               | 17 -----------------
 .../rootfs_overlay/boot/extlinux/extlinux.conf          |  4 ++++
 board/freescale/imxrt1050evk/uboot.fragment             |  2 --
 configs/imxrt1050-evk_defconfig                         |  6 ++++--
 4 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
index 64fc8452f8..3a4c4fb792 100644
--- a/board/freescale/imxrt1050evk/genimage.cfg
+++ b/board/freescale/imxrt1050evk/genimage.cfg
@@ -1,14 +1,3 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"imxrt1050-evk.dtb",
-		}
-	}
-
-	size = 8M
-}
-
 image sdcard.img {
 	hdimage {
 	}
@@ -27,12 +16,6 @@ image sdcard.img {
 		size = 512K
 	}
 
-	partition boot {
-		partition-type = 0xc
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
diff --git a/board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..1818d2702d
--- /dev/null
+++ b/board/freescale/imxrt1050evk/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label buildroot
+	kernel /boot/zImage
+	devicetree /boot/imxrt1050-evk.dtb
+	append console=ttyLP0 root=/dev/mmcblk0p1 rootwait rw
diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
deleted file mode 100644
index dd45ca4c29..0000000000
--- a/board/freescale/imxrt1050evk/uboot.fragment
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_USE_BOOTCOMMAND=y
-CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 zImage;bootz 0x80000000 - 0x80800000"
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index 8a515a9260..fce2b831f3 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
+BR2_ROOTFS_OVERLAY="board/freescale/imxrt1050evk/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
 BR2_LINUX_KERNEL=y
@@ -9,15 +10,16 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
