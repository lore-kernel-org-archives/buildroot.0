Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A08AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00B2B845D0;
	Fri, 12 Jul 2024 08:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uaa6nUXxVsMY; Fri, 12 Jul 2024 08:17:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EDD6845C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EDD6845C7;
	Fri, 12 Jul 2024 08:17:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 824F31BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FA7B60AC3
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HGGeFbcUU1oo for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 398A160AB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 398A160AB1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:16:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22FC885BE6; Fri, 12 Jul 2024 08:16:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 10:11:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c981800251f984d41594aa86b2fc471511b880ac
X-Git-Newrev: 1eb7d2b8600e08a553aab84b2767c67e72da7904
X-Patchwork-Hint: ignore
Message-Id: <20240712081657.22FC885BE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/beagleboard: add initial support for
 the beagleplay
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1eb7d2b8600e08a553aab84b2767c67e72da7904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the initial baseport level support for The BeagleBoard.org
Foundation's BeaglePlay board.

Signed-off-by: Bryan Brattlof <bb@ti.com>
Tested-by: Paresh Bhagat <p-bhagat@ti.com>
[Romain: use BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                         |  2 +
 board/beagleboard/beagleplay/extlinux.conf         |  5 ++
 board/beagleboard/beagleplay/genimage.cfg          | 39 +++++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../beagleplay/patches/linux/linux.hash            |  2 +
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  2 +
 .../beagleplay/patches/uboot/uboot.hash            |  2 +
 board/beagleboard/beagleplay/post-build.sh         |  5 ++
 board/beagleboard/beagleplay/readme.txt            | 39 +++++++++++++++
 configs/beagleplay_defconfig                       | 55 ++++++++++++++++++++++
 11 files changed, 154 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f8c33fb5b..0faad55f97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -559,8 +559,10 @@ F:	package/pdmenu/
 
 N:	Bryan Brattlof <bb@ti.com>
 F:	board/ti/
+F:	board/beagleboard/beagleplay/
 F:	boot/ti-k3-boot-firmware/
 F:	boot/ti-k3-r5-loader/
+F:	configs/beagleplay_defconfig
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
 
diff --git a/board/beagleboard/beagleplay/extlinux.conf b/board/beagleboard/beagleplay/extlinux.conf
new file mode 100644
index 0000000000..2b3aa7349e
--- /dev/null
+++ b/board/beagleboard/beagleplay/extlinux.conf
@@ -0,0 +1,5 @@
+label beagleplay-buildroot
+    kernel /Image
+    fdtdir /
+    devicetree /k3-am625-beagleplay.dtb
+    append console=ttyS2,115200n8 root=/dev/mmcblk1p2 rw rootfstype=ext4 rootwait earlycon=ns16550a,mmio32,0x02800000
diff --git a/board/beagleboard/beagleplay/genimage.cfg b/board/beagleboard/beagleplay/genimage.cfg
new file mode 100644
index 0000000000..4b516dc714
--- /dev/null
+++ b/board/beagleboard/beagleplay/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+        vfat {
+            files = {
+                    "Image",
+                    "k3-am625-beagleplay.dtb",
+                    "tiboot3.bin",
+            }
+
+            file tispl.bin {
+                    image = tispl.bin_unsigned
+            }
+
+            file u-boot.img {
+                    image = u-boot.img_unsigned
+            }
+
+            file extlinux/extlinux.conf {
+                    image = extlinux.conf
+            }
+        }
+
+        size = 64M
+}
+
+image sdcard.img {
+        hdimage {
+        }
+
+        partition u-boot {
+                partition-type = 0xC
+                bootable = "true"
+                image = "boot.vfat"
+        }
+
+        partition rootfs {
+                partition-type = 0x83
+                image = "rootfs.ext4"
+        }
+}
diff --git a/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..02714d06a0
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagleplay/patches/linux/linux.hash b/board/beagleboard/beagleplay/patches/linux/linux.hash
new file mode 100644
index 0000000000..a53ec1f4e7
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  24fa01fb989c7a3e28453f117799168713766e119c5381dac30115f18f268149  linux-6.9.tar.xz
diff --git a/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/beagleboard/beagleplay/patches/uboot/uboot.hash b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/beagleboard/beagleplay/post-build.sh b/board/beagleboard/beagleplay/post-build.sh
new file mode 100755
index 0000000000..f11dc6c313
--- /dev/null
+++ b/board/beagleboard/beagleplay/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh -x
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux.conf
diff --git a/board/beagleboard/beagleplay/readme.txt b/board/beagleboard/beagleplay/readme.txt
new file mode 100644
index 0000000000..eed87e6d3c
--- /dev/null
+++ b/board/beagleboard/beagleplay/readme.txt
@@ -0,0 +1,39 @@
+BeagleBoard's BeaglePlay
+
+Description
+===========
+
+This configuration will build a complete image for the BeaglePlay
+board: https://www.beagleboard.org/boards/beagleplay
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+    $ make beagleplay_defconfig
+
+Optional: modify the configuration:
+
+    $ make menuconfig
+
+NOTE: The AM625x processor has multiple security variants. You must
+ensure the matching tiboot3.bin is uses or the board will not boot.
+The BeaglePlay uses the General Purpose (GP) variant, ensure you use
+the tiboot3-am62x-gp-evm.bin
+
+Build:
+
+    $ make
+
+To copy the resultimg output image file to an SD card use dd:
+
+    $ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+How to Run
+==========
+
+This configuration has both the boot/ and root/ partitions which is
+capable of booting from the bootloaders embedded in the eMMC as well
+as when using holding the USR button to boot from the SD card.
+
diff --git a/configs/beagleplay_defconfig b/configs/beagleplay_defconfig
new file mode 100644
index 0000000000..19b12825c5
--- /dev/null
+++ b/configs/beagleplay_defconfig
@@ -0,0 +1,55 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleplay/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleplay/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/beagleboard/beagleplay/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-beagleplay"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
+BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_WILC3000_FIRMWARE=y
+BR2_PACKAGE_WILINK_BT_FIRMWARE=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_beagleplay_r5"
+BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_beagleplay_a53"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.img_unsigned"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin_unsigned"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
