Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906DCC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 21:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0CF181EA3;
	Mon, 24 Jun 2024 21:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJmA-j7d4vFw; Mon, 24 Jun 2024 21:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DA2E81EA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DA2E81EA7;
	Mon, 24 Jun 2024 21:16:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7189F1BF255
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 21:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EC5C81EA7
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 21:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFCIw0Ft7soV for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 21:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F036381EA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F036381EA3
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F036381EA3
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 21:16:46 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45OLGjaI050297
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 16:16:45 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45OLGjW0076097
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 16:16:45 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jun 2024 16:16:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jun 2024 16:16:45 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45OLGjMX081436;
 Mon, 24 Jun 2024 16:16:45 -0500
Date: Mon, 24 Jun 2024 16:16:44 -0500
MIME-Version: 1.0
Message-ID: <20240624-play-v1-1-3c47a69614de@ti.com>
X-B4-Tracking: v=1; b=H4sIADvieWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0NT3YKcxEpdE4PUtNQky0QjE/MkJaDSgqLUtMwKsDHRsbW1AC/Npjl
 WAAAA
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1719263805;
 bh=GrY5n3gt1va0lgooEjNw2lAmZ40i6ZF3kz3P3OXx9CQ=;
 h=From:Date:Subject:To:CC;
 b=Z6cHxdt0iUCxy/ltTHHklcXC8+UrDWqzAZvXyYtZ2+Cyk5pBy59kP014EU3P7nj26
 7726sEt1rK+V7xwGANWC5wjKDAAt770nib8UBABi2fcY+y2j1JAUx4tChyp6cd7bnY
 MtN+cWiYODL4xiCiQjnu3ssDKVvutpMUbVK8X5e0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Z6cHxdt0
Subject: [Buildroot] [PATCH] board/beagleboard: add initial support for the
 beagleplay
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the initial baseport level support for The BeagleBoard.org
Foundation's BeaglePlay board.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Hello everyone,

This small series adds basic support for the BeaglePlay. My end-goal is 
to get the home-assistant OS build for this. First step is the bsp
support. ;)

Thanks for reviewing
~Bryan
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
 configs/beagleplay_defconfig                       | 56 ++++++++++++++++++++++
 11 files changed, 155 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a5cceba78ee1..afcfe92cc1a7d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -557,8 +557,10 @@ F:	package/pdmenu/
 
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
index 0000000000000..2b3aa7349e8c0
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
index 0000000000000..4b516dc714668
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
index 0000000000000..02714d06a09c0
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000000..5808d92afe890
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagleplay/patches/linux/linux.hash b/board/beagleboard/beagleplay/patches/linux/linux.hash
new file mode 100644
index 0000000000000..a53ec1f4e7f15
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  24fa01fb989c7a3e28453f117799168713766e119c5381dac30115f18f268149  linux-6.9.tar.xz
diff --git a/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000000..97a2b4eaf95ba
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/beagleboard/beagleplay/patches/uboot/uboot.hash b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
new file mode 100644
index 0000000000000..97a2b4eaf95ba
--- /dev/null
+++ b/board/beagleboard/beagleplay/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/beagleboard/beagleplay/post-build.sh b/board/beagleboard/beagleplay/post-build.sh
new file mode 100755
index 0000000000000..f11dc6c313100
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
index 0000000000000..eed87e6d3cb95
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
index 0000000000000..f7a02b33234ab
--- /dev/null
+++ b/configs/beagleplay_defconfig
@@ -0,0 +1,56 @@
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
+BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="am62x"
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

---
base-commit: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
change-id: 20240615-play-40efeb9a247b

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
