Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77673EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 06:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3534098C;
	Mon,  7 Aug 2023 06:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF3534098C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_DVDPnnqgah; Mon,  7 Aug 2023 06:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2166F4109B;
	Mon,  7 Aug 2023 06:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2166F4109B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4E21BF39A
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 06:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F1E9405D0
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 06:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F1E9405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDtbVCIZI6qG for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 06:00:09 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58CD140272
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 06:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58CD140272
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiYOBn55TWSPja6e/vQFh5hpgavgzaYR9Kux6saMH8jnJNpa4Tm1ASAr9eAiUsempI4ILUuiCgDmW+etINxKl8oMCurcAP1nM4dDzgFVEG+ToZImhLZIzwwug5+h+fGCham9bf/6g52mDznFcI246KYx/5MhpnOEW4HjFY51Y5epUQFBkFceBspYZMpjWLbn3TH4U6RpsIM7eJIoanIB4GJ76pUdWFuAbto8tuHOQqLiUXM1qwMQEX5IU1mms0zRh/o1A071EkONcRzuZ6Y2lPuBYI51chncP6ny28Lqn+uxiDHC3zU5KGMMWmL8f0YPvaCCLvicwJDmkj4Wqn+Mog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOxSaytwwBYL2cmAYHe0g6bx+wXXoRmCjWewnhthrFM=;
 b=NAcWZi6GYH3B+Whq4s1po5f+SJpNbwTAiyocdFbM6LeOlxL1eAeSeqm4ulHqRqo/XoiCy6weCsF4i2hR7/2q3QLdw0D9LO8VNKR70reLpUH2IrMYP6ZUAPOh7dA+yv5InlLSjanVvyHnynxzoysK+m6Xsq5DhtXtcQqn1lt66PtfwJeot8Cryv8SnkhQvVn6tRVcbr1eF/RFVE6LoXD7xatwnEmgFfUMA2V/Dq6yHHJKDlCCZf9LbwS2Wnxb9FwK7PPi/e+cPfpEqpm3tr9Zg0K8JEGbXBx8xPuptmXjjl6sjwP0xsmJLfPHQyT2uDN64OUrg7//yyXs+y5T2Ahunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY8PR22CA0024.namprd22.prod.outlook.com (2603:10b6:930:45::29)
 by MN0PR12MB6175.namprd12.prod.outlook.com (2603:10b6:208:3c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 06:00:01 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:45:cafe::20) by CY8PR22CA0024.outlook.office365.com
 (2603:10b6:930:45::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Mon, 7 Aug 2023 06:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Mon, 7 Aug 2023 06:00:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 01:00:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 01:00:00 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 7 Aug 2023 00:59:38 -0500
To: <buildroot@buildroot.org>
Date: Mon, 7 Aug 2023 06:59:36 +0100
Message-ID: <20230807055936.2343266-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|MN0PR12MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a497f9-9c50-4d47-bfd1-08db970b8a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ioXgpX1Oz5nv0nSKr82IJTRRFViKMKolWX76EK9epuQ7IjcIdtn4scolc+qxqlbH9fRk3JjluEjr2zioEnyVLjMSlcEDX87ww3yyxZspfaTGkE49TXF+FWjRGh/C1mYLr9Q9pTIRgg7Q26xjymUrd+cfXvt3dOADxPsgJtIy0EUxX64DHJFzV+8yfrOXhxM/M+x0r4+3FNb8yl4HUdo+Obb7x1UE26d59f0pbmSa5/V4rHeOFmyCTNJ1ZkXDX5QILuXEG0tsLrodskwKFBu3l30sURFCOxWqBK1mkMT0x464GyT4lbTKnydeV+imCSZbPTz2W+cPLRkDnnXMC79nqW7m12N/pSShkIPEMS7lpoOUk6bDXZxKyk7YW4vcVVrk9gWyqZ4zVikwFs2b+zxHpLpBvIFe2eJd7qBIzpFYMmSf4Atwy1J7TS2rDwX3pGHeergV+2q0SH8AJPJgy6+5ra9tIHxxvKhqGzVkHNoUdom2gAWSYrGTMos278sYPom22Fb0IXofaX+dHT1Mt3l+L4zMtojPoCDitmlPZRLPQ4OGgNvDE0Arvtj/RlralamHmX64vrt9sIRBCoeMQLGt9gi/IVUhjcfdb11ZyNo9+1wqnSCeYbKJOXeV1pJrwdFoGDiehQpRzkju73cmkVgl08/dUc/1f+eNNoXoO8etU+pZUHJDAhu36NOY3L1biF7kc68n13KHEZ2Q8KzAmejDFvd5m8p/Uh7J/I9g8sOvJurhRyxFvKvD+/Y4dVyuNe+fxQ3dfmSJaXh2wKwCjBR5sWpDx5yT/UFA2ID1o1CZjRQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(186006)(451199021)(1800799003)(82310400008)(46966006)(36840700001)(40470700004)(8936002)(8676002)(54906003)(478600001)(5660300002)(44832011)(84970400001)(41300700001)(6916009)(4326008)(316002)(70586007)(70206006)(40460700003)(40480700001)(86362001)(336012)(1076003)(26005)(2906002)(966005)(82740400003)(81166007)(356005)(36756003)(83380400001)(47076005)(426003)(2616005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 06:00:02.6550 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a497f9-9c50-4d47-bfd1-08db970b8a87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOxSaytwwBYL2cmAYHe0g6bx+wXXoRmCjWewnhthrFM=;
 b=oKSMeqh6TgUE6DEphKXm+jBj4wRdchE7QrXtHLhWh5Pqm+SW1QH7rbLcyqxH6bTBPVeqsfItr4w/JnM+v6in/0zb9YfCPEeBbjy/tbnTjdg1TnzpOtehgMFAyRDg2Jn867kGEJxYKXAgIpLurjMsSo2kOn8aAEoTxG8gXj3L48o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oKSMeqh6
Subject: [Buildroot] [PATCH v2 1/1] configs/versal_vck190_defconfig: bump to
 xilinx-v2023.1
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

This patch bumps the versal_vck190_defconfig to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01
- TF-A v2.8 (including mainline patches)
- PLM xilinx_v2023.1
- PSMFW xilinx_v2023.1
- versal-firmware uses new github.com/Xilinx/soc-prebuilt-firmware repo

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - added TF-A mainline patches already included in buildroot
---
 ...d-add-support-for-new-binutils-versions.patch |  2 +-
 ...0002-build-tools-avoid-unnecessary-link.patch |  1 +
 board/versal/post-build.sh                       |  2 +-
 board/versal/post-image.sh                       |  7 +++----
 board/versal/uboot.fragment                      |  1 -
 configs/versal_vck190_defconfig                  | 16 ++++++++--------
 package/versal-firmware/Config.in                |  4 ++--
 package/versal-firmware/versal-firmware.mk       |  8 ++++----
 8 files changed, 20 insertions(+), 21 deletions(-)
 create mode 120000 board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
 delete mode 100644 board/versal/uboot.fragment

diff --git a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
index 695cc80b94..8ad996914b 120000
--- a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
+++ b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -1 +1 @@
-../../../../boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
+../../../../boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch b/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
new file mode 120000
index 0000000000..fecdee5449
--- /dev/null
+++ b/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
@@ -0,0 +1 @@
+../../../../boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
\ No newline at end of file
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
index ed08ea2d49..faa75a0de3 100755
--- a/board/versal/post-build.sh
+++ b/board/versal/post-build.sh
@@ -11,5 +11,5 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
 	label linux
 	  kernel /Image
 	  devicetree /system.dtb
-	  append console=${CONSOLE} clk_ignore_unused root=/dev/${ROOT} rw rootwait
+	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
 	__HEADER_EOF
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 1d9802c34d..22367d5028 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -11,16 +11,15 @@ FIRST_DT=$(sed -nr \
 [ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
-BOARD_NAME="$4"
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	the_ROM_image:
 	{
 	  image {
-	    { type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
-	    { type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
-	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
+	    { type=bootimage, file=${BINARIES_DIR}/vpl_gen_fixed.pdi }
+	    { type=bootloader, file=${BINARIES_DIR}/plm.elf }
+	    { core=psm, file=${BINARIES_DIR}/psmfw.elf }
 	  }
 	  image {
 	    id = 0x1c000000, name=apu_subsystem
diff --git a/board/versal/uboot.fragment b/board/versal/uboot.fragment
deleted file mode 100644
index 6f71907379..0000000000
--- a/board/versal/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_OF_SEPARATE=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index fab41a2991..e30bb35b74 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2 vck190"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="xilinx_versal"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
@@ -24,16 +24,16 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/versal/uboot.fragment"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="2022.2_br_1"
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
 BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
index b4b63282d8..01daefd204 100644
--- a/package/versal-firmware/Config.in
+++ b/package/versal-firmware/Config.in
@@ -4,13 +4,13 @@ config BR2_PACKAGE_VERSAL_FIRMWARE
 	help
 	  Pre-built firmware files for Xilinx Versal boards.
 
-	  https://github.com/nealfrager/buildroot-firmware
+	  https://github.com/Xilinx/soc-prebuilt-firmware
 
 if BR2_PACKAGE_VERSAL_FIRMWARE
 
 config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
 	string "firmware version"
-	default "2022.2_br_1"
+	default "xilinx_v2023.1"
 	help
 	  Release version of Versal firmware.
 
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
index 0bc5a00bc6..1ced259be1 100644
--- a/package/versal-firmware/versal-firmware.mk
+++ b/package/versal-firmware/versal-firmware.mk
@@ -5,16 +5,16 @@
 ################################################################################
 
 VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_SITE = $(call github,Xilinx,ubuntu-firmware,$(VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only
+VERSAL_FIRMWARE_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = MIT
 VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
 VERSAL_FIRMWARE_INSTALL_TARGET = NO
 VERSAL_FIRMWARE_INSTALL_IMAGES = YES
 
 define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
-		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f) \
-			$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f)
+		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)-versal/$(f) \
+			$(BINARIES_DIR)/$(f)
 	)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
