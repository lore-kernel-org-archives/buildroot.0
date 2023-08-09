Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EDFC0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71EEE40237;
	Wed,  9 Aug 2023 21:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71EEE40237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4T60xcScZ5tC; Wed,  9 Aug 2023 21:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B0F041765;
	Wed,  9 Aug 2023 21:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B0F041765
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22DA21BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05238408A8
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05238408A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtRzGUhpDHcM for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:33:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F10BB400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F10BB400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD3F8853B3; Wed,  9 Aug 2023 21:33:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 23:30:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2cc1902943b2032aca48e050816906e9caa355cd
X-Git-Newrev: 930a6d9470efc5c46bcff358947c050540555a6c
X-Patchwork-Hint: ignore
Message-Id: <20230809213348.DD3F8853B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi_pc2: new
 defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=930a6d9470efc5c46bcff358947c050540555a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds a new defconfig for OrangePI PC2 board.

It was supported before in Buildroot, however due to problems in
building TF-A, it was removed in commit
eeede611f81d8f83b72e4a6671cd7d1e46b266b0. This commit re-adds it, in a
state that properly builds.

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  4 ++++
 board/orangepi/orangepi-pc2/readme.txt | 37 ++++++++++++++++++++++++++++++++++
 configs/orangepi_pc2_defconfig         | 36 +++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a2948e8cb7..d41e717b45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1507,6 +1507,10 @@ F:	package/quota/
 N:	Jason Pruitt <jrspruitt@gmail.com>
 F:	package/librtlsdr/
 
+N:	Javad Rahimi <javad321javad@gmail.com>
+F:	board/orangepi/orangepi-pc2
+F:	configs/orangepi_pc2_defconfig
+
 N:	Jean Burgat <jeanburgat33@gmail.com>
 F:	package/openfpgaloader/
 
diff --git a/board/orangepi/orangepi-pc2/readme.txt b/board/orangepi/orangepi-pc2/readme.txt
new file mode 100644
index 0000000000..6c699244ce
--- /dev/null
+++ b/board/orangepi/orangepi-pc2/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Orangepi PC2. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Orangepi PC2 link:
+http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-PC-2.html
+
+Sunxi Wiki link:
+https://linux-sunxi.org/Xunlong_Orange_Pi_PC_2
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make orangepi_pc2_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SDcard in your Orangepi PC2 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
new file mode 100644
index 0000000000..3de067ae54
--- /dev/null
+++ b/configs/orangepi_pc2_defconfig
@@ -0,0 +1,36 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
