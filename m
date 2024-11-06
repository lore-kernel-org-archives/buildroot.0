Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B49D59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E192240241;
	Wed,  6 Nov 2024 21:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id um7SL6R_ip7Y; Wed,  6 Nov 2024 21:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C9B7401A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C9B7401A2;
	Wed,  6 Nov 2024 21:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87ACBB8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 676426062E
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QT3PSI5oHlnP for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC0F660610
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC0F660610
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:52:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E43ED85EAC; Wed,  6 Nov 2024 21:52:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 22:51:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c679a44b31c333a958dec903a12ffb8adc4e58f2
X-Git-Newrev: 3b72a34f5b82c60931e1f445fc18ff26a61520e2
X-Patchwork-Hint: ignore
Message-Id: <20241106215212.E43ED85EAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62px_sk_defconfig: add
 initial support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b72a34f5b82c60931e1f445fc18ff26a61520e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce the initial base-port support for the SK-AM62P reference board
made by Texas Instruments.

Signed-off-by: Bryan Brattlof <bb@ti.com>
[Arnout: extend explanation of tiboot3.bin]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 board/ti/am62px-sk/genimage.cfg                    | 33 ++++++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/ti/am62px-sk/patches/linux/linux.hash        |  2 +
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  1 +
 board/ti/am62px-sk/patches/uboot/uboot.hash        |  2 +
 board/ti/am62px-sk/readme.txt                      | 39 ++++++++++++++++++
 configs/ti_am62px_sk_defconfig                     | 46 ++++++++++++++++++++++
 9 files changed, 127 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5beaf54ffb..39b9b12534 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -567,6 +567,7 @@ F:	boot/ti-k3-boot-firmware/
 F:	boot/ti-k3-r5-loader/
 F:	configs/beagleplay_defconfig
 F:	configs/ti_am62ax_sk_defconfig
+F:	configs/ti_am62px_sk_defconfig
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
 
diff --git a/board/ti/am62px-sk/genimage.cfg b/board/ti/am62px-sk/genimage.cfg
new file mode 100644
index 0000000000..b0a1bee8b9
--- /dev/null
+++ b/board/ti/am62px-sk/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img",
+			"k3-am62p5-sk.dtb",
+			"Image"
+		}
+
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
+		}
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/ti/am62px-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62px-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..8b77e1f165
--- /dev/null
+++ b/board/ti/am62px-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/ti/am62px-sk/patches/linux-headers/linux-headers.hash b/board/ti/am62px-sk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/ti/am62px-sk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/ti/am62px-sk/patches/linux/linux.hash b/board/ti/am62px-sk/patches/linux/linux.hash
new file mode 100644
index 0000000000..53eb143894
--- /dev/null
+++ b/board/ti/am62px-sk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
diff --git a/board/ti/am62px-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62px-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 120000
index 0000000000..b89e91d3e8
--- /dev/null
+++ b/board/ti/am62px-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1 @@
+../uboot/uboot.hash
\ No newline at end of file
diff --git a/board/ti/am62px-sk/patches/uboot/uboot.hash b/board/ti/am62px-sk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/ti/am62px-sk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/board/ti/am62px-sk/readme.txt b/board/ti/am62px-sk/readme.txt
new file mode 100644
index 0000000000..a20911c354
--- /dev/null
+++ b/board/ti/am62px-sk/readme.txt
@@ -0,0 +1,39 @@
+Texas Instuments SK-AM62P5 Test and Development Board
+
+Description
+===========
+
+This configuration will build a complete image for the TI SK-AM62P
+board: https://www.ti.com/tool/SK-AM62P.
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+$ make ti_am62px_sk_defconfig
+
+Optional: modify the configuration:
+
+$ make menuconfig
+
+IMPORTANT: make sure to use the tiboot3 firmware that match with the TI
+K3 SoC boot ROM (tiboot3-am62px-{hs-fs/hs}-evm.bin) used on the board.
+Use the BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN to name which tiboot3.bin
+security variant we want to use.
+
+Build:
+
+$ make
+
+To copy the resultimg output image file to an SD card use dd:
+
+$ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+How to Run
+==========
+
+Insert the SD card into the SK-AM62P board, and power it up through the
+USB Type-C connector. The system should come up. You can use a
+micro-USB cable to connect to the connector labeled UART to
+communicate with the board.
diff --git a/configs/ti_am62px_sk_defconfig b/configs/ti_am62px_sk_defconfig
new file mode 100644
index 0000000000..4937fb704c
--- /dev/null
+++ b/configs/ti_am62px_sk_defconfig
@@ -0,0 +1,46 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am62px-sk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am62p5-sk.dtb -l am62px-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62px-sk/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am62p5-sk"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62px"
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62px_evm_r5"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62px_evm_a53"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
