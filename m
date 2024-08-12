Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3756BC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 17:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86B2B80B15;
	Mon, 12 Aug 2024 17:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RB2NCui66eUS; Mon, 12 Aug 2024 17:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D76E80B19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D76E80B19;
	Mon, 12 Aug 2024 17:04:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EEA11BF59C
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 17:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B10980B15
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 17:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iiFdW8Tv4Jcz for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 17:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA32F80AF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA32F80AF9
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA32F80AF9
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 17:04:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47CH4nIN001580
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 12:04:49 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47CH4nxf109452
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 12:04:49 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Aug 2024 12:04:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Aug 2024 12:04:49 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47CH4nau058462;
 Mon, 12 Aug 2024 12:04:49 -0500
Date: Mon, 12 Aug 2024 12:04:47 -0500
MIME-Version: 1.0
Message-ID: <20240812-am62px-v1-1-9d16fa5a13fa@ti.com>
X-B4-Tracking: v=1; b=H4sIAK5AumYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyML3cRcM6OCCt2U5EQLw9Rky8QkAxMloOKCotS0zAqwQdGxtbUAfog
 v2FgAAAA=
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9224; i=bb@ti.com;
 h=from:subject:message-id; bh=W7JGM/vMGra0DCdX2N6EvgbvSqYUU30DigOvKKDjyU8=;
 b=owNCWmg5MUFZJlNZwiCaaAAAZH/////dP7v2/1bn7u933R33YS+/+s5+r/99fLkv/5/5v/ewA
 RsWEPUABoABkaAAAaeoyGgGgBoAAADQBkBpoNAGmgAAAAGnqYRpmoe1NT9UQAaANB5QGmgABkAa
 aaZANGgAAwgaepoGjQaaGQDQwgeoBp6gHkmg0GIaAAxRk0aNAaAADTIBppk0AHqDQGIGgMIBkAy
 MjQAaaANAB6mgDTQAaGJtTTIBYvPcjYywLuCEY7hOY9Wvky32SGztUEa+XV5eAJFQyWApmSshpa
 CzzBcfQuHGYydYzMogaidbBxUzKEslINkaArD4+e9MIqnDpPVxQAiajnWlXIMT28TRAMLYWCtAC
 XTYMco8CgsMyepUh9A/yuahj7TWrbtHcCClP6hTU5djhdsiyGRpSR2IXHzVUGBB5yEbLCOL+aQU
 t5suEoV/q/3fbYxXWqIFxPOidVecq5t6eRnM9RBarKHWJDMW/QZiG6GM0PQ68lNlPwMBd5FieyJ
 wyvZWAvXMUEaTgFbBrlAi21CaB9Ser9l7y2B8oGCPEio6Pu1n/sI+xos69Lk16XGbfcH0iwIFb1
 iDvgqtCJefCMmERBAqVtixR2iEzcYmb8xaDpLh8F1CAgkIUPyTddRAv8b/YdmpT9cJBWh+Kmg+Y
 wWQ6P/i7kinChIYRBNNAA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1723482289;
 bh=kOkweqDlOkIPEufnx8sIUMIAsvItYGUjfe6iXHLyDJQ=;
 h=From:Date:Subject:To:CC;
 b=nEx5pojiE1lrKpc8h8KXPcd/P69SmvAKtd9MGarq1s7valgBGlsdr/CAJ5UQiWfLB
 FIrK3gokHrBL+7KHdfFm4Xolzm5nR7MOsqddlldcikzo2kZi6nDdnZP9Q5r2o4nLCh
 ekNYOt9EzwRUYpyDsT5QiurFiO7qmlawz/wdvO6I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=nEx5poji
Subject: [Buildroot] [PATCH] configs/ti_am62px_sk_defconfig: add initial
 support
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

Introduce the initial base-port support for the SK-AM62P reference board
made by Texas Instruments.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Hello everyone,

The SK-AM62P is an extension of the existing AM62x lost-cost family of 
application processors built for Automotive and Linux Application 
development. Sporting scalable ARM Cortex-A53s and embedded features 
such as: multi high-definition display support, 3D-graphics
acceleration, 4K video acceleration, and extensive peripherals make the
AM62Px well-suited for a broad range of automation and industrial
application, including automotive digital instrumentation, automotive
displays, industrial HMI, and more.

Some highlights of AM62P SoC are:

* Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster. 
  Dual/Single core variants are provided in the same package to allow HW 
  compatible designs.
* One Device manager Cortext-R5F for system power and resource
  management, and one Cortex-R5F for Functional Safety or
  general-purpose usage.
* One 3D GPU up to 50 GLFOPS
* H.264/H.265 Video Encode/Decode.
* Display support: 3x display support over OLDI/LVDS (1x OLDI-DL, 1x or
  2x OLDI-SL), DSI, or DPI. Up to 3840x1080@60fps resolution
* Integrated Giga-bit Ethernet switch supporting up to a total of two 
  external ports (TSN capable).
* 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3xMMC and SD, GPMC for 
  NAND/FPGA connection, OSPI memory controller, 3xMcASP for audio, 
  1xCSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other peripherals.
* Dedicated Centralized Hardware Security Module with support for secure 
  boot, debug security and crypto acceleration and trusted execution 
  environment.
* One 32-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
* Multiple low power modes support, ex: Deep sleep, Standby, MCU-only, 
  enabling battery powered system design.

For those interested, more details about this SoC can be found in the
Technical Reference Manual here:

     https://www.ti.com/lit/pdf/spruj83

Thanks for reviewing
~Bryan
---
 DEVELOPERS                                         |  1 +
 board/ti/am62px-sk/genimage.cfg                    | 33 ++++++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/ti/am62px-sk/patches/linux/linux.hash        |  2 +
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  1 +
 board/ti/am62px-sk/patches/uboot/uboot.hash        |  2 +
 board/ti/am62px-sk/readme.txt                      | 37 +++++++++++++++++
 configs/ti_am62px_sk_defconfig                     | 46 ++++++++++++++++++++++
 9 files changed, 125 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af35431b7..3f964d65e45cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -569,6 +569,7 @@ F:	boot/ti-k3-boot-firmware/
 F:	boot/ti-k3-r5-loader/
 F:	configs/beagleplay_defconfig
 F:	configs/ti_am62ax_sk_defconfig
+F:	configs/ti_am62px_sk_defconfig
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
 
diff --git a/board/ti/am62px-sk/genimage.cfg b/board/ti/am62px-sk/genimage.cfg
new file mode 100644
index 0000000000000..b0a1bee8b991b
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
index 0000000000000..8b77e1f1653a4
--- /dev/null
+++ b/board/ti/am62px-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/ti/am62px-sk/patches/linux-headers/linux-headers.hash b/board/ti/am62px-sk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000000..5808d92afe890
--- /dev/null
+++ b/board/ti/am62px-sk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/ti/am62px-sk/patches/linux/linux.hash b/board/ti/am62px-sk/patches/linux/linux.hash
new file mode 100644
index 0000000000000..53eb1438945bc
--- /dev/null
+++ b/board/ti/am62px-sk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
diff --git a/board/ti/am62px-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62px-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 120000
index 0000000000000..b89e91d3e8819
--- /dev/null
+++ b/board/ti/am62px-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1 @@
+../uboot/uboot.hash
\ No newline at end of file
diff --git a/board/ti/am62px-sk/patches/uboot/uboot.hash b/board/ti/am62px-sk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000000..fe9b4f53dc639
--- /dev/null
+++ b/board/ti/am62px-sk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/board/ti/am62px-sk/readme.txt b/board/ti/am62px-sk/readme.txt
new file mode 100644
index 0000000000000..1b66c6ba77c65
--- /dev/null
+++ b/board/ti/am62px-sk/readme.txt
@@ -0,0 +1,37 @@
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
index 0000000000000..4937fb704cc11
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

---
base-commit: 74b46d08da7adc49b01f7af7ebb9e1421b8a9362
change-id: 20240628-am62px-dca81ec9ab04

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
