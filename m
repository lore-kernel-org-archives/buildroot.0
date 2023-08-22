Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7043EC873B
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E0D983A41;
	Thu,  7 Sep 2023 15:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E0D983A41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A24x_7GPHrub; Thu,  7 Sep 2023 15:31:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0C3183B30;
	Thu,  7 Sep 2023 15:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0C3183B30
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CDC21BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ACC741D9D
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ACC741D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXtRtLvFtKo3 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A93541D6B
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A93541D6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 979F386A1F; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 12:01:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52ce606c05ee3ac869f8087292bc3dbb0d25b79b
X-Git-Newrev: 6b2329bb806b6eacc87a88d5a930d8c4d88b4984
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.979F386A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am64x_sk: new defconfig
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
Content-Type: multipart/mixed; boundary="===============6933805539428348132=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6933805539428348132==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6b2329bb806b6eacc87a88d5a930d8c4d88b4984
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for TI's SK-AM64 board by introducing the
ti_am64x_sk_defconfig file and related support files.

More information about the board can be found at:
https://www.ti.com/tool/SK-AM64

Signed-off-by: Xuanhao Shi <x-shi@ti.com>
Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Acked-by: Andrew Davis <afd@ti.com>
Tested-by: Bryan Brattlof <bb@ti.com>
Cc: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  4 ++++
 board/ti/am64x-sk/genimage.cfg | 27 +++++++++++++++++++++++++++
 board/ti/am64x-sk/readme.txt   | 34 ++++++++++++++++++++++++++++++++++
 configs/ti_am64x_sk_defconfig  | 42 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a10bb44cd..679aeb89d5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -132,9 +132,11 @@ F:	package/libxmlrpc/
 F:	package/python-docopt/
 
 N:	Anand Gadiyar <gadiyar@ti.com>
+F:	board/ti/am64x-sk/
 F:	boot/ti-k3-boot-firmware/
 F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
+F:	configs/ti_am64x_sk_defconfig
 
 N:	André Zwing <nerv@dawncrow.de>
 F:	package/libkrb5/
@@ -3116,9 +3118,11 @@ N:	Wojciech Niziński <niziak@spox.org>
 F:	package/fwup/
 
 N:	Xuanhao Shi <X15000177@gmail.com>
+F:	board/ti/am64x-sk/
 F:	boot/ti-k3-boot-firmware/
 F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
+F:	configs/ti_am64x_sk_defconfig
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/board/ti/am64x-sk/genimage.cfg b/board/ti/am64x-sk/genimage.cfg
new file mode 100644
index 0000000000..26304fe98f
--- /dev/null
+++ b/board/ti/am64x-sk/genimage.cfg
@@ -0,0 +1,27 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img",
+		}
+	}
+
+	size = 16M
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
diff --git a/board/ti/am64x-sk/readme.txt b/board/ti/am64x-sk/readme.txt
new file mode 100644
index 0000000000..5ddbb836ed
--- /dev/null
+++ b/board/ti/am64x-sk/readme.txt
@@ -0,0 +1,34 @@
+Texas Instuments SK-AM64 Test and Development Board
+
+Description
+===========
+
+This configuration will build a complete image for the TI SK-AM64
+board: https://www.ti.com/tool/SK-AM64.
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+$ make am64x_sk_defconfig
+
+Optional: modify the configuration:
+
+$ make menuconfig
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
+Insert the SD card into the SK-AM62 board, and power it up through the
+USB Type-C connector. The system should come up. You can use a
+micro-USB cable to connect to the connector labeled DEBUG CONSOLE to
+communicate with the board.
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
new file mode 100644
index 0000000000..052c440093
--- /dev/null
+++ b/configs/ti_am64x_sk_defconfig
@@ -0,0 +1,42 @@
+BR2_aarch64=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_TI_K3_IMAGE_GEN=y
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
+BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP=y
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y

--===============6933805539428348132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6933805539428348132==--
