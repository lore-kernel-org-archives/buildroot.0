Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22ADC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E86E080E4D;
	Fri, 28 Feb 2025 17:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRgNYAquEePp; Fri, 28 Feb 2025 17:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D40CD80DE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D40CD80DE7;
	Fri, 28 Feb 2025 17:14:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CFFD1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66E9E42F6F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtDb5L_uNOuR for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2641E42FD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2641E42FD4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 228F786780; Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 10:51:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ebe1efd0a1cb31684ff259fd2cf4823f2bfb8de6
X-Git-Newrev: ea3f2d9f93a782e9f0decfb132fe50d2577197f5
X-Patchwork-Hint: ignore
Message-Id: <20250228163033.228F786780@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/raspberrypizero2w_64:
 new defconfig
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4234734581479973701=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4234734581479973701==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ea3f2d9f93a782e9f0decfb132fe50d2577197f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This configuration builds an image for the Raspberry Pi Zero 2 W
(64-bit).

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/raspberrypi/config_zero2w_64bit.txt | 29 ++++++++++++++++++++++++++++
 board/raspberrypi/readme.txt              |  4 ++++
 board/raspberrypizero2w-64                |  1 +
 configs/raspberrypizero2w_64_defconfig    | 32 +++++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/board/raspberrypi/config_zero2w_64bit.txt b/board/raspberrypi/config_zero2w_64bit.txt
new file mode 100644
index 0000000000..bbd8b69363
--- /dev/null
+++ b/board/raspberrypi/config_zero2w_64bit.txt
@@ -0,0 +1,29 @@
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
+# Enable UART0 for serial console on ttyAMA0
+dtoverlay=miniuart-bt
+
+# enable 64bits support
+arm_64bit=1
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 81cd81a7f3..64f0e2a26f 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -37,6 +37,10 @@ For model Zero 2 W (model B3 in smaller form factor):
 
   $ make raspberrypizero2w_defconfig
 
+For model Zero 2 W (model B3 in smaller form factor, 64-bit):
+
+  $ make raspberrypizero2w_64_defconfig
+
 For model 2 B:
 
   $ make raspberrypi2_defconfig
diff --git a/board/raspberrypizero2w-64 b/board/raspberrypizero2w-64
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypizero2w-64
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypizero2w_64_defconfig b/configs/raspberrypizero2w_64_defconfig
new file mode 100644
index 0000000000..dcb8472671
--- /dev/null
+++ b/configs/raspberrypizero2w_64_defconfig
@@ -0,0 +1,32 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w-64/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypizero2w-64/config_zero2w_64bit.txt"
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

--===============4234734581479973701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4234734581479973701==--
