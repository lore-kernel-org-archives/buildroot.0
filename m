Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C88C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 09:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FD4D60F9E;
	Thu,  3 Nov 2022 09:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD4D60F9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fH_QdKp4T3p7; Thu,  3 Nov 2022 09:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40CFA607B0;
	Thu,  3 Nov 2022 09:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40CFA607B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 870AA1BF83C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 09:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6032640165
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 09:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6032640165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lk1snDapXc5s for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 09:29:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D616A40190
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D616A40190
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 09:29:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AM25bvxjMdduxWlq6tl3uWE+Vg0W0NATDaCOJaRTPLYraBk2pKqaCqJKSKQeJXvxZ+OvpX/Re/8R+qXO24qjBT9vxTlpYFc63MzuXVJxZqq5iRAcbhE2nDWY05iTgobLvficzUSNiWiyW479C4C24tw523PhnijC533ulvZS3y1R47G5i6k9i9l8BxYLTVxC7I8gtthzvUKRPCcdktu/GyGg5PCHSc+K/EoONEoimlfp24ZnFLLXFlHBR9DRO0ADQB/8jmcMjVs4Y2HR5vRerWVazXA07kpHkwEznEnXle7mlEHfTGclusXt3Cwh4sZ/OBaNyPdiDtDCQRvSAqr0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chNEs1Ar0wktkkNfbA/05V82DPzEuCsYfuoP1gQTwB8=;
 b=URyZxValYij5p2yEUjwh/VuVQPUTnosdMWbT5OkYXv8MfpNsG/5aN+eJyS/3ALMRDFyWY/axq2Wy4zmEzPraYHG4cUUgkIN8NUa/mnjuY3M6VfY/2RQWy1aW+US8Gf6oNtoWN39fZhJe/P2D3aYszHonfMoOcxVRMqJByKEUs7qUV+YWVSZgCYS5dYNl1CMCHn6EU0BW/vxdfEE+FZw2go15+zG5/s5Nhttut+XNt6E+QjZFphs0jATFOxTimGAyhwykzgTkwSpPItZSbsDGWj7wJuUVPbf4oKAf1b2ZzVTPo6UnQgLjNnqjGotet7dx/3vjaWJzbbz5wqBam7IkLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0713.namprd03.prod.outlook.com (2603:10b6:408:ef::28)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 09:29:48 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::8b) by BN9PR03CA0713.outlook.office365.com
 (2603:10b6:408:ef::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 09:29:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 09:29:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 04:29:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 02:29:39 -0700
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 3 Nov 2022 04:29:38 -0500
To: <buildroot@buildroot.org>
Date: Thu, 3 Nov 2022 03:29:32 -0600
Message-ID: <20221103092932.17159-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221103092932.17159-1-neal.frager@amd.com>
References: <20221103092932.17159-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c83c248-db72-4ac9-dd8b-08dabd7df2cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j0q5BZAnNziAgWs5twoUffBioNYzk6NUFKqJXe/fdAkOuasO9Ip15cBinRDZaFHH5P/jsAerbc/NmaFuw+sRKyuCuOwBmhhJlssNLMmgZtnfBCULPEOtTX7AXXqFtibFqu4ktQ0CS5ChOoXyBuq6JJQA02HTDFu592PXCkL8XBowiTiWwAWhN4itjw6D6zavoMoDqTeeTd+CqEiVJZYeMYg2iNyfdq8IvV1iacRxdE56skeaLZCMI46mOhT/4nAxB4PDIx/1tfjI/U4JIQr9Xa8pEeUz2pc6Ag/Pg/J0QZdXt8peh/Kx+IIbHy6HiiBQ5+HgBctuuITPSUiZAxjW5K2sf2kK7qUza6LKHX6g/S+WDFXtXZglwpvMEWzAupkRZa9icGoCdwfvBsPaafth8CYteu4lPyD9qkDP5GxG4CsK756dJuG/35eiAaRcP6j90W+VEe8NXoLhB+mtDPfjUkilK7EwcZTmHQBW9WlL1r9cKdW18qGDOQHSjyJf13WGuWecnnmLeMgGjcMvDxoUch37JZo5411mph+z8z4MDcc3jMBS29qS67wq8b9zN79BcmOw+b0B01/r7YElqvIGubfTC9SXopou/RrRz8YpEogphv1H8qE8Mu+KxiJan3tvBTwcD4Wu8I5yMtNybBOu3cBhwtYlZ2oCTicogy/os0gqUAiF//w8aDpTbU3DIFgY5sKdzZ6Qk5Ptfsg5/5jzgBMFdVSffUOgc9eAmqCLVfe9bgU8DN9NxTvvXVkCxeLd3u8cbmvt22EjY2bBfiyHtLNQBjbbAsJ3oj+0EiIIQ4qtMilLeyGU3HnsL8qZNJQXNSf89VIg5km9X8VkPLXvMLlTLXKOk1bNvCBbJklRtyzuKDLHDx6ik6+IdUtktwdY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(6666004)(83380400001)(4326008)(70586007)(40460700003)(8676002)(70206006)(82740400003)(40480700001)(36860700001)(81166007)(41300700001)(36756003)(478600001)(186003)(1076003)(44832011)(426003)(356005)(26005)(82310400005)(966005)(316002)(336012)(86362001)(2616005)(2906002)(54906003)(5660300002)(8936002)(47076005)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 09:29:46.7886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c83c248-db72-4ac9-dd8b-08dabd7df2cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chNEs1Ar0wktkkNfbA/05V82DPzEuCsYfuoP1gQTwB8=;
 b=eIn+povlR32Ip1/JWYzPKtKKguhiSmMvvaDYY7AWTm9y9kIkLeyN7CGkfuIEpnKsU2a0Xq1xJID+SVfcYGMSaf3ZDyvQC6sSYj2vTUExHHlaDW/xKd2heFXVIiFFpxP8vj4knVjxSD1++7UFZhy3bUz2IsYPJ77+2zsBFfpaym0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eIn+povl
Subject: [Buildroot] [PATCH v2 2/2] configs/versal_vck190: new defconfig
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
From: Neal Frager via buildroot <buildroot@buildroot.org>
Reply-To: Neal Frager <neal.frager@amd.com>
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Versal VCK190 evaluation board.

VCK190 features can be found here:
https://www.xilinx.com/products/boards-and-kits/vck190.html

The VCK190 is based on the Xilinx Versal family:
https://www.xilinx.com/products/silicon-devices/acap/versal.html

The VC1902 included with the VCK190 evaluation board has Xilinx
AI Engine acclerators designed for accelerating machine learning
applications.  Also included is an upgrade from prior Zynq and
ZynqMP families to ARM Cortex-A72 cores.

While the Linux kernel for Versal is quite similar to ZynqMP,
the boot process has significantly changed.

Triple-redundant MicroBlaze cores are used to boot and setup
Versal devices.  For this reason, current buildroot support
will download pre-built firmware images and use Xilinx bootgen
to generate the boot.bin for the vck190.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - removed uboot.fragment and using BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS instead
  - squashed versal_vck190_defconfig and board files into single patch
---
 DEVELOPERS                      |  2 ++
 board/versal/genimage.cfg       | 30 ++++++++++++++++++
 board/versal/post-build.sh      | 16 ++++++++++
 board/versal/post-image.sh      | 35 +++++++++++++++++++++
 board/versal/readme.txt         | 54 +++++++++++++++++++++++++++++++++
 configs/versal_vck190_defconfig | 38 +++++++++++++++++++++++
 6 files changed, 175 insertions(+)
 create mode 100644 board/versal/genimage.cfg
 create mode 100755 board/versal/post-build.sh
 create mode 100755 board/versal/post-image.sh
 create mode 100644 board/versal/readme.txt
 create mode 100644 configs/versal_vck190_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index fcb46bf59d..95401d0069 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2180,9 +2180,11 @@ F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 
 N:	Neal Frager <neal.frager@amd.com>
+F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	board/zynqmp/kria/
+F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
diff --git a/board/versal/genimage.cfg b/board/versal/genimage.cfg
new file mode 100644
index 0000000000..d994d3a2bf
--- /dev/null
+++ b/board/versal/genimage.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"boot.bin",
+			"system.dtb",
+			"Image"
+		}
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
+		}
+	}
+
+	size = 32M
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
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
new file mode 100755
index 0000000000..0713bd1b05
--- /dev/null
+++ b/board/versal/post-build.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+# genimage will need to find the extlinux.conf
+# in the binaries directory
+
+BOARD_DIR="$(dirname $0)"
+CONSOLE=$2
+ROOT=$3
+
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+	label linux
+	  kernel /Image
+	  devicetree /system.dtb
+	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
+	__HEADER_EOF
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
new file mode 100755
index 0000000000..aad6813052
--- /dev/null
+++ b/board/versal/post-image.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+# By default U-Boot loads DTB from a file named "system.dtb", so
+# let's use a symlink with that name that points to the *first*
+# devicetree listed in the config.
+
+FIRST_DT=$(sed -nr \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
+               ${BR2_CONFIG})
+
+[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
+
+BOARD_DIR="$(dirname $0)"
+BOARD_NAME=$4
+
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
+	the_ROM_image:
+	{
+	image {
+		{ type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
+		{ type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
+		{ core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
+	}
+	image {
+		id = 0x1c000000, name=apu_subsystem 
+		{ type=raw, load=0x00001000, file=${BINARIES_DIR}/system.dtb }
+		{ core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
+		{ core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot }
+	}
+	}
+	__HEADER_EOF
+
+${HOST_DIR}/bin/bootgen -arch versal -image ${BINARIES_DIR}/bootgen.bif -o ${BINARIES_DIR}/boot.bin -w on
+support/scripts/genimage.sh -c ${BOARD_DIR}/genimage.cfg
diff --git a/board/versal/readme.txt b/board/versal/readme.txt
new file mode 100644
index 0000000000..9f234be620
--- /dev/null
+++ b/board/versal/readme.txt
@@ -0,0 +1,54 @@
+******************************************
+Xilinx VCK190 board - Versal
+******************************************
+
+This document describes the Buildroot support for the VCK190
+board by Xilinx, based on Versal.  It has been tested with the 
+VCK190 production board.
+
+Evaluation board features can be found here with the link below.
+
+VCK190:
+https://www.xilinx.com/products/boards-and-kits/vck190.html
+
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make versal_vck190_defconfig
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+    output/images/
+    +-- boot.bin
+    +-- boot.vfat
+    +-- Image
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- sdcard.img
+    +-- system.dtb -> versal-vck190-rev1.1.dtb
+    `-- versal-vck190-rev1.1.dtb
+
+How to write the SD card
+========================
+
+WARNING! This will destroy all the card content. Use with care!
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to an SD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the SD.
+
+Eject the SD card, insert it in the board, and power it up.
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
new file mode 100644
index 0000000000..c78694d70e
--- /dev/null
+++ b/configs/versal_vck190_defconfig
@@ -0,0 +1,38 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2 vck190"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_versal"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_ELF=y
+BR2_PACKAGE_VERSAL_FIRMWARE=y
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="v2022.2"
+BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_BOOTGEN=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
