Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F712C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 14:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3001C81FD9;
	Wed, 23 Nov 2022 14:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3001C81FD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzFVvhP4yvCe; Wed, 23 Nov 2022 14:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C3D81FCD;
	Wed, 23 Nov 2022 14:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C3D81FCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 844E21BF3E9
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E0FE81FCD
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E0FE81FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIVB4vfBRY2n for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 14:55:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C5D81FCB
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3C5D81FCB
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 14:55:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtHman5Z3wWGLG5xPRm4bDJf8M58NX03v9sGLGQEylNQ3NQVdZxkXvyeSlbZzgJgJeoIqXF2u4bSxhGR9F7luOiQ7lyW5ddye/6MXAc8NoedXE9Gen3t2ILQGbsfjAmzIwSh3rsJg9AYtPJGL5QVsw1+7dQLurUEKHViKsSUzKC0/K/KF8Z3h6BcmZFrr9KgvTpdVFRWKqRI+ozmgmtA9Gms6rppTXDvp71SMfQMezPmG/JGT5Hv/GIyrgz+0BWbqUYeDA4SsHLsQKZ71rerODr7QxHJl08Mm8T/W4AWWvYtl2yjTci5kz0poBrtHgXik+qIcjqQ7iBqzQ4gEhyVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glV0rb7LBFtqYb/3hHlnuNy7OL0trBEk8BFwlV44Q8g=;
 b=Y4PZWnJfntnUDUPpDG6JOpszkNGVcE3wuOQuVc0NxnG2BAz/mYqVg5iJGLkcejMt2t2OPdFW3iRyqe880iKRs+AIs3WaH1UUNNJgynXH93lbJoEdcqB9bKSXDP7XhT0OSTEzpb/nX6XzIZx2whK7OwhyY965qcApjfKPYb1CJzG/Fwmzp/SX/3uzMJ8KQFg7mD3Y+aveijvc7HBcL2u1XtMcH9WpDg+jARqlL5Lj1uY28bL3qVNOmXScOFRpkVqsqpW7TmFp+eMrvKdr/4+TPd6GjHmYBykAVa7THL2neOyttBtcrUoeVJDheDqyCcykUEgLi2+LUZS8Bj/vqUjHHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0223.namprd04.prod.outlook.com (2603:10b6:303:87::18)
 by MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 14:55:38 +0000
Received: from CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::66) by MW4PR04CA0223.outlook.office365.com
 (2603:10b6:303:87::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.18 via Frontend
 Transport; Wed, 23 Nov 2022 14:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT114.mail.protection.outlook.com (10.13.174.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 14:55:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 08:55:37 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 06:55:36 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 23 Nov 2022 08:55:36 -0600
To: <buildroot@buildroot.org>
Date: Wed, 23 Nov 2022 07:55:31 -0700
Message-ID: <20221123145531.9603-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221123145531.9603-1-neal.frager@amd.com>
References: <20221123145531.9603-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT114:EE_|MW3PR12MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: e89941bf-75f5-4336-512d-08dacd62c868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t2uM97qjUy954+jaWJStAl0mJzSMPrPKaUXFbbde1//x0U2yxx+YkT1trWAMpmilGETePMVQEWGIGTDpI+3e5FpuXcbBHWWisxa/U3jFpzDEbdHhRVpKeTlYEHr8lwCKM8IyXaMmwHrT19uYSEwpY+shDfEKKeE7C033UMv80nQPGPs5N6Kb4yr5U+JsN+bUzgvtydCyd6LGPXvvbLFdJjaVHLOzzDX78t92A6ojItXsKIQ2GvDcTq1LCq0G5406xubGfy2ZSFHzrjGHCutaZkzU+cGI7yrvEblSOlBbMftwqnHBdDJVZe3Y8Bjrwv/sn6+1mXqIJMlWmVDHwU96tVnA420WpmI2YpfgNRvPCkS0owpmLT8R1+TCx0EnDTuTVzjUbdNJBHk33BH0f0NSKW4gvDc+/Umjq41LVtXV4r9Vdyp9TrowMYZRC0vmI9NJyQ23VVDiOsmOGmkC+Hq/+fyTKQKGIX4eJuEJ8Fu+GL8/2BLmRxy4Oz3WojDenf+Z7p6sZ9VMkyo8AJh+AVzogxTokp9KUruFrzDm7tDvJoiBtzuAFGrWXeIA7xU0UpC7jRfZp39V7CHhCi0dsfaovHPn+XCkeFe25V9CRIlWlX8p8pMy1vdNv4HvmMd67nHp6bS4elfffAI94rz1omN2nnm9yKJ9hLHkK6zi0eN6XTDL1jVpRqbu6eFHmOmP85DXi8wdMFhgF0CZLUW2oKYutLSXpSK/87IJSOMwdNDW516kpxqJtg2GhZesbdk8i01TZ2sRJLh6I/v6BsxHJJCIxciVhdOOgOflZ4tIF/Ncdap897uK8rwHQmtGGFn2lbIk
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(36860700001)(83380400001)(40460700003)(1076003)(40480700001)(70586007)(2616005)(86362001)(36756003)(41300700001)(82310400005)(70206006)(6916009)(47076005)(81166007)(54906003)(356005)(82740400003)(8676002)(186003)(8936002)(44832011)(5660300002)(4326008)(6666004)(26005)(426003)(316002)(336012)(966005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 14:55:37.7552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e89941bf-75f5-4336-512d-08dacd62c868
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glV0rb7LBFtqYb/3hHlnuNy7OL0trBEk8BFwlV44Q8g=;
 b=V2Nto/Dg7VYi32b+gj3JHR6KnjkAvfUN3zBWpwzRZY2g0NgBOisxIvQF56Jst30Izb7+IVH1IeVLPPbvhKYDwjeqkCR97dXPge3jmr5VY0ucPpmKE26W0bOBw7FYZUJ6sRnVAVi4U2rd0tBafKJtoCUfGJwV4I2zIk7R3kkyucY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=V2Nto/Dg
Subject: [Buildroot] [PATCH v5 2/2] configs/versal_vck190: new defconfig
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
V2->V3:
  - correct console name to ttyAMA0
  - added necessary extlinux.conf append flags
V3->V4:
  - switch to stripped u-boot.elf binary
  - clean up bootgen.bif file format
V4->V5:
  - using new BR2_TARGET_UBOOT_FORMAT_BIN_ELF config
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
index 4689453d54..63d0758858 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2146,9 +2146,11 @@ F:	package/pkg-qmake.mk
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
index 0000000000..ff8f8a6071
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
+	  append console=${CONSOLE} clk_ignore_unused root=/dev/${ROOT} rw rootwait
+	__HEADER_EOF
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
new file mode 100755
index 0000000000..890522c31d
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
+	  image {
+	    { type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
+	    { type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
+	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
+	  }
+	  image {
+	    id = 0x1c000000, name=apu_subsystem 
+	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/system.dtb }
+	    { core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
+	    { core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
+	  }
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
index 0000000000..b07c17b3fe
--- /dev/null
+++ b/configs/versal_vck190_defconfig
@@ -0,0 +1,38 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2 vck190"
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
+BR2_TARGET_UBOOT_FORMAT_BIN_ELF=y
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
