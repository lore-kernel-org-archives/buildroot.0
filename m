Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49FAC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 11:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D5B561518;
	Wed, 31 Jan 2024 11:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D5B561518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0cwkwY0NkI-9; Wed, 31 Jan 2024 11:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B62F6155C;
	Wed, 31 Jan 2024 11:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B62F6155C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07EAE1BF5E6
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61BEE415D7
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 11:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61BEE415D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEUtT0Wsb_ME for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 11:24:04 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::623])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F36C41F0F
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 11:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F36C41F0F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czXpiTm0lqPIB8b3FgWQGlgNXI5T0G8Ef7BLJbEI1Djn8tK81uXBxzCkamZ/LmK2hP2z9q6FQeoOyM+eu6qJX1O2KLwPrZUeNsAOLVHndbUUQwuO/XmAIqnN2KtYZPuUYUViKH3flXhVu4OPARx/xxCivQrjg9efoj4gZx6xsQEgdBA2INpmJ/VHCmeF2fo1iJrRdiPqp/skCwZlku58PUrHtf2jZ/7nWK8z8rGJF4yPGpVQE6s7P7HzZUJo0+gGqgWkndKGQG2SBFogGkG9My99vqZL6eW3U45WCtMDfvbhcamiqyOaNhISsFy75NRrJ7ErXCHXTJYfEDbkxq/UCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hY3FDgnoNmzuC2LRNCzx5pMQ/j0oIyEZQ/qwMaQHKNQ=;
 b=D1/IXv9/lTl/Pq1Kq0q3Ji0K9UsFR8sQHi0lZOTSGtPYwFe1iLBLjtC6w0sneYas9imebayz+d3VoM8Eg/YqbQNQ96cgK8if6y39fTSPt+YtxPiIoCHSrvRlLdt/HuFL4U4q7uXsH0Ty8CdsDEZj02WdDOsh/emBBZuWcx+Bgv61cc02wfWxrnBLwymwmSSFXs3wK3mikkNc1bGAcIG74OifgkG1rNMt3w9yH8R01EdxxP2HQWOb+Bta7Km+EWwZ8rxbsw9W5ZXsSjhAf7Jnx1qXtbf82Y6HaaXJfJmui2ZIxavNC9spSRfwrujG1J8J782nttUBon1uZrU/a8HIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DM6PR13CA0026.namprd13.prod.outlook.com (2603:10b6:5:bc::39) by
 DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.22; Wed, 31 Jan 2024 11:24:01 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:5:bc:cafe::30) by DM6PR13CA0026.outlook.office365.com
 (2603:10b6:5:bc::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Wed, 31 Jan 2024 11:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 11:24:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:23:59 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 05:23:56 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 05:23:55 -0600
To: <buildroot@buildroot.org>
Date: Wed, 31 Jan 2024 11:22:20 +0000
Message-ID: <20240131112223.2175855-8-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131112223.2175855-1-neal.frager@amd.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|DM4PR12MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ff0951-bd64-4340-3322-08dc224f2017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpRIzfST51JesgxPu5M+VrTZqLYwyhX4sxDE4D1d1uC6fSj53JP9e+bwx2tPff6Rat2Wx224KiBjdJLcYXh1hA9z5NcOfeg5hWrjNeDKdeZC1Kkb1r+Kqy9cDHEAfG/E8N/edvJxR8pw7JBgJAFkjrjA1wPqLyj4H+o1fHM1LsspiXIjrNrqC6XkhH6f6axqfefFa7elQ4SoeOakNGFIND8/v9mKY78IYyThY6lEa4Yc0f6gLqo1qk0gSLl8C/f8nXAhMbLAZKclXWTNcFKXeTjeWSXyDIjXS1W6nhgMc+vGARMbeZL1+Oma0b/HigjDU6vErB0DXx+km++N8R+vHBaD+QEQP28TxOX6ycv1UNA2YxM4PJRCyE5R+EpNuDVw6rzyd6qPFtxc6JELcV+zGP4xw7NnAqHvAAjCzcQ9qj3kB2KnuV6XR0qHf0E+DpkKYzsWdDCJn7FNQmWgQURmnTa4dHh7AyAzWG7VQTBdt5iQZFw0tUuJIcX1CAnmUETRPhdYXtx6ZNjQ7FA0tYaX0TebMAMH55OT6fqKOsoU6bXs/JXWFeZvhgfy66y70E19udm8VaGeSFbCWC/jxJ0Gq6+XLhAObtajO5Gmt14ilbY9+rwQ8I5syx9jnldzX9025ddtr8EMw1JGuDfMFW2Gg8hSvkGr7QYpNQNWxVZCVH6h2Gf4fZs7i5M4UakcsJSmC0Q2bWHFg2s6KkjsR9y56mqBctQ1bPUX3TunjEf/ETaDw/eXSfuywoI2lOdEpHUt5YBBO0BvIkKV/ZC56FbKza1rAqWj6pZepZvRlUS2aZ8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(426003)(26005)(336012)(2616005)(1076003)(41300700001)(40460700003)(40480700001)(36860700001)(316002)(6916009)(36756003)(478600001)(83380400001)(6666004)(356005)(82740400003)(47076005)(81166007)(54906003)(5660300002)(86362001)(70206006)(70586007)(44832011)(4326008)(8676002)(8936002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:24:01.5138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ff0951-bd64-4340-3322-08dc224f2017
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY3FDgnoNmzuC2LRNCzx5pMQ/j0oIyEZQ/qwMaQHKNQ=;
 b=QuD1sWGCTEoV8RVhYqryk7FrY9J2MM0JGl7iOX3/nGhG2jVamsIQSCtoSGNOrev/g31w9kceGHeAPZj1bD2YuH+I01MfKiwp9afNguXReQTfTwpIdFQD2M/S94dKTrucsFsFJk4cz1cHBdbi8mYJ3ng1SoujxbPSVXXcsXV0lrM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QuD1sWGC
Subject: [Buildroot] [PATCH v9 08/11] configs/zynqmp*: build pmufw source
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

This patch migrates the zynqmp config files to use the new
zynqmp-firmware package for building the zynqmp pmufw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V7:
 - no changes
V7->V8:
 - bump to xilinx_v2023.2
V8->V9:
 - add the new zynqmp defconfigs
 - add BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH definition
---
 configs/zynqmp_kria_kd240_defconfig | 5 ++++-
 configs/zynqmp_kria_kr260_defconfig | 5 ++++-
 configs/zynqmp_kria_kv260_defconfig | 5 ++++-
 configs/zynqmp_zcu102_defconfig     | 4 +++-
 configs/zynqmp_zcu104_defconfig     | 4 +++-
 configs/zynqmp_zcu106_defconfig     | 4 +++-
 6 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
index 78302a48c0..1c82585feb 100644
--- a/configs/zynqmp_kria_kd240_defconfig
+++ b/configs/zynqmp_kria_kd240_defconfig
@@ -32,7 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kd240-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 -DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL -DCONNECT_PMU_GPO_2_VAL=0"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kd240/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
index 2089c3f355..8a2d9db87e 100644
--- a/configs/zynqmp_kria_kr260_defconfig
+++ b/configs/zynqmp_kria_kr260_defconfig
@@ -32,7 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kr260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 -DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL -DCONNECT_PMU_GPO_2_VAL=0"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kr260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index a3a157267c..2d39818599 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -32,7 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/kv260-kria/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
+BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS="-DBOARD_SHUTDOWN_PIN=2 -DBOARD_SHUTDOWN_PIN_STATE=0 -DENABLE_EM -DENABLE_MOD_OVERTEMP -DENABLE_DYNAMIC_MIO_CONFIG -DENABLE_IOCTL -DCONNECT_PMU_GPO_2_VAL=0"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index c920093d8d..9ae4ce7995 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -30,7 +30,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu102-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
index 452f2343c8..d86f17e384 100644
--- a/configs/zynqmp_zcu104_defconfig
+++ b/configs/zynqmp_zcu104_defconfig
@@ -30,7 +30,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu104-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu104/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 011c7f0fae..03c04dff39 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -30,7 +30,9 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu106-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
+BR2_TARGET_ZYNQMP_FIRMWARE_VERSION="xilinx_v2023.2"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
