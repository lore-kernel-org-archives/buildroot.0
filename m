Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBFAC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:01:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BEA161078
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BEA161078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 737FF8427E;
	Wed,  4 Aug 2021 00:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7FR1PuHIDEsK; Wed,  4 Aug 2021 00:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 888A184158;
	Wed,  4 Aug 2021 00:01:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6451BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 954A840617
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBiFcRf2IzsJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5C844065A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 49942860D3; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 21:27:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a7ca24784a8d5248eee24462b7148f121405845e
X-Git-Newrev: 4c9bc44534f6739ade2f55fe04a96f1024f76681
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.49942860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/kontron_pitx_imx8m:
 new defconfig
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4747657733413262041=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4747657733413262041==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4c9bc44534f6739ade2f55fe04a96f1024f76681
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998@free.fr: drop "exit $?" in post-image.sh]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                             |  2 +
 board/kontron/pitx-imx8m/boot.cmd      |  8 ++++
 board/kontron/pitx-imx8m/genimage.cfg  | 16 ++++++++
 board/kontron/pitx-imx8m/post-build.sh |  4 ++
 board/kontron/pitx-imx8m/post-image.sh |  3 ++
 board/kontron/pitx-imx8m/readme.txt    | 74 ++++++++++++++++++++++++++++++++++
 configs/kontron_pitx_imx8m_defconfig   | 54 +++++++++++++++++++++++++
 7 files changed, 161 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98dde8773b..2a69f88299 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1121,6 +1121,8 @@ F:	package/python-sip/
 F:	package/uhd/
 
 N:	Heiko Thiery <heiko.thiery@gmail.com>
+F:	board/kontron/pitx-imx8m/
+F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
 F:	package/ipmitool/
 F:	package/libnetconf2/
diff --git a/board/kontron/pitx-imx8m/boot.cmd b/board/kontron/pitx-imx8m/boot.cmd
new file mode 100644
index 0000000000..4d89235392
--- /dev/null
+++ b/board/kontron/pitx-imx8m/boot.cmd
@@ -0,0 +1,8 @@
+echo "Root File Sytem on MMC${devnum}"
+setenv rootfs /dev/mmcblk${devnum}p1
+setenv bootargs root=${rootfs} rootwait rw ${extrabootargs}
+
+load ${devtype} ${devnum} ${kernel_addr_r} boot/Image
+load ${devtype} ${devnum} ${fdt_addr_r} boot/imx8mq-kontron-pitx-imx8m.dtb
+
+booti ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
new file mode 100644
index 0000000000..c335b0c026
--- /dev/null
+++ b/board/kontron/pitx-imx8m/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition imx-boot {
+		in-partition-table = "no"
+		image = "imx8-boot-sd.bin"
+		offset = 33k
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 8M
+	}
+}
diff --git a/board/kontron/pitx-imx8m/post-build.sh b/board/kontron/pitx-imx8m/post-build.sh
new file mode 100755
index 0000000000..4574221fe5
--- /dev/null
+++ b/board/kontron/pitx-imx8m/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+mkdir -p $TARGET_DIR/boot/
+cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/kontron/pitx-imx8m/post-image.sh b/board/kontron/pitx-imx8m/post-image.sh
new file mode 100755
index 0000000000..564211c829
--- /dev/null
+++ b/board/kontron/pitx-imx8m/post-image.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+support/scripts/genimage.sh -c $(dirname $0)/genimage.cfg
diff --git a/board/kontron/pitx-imx8m/readme.txt b/board/kontron/pitx-imx8m/readme.txt
new file mode 100644
index 0000000000..7c85dd4377
--- /dev/null
+++ b/board/kontron/pitx-imx8m/readme.txt
@@ -0,0 +1,74 @@
+Kontron pitx-imx8m
+==================
+
+https://www.kontron.com/produkte/pitx-imx8m/p155258
+
+
+How to build it
+===============
+
+Configure buildroot:
+
+  $ make kontron_pitx_imx8m_defconfig
+
+Change settings to fit your needs (optional):
+
+  $ make menuconfig
+
+Compile everything and buildr the rootfs image:
+
+  $ make
+
+
+Result of the build
+===================
+
+After building, the output/images directory contains:
+
+  output/images/
+    ├── bl31.bin
+    ├── boot.scr
+    ├── ddr_fw.bin
+    ├── Image
+    ├── imx8-boot-sd.bin
+    ├── imx8mq-kontron-pitx-imx8m.dtb
+    ├── lpddr4_pmu_train_fw.bin
+    ├── rootfs.ext2
+    ├── rootfs.ext4 -> rootfs.ext2
+    ├── rootfs.tar
+    ├── sdcard.img
+    ├── signed_hdmi_imx8m.bin
+    ├── u-boot.bin
+    ├── u-boot.itb
+    ├── u-boot-nodtb.bin
+    ├── u-boot-spl.bin
+    └── u-boot-spl-ddr.bin
+
+
+Flashing the SD card image
+==========================
+
+To install the image on a SDCard simply copy sdcard.img to the storage (e.g. SD, eMMC)
+
+  $ sudo dd if=output/images/sdcard.img of=<your-sd-device>
+
+
+Preparing the board
+===================
+
+ * Connect a serial line to the board
+ * Insert the SD card
+ * Make sure the boot source selection DIP switches are set correctly
+  * SW1 1-4 OFF
+  * SW1 2-3 OFF
+ * Power-up the board
+
+
+Booting the board
+=================
+
+By default the bootloader will search for the first valid image, starting
+with the internal eMMC. To make sure the bootloader loads bootscript from
+the correct location (SD card) set the boot_targets environment variable:
+
+  $ setenv boot_targets mmc1
diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
new file mode 100644
index 0000000000..4053e1e398
--- /dev/null
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -0,0 +1,54 @@
+# Architecture
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/kontron/pitx-imx8m/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/kontron/pitx-imx8m/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/pitx-imx8mq.dtb"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+
+# Bootloader
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://gitlab.kontron.com/imx/u-boot-imx/-/archive/PITX-IMX8M-R12/u-boot-imx-PITX-IMX8M-R12.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pitx-imx8m"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_SPL=y
+
+# Required host tools to create the SD/eMMC image
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/kontron/pitx-imx8m/boot.cmd"

--===============4747657733413262041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4747657733413262041==--
