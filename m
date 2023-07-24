Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F526C0015E
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 11:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 437CB60EAA;
	Mon, 24 Jul 2023 11:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 437CB60EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OERAOExRWm16; Mon, 24 Jul 2023 11:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5648060F47;
	Mon, 24 Jul 2023 11:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5648060F47
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FDAD1BF4D6
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 11:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6639240C11
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 11:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6639240C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOKBoe1H3_aN for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 11:06:35 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5887640182
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 11:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5887640182
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxKL7+6L1NDYlUyuQRF0RlHkJieyI2/ALppJSQ+JE5zJM9zobZhS3kzAzaZoEhH+orn09XE0kvAawDnO21P4kfcKlr4mRNsG07jaDArXFk7O84TWmPDliknn0BuhAJqFDcF2Y116q1Qm+ueKfXExuNVi5FiWfO56dyhSLWVEQleefgRO60GZeu44ffd/ywQKA2b7hFIXi9XY0rTbVdZKWxMACC69YrKR9AbcrsAIJpMxL6wn7Jyz9Lb8Gkq2aBSJwo6IeB5GbyS1Zc4as4q+DnFpo5+zL9uhmGAUhcP+lqQFYSdRwgR+eD3bBNPxaKX1eSu3dUhalmOSVUfzE4LABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLnFQcglmCdz3ScSYjvgB0eh7FuG+edu7R8CSiwfCJo=;
 b=HMPc+Hm0PakMtQFqlsBd3pAJjxk58lG+wFAHzjeCwvCxrFtCV4ckOlvrrZOS2Am88vxjovwNSoqZCbC+GJ++Z0AvW9/tsjDnl5K9AZWYArHWMm9fcYOTLudM9HTkYMJYEjZQ/4ZNrsnpqxweHy60JCf1zn+35gpEtJmS2wVAFkB7ffLZwooyKy7iYwcJNzZ19KjC4PncQjEVOS1GeV+udTqdEDgkri6Nsd3dOA7UQu7jrBpXBM89FMQEIGF93m3hFfuDX79G4dQOzPhl5YsAMV9fjIFeNQBPXkNeKEExF2j7qkPRxI5GM4Pj7nY5KPp3y1bp83OFXfmDCTlrJk7CGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN0PR04CA0057.namprd04.prod.outlook.com (2603:10b6:408:e8::32)
 by DM8PR12MB5496.namprd12.prod.outlook.com (2603:10b6:8:38::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 11:06:32 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::34) by BN0PR04CA0057.outlook.office365.com
 (2603:10b6:408:e8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33 via Frontend
 Transport; Mon, 24 Jul 2023 11:06:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.22 via Frontend Transport; Mon, 24 Jul 2023 11:06:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 24 Jul
 2023 06:06:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 24 Jul
 2023 04:06:31 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 24 Jul 2023 06:06:30 -0500
To: <buildroot@buildroot.org>
Date: Mon, 24 Jul 2023 12:06:06 +0100
Message-ID: <20230724110606.794742-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT044:EE_|DM8PR12MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: bc031332-5f7e-4f0c-5d47-08db8c36098e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UTilbKJxt/qQBGJRSfnXwfUiV9NTMa01D1DJVf3g0yiGtdCUSIgLzB7JZB227JSUKco/tL+ax/5Ugtq8RVqKsABkIwRzH/7oRhcNKTYPnl8fSc1gx/x/u7FRCxFgiHCEUU8II6K+3fpx4yOVVxtMVRktlNdw2O1d1ra5Akwfmr5AcKgsCTIcls16IINevbkjDtk8Z1eao1txxbj7IkIYAAoeKtg8XJIK1eCqHtonaExyt/Zfp4CGaxE86BTlz0Y3f5uHKuL/98Exow0UqbUktUKdasmKTrHbAhep3ns3nX806cs7Q2Gad2VrAcKnagN+LcAlQ4cYWh0M2RwFzqOoBko5vOLtIJb3N1ub+D3R7H5NFfNV7LLvmsfuYq4SSE+Ce+kYyjUTZ8kzovwTAfMcl6sm9WWiJSt7yZ9XSfIGYzvAYOR+YqkMhTrXZ/5a4edaNXa0EdN5+v3nhP5h2FEBuOXCf13hO8cXbqa3q1C1QQr5MeV5xsO5o4nyiL0p+Ym/8rNPBDKQ07dlecF98n9ykxQ3pVRNl+MTXYqsNDXbjF7oigG4TXgHdAcHKzHz7dgkuJTOjoOL+elNGi5qO/MOLL/FpPQRNG/rW05cunyEwiretHc8D99pCYI9xDV0XegiC5CZmKBB2yWZCLu0iecYCbxlMWH3UdxFWH1fvTZYVwdoD85wu5ps4+vE5t62CS4oso4KEkaJtSaD6R8LQUinS5aCLv2px/GCY57ev5nsUZABVO0GIBbjaXR7Q606BUO31e2LhYdXI9ZAdl7TbrIrYQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(40460700003)(81166007)(40480700001)(356005)(36860700001)(36756003)(2616005)(426003)(47076005)(83380400001)(8676002)(8936002)(5660300002)(44832011)(54906003)(478600001)(6916009)(4326008)(316002)(70206006)(70586007)(41300700001)(186003)(26005)(336012)(1076003)(6666004)(2906002)(86362001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 11:06:31.9035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc031332-5f7e-4f0c-5d47-08db8c36098e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5496
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLnFQcglmCdz3ScSYjvgB0eh7FuG+edu7R8CSiwfCJo=;
 b=5bqaDg9msOhTeOANuGARyGxf0xrz/jbdE8rTrueWtfsDkUymhtmXwSWo5X6/ckj7rJ2nKbfE2CQEdaIYQl7f8DXXHci3jsBiziZKZNaPQLdo+8X2cmp9aASC3x3PQzZLgJUy4fy6Va9N8FpZT12sP/nutgzFr28iE+/oc5Nhb7Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5bqaDg9m
Subject: [Buildroot] [PATCH v1 1/1] board/versal: merge post scripts
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch merges the versal post scripts as only one script is needed.
This patch also cleans up some shellcheck issues.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .checkpackageignore             |  2 --
 board/versal/post-build.sh      | 16 ----------------
 board/versal/post-image.sh      | 25 +++++++++++++++++++------
 configs/versal_vck190_defconfig |  1 -
 4 files changed, 19 insertions(+), 25 deletions(-)
 delete mode 100755 board/versal/post-build.sh

diff --git a/.checkpackageignore b/.checkpackageignore
index b9265ae2e4..3d90a23471 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -99,8 +99,6 @@ board/technologic/ts4900/post-image.sh Shellcheck
 board/toradex/apalis-imx6/post-image.sh Shellcheck
 board/udoo/common/post-build.sh Shellcheck
 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
-board/versal/post-build.sh Shellcheck
-board/versal/post-image.sh Shellcheck TrailingSpace
 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
 boot/at91bootstrap/0001-eabi-fix.patch Upstream
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
deleted file mode 100755
index ff8f8a6071..0000000000
--- a/board/versal/post-build.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-# genimage will need to find the extlinux.conf
-# in the binaries directory
-
-BOARD_DIR="$(dirname $0)"
-CONSOLE=$2
-ROOT=$3
-
-mkdir -p "${BINARIES_DIR}"
-cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
-	label linux
-	  kernel /Image
-	  devicetree /system.dtb
-	  append console=${CONSOLE} clk_ignore_unused root=/dev/${ROOT} rw rootwait
-	__HEADER_EOF
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 92e65ed3b7..7a776616a5 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -6,11 +6,13 @@
 
 FIRST_DT=$(sed -nr \
                -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               ${BR2_CONFIG})
+               "${BR2_CONFIG}")
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
+[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
 
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR="$(dirname "$0")"
+CONSOLE=$2
+ROOT=$3
 BOARD_NAME=$4
 
 mkdir -p "${BINARIES_DIR}"
@@ -23,7 +25,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
 	  }
 	  image {
-	    id = 0x1c000000, name=apu_subsystem 
+	    id = 0x1c000000, name=apu_subsystem
 	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/u-boot.dtb }
 	    { core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
 	    { core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
@@ -31,5 +33,16 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	}
 	__HEADER_EOF
 
-${HOST_DIR}/bin/bootgen -arch versal -image ${BINARIES_DIR}/bootgen.bif -o ${BINARIES_DIR}/boot.bin -w on
-support/scripts/genimage.sh -c ${BOARD_DIR}/genimage.cfg
+"${HOST_DIR}/bin/bootgen" -arch versal -image "${BINARIES_DIR}/bootgen.bif" -o "${BINARIES_DIR}/boot.bin" -w on
+
+# genimage will need to find the extlinux.conf in the binaries directory
+
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+	label linux
+	  kernel /Image
+	  devicetree /system.dtb
+	  append console=${CONSOLE} clk_ignore_unused root=/dev/${ROOT} rw rootwait
+	__HEADER_EOF
+
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index a393b681c8..e8694f20c9 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,7 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2 vck190"
 BR2_LINUX_KERNEL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
