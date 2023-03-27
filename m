Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432ABC76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 17:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1FAC409B6;
	Mon, 27 Mar 2023 17:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1FAC409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w43T07IcDi1k; Mon, 27 Mar 2023 17:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22F1B416BE;
	Mon, 27 Mar 2023 17:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F1B416BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CB461BF336
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 17:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 522604010F
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 17:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 522604010F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E845XVSG2ACk for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 17:06:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB9C400C4
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::619])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FB9C400C4
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 17:06:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+P05htTkALOB508WbaXs9l9D/Lyi53OykYKPISxKTEMvWuqjHH83DNG6UlsaZmBkR+8F8x5lsJccG5eNRIV4V4sE60rHYGbtClo/lHdaUNFXLcX4UWP0jhC7Ok0iBobxcmR8+QZ9MC7k/x9tRnSLpt9u0je1E5JUJPTmLrwuC7MzaODBhqQkAK/9YqZLmCbVWAiNS8mu6aPkBN7OsiCMqf9980B93qdZacUkyv/O7xZEoDTL4tPD9G8HVxpF7FPZm0Q3BTOSrALAEABkx1QNwHH0SjYE/Y8rJhsovWBXKnnEpaE7HVTb3jpuzu4yJn0VOS04LvA7nAFsgu4wD3wDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4AWw7mLuZ+nA120YlR0lQJkhHF9k9mmuHivvTTkkDw=;
 b=OJoDH8St2dChxcNNw1+ib3YHTg2qpKpONGm3vHlrS+lBLDgv19vfWqqVVfc0vR5fzpMzFWeWgDFstm9iynHa/inwRAxLPQwGH+K62Bzk25R0MwmW5QoTZF1S1appkJ0Sgal6SPuzN3HUBni/lxZLjhiUUn8q3N/v0kJfNf+/6fTU7lMTD+SWzwICOxNv2/0kDLgFaoS1LcMH6aU+YKuyxmrTfLSRvY8GmL/jj3HemlhBQNif7R/B7w35AuVn/HFYWQJJSwqD7vCJaXggUGRZwBo8oUuL8PAtv6TrmxKYpsdXLhgepLzudr5/OiBWouSvOZ3GVtiXpDnC9972T1FbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::20)
 by CY8PR12MB7707.namprd12.prod.outlook.com (2603:10b6:930:86::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Mon, 27 Mar
 2023 17:06:13 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::75) by MW4P220CA0015.outlook.office365.com
 (2603:10b6:303:115::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 17:06:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.21 via Frontend Transport; Mon, 27 Mar 2023 17:06:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 12:06:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 12:06:12 -0500
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 27 Mar 2023 12:06:11 -0500
To: <buildroot@buildroot.org>
Date: Mon, 27 Mar 2023 18:06:04 +0100
Message-ID: <20230327170604.22854-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327170604.22854-1-neal.frager@amd.com>
References: <20230327170604.22854-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT040:EE_|CY8PR12MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 7405a2aa-212e-49b6-c84d-08db2ee591f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dkMNfBi/FOwT64gTgGeCDGL3IFTlvZBAC5lhl4JlB52HxbsFLRw7lO9mXnoIsWNMgpWt5pzHgurWovPy+QY5xJKiuiHCV0gjkT8uMh9G8wJzgupbPgeTMjfEtSNkobmP4+9sZJm/ZJ1iF/jwAkeEETOfRYU3sZh9lxlcWuBAeQJcCzfQEEM4f/5zETC2db17tSKvU2TPjdcKS1LahJzOAjkaBL5btsJTubkt+hsQW+UEb090LlVRyo4aFtfTQnv8JVQKhvZ3Kk1aOCtpCLm6NQkT8w83lhAxFpztMZ4g8S52xGeeJ6zScPgii29VWkeX/xO+NG8Dxa0X2wlhVUKpnpZb+Lmo/FW6MG37d5NowfENTLtGdSFcoZFPjInzBoxKcyRusmQlDmzeyDJ3tq41xHEHBD/yYxflmgON7G+Dm4ceqQGy8ykVa1+71Ah5m/3MPIIj8zN5qCRKHUz2w/AFiRvIiqXiztME2CXnarxCq4F9jtNa9Gn66QcBHzVqTNDwgzvp0ERigaUu7f4r4csbvNW1o4QqlbI91u3APqcnJo0lp9Fj9cb92up4agsl5asrFtqDChXoassp9lK2pgq0oIh+t7+A0QuQztjxsv1kSFAuwTI1caXzg7geQjmhgtUQtLoRnlqJ5P3cgG54SG+xzes0GvOEN7q00mEqvQ6TahVxXXW1RmTtqMqU8LmZ35RwdI1wzg3ucZbUFYa9wCEU7P09VD5sItWy5QyX864T7jpPSf7spgSXoOL9Gnz7TJqqHaip4Lew38iSEKJBPfIlA8YiUdzYZAAE9BLvjCMT34c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(8936002)(2906002)(6916009)(41300700001)(186003)(1076003)(6666004)(478600001)(26005)(8676002)(40460700003)(426003)(336012)(81166007)(2616005)(36860700001)(54906003)(316002)(70586007)(5660300002)(4326008)(356005)(44832011)(40480700001)(70206006)(86362001)(82310400005)(83380400001)(47076005)(82740400003)(36756003)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 17:06:13.2203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7405a2aa-212e-49b6-c84d-08db2ee591f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7707
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4AWw7mLuZ+nA120YlR0lQJkhHF9k9mmuHivvTTkkDw=;
 b=ka0Af7u9ln5Ygbpi6a3AYZ+MI69MENd0lSLAqsoDAJ6cXbPUeifaenN/SqtyROr/ZSk7u5SwmOSdgPXUZ/GV+zgUuLZclx6v1uUUCxJ5zQbsxcfxGqRlXOjwSIi2cHgyJFAVMSgLJNqmpkV6hcl15z1V0CLlDvTHEvJFY3PpLrk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ka0Af7u9
Subject: [Buildroot] [PATCH v2 2/2] boot/uboot.mk: new zynqmp pmufw build
 option
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

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
use the zynqmp-firmware package for building a pmufw.elf that gets included in
the generated boot.bin.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - Improved naming to be clear about choice between building from source or
    using prebuilt image
  - Updated zynqmp_xxx_defconfig files to use new naming convention
---
 boot/uboot/Config.in                | 22 +++++++++++++++++++---
 boot/uboot/uboot.mk                 |  7 ++++++-
 configs/zynqmp_kria_kv260_defconfig |  2 +-
 configs/zynqmp_zcu102_defconfig     |  2 +-
 configs/zynqmp_zcu106_defconfig     |  2 +-
 5 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f5c20f5168..cf9da88749 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -476,11 +476,25 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
-config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
-	string "PMU firmware location"
+choice
+	prompt "zynqmp firmware source or prebuilt"
+	default BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
+	bool "Build zynqmp PMU firmware from source"
+	depends on BR2_PACKAGE_ZYNQMP_FIRMWARE
+	help
+	  This option instructs u-boot to build the zynqmp pmufw using
+	  the zynqmp-firmware package.  u-boot will then include this
+	  pmufw.elf in the generated boot.bin.
+
+	  This feature requires U-Boot >= 2018.07.
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
+	string "Pre-built zynqmp PMU firmware location"
 	help
-	  Location of a PMU firmware binary.
+	  Location of a pre-built PMU firmware binary.
 
 	  If not empty, instructs the U-Boot build process to generate
 	  a boot.bin (to be loaded by the ZynqMP boot ROM) containing
@@ -497,6 +511,8 @@ config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
 
 	  This feature requires U-Boot >= 2018.07.
 
+endchoice
+
 config BR2_TARGET_UBOOT_ZYNQMP_PM_CFG
 	string "PMU configuration location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..5493c9fe75 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -390,7 +390,12 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
-UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE),y)
+UBOOT_DEPENDENCIES += zynqmp-firmware
+UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
+else
+UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT))
+endif
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index e180d5e7e7..36cac86282 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/kv260/kv260_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/kv260/kv260_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 00b33261b6..0b76f76c70 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu102/zcu102_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu102/zcu102_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 88295571af..04beeba0fe 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu106/zcu106_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu106/zcu106_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
