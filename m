Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411AAE7D0AF
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 21:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B61F8418CC;
	Thu, 21 Sep 2023 21:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B61F8418CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8TZp_dlWkiB; Thu, 21 Sep 2023 21:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6CFC41889;
	Thu, 21 Sep 2023 21:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6CFC41889
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF1481BF3DB
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 21:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84A1541801
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 21:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A1541801
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qrCh9H_80Y0h for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 21:57:04 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EA744188D
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 21:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EA744188D
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38LI5QYW018429; Thu, 21 Sep 2023 21:57:01 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3t8tt72dr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 21:57:01 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38LLv0Em014964
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 21:57:00 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38LLux9d025054
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 21 Sep 2023 21:56:59 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 688536065A;
 Thu, 21 Sep 2023 16:56:59 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:56:33 +0000
Message-ID: <20230921215633.34828-4-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921215633.34828-1-brandon.maier@collins.com>
References: <20230921215633.34828-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309210190
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210189
X-Proofpoint-GUID: X6ZNL5oa5arGMl84PI_Yo3gZRNc8KPHy
X-Proofpoint-ORIG-GUID: X6ZNL5oa5arGMl84PI_Yo3gZRNc8KPHy
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309210190
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=InuQCJGI/2SMXY3cueYAoDq2uVEbhK238KD+VGQ5nYI=;
 b=YdmoLzamFcWwo66lMQr8b0sbh3xVSKq5l7FRg1dAc3br1mT/cYPyVnzijgCS63p4fsxM
 fiUNS2mPiIDP8oJBqMK0lQg27Got3hV+NZfmtfTZ0or4YxLV1zuFbHCUy1jT2HbRvVnK
 WUpoKiJHZ5IV2rn6F/i5czFdp06aoWJGbyId55kqvXnG91heH1TbMGG5pNuZ3gO7su4i
 MnzLjUi2HBRxw8Pf1SPiiLxh2d+CJ3wbNMCFgFwcTzELqDPEZ9zW1oDaTsr05FZiKZd7
 OC1/WMqqxmNZEwKdcw5zKCJxFtG31VdpaJhInl/iOyeK0Zc8uffG8VUpJkY1Z/XAy5wn EQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=YdmoLzam
Subject: [Buildroot] [PATCH 4/4] configs/ls1046a-frwy: new defconfig
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>,
 Maeva Manuel <maeva.manuel@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a development platform for the NXP LS1046A SoC.

The config is heavily based on the ls1028ardb_defconfig.

see https://www.nxp.com/design/software/qoriq-developer-resources/ls1046a-freeway-board:FRWY-LS1046A

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 DEVELOPERS                                    |  2 +
 board/freescale/ls1046a-frwy/genimage.cfg     | 29 ++++++
 board/freescale/ls1046a-frwy/readme.txt       | 90 +++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |  4 +
 configs/ls1046a-frwy_defconfig                | 61 +++++++++++++
 5 files changed, 186 insertions(+)
 create mode 100644 board/freescale/ls1046a-frwy/genimage.cfg
 create mode 100644 board/freescale/ls1046a-frwy/readme.txt
 create mode 100644 board/freescale/ls1046a-frwy/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 configs/ls1046a-frwy_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e1f0c1cf1b..fd07865fb1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -513,6 +513,8 @@ F:	package/iftop/
 F:	package/ncdu/
 
 N:	Brandon Maier <brandon.maier@collins.com>
+F:	board/freescale/ls1046a-frwy/
+F:	configs/ls1046a-frwy_defconfig
 F:	package/qoriq-fm-ucode/
 F:	package/vmtouch/
 
diff --git a/board/freescale/ls1046a-frwy/genimage.cfg b/board/freescale/ls1046a-frwy/genimage.cfg
new file mode 100644
index 0000000000..63cca042b2
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/genimage.cfg
@@ -0,0 +1,29 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition fsbl {
+		offset = 4K
+		in-partition-table = "no"
+		image = "bl2_sd.pbl"
+	}
+
+	partition ssbl {
+		offset = 1M
+		in-partition-table = "no"
+		image = "fip.bin"
+	}
+
+	partition fman {
+		offset = 9M
+		in-partition-table = "no"
+		image = "fsl_fman_ucode_ls1046_r1.0_106_4_18.bin"
+	}
+
+	partition rootfs {
+		offset = 16M
+		partition-type = 0x83
+		bootable = "true"
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
new file mode 100644
index 0000000000..fbcfdb1b85
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -0,0 +1,90 @@
+**************
+NXP LS1046A-FRWY
+**************
+
+This file documents the Buildroot support for the LS1046A Freeway Board.
+
+for more details about the board and the QorIQ Layerscape SoC, see the following pages:
+  - https://www.nxp.com/design/software/qoriq-developer-resources/ls1046a-freeway-board:FRWY-LS1046A
+  - https://www.nxp.com/FRWY-LS1046A
+  - https://www.nxp.com/docs/en/quick-reference-guide/FRWY-LS1046AGSG.pdf
+
+for the software NXP LSDK (Layerscape Software Development Kit), see
+  - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
+
+the components from NXP are:
+  - rcw, LSDK 21.08
+  - atf (fork), LSDK 21.08
+  - uboot (fork), LSDK 21.08
+  - qoriq-fm-ucode (blob), LSDK 21.08
+  - linux (fork), LSDK 21.08
+
+Build
+=====
+
+First, configure Buildroot for the LS1046A-FRWY board:
+
+  make ls1046a-frwy_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl
+  - fip.bin
+  - fsl_fman_ucode_ls1046_r1.0_106_4_18.bin
+  - fsl_fman_ucode_ls1046_r1.0_108_4_9.bin
+  - fsl-ls1046a-frwy.dtb
+  - fsl-ls1046a-frwy-sdk.dtb
+  - Image
+  - PBL.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - sdcard.img
+  - u-boot.bin
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
+  dd if=output/images/sdcard.img of=/dev/sdX
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/ls1046a-frwy/genimage.cfg.
+
+Boot the LS1046A-FRWY board
+=========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the switches SW1[1:9] = 0_0100_0000 (select SD Card boot option)
+- put a Micro-USB cable into UART1 Port and connect using a terminal emulator
+  at 115200 bps, 8n1. Or remove the jumper on J72, connect a USB to TTL cable
+  to J73, and connect using a terminal emualtor at 115200 bps, 8n1.
+- power on the board.
+
+The front panel Ethernet connectors are off at boot, to bring them up run the
+following commands.
+
+1G PORT1
+  ip link set eth1 up
+
+1G PORT2
+  ip link set eth2 up
+
+1G PORT3
+  ip link set eth0 up
+
+1G PORT4
+  ip link set eth3 up
diff --git a/board/freescale/ls1046a-frwy/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/ls1046a-frwy/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..536d62b6c5
--- /dev/null
+++ b/board/freescale/ls1046a-frwy/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label ls1046afrwy-buildroot
+  kernel /boot/Image
+  devicetree /boot/fsl-ls1046a-frwy-sdk.dtb
+  append console=ttyS0,115200 root=/dev/mmcblk0p1 earlycon=uart8250,mmio,0x21c0500 rootwait
diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
new file mode 100644
index 0000000000..ce796ce3ef
--- /dev/null
+++ b/configs/ls1046a-frwy_defconfig
@@ -0,0 +1,61 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72=y
+
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/common/patches"
+
+# Toolchain
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="ls1046afrwy"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/freescale/ls1046a-frwy/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1046a-frwy/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,LSDK-21.08)/linux-LSDK-21.08.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1046a-frwy freescale/fsl-ls1046a-frwy-sdk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,LSDK-21.08)/atf-LSDK-21.08.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1046afrwy"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,LSDK-21.08)/u-boot-LSDK-21.08.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1046afrwy_tfa"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+
+# Firmware
+BR2_PACKAGE_QORIQ_FM_UCODE=y
+BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM="ls1046"
+
+# Host utilities
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_QORIQ_RCW=y
+BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1046afrwy/NN_NNQNNPNP_3040_0506/rcw_1600_sdboot.bin"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
