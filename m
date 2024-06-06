Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88BAC27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 10:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2E27610B9;
	Thu, 13 Jun 2024 10:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meYD_XnJcRRN; Thu, 13 Jun 2024 10:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31936115F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31936115F;
	Thu, 13 Jun 2024 10:08:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BBE191BF354
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A56E1413E0
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKQAawFvfB98 for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 10:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BD7A413FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BD7A413FC
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5396C87ED8; Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 16:18:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1554df688cb1563c8da2f8fcba21020dcf126a1
X-Git-Newrev: d9a0954288c43c01633343a4a701692de8068cba
X-Patchwork-Hint: ignore
Message-Id: <20240613100500.5396C87ED8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs: add raspberrypi 5 defconfig
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1588178382583588734=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1588178382583588734==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d9a0954288c43c01633343a4a701692de8068cba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This configuration builds an image for the RaspberryPi 5.

Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
[yann.morin.1998@free.fr: check hashes]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/raspberrypi/cmdline_5.txt               |  1 +
 board/raspberrypi/config_5.txt                | 14 ++++++++
 board/raspberrypi/linux-4k-page-size.fragment |  1 +
 board/raspberrypi/readme.txt                  |  6 ++++
 board/raspberrypi5                            |  1 +
 configs/raspberrypi5_defconfig                | 50 +++++++++++++++++++++++++++
 6 files changed, 73 insertions(+)

diff --git a/board/raspberrypi/cmdline_5.txt b/board/raspberrypi/cmdline_5.txt
new file mode 100644
index 0000000000..ac457353e2
--- /dev/null
+++ b/board/raspberrypi/cmdline_5.txt
@@ -0,0 +1 @@
+root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA10,115200
diff --git a/board/raspberrypi/config_5.txt b/board/raspberrypi/config_5.txt
new file mode 100644
index 0000000000..bbed19fe46
--- /dev/null
+++ b/board/raspberrypi/config_5.txt
@@ -0,0 +1,14 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
diff --git a/board/raspberrypi/linux-4k-page-size.fragment b/board/raspberrypi/linux-4k-page-size.fragment
new file mode 100644
index 0000000000..5df91df1aa
--- /dev/null
+++ b/board/raspberrypi/linux-4k-page-size.fragment
@@ -0,0 +1 @@
+CONFIG_ARM64_4K_PAGES=y
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 9202b5ff37..aa6421ea01 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -10,6 +10,7 @@ These instructions apply to all models of the Raspberry Pi:
   - the model B3 (aka Raspberry Pi 3).
   - the model B4 (aka Raspberry Pi 4).
   - the model CM4 (aka Raspberry Pi Compute Module 4 and IO Board).
+  - the model B5 (aka Raspberry Pi 5).
 
 How to build it
 ===============
@@ -64,6 +65,10 @@ or for CM4 (on IO Board - 64 bit):
 
   $ make raspberrypicm4io_64_defconfig
 
+For model 5 B:
+
+  $ make raspberrypi5_defconfig
+
 Build the rootfs
 ----------------
 
@@ -94,6 +99,7 @@ After building, you should obtain this tree:
     +-- bcm2710-rpi-cm3.dtb         [1]
     +-- bcm2711-rpi-4-b.dtb         [1]
     +-- bcm2711-rpi-cm4.dtb         [1]
+    +-- bcm2712-rpi-5-b.dtb         [1]
     +-- bcm2837-rpi-3-b.dtb         [1]
     +-- boot.vfat
     +-- rootfs.ext4
diff --git a/board/raspberrypi5 b/board/raspberrypi5
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypi5
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
new file mode 100644
index 0000000000..73592c4a1a
--- /dev/null
+++ b/configs/raspberrypi5_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a76_a55=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2712-rpi-5-b"
+
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi5/config_5.txt"
+BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE="board/raspberrypi5/cmdline_5.txt"
+# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
+
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi5/patches"

--===============1588178382583588734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1588178382583588734==--
