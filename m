Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD76C4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B77160A70;
	Mon, 12 Feb 2024 21:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DutU63g5uSpv; Mon, 12 Feb 2024 21:45:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8D8360A7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8D8360A7B;
	Mon, 12 Feb 2024 21:45:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00F3F1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC4AD81F5C
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMSLX-BHFGRN for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A28A81FBB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A28A81FBB
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 157CC878C1; Mon, 12 Feb 2024 21:45:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 22:44:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 202e35e4b68a6bb8e891b3ec068ca09f67963c59
X-Git-Newrev: c05f27c8ae46cc6d9236a30d51f854f221d55ff6
X-Patchwork-Hint: ignore
Message-Id: <20240212214541.157CC878C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/freescale_imx93evk: new defconfig
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7354702520520462931=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7354702520520462931==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c05f27c8ae46cc6d9236a30d51f854f221d55ff6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for the NXP i.MX 93 11x11 EVK board [1].

[1] https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-93-evaluation-kit:i.MX93EVK

Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>
[Julien: tested on NXP board i.MX93EVK, cpu rev A1, board rev B]
Reviewed-by: Gary Bisson <bisson.gary@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
[Arnout:
 - Fix shellcheck errors.
 - Add hash files for ATF, linux, U-Boot.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../common/imx/genimage.cfg.template_imx9          | 42 ++++++++++++
 .../common/imx/imx9-bootloader-prepare.sh          | 43 ++++++++++++
 board/freescale/common/imx/post-image.sh           |  4 ++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/freescale/imx93evk/patches/linux/linux.hash  |  3 +
 board/freescale/imx93evk/patches/uboot/uboot.hash  |  2 +
 board/freescale/imx93evk/readme.txt                | 77 ++++++++++++++++++++++
 configs/freescale_imx93evk_defconfig               | 40 +++++++++++
 9 files changed, 214 insertions(+)

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx9 b/board/freescale/common/imx/genimage.cfg.template_imx9
new file mode 100644
index 0000000000..df7ddc25b7
--- /dev/null
+++ b/board/freescale/common/imx/genimage.cfg.template_imx9
@@ -0,0 +1,42 @@
+# Minimal SD card image for the NXP i.MX9 boards
+#
+# We mimic the .sdcard NXP's image format:
+# * the SD card must have 32 kB free space at the beginning,
+# * U-Boot is integrated into imx9-boot-sd.bin and is dumped as is,
+# * a FAT partition at offset 8MB is containing Image and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+	vfat {
+		label = "boot"
+		files = {
+			%FILES%
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
+	partition imx-boot {
+		in-partition-table = "no"
+		image = "imx9-boot-sd.bin"
+		offset = %IMXOFFSET%
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 8M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/freescale/common/imx/imx9-bootloader-prepare.sh b/board/freescale/common/imx/imx9-bootloader-prepare.sh
new file mode 100755
index 0000000000..a9611a81bd
--- /dev/null
+++ b/board/freescale/common/imx/imx9-bootloader-prepare.sh
@@ -0,0 +1,43 @@
+#!/usr/bin/env bash
+
+main ()
+{
+	SPL_LOAD_ADDR=0x2049A000
+	ATF_LOAD_ADDR=0x204E0000
+	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91=y$" "${BR2_CONFIG}"; then
+		SPL_LOAD_ADDR=0x204A0000
+		ATF_LOAD_ADDR=0x204C0000
+	fi
+
+	dd if="${BINARIES_DIR}/u-boot-spl.bin" of="${BINARIES_DIR}/u-boot-spl-padded.bin" bs=4 conv=sync
+	cat "${BINARIES_DIR}/u-boot-spl-padded.bin" "${BINARIES_DIR}/ddr_fw.bin" > "${BINARIES_DIR}/u-boot-spl-ddr.bin"
+
+	"${HOST_DIR}/bin/mkimage_imx8" -commit > "${BINARIES_DIR}/mkimg.commit"
+	cat "${BINARIES_DIR}/u-boot.bin" "${BINARIES_DIR}/mkimg.commit" > "${BINARIES_DIR}/u-boot-hash.bin"
+	rm -f "${BINARIES_DIR}/mkimg.commit"
+
+	if grep -Eq "^BR2_TARGET_OPTEE_OS=y$" "${BR2_CONFIG}"; then
+		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
+			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
+			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
+			-ap "${BINARIES_DIR}/tee.bin" a35 0x96000000 \
+			-out "${BINARIES_DIR}/u-boot-atf-container.img" \
+	else
+		"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -c \
+			-ap "${BINARIES_DIR}/bl31.bin" a35 ${ATF_LOAD_ADDR} \
+			-ap "${BINARIES_DIR}/u-boot-hash.bin" a35 0x80200000 \
+			-out "${BINARIES_DIR}/u-boot-atf-container.img"
+	fi
+
+	"${HOST_DIR}/bin/mkimage_imx8" -soc IMX9 -append "${BINARIES_DIR}/ahab-container.img" -c \
+		-ap "${BINARIES_DIR}/u-boot-spl-ddr.bin" a35 ${SPL_LOAD_ADDR} \
+		-out "${BINARIES_DIR}/imx9-boot-sd.bin"
+
+	flashbin_size="$(wc -c "${BINARIES_DIR}/imx9-boot-sd.bin" | awk '{print $1}')"
+	pad_cnt=$(($((flashbin_size + 0x400 - 1)) / 0x400))
+	dd if="${BINARIES_DIR}/u-boot-atf-container.img" of="${BINARIES_DIR}/imx9-boot-sd.bin" bs=1K seek=${pad_cnt}
+
+	exit $?
+}
+
+main "$@"
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 638da4b86c..a440bfb75c 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -50,6 +50,10 @@ genimage_type()
 		echo "genimage.cfg.template_imx8"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91=y$" "${BR2_CONFIG}"; then
+		echo "genimage.cfg.template_imx9"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y$" "${BR2_CONFIG}"; then
+		echo "genimage.cfg.template_imx9"
 	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" "${BR2_CONFIG}"; then
 		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" "${BR2_CONFIG}"; then
 		    echo "genimage.cfg.template_no_boot_part_spl"
diff --git a/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..98f425a89e
--- /dev/null
+++ b/board/freescale/imx93evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cfb927722272897f850681c78d5f129b0883a8efaba9c52d30e029086524f7ff  imx-atf-lf-6.1.55-2.2.0.tar.gz
diff --git a/board/freescale/imx93evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx93evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx93evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx93evk/patches/linux/linux.hash b/board/freescale/imx93evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..5687ec7343
--- /dev/null
+++ b/board/freescale/imx93evk/patches/linux/linux.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  eb94414f952444289c0af8ad82afa0dc2d07e08f9000ccd2cc39f11da5b494ea  linux-imx-lf-6.1.55-2.2.0.tar.gz
+
diff --git a/board/freescale/imx93evk/patches/uboot/uboot.hash b/board/freescale/imx93evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..9bc17c3f6f
--- /dev/null
+++ b/board/freescale/imx93evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  64441ee5bf3d5011e7853c028d06211b6f0439d21e147a8f36972c95a07ae9ac  uboot-imx-lf-6.1.55-2.2.0.tar.gz
diff --git a/board/freescale/imx93evk/readme.txt b/board/freescale/imx93evk/readme.txt
new file mode 100644
index 0000000000..1173de39db
--- /dev/null
+++ b/board/freescale/imx93evk/readme.txt
@@ -0,0 +1,77 @@
+*********************
+NXP i.MX93 EVK board
+*********************
+
+This file documents the Buildroot support for the i.MX 93 EVK board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX 93 EVK board:
+
+  make freescale_imx93evk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - ahab-container.img
+  - bl31.bin
+  - boot.vfat
+  - ddr_fw.bin
+  - Image
+  - imx93-11x11-evk.dtb
+  - imx9-boot-sd.bin
+  - lpddr4_pmu_train_fw.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot-atf-container.img
+  - u-boot.bin
+  - u-boot-hash.bin
+  - u-boot-spl.bin
+  - u-boot-spl-ddr.bin
+  - u-boot-spl-padded.bin
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template_imx9.
+
+Boot the i.MX 93 EVK board
+===============================
+
+To boot your newly created system (refer to the i.MX 93 EVK Documentation
+[1] for guidance):
+- insert the SD card in the SD slot of the board;
+- Configure the switches as follows:
+SW1301: 0100 SW1301[1-4]
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Note: the debug USB connector presents 4 UARTs (for example /dev/ttyUSB[0-3]),
+the Cortex-A55 UART should be the 3rd one (in the previous example, /dev/ttyUSB2).
+Refer to the documentation [1] for more details.
+
+Enjoy!
+
+References
+==========
+[1] https://www.nxp.com/document/guide/getting-started-with-the-i-mx93-evk:GS-IMX93EVK
diff --git a/configs/freescale_imx93evk_defconfig b/configs/freescale_imx93evk_defconfig
new file mode 100644
index 0000000000..fa16967884
--- /dev/null
+++ b/configs/freescale_imx93evk_defconfig
@@ -0,0 +1,40 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx93evk/patches"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.55-2.2.0)/linux-imx-lf-6.1.55-2.2.0.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.55-2.2.0)/imx-atf-lf-6.1.55-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.55-2.2.0)/uboot-imx-lf-6.1.55-2.2.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y

--===============7354702520520462931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7354702520520462931==--
