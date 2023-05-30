Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9F0C77B73
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 05:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B993441D30;
	Tue, 30 May 2023 05:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B993441D30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MyjMZePU6Lx; Tue, 30 May 2023 05:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25E50402DC;
	Tue, 30 May 2023 05:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25E50402DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6C5F1BF3A9
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 05:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 345F2402DC
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 05:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 345F2402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muqKeabsaW1Q for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 05:54:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF1724015E
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::606])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AF1724015E
 for <buildroot@buildroot.org>; Tue, 30 May 2023 05:54:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hi0ICgTi6cCxu5SXqn67HKtGv9wbNOtSxnQnPI7cQ+vYFg7AWD1H58Tr2sH2Qv3uAgMV0MCCJVAb/SG9VOKazroHqaEtd+XWK4SoksFjBAKAk+m7ibdcw8lrM9IaNUTp0PY3bAWrYCgWmTtb7LoGtzuMga1+vf+4CCgSA8gLaQ5nz7swdq/23iEJhp8YPsALeTkfxjT6gT44E26yqXunz/8HSaAI99x8w/h/pPQ+BOo7ymjatFIJihtwTv/qk7/k9yfQARnCJZMVYemKQQIqXlv4IOQsLGJyckJJao0tL6MjbGougQoDU5kunWdCayyB3ighzQadI/aXzg68A0YKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnnAmMzh8WVFB7fHmSJ5zKYH5vukfmGtHCj3rmdXDMI=;
 b=Jw/dJoWrRmTwvj+1EhQ62WXEgHC24FLn/l9GOHkVczjOyk+RG4UAPSgF1Ad8oYiM+c4EU7jh/g0c2Gt6b60wHM5AABXN5JsxR4x0R4u6vwRB/Cg9Y8iwG4j3hIyu7sRwj9eupVLoXc6VRBkHMCBqrSB0bVnR1UkDnTqW5Fa/iYGsnh+luYkZvZalFke+eWsMLIwMID2bFTqjjWE8RZP1p0goVoEB/5M6uPQTUVB2KBBCWgXD8Vw2cVEoS48Faymc9+vA7p67Do+hQ6op9h4bM+zeUc/EoZ0YAekRCw2Op2DdEo2LHe9kH+qNl52z703Iwr4XdtTAnG+Ad+0GbVWQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from BN9PR03CA0410.namprd03.prod.outlook.com (2603:10b6:408:111::25)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Tue, 30 May
 2023 05:53:58 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::b5) by BN9PR03CA0410.outlook.office365.com
 (2603:10b6:408:111::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 05:53:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.22 via Frontend Transport; Tue, 30 May 2023 05:53:57 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 30 May
 2023 00:53:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 22:53:57 -0700
Received: from xirengwts07.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 30 May 2023 00:53:56 -0500
To: <buildroot@buildroot.org>
Date: Tue, 30 May 2023 06:53:53 +0100
Message-ID: <20230530055353.43786-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 0247e42e-a5f9-497a-d548-08db60d24281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9RiAMXhNpealCW1OVb5LUETV5HzsJcgfaFBN1Lk8pF66vtE4FHjSAloyEYRy8EyHOzF/1jp05PyukDjuN4sLOsTWT73nirvReUSofX4k5KYxiCAp/AmHBMRgS0ZcUgZQcZmlOPjBXkfnM9t9aXc2VyZ13ir8QZAmRoAMsfI9gZSRFSC9Iz9uQ0Jb+KATClYTMPTQKQOuJK+uRbwUBlbXnLNFlf0JBEbayl0ghcGOSkmcM+bj86IhASS9uAAyJQUdAQkwhA0jBKohiUBpLszKfIdcAQhxG3nI1o/tYMSRVufx4UBKmQWrGmegWoqmmGgoRJ4gG6ZsUcdN40IKheOxiCj74luaQIMEuoPmnVY6nnZV/7B7ilWX91SEkhlAfkxlY7sl/kmnSDHpjaIBJSzi8NhcYvoFRQBtaxCVpxUb4mL5TukLDOjJ8VwLtrpKy5o2hAh9116Vf0LES6Qx5dsIT1SQ7TiOvhVqT5paz4P/mislv73H0/sody6sHvwC8/V4xth5d+m9FcNvHSo/ODv32Kysww7CaKmFhxlOm3bCxeTTA8l5rC8/BIM3bzejfN/vLi4CBkYSjhtu9I8H/IiC4EZD74UddS5wO1H4THL3UO3DNjv1pPmvkSC6rUHfzH6YEs/Va7pNNhQckT8SFhojERaEtNDjc7WhL3kYKl4EW6eUcl2GRNkfmElE4foQkD4PEEi8FQO4cZE6eXoW8cBpqdrh3LCWKFTGZSg4Z9fA3v/q3pZah1TK548Vdbt+5nmykMt2K8SdJy7ywxZrNGYPCW9poo6iJ4ViR7tnOgsMM0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(8936002)(966005)(82740400003)(6916009)(4326008)(36860700001)(47076005)(70206006)(70586007)(40480700001)(316002)(356005)(81166007)(84970400001)(478600001)(54906003)(6666004)(41300700001)(40460700003)(86362001)(44832011)(2616005)(26005)(426003)(5660300002)(1076003)(2906002)(336012)(82310400005)(83380400001)(186003)(36756003)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 05:53:57.7792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0247e42e-a5f9-497a-d548-08db60d24281
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnnAmMzh8WVFB7fHmSJ5zKYH5vukfmGtHCj3rmdXDMI=;
 b=SIq0HnGcz/l5/egExEDdHePNSYFHjjiHEallYCanMEbxvFACA8W8c1nYY5sniWISC5db1sJE3c7SBR7ugO2wdzaXHEBjXb0aLooiC9lmrkbyPEoFUQDfAqrPjRoTz5ULtzlGSKK9qO0xnwB6SCK9nSj1kYqgs8JfYU5pD3Ol+vA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SIq0HnGc
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: bump to
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the versal_vck190_defconfig to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01
- ATF v2.8
- PLM xilinx_v2023.1
- PSMFW xilinx_v2023.1
- versal-firmware uses new github.com/Xilinx/soc-prebuilt-firmware repo

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/versal/post-build.sh                 |  2 +-
 board/versal/post-image.sh                 |  6 +++---
 board/versal/uboot.fragment                |  1 -
 configs/versal_vck190_defconfig            | 12 ++++++------
 package/versal-firmware/Config.in          |  4 ++--
 package/versal-firmware/versal-firmware.mk |  8 ++++----
 6 files changed, 16 insertions(+), 17 deletions(-)
 delete mode 100644 board/versal/uboot.fragment

diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
index ff8f8a6071..0713bd1b05 100755
--- a/board/versal/post-build.sh
+++ b/board/versal/post-build.sh
@@ -12,5 +12,5 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
 	label linux
 	  kernel /Image
 	  devicetree /system.dtb
-	  append console=${CONSOLE} clk_ignore_unused root=/dev/${ROOT} rw rootwait
+	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
 	__HEADER_EOF
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 92e65ed3b7..76fe7cb526 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -18,9 +18,9 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
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
index a393b681c8..d95944641b 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2 vck190"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_versal"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
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
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
