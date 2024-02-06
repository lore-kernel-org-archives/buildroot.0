Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E2C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 08:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD9F24034D;
	Tue,  6 Feb 2024 08:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD9F24034D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IeBcLAou_GYt; Tue,  6 Feb 2024 08:08:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ABFA41D99;
	Tue,  6 Feb 2024 08:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ABFA41D99
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBFFA1BF2BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id A3EC641D6C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3EC641D6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id xdjRG9VLnjuR for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 08:08:35 +0000 (UTC)
Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com
 [203.205.221.221])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id B48FC41D99
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 08:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B48FC41D99
Received: from localhost.localdomain ([36.101.134.205])
 by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
 id 1F32BCBA; Tue, 06 Feb 2024 16:07:51 +0800
X-QQ-mid: xmsmtpt1707206872t4ywh8nhn
Message-ID: <tencent_3D7A01628C29BF242C6737C7FF6F4A3A3809@qq.com>
X-QQ-XMAILINFO: OZiGlmjmGvyhZwnUkkOcTveE2RBE8AOFid6FTDI1VV8rumQDROfyTNmi0ROp7y
 jV8zS4PwCdspz5iogHbQLSjeXhxuxYzBl8X7N4gelGC+9sLHp6YnEfIqHvBU/UVd+5isnf4q+Doo
 MEFaK3iotkNMyOKQDm3CW4CgbsMyRv1EgQtvYycsg6pTY8eaH9JbkR6LpfM2HAysgdnFaVmYMtk7
 d8IQZ4jnUbVOjpT2ww3i7/z7vM1m7WVOWhrWwzsWQWTxRakfjkMKzqBen7rbeJNCTvMixEI8OEWD
 vidRqOC6VcviuuePkT3l069ZkVP/AviOsLBV1HfTJlka5hDsawRjKLlCrqLaOfwJZNO8u9vBl0ar
 j6VxmsrmplG1NM8lwBLPSmh9WMDVYc/rmYyNmiH/ZmfZnpcaqRHqWpf2AhikG9fSSbKcH166IPzK
 7YlM1Il71GwfBrZb7SUUFemFDD4TP9wQOHVgJI42bdtPcGdVkErbJnckRefoaRyFr96mpOm1QQqV
 o6FLwXTCeJ/EsInx2EDHIVXq2hHDzf2LxgIheqfOqgl03XqUefkhF7u2kvvkhutifSn8+uw0u1z3
 SnHndJs2IVS8SnXoyYNUPdWUVfIkWQ0RZCwI8hK0eq/NoOGU7e1NzSk7mgGBEWAczj/lsc4nqUjU
 dNJY9uyWSlQtltaMThFY48Vp0wUEgvcly2rIq61YFymCYenBziVaSVeUcz8d+VUTJ8Yxr/c8n/9h
 ulADL/rCpB8Gz6ZUh4zKOwdnqeGNoaVRaHwP4nm5xmB0C02zmRT5ePvW1StbHyQNRDor62NPP//H
 gHIFeZsvc6gkJS9UnE4UK3lS8QSm3XikG+YXOtYlrMkYIDuwskpyF/eq98CKm2PWzW9WjQXKMJKY
 SnE4XuF0Ay0NZdYo/yaxKZAHAyC3tMYNKYe+0S0gAQPyQ9AHMDfG555bhUgMqJQ7PVZ3ftQ12ide
 2qMm1KWQT8c6VyITcTX9eUDzTNe4wkPQEKAsHrZeEKEOd9otTHScQr7ZhbNmNVoohw3rAOK58=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 16:06:03 +0800
X-OQ-MSGID: <20240206080603.28916-2-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206080603.28916-1-hanyuan-z@qq.com>
References: <20240206080603.28916-1-hanyuan-z@qq.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1707206904; bh=29HTG27O1Y/EUeaJdN8AXxm/O9kDXC6v7AwIvqYq9ZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dgfgWSRkvrRbZiIACO6e2YXdy5ZeX9Kf93Q3l4MtY4i3K78t/ICp9NgOBx0orQwA4
 A7nYzLD+UYFHwevozJzqSXIHBkvTeVKdc7eyk+0CK+9nD5NjocLpRIlCV/ItOPWo0w
 kTyMWTUhngdPQ4D/ntF9+TP1qO8M2IRxnvEybZ9A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=dgfgWSRk
Subject: [Buildroot] [PATCH v3 2/2] configs/milkv_duo: new defconfig
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
From: Hanyuan Zhao via buildroot <buildroot@buildroot.org>
Reply-To: Hanyuan Zhao <hanyuan-z@qq.com>
Cc: Emil S <emil.soltys@outlook.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Hanyuan Zhao <hanyuan-z@qq.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 GP Orcullo <kinsamanka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Milk-V Duo is an ultra-compact embedded RISC-V development platform based on the CV1800B chip.
It can run Linux and RTOS, providing a reliable, low-cost, and high-performance platform
for professionals, industrial ODMs, AIoT enthusiasts, DIY hobbyists, and creators.

https://milkv.io/duo

Co-authored-by: Emil S <emil.soltys@outlook.com>
Co-authored-by: GP Orcullo <kinsamanka@gmail.com>
Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
---
 board/milkv/duo/genimage.cfg                 | 25 ++++++++
 board/milkv/duo/post-image.sh                | 47 +++++++++++++++
 board/milkv/duo/readme.txt                   | 54 +++++++++++++++++
 configs/milkv_duo_musl_riscv64_defconfig     | 63 ++++++++++++++++++++
 configs/milkv_duo_musl_riscv64_ion_defconfig | 63 ++++++++++++++++++++
 5 files changed, 252 insertions(+)
 create mode 100644 board/milkv/duo/genimage.cfg
 create mode 100755 board/milkv/duo/post-image.sh
 create mode 100644 board/milkv/duo/readme.txt
 create mode 100644 configs/milkv_duo_musl_riscv64_defconfig
 create mode 100644 configs/milkv_duo_musl_riscv64_ion_defconfig

diff --git a/board/milkv/duo/genimage.cfg b/board/milkv/duo/genimage.cfg
new file mode 100644
index 0000000000..1fd74f845a
--- /dev/null
+++ b/board/milkv/duo/genimage.cfg
@@ -0,0 +1,25 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"fip.bin",
+			"boot.sd",
+		}
+	}
+	size = 8M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
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
diff --git a/board/milkv/duo/post-image.sh b/board/milkv/duo/post-image.sh
new file mode 100755
index 0000000000..c58233003e
--- /dev/null
+++ b/board/milkv/duo/post-image.sh
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+###########################################################
+# File: post-image.sh
+# Author: GP Orcullo <kinsamanka@gmail.com>
+#         Hanyuan Zhao <zhaohy22@mails.tsinghua.edu.cn>
+# Description: this sh will make the fip.bin and boot.sd,
+#              then pack everything to an image file.
+###########################################################
+
+FIPTOOL_OPTS="genfip ${BINARIES_DIR}/fip.bin \
+	--MONITOR_RUNADDR=0x80000000 \
+	--CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
+	--NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
+	--NAND_INFO=00000000 \
+	--BL2=${BINARIES_DIR}/bl2.bin \
+	--BLCP_IMG_RUNADDR=0x05200200 \
+	--BLCP_PARAM_LOADADDR=0 \
+	--DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
+	--MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
+	--LOADER_2ND=${BINARIES_DIR}/u-boot.bin"
+
+if [ -f ${BINARIES_DIR}/cvirtos.bin ]; then
+	FIPTOOL_OPTS="${FIPTOOL_OPTS} \
+		--BLCP=${BINARIES_DIR}/empty.bin \
+		--BLCP_2ND=${BINARIES_DIR}/cvirtos.bin \
+		--BLCP_2ND_RUNADDR=0x83f40000"
+	echo "[Duo Post-Image fiptool.py] Integrating FreeRTOS"
+fi
+
+${BINARIES_DIR}/fiptool.py ${FIPTOOL_OPTS}\
+> ${BINARIES_DIR}/fip.log 2>&1
+if [ -f ${BINARIES_DIR}/fip.bin ]; then
+	echo "[Duo Post-Image fiptool.py] > fip.bin generated!"
+fi
+
+cp ${BINARIES_DIR}/u-boot.dtb ${BINARIES_DIR}/cv1800b_milkv_duo_sd.dtb
+lzma -fk ${BINARIES_DIR}/Image
+mkimage -f ${BINARIES_DIR}/multi.its ${BINARIES_DIR}/boot.sd
+if [ -f ${BINARIES_DIR}/boot.sd ]; then
+	echo "[Duo Post-Image] > boot.sd generated!"
+fi
+support/scripts/genimage.sh -c $(pwd)/board/milkv/duo/genimage.cfg
+gzip -fk ${BINARIES_DIR}/sdcard.img
+if [ -f ${BINARIES_DIR}/sdcard.img ]; then
+	echo "[Duo Post-Image] > sdcard.img generated!"
+fi
diff --git a/board/milkv/duo/readme.txt b/board/milkv/duo/readme.txt
new file mode 100644
index 0000000000..1623fa97c5
--- /dev/null
+++ b/board/milkv/duo/readme.txt
@@ -0,0 +1,54 @@
+Milk-V Duo (https://milkv.io/docs/duo/overview)
+
+Intro
+=====
+
+Milk-V Duo is an ultra-compact embedded development platform
+based on the rv64 CV1800B chip. It can run Linux and RTOS,
+providing a reliable, cost-effective, and high-performance
+platform for professionals, industrial ODMs, AIoT enthusiasts,
+DIY enthusiasts, and creators.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make milkv_duo_musl_riscv64_defconfig
+
+The milkv_duo_musl_riscv64_defconfig will by default provide
+the full 64MiB free RAM. If you want to build with memory
+reserved for ION (generalized memory manager in linux, i.e.
+some memory will be reserved for the camera algorithms), please try:
+
+    $ make milkv_duo_musl_riscv64_ion_defconfig
+
+For more information about the ION, please refer to
+
+https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/README.md?plain=1#L436
+
+Modify configuration if needed, e.g. add more packages to target:
+
+    $ make menuconfig
+
+Compile everything and build the SD card image:
+
+    $ make
+
+To configure the linux kernel or u-boot:
+
+    $ make linux-menuconfig
+
+To rebuild something (e.g. linux):
+
+    $ make linux-rebuild
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image
+called "sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/milkv_duo_musl_riscv64_defconfig b/configs/milkv_duo_musl_riscv64_defconfig
new file mode 100644
index 0000000000..4155ad1f57
--- /dev/null
+++ b/configs/milkv_duo_musl_riscv64_defconfig
@@ -0,0 +1,63 @@
+# Architecture
+BR2_riscv=y
+BR2_riscv_g=y
+BR2_RISCV_ISA_RVC=y
+
+# Linux headers same as kernel 5.10 series
+BR2_KERNEL_HEADERS_5_10=y
+
+# Using gcc13 and musl to have t-head's optimization and features
+BR2_GCC_VERSION_13_X=y
+BR2_TOOLCHAIN_BUILDROOT_MUSL=y
+BR2_TARGET_OPTIMIZATION="-march=rv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xtheadfmemidx_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync"
+
+# opensbi
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_GIT=y
+BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-opensbi.git"
+BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="ee78f99daf8ac5956c6bf95458983ead52142548"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
+BR2_TARGET_OPENSBI_FW_FDT_PATH=y
+
+# u-boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2021.10_64mb"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="duo-linux-5.10.4"
+BR2_LINUX_KERNEL_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
+BR2_LINUX_KERNEL_LZMA=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# SD card image generating script
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/milkv/duo/post-image.sh"
+
+# rootfs
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Packages for the sdcard image generating
+BR2_PACKAGE_MILKV_DUO_LIBRARIES=y
+BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL=y
+BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB=y
+BR2_PACKAGE_MILKV_DUO_PINMUX=y
+BR2_PACKAGE_MILKV_DUO_FEATURES=y
+BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y
+
+# Host packages for the sdcard image generating
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_LZMA_ALONE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
diff --git a/configs/milkv_duo_musl_riscv64_ion_defconfig b/configs/milkv_duo_musl_riscv64_ion_defconfig
new file mode 100644
index 0000000000..7af0d9a44d
--- /dev/null
+++ b/configs/milkv_duo_musl_riscv64_ion_defconfig
@@ -0,0 +1,63 @@
+# Architecture
+BR2_riscv=y
+BR2_riscv_g=y
+BR2_RISCV_ISA_RVC=y
+
+# Linux headers same as kernel 5.10 series
+BR2_KERNEL_HEADERS_5_10=y
+
+# Using gcc13 and musl to have t-head's optimization and features
+BR2_GCC_VERSION_13_X=y
+BR2_TOOLCHAIN_BUILDROOT_MUSL=y
+BR2_TARGET_OPTIMIZATION="-march=rv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xtheadfmemidx_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync"
+
+# opensbi
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_GIT=y
+BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-opensbi.git"
+BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="ee78f99daf8ac5956c6bf95458983ead52142548"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
+BR2_TARGET_OPENSBI_FW_FDT_PATH=y
+
+# u-boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2021.10_ion"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="duo-linux-5.10.4"
+BR2_LINUX_KERNEL_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
+BR2_LINUX_KERNEL_LZMA=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# SD card image generating script
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/milkv/duo/post-image.sh"
+
+# rootfs
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Packages for the sdcard image generating
+BR2_PACKAGE_MILKV_DUO_LIBRARIES=y
+BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL=y
+BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y
+BR2_PACKAGE_MILKV_DUO_PINMUX=y
+BR2_PACKAGE_MILKV_DUO_FEATURES=y
+BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y
+
+# Host packages for the sdcard image generating
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_LZMA_ALONE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
