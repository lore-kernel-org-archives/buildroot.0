Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90567C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5613B846B1;
	Fri, 28 Feb 2025 16:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDZ7fZO6I9K0; Fri, 28 Feb 2025 16:42:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AB04846C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AB04846C1;
	Fri, 28 Feb 2025 16:42:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1352C1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 783844274E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsFaDh6eVG9J for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4A9424EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B4A9424EF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D57284487; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Dec 2024 20:20:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 75320f567d3ac120002a21e3c2399ef2a3929b61
X-Git-Newrev: 1ae73f3dfa1d6104e417aff85fe4f2b30e2cfdc0
X-Patchwork-Hint: ignore
Message-Id: <20250228162943.7D57284487@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi_zero3: update
 BSP versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ae73f3dfa1d6104e417aff85fe4f2b30e2cfdc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch to:
 * Linux LTS 6.12.6
 * U-Boot 2024.10
 * ATF 2.11

Provide hashes for all above components and enable
BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Increase ext4 rootfs size to fit larger components.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                         |  1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  |  2 ++
 .../orangepi-zero3/patches/linux-headers/linux-headers.hash |  1 +
 board/orangepi/orangepi-zero3/patches/linux/linux.hash      |  2 ++
 board/orangepi/orangepi-zero3/patches/uboot/uboot.hash      |  2 ++
 configs/orangepi_zero3_defconfig                            | 13 ++++++++-----
 6 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1c1d0dab3a..0fedae0bb2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -202,7 +202,6 @@ configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-zero3/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/orangepi/orangepi-zero3/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..8b77e1f165
--- /dev/null
+++ b/board/orangepi/orangepi-zero3/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/orangepi/orangepi-zero3/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-zero3/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-zero3/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero3/patches/linux/linux.hash b/board/orangepi/orangepi-zero3/patches/linux/linux.hash
new file mode 100644
index 0000000000..80e573540f
--- /dev/null
+++ b/board/orangepi/orangepi-zero3/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  d450ab215de4e1f8bb85e0f4216760fa33fd024b4526b144f4ce0d9012b29c9e  linux-6.12.6.tar.xz
diff --git a/board/orangepi/orangepi-zero3/patches/uboot/uboot.hash b/board/orangepi/orangepi-zero3/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/orangepi/orangepi-zero3/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
index b42cd370f6..c6aa9c991a 100644
--- a/configs/orangepi_zero3_defconfig
+++ b/configs/orangepi_zero3_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero3/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero3"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
@@ -9,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.6"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h618-orangepi-zero3"
@@ -18,20 +20,21 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="130M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h616"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero3"
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
