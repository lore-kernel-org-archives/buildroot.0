Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8D9C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F298542E45;
	Fri, 25 Apr 2025 16:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-BI4yH_Fr6i; Fri, 25 Apr 2025 16:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0E33424F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E33424F1;
	Fri, 25 Apr 2025 16:25:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5807E127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4716F81FB7
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4d6d6mh3hZK5 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE3E80B4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FE3E80B4C
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:25:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DAC08638F; Fri, 25 Apr 2025 16:25:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:24:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72661cb424c18399ce1f352d15416a71b746712b
X-Git-Newrev: 460da6d4b4b189a8a0fc512f6ccd2d642e610c66
X-Patchwork-Hint: ignore
Message-Id: <20250425162543.5DAC08638F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi2_64: new defconfig
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3088357318556164379=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3088357318556164379==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=460da6d4b4b189a8a0fc512f6ccd2d642e610c66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This configuration builds an image for the Raspberry Pi 2 Rev 1.2
(64-bit).

Note: Raspberry Pi 2 Model B Rev 1.2[1] switched from BCM2836[2] to
BCM2837[3] that is 64-bit.

	BCM2836[2]

	The Broadcom chip used in the Raspberry Pi 2 Model B. The
	underlying architecture in BCM2836 is identical to BCM2835. The
	only significant difference is the removal of the ARM1176JZF-S
	processor and replacement with a quad-core Cortex-A7 cluster.

	BCM2837[3]

	This is the Broadcom chip used in the Raspberry Pi 3 Model B,
	later models of the Raspberry Pi 2 Model B, and the Raspberry Pi
	Compute Module 3. The underlying architecture of the BCM2837 is
	identical to the BCM2836. The only significant difference is the
	replacement of the ARMv7 quad core cluster with a quad-core ARM
	Cortex A53 (ARMv8) cluster.

	The ARM cores run at 1.2GHz, making the device about 50% faster
	than the Raspberry Pi 2. The VideoCore IV runs at 400MHz.

[1]: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#flagship-series
[2]: https://www.raspberrypi.com/documentation/computers/processors.html#bcm2836
[3]: https://www.raspberrypi.com/documentation/computers/processors.html#bcm2837

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/raspberrypi/config_2_64bit.txt | 26 ++++++++++++++++++++++++++
 board/raspberrypi/readme.txt         |  4 ++++
 board/raspberrypi2-64                |  1 +
 configs/raspberrypi2_64_defconfig    | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/board/raspberrypi/config_2_64bit.txt b/board/raspberrypi/config_2_64bit.txt
new file mode 100644
index 0000000000..5b531b1cae
--- /dev/null
+++ b/board/raspberrypi/config_2_64bit.txt
@@ -0,0 +1,26 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=Image
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# enable 64bits support
+arm_64bit=1
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 47814736bd..7dda631387 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -54,6 +54,10 @@ For model 2 B:
 
   $ make raspberrypi2_defconfig
 
+or for model 2 B (Rev 1.2, model B3 without wireless LAN and Bluetooth, 64 bit):
+
+  $ make raspberrypi2_64_defconfig
+
 For model 3 B, B+, CM3 and CM3+:
 
   $ make raspberrypi3_defconfig
diff --git a/board/raspberrypi2-64 b/board/raspberrypi2-64
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypi2-64
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypi2_64_defconfig b/configs/raspberrypi2_64_defconfig
new file mode 100644
index 0000000000..211e8470b4
--- /dev/null
+++ b/configs/raspberrypi2_64_defconfig
@@ -0,0 +1,34 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2-64/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,cd231d4775b14f228606c09f219b48308f6ab3aa)/linux-cd231d4775b14f228606c09f219b48308f6ab3aa.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-2-b"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi2-64/config_2_64bit.txt"
+# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
+BR2_PACKAGE_HOST_MTOOLS=y

--===============3088357318556164379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3088357318556164379==--
