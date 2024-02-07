Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942A0C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 07:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F3E3838DB;
	Wed,  7 Feb 2024 07:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcQEpAJHjPMK; Wed,  7 Feb 2024 07:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC77C820C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC77C820C6;
	Wed,  7 Feb 2024 07:51:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A02B1BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id 46980820C6
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 07:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id UOC6k-eFgrh6 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 07:51:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.231;
 helo=out203-205-221-231.mail.qq.com; envelope-from=hanyuan-z@qq.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0835D81FB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0835D81FB6
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com
 [203.205.221.231])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 0835D81FB6
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 07:51:50 +0000 (UTC)
Received: from localhost.localdomain ([36.101.73.56])
 by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
 id CAB11A20; Wed, 07 Feb 2024 15:50:43 +0800
X-QQ-mid: xmsmtpt1707292268tf2njzxug
Message-ID: <tencent_7C8E1E802D63F62F30CBE54D84FFAB120907@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9WwA+8baecEZqggJ/SLY6beKOAhSm2zfn1XNN0unzdnO6joio4W
 AgN6CTsL9YcoT9qoP3NMaFQjzL1ce+GZ5+OFKRGMhY8az/5JHrm3QIwXxabFaZbEiyc9+Lj7pg2z
 S/8CzRx/lcetIZPM0kAHyMFpOgIKZlSzu/A8ZiR8yrgQpCs4kDX1zSerA1XMxP6cgyMFjXEodsjy
 S6g9+hbSBcS6ZGB8Aigw96z+PwJX2BSZ60Fqhhvn3mSndlEMHbZfGxtA+ftVYQWgtbCwxwQFiv6V
 kC/rJ/ipzlgXOR9namX0mk4NWz0DiCpKsgitrbJbEg0lCQas39ZYBcCOFfPKxMtT7T/FTbe9w2eD
 fHJOWxrJ5Tga/AM1LEDVFXIHSHbRcUUELUY0AcPX9Ks+MNB05N55zJsp4P5A6RAbzwddXMQRo2cD
 hQTt2i/Godh8tBPy6muj2FeNnEFYbL4VasjSTA1r2MQblTHF1dvIiy9HgXjhJipRF0kreCYIvQm5
 pHxmWDCDmcU3duibI1/t5UFUrbRcyJ9S7HToYVT3qZorBXlSVC2pUfev6Eu+cFqkRy/VW/zoqw9T
 UXH4zcKW4YmaEMggdKINGExq5KiW6tgobVePG/jlCLNUxib9vvaJNdLso0BFYchjQbzsGrPjY8xR
 rV920KPT8CEc6cP/m6Cy6za/wD+9KiadJrvPXRPvEohSrRlHXF/ruc/ceoLL/dBICz8isgXg+eCy
 TBCbu+MasnutKsqqO3be3rIl6B0qMk3YI2RKCtFNU9WcYfXtOhsSsEcxzpe3wG1E3I3hBfENNfFT
 jCRNX2LhKjoL58nQOYKMeJkLCnVwcTpP0Eoa/ocV9aE8T4so8qCDPbDXe7z3fduE/qFyf2veDneT
 urI/3Hw9RIHACuDZWR3uaICeUXQFV4bWJYDQm0am1tPHKVZc7nZIqt1ctSnF75K1qfoioa8fkfvH
 XMYjIEw8ky9bGQ6+sX9j1xH3Axs4/FTzATpgvOxp+6kTrW4QK6AZheGTt2+/Ykhp5lXfGVWSYp5S
 giMErGHQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 15:49:53 +0800
X-OQ-MSGID: <20240207074950.2049-3-hanyuan-z@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207074950.2049-1-hanyuan-z@qq.com>
References: <20240207074950.2049-1-hanyuan-z@qq.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1707292308; bh=3sH8fKM73dBf7NcHIgqfs3mGbWxm5Ck9wDOr1eTmgAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ci260Yr/Q/pUT9AvIzyTaj92LEbrvdt8CTkoX+CFXWtOIoTeEByIjYgU+dQecSTLV
 F/NqsZjwodtQUEYNboP99buMVU5Ed77806kAXDjCmFuy1j1V6lxZR+xqwcVaKSm5fh
 aw6dL9iAQBHdDon5ZIk3ZfAbf/3v17cW7hC0v4Uw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=qq.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=ci260Yr/
Subject: [Buildroot] [PATCH v4 3/3] configs/milkv_duo: new defconfig
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
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Build Tested only both defconfigs]
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

---
This patch depends on:
https://patchwork.ozlabs.org/project/buildroot/list/?series=393667
to work-around a gcc bug on htop package.
---
Changes v3 -> v4:
  - Lint the code
  - Add more comments about gcc ICE in defconfig
  - Remove unnecessary comments

Changes v2 -> v3:
  - Remove BR2_TOOLCHAIN_BUILDROOT_CXX in defconfig
  - Refactor post-image.sh
  - Provide more info about ION and camera memory use

Changes v1 -> v2:
  - Refactor defconfig
  - Set the boot partition size to 8M
  - Refactor the image generating logic
---
 board/milkv/duo/genimage.cfg                 | 25 ++++++++
 board/milkv/duo/post-image.sh                | 47 ++++++++++++++
 board/milkv/duo/readme.txt                   | 46 ++++++++++++++
 configs/milkv_duo_musl_riscv64_defconfig     | 67 ++++++++++++++++++++
 configs/milkv_duo_musl_riscv64_ion_defconfig | 67 ++++++++++++++++++++
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
index 0000000000..3856d977df
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
+${BINARIES_DIR}/fiptool.py ${FIPTOOL_OPTS} \
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
index 0000000000..bb05050245
--- /dev/null
+++ b/board/milkv/duo/readme.txt
@@ -0,0 +1,46 @@
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
index 0000000000..0773924072
--- /dev/null
+++ b/configs/milkv_duo_musl_riscv64_defconfig
@@ -0,0 +1,67 @@
+# Architecture
+BR2_riscv=y
+BR2_riscv_g=y
+BR2_RISCV_ISA_RVC=y
+
+# Linux headers same as kernel 5.10 series
+BR2_KERNEL_HEADERS_5_10=y
+
+# Since gcc 13 and later versions with the t-head's optimizations
+# below are currently not well compatible with glibc, which will
+# throw gcc ICE (Internal Compiler Error) when the buildroot is
+# compiling the glibc, so we choose musl used by the official sdk
+# until this ICE gets fixed.
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
index 0000000000..18458726d9
--- /dev/null
+++ b/configs/milkv_duo_musl_riscv64_ion_defconfig
@@ -0,0 +1,67 @@
+# Architecture
+BR2_riscv=y
+BR2_riscv_g=y
+BR2_RISCV_ISA_RVC=y
+
+# Linux headers same as kernel 5.10 series
+BR2_KERNEL_HEADERS_5_10=y
+
+# Since gcc 13 and later versions with the t-head's optimizations
+# below are currently not well compatible with glibc, which will
+# throw gcc ICE (Internal Compiler Error) when the buildroot is
+# compiling the glibc, so we choose musl used by the official sdk
+# until this ICE gets fixed.
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
