Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18802C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC6ED4EF91;
	Fri, 28 Feb 2025 16:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dqf-0ZyJ33Sn; Fri, 28 Feb 2025 16:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 920B34AA55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 920B34AA55;
	Fri, 28 Feb 2025 16:32:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 051CE68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF17C6068F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOBbK07vaBj6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD7346FB2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD7346FB2B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D90C885E77; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 11:44:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bc31bb7cf2f8a62dff57a8d5ac41771df29c88e5
X-Git-Newrev: 4d2561e01ffcc0a0a80fe2fa009e7c0401738385
X-Patchwork-Hint: ignore
Message-Id: <20250228162940.D90C885E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi_zero2w:
 update BSP versions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d2561e01ffcc0a0a80fe2fa009e7c0401738385
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch to the new Linux LTS release 6.12.3. Switch to U-Boot 2024.10 and
ATF 2.11. Force check of hashes for Linux kernel, headers, U-Boot, ATF.
Finally, add BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash       | 4 ++--
 board/orangepi/orangepi-zero2w/patches/linux/linux.hash          | 4 ++--
 board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash          | 2 +-
 configs/orangepi_zero2w_defconfig                                | 9 +++++----
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b3df439a0..8b77e1f165 100644
--- a/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/orangepi/orangepi-zero2w/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/orangepi/orangepi-zero2w/patches/linux/linux.hash b/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
index 5a6f308c7b..aea771e7bf 100644
--- a/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
+++ b/board/orangepi/orangepi-zero2w/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  9e723232d603ab45ebf043c34714c48f277ab195c29abcb8472f2a4c3a5a1995  linux-6.8.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash b/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
index 97a2b4eaf9..904fa56c02 100644
--- a/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
+++ b/board/orangepi/orangepi-zero2w/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
index 9da9c94754..c2030b05c2 100644
--- a/configs/orangepi_zero2w_defconfig
+++ b/configs/orangepi_zero2w_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero2w/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero2W"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h618-orangepi-zero2w"
@@ -23,16 +23,17 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h616"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero2w"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
