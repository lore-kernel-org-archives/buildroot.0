Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26949CF6BF3
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 07:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C683260833;
	Wed,  7 Jan 2026 07:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yfxAjM6BIdz; Wed,  7 Jan 2026 07:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EA0B60C19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767771269;
	bh=kfTlVoJyhPS0fmJWl4cHDfu6KJLg89Svy4vsobIiW3c=;
	h=To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=drwuwUkJpRO0z/Pz8uL6xiq62t+OZ+JHbQODIEbNy+Y6v7swuqvAvQIpsVK/0vvKY
	 txgwCM//x3uLoGabo2FETcmju7q5KjTWCi04I+kiybHQU6CxP9x3dIoS1pmiYdf0xO
	 SDZrIcLlWE4dAYHPpjg+3qj/nP2TWFq35iAMXiB2Sl0BVa1MehcMHBejlakk0pQsJm
	 sEmUVlBYLdP76FVAlbxLu2BTuPRgrOkm5Vfl3kpn8s9r5j2pNQRG0FWvwbLc2M3CvC
	 c8po3/Bh6JRLyTUasgrco87S4zetTG4GajqZoqzyVT1KjQISqxH3pMWbIjKLIutbL5
	 h3rSyEO2E62yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EA0B60C19;
	Wed,  7 Jan 2026 07:34:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B583249
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C06B60C19
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPBQ99xBqAEn for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 07:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=cnoize@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E55460833
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E55460833
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 07:34:22 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 6077Y8uM006962
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
 for <buildroot@buildroot.org>; Wed, 7 Jan 2026 15:34:08 +0800 (+08)
 (envelope-from cnoize@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Jan
 2026 15:34:08 +0800
To: <buildroot@buildroot.org>
CC: Leo Yu-Chi Liang <ycliang@andestech.com>, Che-Wei Chuang
 <cnoize@andestech.com>
Date: Wed, 7 Jan 2026 15:34:01 +0800
Message-ID: <20260107073401.3004368-3-cnoize@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107073401.3004368-1-cnoize@andestech.com>
References: <20260107073401.3004368-1-cnoize@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 6077Y8uM006962
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: [Buildroot] [PATCH 2/2] board/andes: add AE350 OP-TEE board support
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
From: Che-Wei Chuang via buildroot <buildroot@buildroot.org>
Reply-To: Che-Wei Chuang <cnoize@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add initial Buildroot support for the Andes AE350 OP-TEE platform,
including board files, config fragments, patches, hash files, and
defconfig.

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
---
 board/andes/ae350-optee/genimage_sdcard.cfg   |  31 +++
 board/andes/ae350-optee/linux.config.fragment |   1 +
 .../ae350-optee/patches/linux/linux.hash      |   2 +
 .../ae350-optee/patches/opensbi/opensbi.hash  |   2 +
 .../patches/optee-os/optee-os.hash            |   2 +
 ...ble-fragmentation-calculation-for-ol.patch |  43 ++++
 .../ae350-optee/patches/uboot/uboot.hash      |   2 +
 board/andes/ae350-optee/post-build.sh         |  13 ++
 board/andes/ae350-optee/readme.txt            | 204 ++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |   4 +
 board/andes/ae350-optee/uboot.config.fragment |  14 ++
 configs/andes_ae350_45_optee_defconfig        |  56 +++++
 12 files changed, 374 insertions(+)
 create mode 100644 board/andes/ae350-optee/genimage_sdcard.cfg
 create mode 100644 board/andes/ae350-optee/linux.config.fragment
 create mode 100644 board/andes/ae350-optee/patches/linux/linux.hash
 create mode 100644 board/andes/ae350-optee/patches/opensbi/opensbi.hash
 create mode 100644 board/andes/ae350-optee/patches/optee-os/optee-os.hash
 create mode 100644 board/andes/ae350-optee/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch
 create mode 100644 board/andes/ae350-optee/patches/uboot/uboot.hash
 create mode 100755 board/andes/ae350-optee/post-build.sh
 create mode 100644 board/andes/ae350-optee/readme.txt
 create mode 100644 board/andes/ae350-optee/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/andes/ae350-optee/uboot.config.fragment
 create mode 100644 configs/andes_ae350_45_optee_defconfig

diff --git a/board/andes/ae350-optee/genimage_sdcard.cfg b/board/andes/ae350-optee/genimage_sdcard.cfg
new file mode 100644
index 0000000000..8856722531
--- /dev/null
+++ b/board/andes/ae350-optee/genimage_sdcard.cfg
@@ -0,0 +1,31 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"u-boot-spl.bin",
+			"u-boot.itb",
+			"dtb",
+                        "Image.gz",
+		}
+	}
+	size = 8184K
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		image = "boot.vfat"
+                offset = 8K
+		size = 8184K # 8MB - 8KB
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		bootable = true
+		image = "rootfs.ext4"
+		offset = 8M
+		size = 24M
+	}
+}
diff --git a/board/andes/ae350-optee/linux.config.fragment b/board/andes/ae350-optee/linux.config.fragment
new file mode 100644
index 0000000000..becad4d7ed
--- /dev/null
+++ b/board/andes/ae350-optee/linux.config.fragment
@@ -0,0 +1 @@
+CONFIG_INITRAMFS_SOURCE=""
diff --git a/board/andes/ae350-optee/patches/linux/linux.hash b/board/andes/ae350-optee/patches/linux/linux.hash
new file mode 100644
index 0000000000..f0e82a37e6
--- /dev/null
+++ b/board/andes/ae350-optee/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2a1dc278902473fed28fc40d4eecdbe0692b23c1282649db8281efcb8306e679  linux-optee_ast540_v4.3.tar.gz
diff --git a/board/andes/ae350-optee/patches/opensbi/opensbi.hash b/board/andes/ae350-optee/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..b2160eba90
--- /dev/null
+++ b/board/andes/ae350-optee/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  70a38b6d3c8c9c4eaeb6076480e567c7c5155f321e8989492ccc95ad87304185  opensbi-optee_ast540_v4.3.tar.gz
diff --git a/board/andes/ae350-optee/patches/optee-os/optee-os.hash b/board/andes/ae350-optee/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..0e1dacd925
--- /dev/null
+++ b/board/andes/ae350-optee/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f56fa9636afe671f67b87b1bfcd546d124003a4817ad1b47d1a8c91d80a4043a  optee_os-optee_ast540_v4.3.tar.gz
diff --git a/board/andes/ae350-optee/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch b/board/andes/ae350-optee/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch
new file mode 100644
index 0000000000..6613b9abe0
--- /dev/null
+++ b/board/andes/ae350-optee/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch
@@ -0,0 +1,42 @@
+From cc87f97d5b4b29cf13df14e475f31b4806e4eae7 Mon Sep 17 00:00:00 2001
+From: Che-Wei Chuang <cnoize@andestech.com>
+Date: Tue, 6 Jan 2026 11:19:31 +0800
+Subject: [PATCH] xtest: stats: Disable fragmentation calculation for older
+ OP-TEE OS
+
+optee-os versions prior to 4.6.0 do not provide the free2_sum field in
+struct pta_stats_alloc. xtest 4.6.0 unconditionally accesses this field,
+which breaks the build when used together with older OP-TEE OS releases
+such as 4.3.0.
+
+Disable the fragmentation calculation based on free2_sum to restore
+compatibility with older OP-TEE OS versions while keeping the remaining
+statistics intact.
+
+Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
+---
+ host/xtest/stats.c | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/host/xtest/stats.c b/host/xtest/stats.c
+index dc05d7b..212e5a5 100644
+--- a/host/xtest/stats.c
++++ b/host/xtest/stats.c
+@@ -155,15 +155,6 @@ static int stat_alloc(int argc, char *argv[])
+		       stats[n].desc);
+		printf("Bytes allocated:                       %"PRId32"\n",
+		       stats[n].allocated);
+-		if (stats[n].free2_sum && stats[n].size != stats[n].allocated) {
+-			double free2_sum = stats[n].free2_sum;
+-			double free_sum = stats[n].size - stats[n].allocated;
+-			double free_quote = sqrt(free2_sum) / free_sum;
+-			double fragmentation = 1.0 - free_quote * free_quote;
+-
+-			printf("Fragmentation:			       %u %%\n",
+-				(unsigned int)(fragmentation * 100.0));
+-		}
+		printf("Max bytes allocated:                   %"PRId32"\n",
+		       stats[n].max_allocated);
+		printf("Size of pool:                          %"PRId32"\n",
+--
+2.34.1
diff --git a/board/andes/ae350-optee/patches/uboot/uboot.hash b/board/andes/ae350-optee/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..6354bc127f
--- /dev/null
+++ b/board/andes/ae350-optee/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c6d9232e09ba1f318b6ff6c558c5847b8ac576eccfbeffb6d3c315dad3da4b49  uboot-optee_ast540_v4.3.tar.gz
diff --git a/board/andes/ae350-optee/post-build.sh b/board/andes/ae350-optee/post-build.sh
new file mode 100755
index 0000000000..f18fed0a6e
--- /dev/null
+++ b/board/andes/ae350-optee/post-build.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+set -e
+
+mkdir -p "${BINARIES_DIR}"/dtb
+cd "${BUILD_DIR}"/linux-custom/arch/riscv/boot/dts/andes/ || exit 1
+for f in *.dtb; do
+	[ -e "$f" ] || continue
+	cp -av "$f" "${BINARIES_DIR}"/dtb/
+done
+
+cp "$BINARIES_DIR"/Image.gz "$TARGET_DIR"/boot
+cp "$BINARIES_DIR"/dtb/ax45_c1_d_dsp_noncoherent_ae350_optee.dtb "$TARGET_DIR"/boot
+cp "$BINARIES_DIR"/dtb/ax45mp_c4_d_dsp_ae350_optee.dtb "$TARGET_DIR"/boot
diff --git a/board/andes/ae350-optee/readme.txt b/board/andes/ae350-optee/readme.txt
new file mode 100644
index 0000000000..83655bb063
--- /dev/null
+++ b/board/andes/ae350-optee/readme.txt
@@ -0,0 +1,203 @@
+Intro
+=====
+
+AndesTech AE350 Platform with OP-TEE
+
+The AE350 prototype demonstrates the AE350 platform with OP-TEE support on
+both FPGA hardware and QEMU simulation.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+  $ make andes_ae350_45_optee_defconfig
+
+If you want to customize your configuration:
+
+  $ make menuconfig
+
+Build everything
+----------------
+Note: you will need to access to the network, since Buildroot will
+download the packages' sources.
+
+  $ make
+
+Result of the build
+-------------------
+
+After building, you should obtain the following files:
+
+  output/images/
+  |-- ax45_c1_d_dsp_noncoherent_ae350_optee.dtb
+  |-- dtb/ax45mp_c4_d_dsp_ae350_optee.dtb
+  |-- boot.vfat
+  |-- fw_dynamic.bin
+  |-- fw_dynamic.elf
+  |-- Image.gz
+  |-- rootfs.ext2
+  |-- rootfs.ext4 -> rootfs.ext2
+  |-- sdcard.img
+  |-- tee.bin
+  |-- u-boot-spl.bin
+  `-- u-boot.itb
+
+How to update the bootloader and device-tree
+============================================
+
+To update the bootloader and device tree, make sure you have
+an ICEman (Andes OpenOCD [1]) and AICE [2] connection set up
+as below:
+
+  Local Host                 Local/Remote Host
+ .-----------------.          .--------------.
+ | buildroot images|          |              |
+ |                 |         ICEman host <IP:PORT>
+ | .----------.    |          |  .--------.  |
+ | | SPI_burn |<---+--socket--+->| ICEman |  |
+ | '----------'    |          |  '--.-----'  |
+ '-----------------'          '-----|--------'
+                                    |
+                                    USB
+   .--------------.                 |
+   | target       |           .-----v-----.
+   | board        <----JTAG---| AICE      |
+   |              |           '-----------'
+   '--------------'
+
+[1] https://github.com/andestech/ICEman
+[2] https://www.andestech.com/en/products-solutions/andeshape-platforms/aice-micro/
+
+The Andes SPI_burn tool will be located in output/host/bin.
+Use the following commands to update the bootloader and device tree:
+
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x000000 -i u-boot-spl.bin
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x020000 -i u-boot.itb
+  $ SPI_burn --host $ICE_IP --port $ICE_BURNER_PORT --addr 0x1E0000 \
+	-i ax45_c1_d_dsp_noncoherent_ae350_optee.dtb
+
+Note that the --addr option specifies the offset starting from
+the flash base address 0x80000000 and set by U-Boot configurations.
+e.g.
+u-boot-spl.bin: CONFIG_SPL_TEXT_BASE=0x80000000
+u-boot.itb:     CONFIG_SPL_LOAD_FIT_ADDRESS=0x80020000
+ax45_c1_d_dsp_noncoherent_ae350_optee.dtb: CONFIG_SYS_FDT_BASE=0x801E0000
+
+How to write the SD card
+========================
+
+Copy the sdcard.img to a SD card with "dd":
+
+  $ sudo dd if=sdcard.img of=/dev/sdX bs=4096
+  $ sudo sync
+
+OP-TEE OS (tee.bin)
+===================
+
+The file `tee.bin` is the OP-TEE OS secure world binary.
+It provides a Trusted Execution Environment (TEE) that runs alongside Linux in
+secure mode.
+
+The OP-TEE OS binary (`tee.bin`) is packaged inside the `u-boot.itb` image on
+the AE350 platform.
+
+OP-TEE provides the following core security services:
+
+- Secure execution of Trusted Applications (TAs)
+- Secure key storage and cryptographic operations
+- Hardware-backed isolation between Secure World and Normal World
+- Secure monitor call (SMC) interface for Linux communication
+
+Linux communicates with OP-TEE through the standard OP-TEE Linux driver using
+SMC calls. This allows normal world applications to access secure services
+without exposing sensitive data to the Linux kernel.
+
+For the quad-core configuration, switch to ax45mp_c4_d_dsp_ae350_optee.dts.
+Set the following options in menuconfig:
+
+Kernel  ---> In-tree Device Tree Source file names
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ax45mp_c4_d_dsp_ae350_optee"
+
+Bootloaders  ---> Additional build variables
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_TEE_CORE_NB_CORE=4 CFG_NUM_THREADS=8"
+
+OP-TEE User-space Configuration (4.3.0)
+=======================================
+
+The OP-TEE user-space components are built from custom upstream
+tarballs and provide Linux support for OP-TEE OS.
+
+They can be enabled from Buildroot menuconfig:
+  Target packages  --->
+    Security  --->
+
+  -*- optee-client
+      optee-client version (Custom tarball)  --->
+        URL of custom optee-client tarball:
+          $(call github,OP-TEE,optee_client,4.3.0)/optee_client-4.3.0.tar.gz
+
+  [*] optee-examples
+      optee-examples version (Custom tarball)  --->
+        URL of custom optee-examples tarball:
+          $(call github,linaro-swg,optee_examples,4.3.0)/optee_examples-4.3.0.tar.gz
+
+  [*] optee-test
+      optee-test version (Custom tarball)  --->
+        URL of custom optee-test tarball:
+          $(call github,OP-TEE,optee_test,4.3.0)/optee_test-4.3.0.tar.gz
+
+Since the custom tarballs do not have hash files,
+disable this option to build these packages.
+
+  Build options  --->
+    Advanced  --->
+      [ ] Force all downloads to have a valid hash
+
+OP-TEE User-space Configuration (4.6.0)
+=======================================
+
+The OP-TEE user-space components version 4.6.0 are also supported.
+
+They can be enabled from Buildroot menuconfig:
+  Target packages  --->
+    Security  --->
+
+  -*- optee-client
+      optee-client version (4.6.0)  --->
+
+  [*] optee-examples
+      optee-examples version (4.6.0)  --->
+
+  [*] optee-test
+      optee-test version (4.6.0)  --->
+
+Note:
+When using optee-test 4.6.0, xtest case 4016 is expected to fail.
+This is because optee-test 4.6.0 introduces validation for the
+TEE_ERROR_SHORT_BUFFER behavior in the ED25519 sign/verify test.
+This error code did not exist in optee-os version 4.3.0, but it is
+required and tested in version 4.6.0.
+
+QEMU (AE350 simulation)
+=======================
+
+To run the andes_ae350 machine model, use the QEMU version:
+https://github.com/andestech/qemu
+
+Boot command example:
+  qemu-system-riscv64 \
+    -nographic \
+    -M andes_ae350 \
+    -cpu andes-ax45 \
+    -m 2G -smp 1 \
+    -bios none \
+    -device loader,file=u-boot-spl.bin,addr=0x80000000 \
+    -device loader,file=u-boot.itb,addr=0x80020000 \
+    -device loader,file=dtb/ax45_c1_d_dsp_noncoherent_ae350_optee.dtb,addr=0x801E0000 \
+    -drive file=sdcard.img,format=raw,id=sd1 \
+    -device sd-card,drive=sd1 \
+    -net nic,model=atfmac100 \
+    -net user,net=192.168.96.0/24,dhcpstart=192.168.96.10,domainname=andestech.com,hostfwd=tcp::9623-:23 \
+    -gdb tcp::9696
diff --git a/board/andes/ae350-optee/rootfs_overlay/boot/extlinux/extlinux.conf b/board/andes/ae350-optee/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..fcb3fc24e5
--- /dev/null
+++ b/board/andes/ae350-optee/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,3 @@
+label linux
+   kernel /boot/Image.gz
+   append earlycon=sbi root=/dev/mmcblk0p2 rootwait
diff --git a/board/andes/ae350-optee/uboot.config.fragment b/board/andes/ae350-optee/uboot.config.fragment
new file mode 100644
index 0000000000..bc503f7d51
--- /dev/null
+++ b/board/andes/ae350-optee/uboot.config.fragment
@@ -0,0 +1,14 @@
+CONFIG_CMD_OPTEE=y
+CONFIG_OPTEE=y
+CONFIG_OPTEE_LIB=y
+CONFIG_OPTEE_TA_RPC_TEST=y
+CONFIG_SPL_FS_FAT=y
+CONFIG_SPL_LOAD_FIT=y
+CONFIG_SPL_LOAD_FIT_ADDRESS=0x80020000
+CONFIG_SPL_MMC=y
+CONFIG_SPL_OPENSBI_SCRATCH_OPTIONS=0x0
+CONFIG_SPL_RAM_DEVICE=y
+CONFIG_SPL_TEXT_BASE=0x80000000
+CONFIG_SYS_FDT_BASE=0x801E0000
+CONFIG_TEE=y
+CONFIG_TEXT_BASE=0x01800000
diff --git a/configs/andes_ae350_45_optee_defconfig b/configs/andes_ae350_45_optee_defconfig
new file mode 100644
index 0000000000..02a91c5c2b
--- /dev/null
+++ b/configs/andes_ae350_45_optee_defconfig
@@ -0,0 +1,56 @@
+BR2_riscv=y
+BR2_RISCV_ISA_RVC=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/andes/ae350-optee/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_OVERLAY="board/andes/ae350-optee/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/andes/ae350-optee/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350-optee/genimage_sdcard.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,andestech,linux,optee_ast540_v4.3)/linux-optee_ast540_v4.3.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="ae350_rv64_smp"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae350-optee/linux.config.fragment"
+BR2_LINUX_KERNEL_IMAGEGZ=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ax45_c1_d_dsp_noncoherent_ae350_optee"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="24M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,andestech,optee_os,optee_ast540_v4.3)/optee_os-optee_ast540_v4.3.tar.gz"
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_PLATFORM="ae350"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="ARCH=riscv CFG_TEE_CORE_NB_CORE=1 CFG_NUM_THREADS=2 CFG_UNWIND=y CFG_IN_TREE_EARLY_TAS=trusted_keys/f04a0fe7-1f5d-4b9b-abf7-619b85b4ce8c mem_usage CFG_CORE_HEAP_SIZE=524288 CFG_TEE_RAM_VA_SIZE=0x00800000 CFG_TDDRAM_SIZE=0x04000000 CFG_PKCS11_TA_HEAP_SIZE=131072"
+BR2_TARGET_OPTEE_OS_CORE_IMAGES="tee.bin"
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,andestech,opensbi,optee_ast540_v4.3)/opensbi-optee_ast540_v4.3.tar.gz"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,andestech,uboot,optee_ast540_v4.3)/uboot-optee_ast540_v4.3.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ae350_rv64_spl_xip"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/andes/ae350-optee/uboot.config.fragment"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SWDTB=1"
+BR2_PACKAGE_HOST_ANDES_SPI_BURN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
