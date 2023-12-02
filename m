Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC31C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 03:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8FE142458;
	Sat,  2 Dec 2023 03:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8FE142458
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4NCdax-69JA; Sat,  2 Dec 2023 03:00:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE20D42459;
	Sat,  2 Dec 2023 03:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE20D42459
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC411BF2CD
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 03:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35B9542420
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 03:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B9542420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-d_yT92fBtS for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 03:00:41 +0000 (UTC)
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com
 [203.205.221.164])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA2D042459
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 03:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA2D042459
Received: from localhost.localdomain ([183.172.149.93])
 by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
 id F2544B; Sat, 02 Dec 2023 11:00:15 +0800
X-QQ-mid: xmsmtpt1701486015tsus0zx8i
Message-ID: <tencent_267933F59FABC482631A00CC38E64BD83205@qq.com>
X-QQ-XMAILINFO: NvH2zBBgt3uTwmyoZRJJd/i5oA3wT8mT30MmpKy2RVw90wDJzrh4J6Tgms7wWz
 DVYh4JVgQaGtRRgpsoIbKVJ5tBCA+SoNBdQp0vIgmhktvjBPpMRu20Ubg1pshEoHmwnXOjOBHdpc
 9SFN8YVA38J3qIjqzlx7Vxh+wWTmebMm4j0WEiW+wzymMzBwJfJKFR1CNkUfExmPCYqze1A2wNHo
 9tUlTM6PLi6I+MZQAISfrXjZIxn1QUsxdhw9pfsiHdiR63pnwu/CjCHBwpl0yrexdmlie32HmBd+
 le77hqJS+ZkiqGP6YgSJCTU1AZ1YFTUv4wDlcKE5ku6aW3tc0PFk2Mh+3dh3cO2joshke7Rqxwjp
 C3vDyXJpNlAMLPs2kWXwDjjmf8poy/3t926zBjBi9y286FdUgyzEbaT3/n4Cvqvx3eGAVvVE7wra
 v64j7a7wwKFgtcNvceu+jA/HzxAwnTX28fKO5sxMuRzq8RcVWCgETPwIxJuQ2r5ZJEcfYQTJK2Ba
 QqVMYBx+AhQCkjm11QeZdYxn6GS9AKf1fxbmGHn7/eRa0wQHFewC8e1oBhNwQAWRsvjqd99+KoOi
 60ORBkx90C/ld/XEK98AnJvmsGDzqL6tAJpTNi1mMLiFzrNCx4zYXnMwrnCw3rjJqjtur7HwIVtj
 OlqmA9mk9MrrZGoLJo7ct3eokfsuKsT+P3hOg6Vs10NQeDIH6VCNcaMsG9UobgFjqLmED0HrELcL
 7DNXbBXcugXv6C4f6Wyh4ObH2zr0RASb2uE6y/k1EgaQLyE5RNpvaA4K07fC9T4QcEcwJcozbwhy
 n5cZzlV3LarTTF+2M6TNyT5DieZTRsO0hzaWWsTq2LWkntnBghFtzUI9uwePnRPzsg3plg6u/SM4
 yGGLWO4dpbE9y+LqV6zTclvzWaussqvHv629Db4D6Noa3E8TasqC3FJAEeJP8GFQVQxKvl1KGJRY
 F1ZlpwQJGMlpf9uiUQ2MTrteP59zvWnrgcLdxb8Q5Hqj15KkWTsg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 10:57:45 +0800
X-OQ-MSGID: <20231202025745.11752-1-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1701486017; bh=rr4y9nnMYLZ5gvFVQh6gCg3jS2Q5XmXt9ok4e7Co6Qw=;
 h=From:To:Cc:Subject:Date;
 b=jDTwlW/Bouz+qL7/k6StQDDVKOcs4jMguVrc48X/BvOmjWGvxgciLqrDcYlPIWomi
 jk9xAc7vMIMzO/+dnGmS/Jojl4/KgeSWSdjrHoxl115wddEupNReCxuHz5wfbeeM0k
 LWuhb87OhMv2zHH7sFwzZDXqtaqo6r9P3KPan3qU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=jDTwlW/B
Subject: [Buildroot] [PATCH v2 1/2] configs/milkv_duo: new defconfig
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
Cc: Emil S <emil.soltys@outlook.com>, Hanyuan Zhao <hanyuan-z@qq.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 GP Orcullo <kinsamanka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Milk-V Duo is an ultra-compact embedded development platform based on the CV1800B chip.
It can run Linux and RTOS, providing a reliable, low-cost, and high-performance platform
for professionals, industrial ODMs, AIoT enthusiasts, DIY hobbyists, and creators.

Co-authored-by: Emil S <emil.soltys@outlook.com>
Co-authored-by: GP Orcullo <kinsamanka@gmail.com>
Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
---
 board/milkv/duo/genimage.cfg                 | 25 ++++++++
 board/milkv/duo/post-image.sh                | 58 ++++++++++++++++++
 board/milkv/duo/readme.txt                   | 49 +++++++++++++++
 configs/milkv_duo_musl_riscv64_defconfig     | 63 ++++++++++++++++++++
 configs/milkv_duo_musl_riscv64_ion_defconfig | 63 ++++++++++++++++++++
 5 files changed, 258 insertions(+)
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
index 0000000000..6dc6d7853b
--- /dev/null
+++ b/board/milkv/duo/post-image.sh
@@ -0,0 +1,58 @@
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
+if [ -f ${BINARIES_DIR}/cvirtos.bin ]; then
+	${BINARIES_DIR}/fiptool.py genfip ${BINARIES_DIR}/fip.bin \
+	--MONITOR_RUNADDR=0x80000000 \
+	--CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
+	--NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
+	--NAND_INFO=00000000 \
+	--BL2=${BINARIES_DIR}/bl2.bin \
+	--BLCP_IMG_RUNADDR=0x05200200 \
+	--BLCP_PARAM_LOADADDR=0 \
+	--DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
+	--MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
+	--LOADER_2ND=${BINARIES_DIR}/u-boot.bin \
+	--BLCP=${BINARIES_DIR}/empty.bin \
+	--BLCP_2ND=${BINARIES_DIR}/cvirtos.bin \
+	--BLCP_2ND_RUNADDR=0x83f40000 \
+	> ${BINARIES_DIR}/fip.log 2>&1
+	if [ -f ${BINARIES_DIR}/fip.bin ]; then
+		echo "[Duo Post-Image fiptool.py] FreeRTOS integrated"
+	fi
+else
+	${BINARIES_DIR}/fiptool.py genfip ${BINARIES_DIR}/fip.bin \
+	--MONITOR_RUNADDR=0x80000000 \
+	--CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
+	--NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
+	--NAND_INFO=00000000 \
+	--BL2=${BINARIES_DIR}/bl2.bin \
+	--BLCP_IMG_RUNADDR=0x05200200 \
+	--BLCP_PARAM_LOADADDR=0 \
+	--DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
+	--MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
+	--LOADER_2ND=${BINARIES_DIR}/u-boot.bin \
+	> ${BINARIES_DIR}/fip.log 2>&1
+	if [ -f ${BINARIES_DIR}/fip.bin ]; then
+		echo "[Duo Post-Image fiptool.py] No FreeRTOS integrated"
+	fi
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
index 0000000000..a483a73a19
--- /dev/null
+++ b/board/milkv/duo/readme.txt
@@ -0,0 +1,49 @@
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
+reserved for ION, please try:
+
+    $ make milkv_duo_musl_riscv64_ion_defconfig
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
index 0000000000..4f5180891f
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
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
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
index 0000000000..7875853711
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
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
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
