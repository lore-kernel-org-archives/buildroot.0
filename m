Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6959BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 05:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF75240153;
	Sat,  9 Apr 2022 05:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYH-_4B6DrSp; Sat,  9 Apr 2022 05:39:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3E3640143;
	Sat,  9 Apr 2022 05:39:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 290961BF955
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 05:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0933E41E60
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 05:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8zhICwzZUoqg for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 05:39:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12rlnn20071.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::71])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C04E641E59
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 05:39:14 +0000 (UTC)
Received: from CH2PR02MB6952.namprd02.prod.outlook.com (2603:10b6:610:82::23)
 by BYAPR02MB4583.namprd02.prod.outlook.com (2603:10b6:a03:12::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 22:03:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI8IWOc4CFOx7TnZcQN8r3LRK1YKRgpxyyyVXzU7HQCON8Dx/w4VKy3xwGDgbRIrFKJiNWX/QSKTzklwFzubCzXWfxw1K9tOoP//tSlewbBaDfcjnivz3fqULwxo8SSxFWqOF6ziIHIstFREt/ZTGbSMjO3YpJ9H0Du19kzpXNllzAI4v/lSLZmh4De04DjCfVHVfLhmErCRZDE2kkWBG09f900/1Q0cRB+5HDKOQ7249dYIc9p/UhQ/c+dMHjvIg+qsIodpdQjbjoyqo/U6nxNQvTGJlFcGhEtsNjXUtvjz8j91k6duDZhoapPc7q0gaXyV9Il/pyIxrK0HOUOyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYwqXwA8IbX0H7qTO6LH0jmXSov3VyPl0y5pbWowWPo=;
 b=SkDlYsVJcTj8KK4ei1R3AGBAs/ZSa3byW9+Bs2/W5scbb04Mwj6iibYYgfuKjymtG1f57sntilKcQu5QRgmRByljFksZgrC04IQ6sAc1RIeAIuvyO51/HepEAaBoNwlkVW8ewFVYebRew3CF72lV4Yq0lfKfh8Xq7MjlljNSsDiDUxUTjcSLB8S9X0hxiKSEF77f/8moza7GxxVK9z8MnZuTw2RRZEHXTFS6ObFhCQCLEU86D/BpQkcywAinwp8Lod3R+24x8GyZJMCEmgiQNj1NmhWJV+yD7kn6kqBWYb2OQgcMJWncrOnb7caT+WAiahIptNrSxPiZ0+WLTnuxGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYwqXwA8IbX0H7qTO6LH0jmXSov3VyPl0y5pbWowWPo=;
 b=OH4O2PgbDJC+Z/PdWp4kpJA/EnXk2PUXuhGYfuNaWegsDyeZalz+fJcwcjQyIp/X5e91e3rhpPpseUa7nlZ/1a8Sx2azwZ1LdYhuD9c1Q2kn9egiIvGZPIPW8+ccHErJqtjh8tMg87fpf+JMD6JbfAG0xxvTIFucPm7eI8Gn8fo=
Received: from SN7P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::19)
 by CH2PR02MB6952.namprd02.prod.outlook.com (2603:10b6:610:82::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 14:55:48 +0000
Received: from SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:124:cafe::da) by SN7P222CA0006.outlook.office365.com
 (2603:10b6:806:124::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19 via Frontend
 Transport; Fri, 8 Apr 2022 14:55:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0039.mail.protection.outlook.com (10.97.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 14:55:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 8 Apr 2022 07:55:45 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 8 Apr 2022 07:55:45 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, ju.o@free.fr,
 peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=52866 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1ncq1Z-0000FZ-Ps; Fri, 08 Apr 2022 07:55:45 -0700
To: <buildroot@buildroot.org>
Date: Fri, 8 Apr 2022 08:55:28 -0600
Message-ID: <20220408145531.1641356-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdf498eb-c430-48d5-4a59-08da196fdd46
X-MS-TrafficTypeDiagnostic: CH2PR02MB6952:EE_|BYAPR02MB4583:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB6952561B5ECFCCD17BF096D9F0E99@CH2PR02MB6952.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bxhni+duhuB1szB/ZDwq/ckqbJM05h1/sLZy18uEpsfB7J608/Psj5g/FPh5qqqKp4GIvM6TmdC1dZi6BQLFQZCJjqwblFU+E9VLGwVUlBo+aTawm831Vlx49a9KI5IQYCOVP21d4grqNWy/gIoD8Qk9uod/WKM5MJ7/2hObX/Rd2QzDas7XcQBdanb2BBvXA1HnURhvlfgeUNfLxXL5++QPD7o3FXiXo3JKFtS8aj/ZBJJ+ILSPyaqNMIMpQg/TwEOVHnxHxmgyFF5H30ZmJSBUoVyt0WckUnnzsHdmS6Ryrml0vMIRs9GyBBZe+mTzJqe+lKLRKfvdkT0C+INLtJUAlzak55N+SqGMV5sTELKy/41ieH4F8PsaehsZI9edMd8gGvD8Q8Qh1pTyevA8/dgELQ+be/bLdiQ/SD55uTbrNXKROGHDDAzu/wTNlBKJpJxu0ofYX3iHwJykc9QWIrhkmcI5dg3/5j8cOhgFvab2Xs1Df/AWjAwAy3Nh4Az8wPaSNG2SxJ/uPv13/vT5JKCFQj2/XOv2Ga+ds5zaC164TKnP7N5U0YRnaWq8PUYZf+lMFT8icXVb3xuLtEhW5S6uYdqlmYiN9c/fzszXrHoghiGKeYWevfDE65ZnvktjBsK3ddBsLMdzy8j1X0rCKoDgVxI0vUv6E+AjfJKVFNn4WGNwEZSzOpk0FNMDxjyDk77uSP1DUcSnEAY9Zuk0ko7lAcRoOacbots3R7PUrmj0cfuGUaIGvZ52raVTVxox5sSihSZPh7XK62lgwEysjkk+udHZpbw80pN+IdWqlyk97is4kgVfS5Mm1/ydK3VLBjKhvm4nTmxLyTGZFryWGy0HfCVnL8wFbqk3iHlReaA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(35950700001)(47076005)(4326008)(70206006)(8676002)(5660300002)(508600001)(336012)(8936002)(2616005)(26005)(83380400001)(1076003)(86362001)(40460700003)(9786002)(2906002)(70586007)(44832011)(82310400005)(356005)(7636003)(6916009)(36756003)(316002)(54906003)(6666004)(102446001)(41080700001);
 DIR:OUT; SFP:1022; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 14:55:47.0000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf498eb-c430-48d5-4a59-08da196fdd46
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6952
X-OriginatorOrg: xilinx.onmicrosoft.com
Subject: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump to
 Xilinx 2021.2
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com, ju.o@free.fr,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps configs/zynq_zc706_defconfig to Xilinx software release 2021.2
which includes the following updates:
  - U-Boot bumped to 2021.01
  - Linux bumped to 5.10
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support

This patch has been build and run tested on a ZC706 evaluation board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynq/extlinux.conf        |  4 ++++
 board/zynq/genimage.cfg         | 11 ++++++++---
 board/zynq/post-build.sh        |  8 ++++++++
 board/zynq/post-image.sh        | 14 ++++++++------
 board/zynq/zc706/uboot.fragment |  1 +
 configs/zynq_zc706_defconfig    | 20 +++++++++++---------
 6 files changed, 41 insertions(+), 18 deletions(-)
 create mode 100644 board/zynq/extlinux.conf
 create mode 100755 board/zynq/post-build.sh
 create mode 100644 board/zynq/zc706/uboot.fragment

diff --git a/board/zynq/extlinux.conf b/board/zynq/extlinux.conf
new file mode 100644
index 0000000000..b9345906e6
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
index 0cf92e0aa9..bf88aa7cd1 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -1,13 +1,15 @@
 #!/bin/sh
 
-# By default U-Boot loads DTB from a file named "devicetree.dtb", so
+# By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
 # devicetree listed in the config.
 
-FIRST_DT=$(sed -n \
-           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
-           ${BR2_CONFIG})
+FIRST_DT=$(sed -nr \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\1|p' \
+               ${BR2_CONFIG})
 
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
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index e8019177d2..6c2a858f14 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,26 +2,28 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
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
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
