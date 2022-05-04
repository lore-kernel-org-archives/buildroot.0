Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D968C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 04:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE60761058;
	Wed,  4 May 2022 04:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NNyVuI1JhJ7B; Wed,  4 May 2022 04:02:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A651760E22;
	Wed,  4 May 2022 04:02:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7D041BF397
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 04:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A5640167
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 04:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64MHBd8vnWxL for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 04:02:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::617])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD97E40148
 for <buildroot@buildroot.org>; Wed,  4 May 2022 04:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8fLI0gdbSSIrrV1oMXDNw0ZXvELrTj5EaaOtlsqdHlJMDZqJHDIUjmxuN5RZr3WuB/gX89ja/3RoQ+Qss+EU6ZDyM2UQGW2ulHPK3/oKC08JGTDp0PaXZKKCTc/4/0Qf/SmQ14U0F18loRiHW/ObTcI01NLdJqQBNZ+tLr4JAVvYyOpdrqdMPLMOPQv0RDxWRpARkQNjIg7XoV4hVDGvCeYERQHoubZe1WRNTNhVZKCn9pNYD3CHg1wyfGUQzfywkZyuxP6hSs7mRmujzb9dY8MZrFOgqz6y4J63eFxhM/sRWLfh66TfNKnxwJ4Wo38dNg8bVVwVtuRqMz7qysAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAKaXr8CQeSLcUL7rdC4L76pbv+f83ZzTEF8IbyJ2Vw=;
 b=dxq/nZVRs10HxMGjiv+GTHiyhYeWcVq/dkgz12LS+Emi9QORb/2R84L2/EzzCQbrRRlPm5dWt04F+UTX61nxWb6PZEbzgmQGxaHdg+hTuhMqFfr/D13NC9mE/5lErXwqtvd8ncUDaX6TUBN71W8BVYEHn+GjUmPb4Koo+RT4b3/G7Zz7WMtN7jbd98BN8MYTxzcmeleLmGLhJYwuP4RK7tiQg0X8xz9iOYsF7nocjM3uVe87KZTIov5mmAETYAYltcfF6f1mHw2Fb+u8V/Dz0jDw5+SD5t+akO4u1U+Te83bnRe8x2TpYsOuMVTPfsGYL8Jskz1s2/8J1YmlbpEr4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAKaXr8CQeSLcUL7rdC4L76pbv+f83ZzTEF8IbyJ2Vw=;
 b=RQBfSrEbw8uqZUHuv8EnDaCqA5nptiWIlSVHrfvjKo9YeDwJMctgsa9FTyTpE6kp0VZYnfEx4YivJ0Op3uO0cvnyZUFFdaTDCz9Y1dMCxifSL1dMRnFpNneUbf4rBodSdPShyC9jAls1CJc0SkmJmLQLu4beOh8c3qzY6OZOeF8=
Received: from BN9PR03CA0966.namprd03.prod.outlook.com (2603:10b6:408:109::11)
 by BN0PR02MB8142.namprd02.prod.outlook.com (2603:10b6:408:16a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 04:01:57 +0000
Received: from BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:109::4) by BN9PR03CA0966.outlook.office365.com
 (2603:10b6:408:109::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 4 May 2022 04:01:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT062.mail.protection.outlook.com (10.13.2.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 04:01:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 21:01:53 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 21:01:53 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, ju.o@free.fr,
 arnout@mind.be, peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=35390 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nm6D3-0008rT-9S; Tue, 03 May 2022 21:01:53 -0700
To: <buildroot@buildroot.org>
Date: Tue, 3 May 2022 22:01:44 -0600
Message-ID: <20220504040144.3297941-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1fb16df-5100-46cd-306a-08da2d82d4f0
X-MS-TrafficTypeDiagnostic: BN0PR02MB8142:EE_
X-Microsoft-Antispam-PRVS: <BN0PR02MB8142BC6490D2437BCE93BD6DF0C39@BN0PR02MB8142.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Db+Cd9a1XDOS7Cv9qxyJHwQ/aWg3MbNh+eK/zZA9wU4DkJins1mvai748qfMA1NYtB9jP2C/QNzjwoVjt5kRLi82lU4Oj4OhpAJOz44FcT1XfCjj2eTjpoQruCnYmuwyqVzM8yvs67Tb4w8rBIwTETnKd1slA/yFuNTzzqeWmCKwBRMMYjiCMB7EpVoDBfIXnbWFarICqrP/aQnHzRA7xDqsfCislLhDtMPA8xKEoUpKMOltbP8feogbPjW5lWtbO/0gm00afob+eJRyHoffp8ylgdP5uA7scOiiootmei0DcuEb4x0ZBelWS7agDLn5U4sVIoZs6xp0mntF748GRTbDNkEMcBMNC/pX8LM/1dKUzOAwvZ1XBKTs13kdJcpZIv4/BtsnZFMrvAuA0z3WhP/Tcg43aVYMlYTtW87qj/VFrLfGpmtJ+wuiN3O3zAvKj7MYQWo3v/LsjyDVhbSdrJ3fF3bFGYPG8Xxl3EkIyHI7zp/RqckwNaPoNrToqP7Gjx3RIES4iyklpW33/9J9nfPAcCRZP126BazKsoz/86IgsrsqeHcJo30LEWat43pchfgv02APohSV5lF8N+pquOL7NSJ3Sl5JGODtISqDEi4M0hEfVuWfKgqUHSVmPDgPdKn82PccFRTZ1j3FnWrdzbXFLa56U82zT2bd7D7W74Z0+uLyTOfi0l+7TjWaxadQfil63ORVamPj8Oy8etBOfQ+UFeFcjJb012gtqHU38LMQ14xipaKCKRDugLoKzkUflLvgRMKcdwcB3uML5YD55+1hgw6DRagGepKxCvUG0I9RKT/oat0F23jKLzCtH/PoppyuIfgyzrhba/DX2ZNjkQQ3rNmjkfGXSLrFUTohBBc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(35950700001)(82310400005)(5660300002)(70586007)(30864003)(4326008)(9786002)(508600001)(70206006)(44832011)(8936002)(8676002)(7636003)(1076003)(6916009)(54906003)(316002)(356005)(6666004)(2906002)(26005)(2616005)(83380400001)(36756003)(40460700003)(47076005)(86362001)(336012)(102446001)(21314003)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 04:01:56.6449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fb16df-5100-46cd-306a-08da2d82d4f0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8142
Subject: [Buildroot] [PATCH v2 1/1] configs/zynq_xxx_defconfig: bump to
 Xilinx 2022.1
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
Cc: ju.o@free.fr, Neal Frager <neal.frager@amd.com>, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps configs/zynq_xxx_defconfigs to Xilinx software release 2022.1
which includes the following updates:
  - U-Boot bumped to 2022.01
  - Linux bumped to 5.15.19
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support
  - U-Boot migrated from git clone to tarball for faster builds

This patch has been build and run tested on a ZC706 evaluation board.
This patch has been build tested only for zed, microzed and qmtech boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>

---
V1->V2:
  - squashed patch set into single atomic patch
---
 board/zynq/extlinux.conf           |  4 ++++
 board/zynq/genimage.cfg            | 11 ++++++++---
 board/zynq/microzed/uboot.fragment |  1 +
 board/zynq/post-build.sh           |  8 ++++++++
 board/zynq/post-image.sh           |  6 ++++--
 board/zynq/zc706/uboot.fragment    |  1 +
 board/zynq/zed/uboot.fragment      |  1 +
 configs/zynq_microzed_defconfig    | 22 +++++++++++-----------
 configs/zynq_qmtech_defconfig      |  7 ++++---
 configs/zynq_zc706_defconfig       | 20 ++++++++++----------
 configs/zynq_zed_defconfig         | 24 ++++++++++++------------
 11 files changed, 64 insertions(+), 41 deletions(-)
 create mode 100644 board/zynq/extlinux.conf
 create mode 100644 board/zynq/microzed/uboot.fragment
 create mode 100755 board/zynq/post-build.sh
 create mode 100644 board/zynq/zc706/uboot.fragment
 create mode 100644 board/zynq/zed/uboot.fragment

diff --git a/board/zynq/extlinux.conf b/board/zynq/extlinux.conf
new file mode 100644
index 0000000000..3c2ab4f46a
--- /dev/null
+++ b/board/zynq/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /uImage
+  devicetree /system.dtb
+  append console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait
diff --git a/board/zynq/genimage.cfg b/board/zynq/genimage.cfg
index 67baca795e..78eb9275dd 100644
--- a/board/zynq/genimage.cfg
+++ b/board/zynq/genimage.cfg
@@ -3,12 +3,12 @@ image boot.vfat {
 		files = {
 			"boot.bin",
 			"u-boot.img",
-			"devicetree.dtb",
+			"system.dtb",
 			"uImage"
 		}
 
-		file uramdisk.image.gz {
-			image = "rootfs.cpio.uboot"
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
 		}
 	}
 
@@ -24,4 +24,9 @@ image sdcard.img {
 		bootable = "true"
 		image = "boot.vfat"
 	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
 }
diff --git a/board/zynq/microzed/uboot.fragment b/board/zynq/microzed/uboot.fragment
new file mode 100644
index 0000000000..bc4dffaffa
--- /dev/null
+++ b/board/zynq/microzed/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-microzed"
diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh
new file mode 100755
index 0000000000..9fd8bbf2c8
--- /dev/null
+++ b/board/zynq/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# genimage will need to find the extlinux.conf
+# in the binaries directory
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index 0cf92e0aa9..ac74286cf6 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -8,6 +8,8 @@ FIRST_DT=$(sed -n \
            's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
            ${BR2_CONFIG})
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb
+[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
 
-support/scripts/genimage.sh -c board/zynq/genimage.cfg
+BOARD_DIR="$(dirname $0)"
+
+support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
diff --git a/board/zynq/zc706/uboot.fragment b/board/zynq/zc706/uboot.fragment
new file mode 100644
index 0000000000..ad5efa6204
--- /dev/null
+++ b/board/zynq/zc706/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-zc706"
diff --git a/board/zynq/zed/uboot.fragment b/board/zynq/zed/uboot.fragment
new file mode 100644
index 0000000000..d58fcd5439
--- /dev/null
+++ b/board/zynq/zed/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-zed"
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 1bb11fee7e..10a4f4095f 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-microzed"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_microzed"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/microzed/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/zynq_qmtech_defconfig b/configs/zynq_qmtech_defconfig
index 4db3f68b1f..f536b80f57 100644
--- a/configs/zynq_qmtech_defconfig
+++ b/configs/zynq_qmtech_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
@@ -14,9 +15,9 @@ BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-qmtech"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index e8019177d2..82c47be7a5 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc706"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index a215695b54..34e1b67184 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zed/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
