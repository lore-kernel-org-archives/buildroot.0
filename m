Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF25C001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 05:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A8E600C5;
	Wed,  2 Aug 2023 05:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A8E600C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IgCqKCM3233; Wed,  2 Aug 2023 05:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0644A6114D;
	Wed,  2 Aug 2023 05:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0644A6114D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3521BF387
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 05:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 320C24185F
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 05:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 320C24185F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0z9OCHbvGsoI for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 05:55:59 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::615])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF40B4008A
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 05:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF40B4008A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biAU93h1eNT4qd/WypfbZgjeBNGvTLnv/9nNjAszAAHsiRoE652AGgWJmQW0rOQMQSWtbqcb61GiZw3j3ZpZ/cF0w28mDA9FUJiDxEQif7kXGnbVMHHxclAdC+TfSB/qhIQUN/evUN2HlWCVl5XdKVdyRd8sbpPRNGAAKYrm/V5YIR6LHMm5qHqWz6tmjFCjF0m9RBiYVV7Qof/ex4t16e0TFHpjFVZWpTWYCsqo8wl0dP/+/q4QpRdcCw5I8/YIVjT1xAPGnvLfbyM0SX8KmNlESNmZ3do+U6L18oM6aMKyocC1YGq0pKgCI2U/W4M++fdfdJCmOdfkQ6gUWmL4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPxLBw6BLkUw6JB/VSgllPQ5a6K4RRp+AJ8Es9MSfFs=;
 b=SPIPoemoLJY6nJEGqCgTIqnt0lbg1ElAJbdXcaDSbW5+kppeuq2F7HbzGc1q8BP3fcviRmOv9ohrSO26/TC1WfUWO2VW/hGVYnT9ojSnuMiHL2v+sxc6t4pZOvXFqhrLhaqFlZ0hpjtK/kvQubBw5vQP0P8BgKHbxekh3ZnKYdZj0ipgMDdt6eZ2iRA4142bobua/lwXzDnOTUHcnxOjXmYJbo+gcyLHQyO0KEgH6yIODe60538FeEWb3zQITkLzL9/Fd2FAwlI1ON9yY015cYcm8dc5Wy8T80J4ZGXw2DdwFALpf+9RQervSX/WVbM7qVhI3IzCQpWHMjL0qKOFRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR19CA0056.namprd19.prod.outlook.com (2603:10b6:930:1a::25)
 by DM8PR12MB5494.namprd12.prod.outlook.com (2603:10b6:8:24::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.45; Wed, 2 Aug 2023 05:55:52 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:1a:cafe::17) by CY5PR19CA0056.outlook.office365.com
 (2603:10b6:930:1a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Wed, 2 Aug 2023 05:55:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Wed, 2 Aug 2023 05:55:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 00:55:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 22:55:50 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 2 Aug 2023 00:55:49 -0500
To: <buildroot@buildroot.org>
Date: Wed, 2 Aug 2023 06:55:46 +0100
Message-ID: <20230802055546.360651-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DM8PR12MB5494:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb3b2ac-7011-46b3-4500-08db931d20b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JdD9W8cJwsbq1ns/XjytcpySMl90Xb35MU9kgMwC+8nrNkDKaWp+cvY5GpU3ut3+pWR+7tdrw205YqSZXEe1RW4qdsfU35FhWcI90YGyFui94VxHd0PJQXg4ab9cbZzwTJOjpgS92eMZmb4tUueT4pwX4EmY3EIMfNV4r5IFwibYXIMDAJcRuNuq8o7oDF6GgOhcbeQFvkRYhh7N6gt6DwbSis6okRs89CaYtgugaiGacosnXU/A638MZLKaFWMXDHdwNJaZWdGRC/UCtl9R8iIThTzOx0Mskqx61ch4LIPqG3Fsb7qrA6G/jAvA1GQEjR77AWrNTDiT4NSO5TCpu/9kTdtw0Vw2uWf9uGuHD+pkluqqYFT7lE7P7pStxt1bey+ZCKiUXVwHE8GWmLBZV3uRjpm+WhLZGXgIs0iwPRuoqYHDYavzpycUDJaZq5XDaPWiWMtdG8bOb2SM+Be0wRdJia3KO/H9psp3jXAFLLHNWp9vqZg4T+gL4ULiRQ0vtNQF61CKEA5vkJIloP85DmbdR0HKIsVATLtPK7FKVPsIhsQ45gVOuM7znqFj5hoipHXRimUZk+PGMdNdPFRX5AGZL2MmEa1on2tvicpAVxlQVdKm2ZLPVMkqlPBQ/KuUVMivNb9YLorpebwOacd3CEVc+CwB7S2XkRZdeJRfViS2qFxlDb55+BuG2vve0gzJoN3m1BsA7ytHO/KzRCUR/L93GVPbTIDrp46yVtQRm5pKYfrlV6aH0No9wSIhsPbnRXGulDBkwv8jSqvHLaO7kCNJ8CM5Se+rKBLXq3Q8qXo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(82310400008)(451199021)(46966006)(36840700001)(40470700004)(83380400001)(478600001)(54906003)(40460700003)(8936002)(8676002)(36860700001)(426003)(36756003)(2906002)(30864003)(5660300002)(41300700001)(356005)(44832011)(40480700001)(316002)(1076003)(336012)(186003)(26005)(81166007)(6666004)(86362001)(70586007)(4326008)(6916009)(70206006)(2616005)(47076005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 05:55:51.4310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb3b2ac-7011-46b3-4500-08db931d20b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5494
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPxLBw6BLkUw6JB/VSgllPQ5a6K4RRp+AJ8Es9MSfFs=;
 b=lig3q4sIg2m1ni+xrRtc/Cyo2xHiMWvNG4NTHmaTi2gcnMXo1gkhJVkOC3/xOEYNTYrzfbcMot3/Q3a212P0tlFjyThCk8bI+oE2JSMH6ASDba5z3KmwtMgqvQS8E4EzbTfMdVgVJb9n+KwpQMhAg72kxLOmquDA/Y6VAVjsBsE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lig3q4sI
Subject: [Buildroot] [PATCH v2 1/1] configs/zynqmp: bump to xilinx-v2023.1
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

This patch bumps the zynqmp defconfigs to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01
- ATF v2.8 (including mainline buildroot patches)
- PMUFW xilinx_v2023.1
- Updated pm_cfg_obj.c from Vitis v2023.1
- Removed kria u-boot patch which is included with xilinx-v2023.1

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - adds tf-a v2.8 patches
  - squashes zynqmp bump together since all 3 boards share the tf-a patches
---
 .checkpackageignore                           |  1 -
 board/zynqmp/kria/kv260/pm_cfg_obj.c          | 69 ++-----------------
 ...-0001-makefile-add-multi_dtb_fit-dep.patch | 32 ---------
 ...dd-support-for-new-binutils-versions.patch |  2 +-
 ...2-build-tools-avoid-unnecessary-link.patch |  1 +
 board/zynqmp/zcu102/pm_cfg_obj.c              | 51 ++------------
 board/zynqmp/zcu106/pm_cfg_obj.c              | 51 ++------------
 configs/zynqmp_kria_kv260_defconfig           | 15 ++--
 configs/zynqmp_zcu102_defconfig               | 13 ++--
 configs/zynqmp_zcu106_defconfig               | 13 ++--
 10 files changed, 39 insertions(+), 209 deletions(-)
 delete mode 100644 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
 create mode 120000 board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index f846cc7a87..c44bc1d8d0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -101,7 +101,6 @@ board/udoo/common/post-build.sh Shellcheck
 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
 board/versal/post-build.sh Shellcheck
 board/versal/post-image.sh Shellcheck TrailingSpace
-board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
 boot/at91bootstrap/0001-eabi-fix.patch Upstream
 boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch Upstream
diff --git a/board/zynqmp/kria/kv260/pm_cfg_obj.c b/board/zynqmp/kria/kv260/pm_cfg_obj.c
index 019df6e237..fc6c4024c6 100644
--- a/board/zynqmp/kria/kv260/pm_cfg_obj.c
+++ b/board/zynqmp/kria/kv260/pm_cfg_obj.c
@@ -30,6 +30,9 @@
 
 #define SUSPEND_TIMEOUT	0xFFFFFFFFU
 
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
 #define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
 #define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
 #define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
@@ -51,7 +54,7 @@ __root const u32 XPm_ConfigObject[] =
 	/* HEADER */
 	2,	/* Number of remaining words in the header */
 	8,	/* Number of sections included in config object */
-	1U,	/* Type of config object as base */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
 	/**********************************************************************/
 	/* MASTER SECTION */
 	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
@@ -81,7 +84,7 @@ __root const u32 XPm_ConfigObject[] =
 
 
 	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
-	49,				/* Number of slaves */
+	34,				/* Number of slaves */
 
 	NODE_OCM_BANK_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
@@ -131,10 +134,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_USB_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_TTC_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -151,54 +150,22 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SATA,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_2,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_ETH_3,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_UART_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_UART_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SPI_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_SPI_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_I2C_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_I2C_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SD_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_SD_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -215,10 +182,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_NAND,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_QSPI,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -227,14 +190,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_CAN_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_CAN_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_EXTERN,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -259,22 +214,10 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_PCIE,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_PCAP,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_RTC,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_VCU,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_PL,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -545,8 +488,6 @@ __root const u32 XPm_ConfigObject[] =
 	/**********************************************************************/
 	/* GPO SECTION */
 	PM_CONFIG_GPO_SECTION_ID,		/* GPO Section ID */
-	PM_CONFIG_GPO1_BIT_2_MASK |
-	PM_CONFIG_GPO1_MIO_PIN_34_MAP |
 	PM_CONFIG_GPO1_MIO_PIN_35_MAP |
 	0,					/* State of GPO pins */
 };
diff --git a/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch b/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
deleted file mode 100644
index ddc04cacac..0000000000
--- a/board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8b181bf582c17cf709a62cf499f9709c94f49d33 Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Wed, 21 Dec 2022 07:51:42 +0000
-Subject: [PATCH v1 1/1] makefile: add multi_dtb_fit dep
-
-With certain gcc compilers, the u-boot.itb is built immediately after dtb
-generation.  If CONFIG_MULTI_DTB_FIT is used, it is possible that the
-fit-dtb.blob is not finished in time.
-
-This patch adds a necessary dependency to guarantee that the fit-dtb.blob
-is built before attempting to build the u-boot.itb.
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile b/Makefile
-index b96e2ffa15..682a5d94fd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1425,6 +1425,7 @@ MKIMAGEFLAGS_u-boot.itb += -B 0x8
- ifdef U_BOOT_ITS
- u-boot.itb: u-boot-nodtb.bin \
- 		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SANDBOX),dts/dt.dtb) \
-+		$(if $(CONFIG_MULTI_DTB_FIT),$(FINAL_DTB_CONTAINER)) \
- 		$(U_BOOT_ITS) FORCE
- 	$(call if_changed,mkfitimage)
- 	$(BOARD_SIZE_CHECK)
--- 
-2.17.1
-
diff --git a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
index 695cc80b94..8ad996914b 120000
--- a/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
+++ b/board/zynqmp/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -1 +1 @@
-../../../../boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
+../../../../boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch b/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
new file mode 120000
index 0000000000..fecdee5449
--- /dev/null
+++ b/board/zynqmp/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
@@ -0,0 +1 @@
+../../../../boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
\ No newline at end of file
diff --git a/board/zynqmp/zcu102/pm_cfg_obj.c b/board/zynqmp/zcu102/pm_cfg_obj.c
index 68557c4cb4..04bfb16e35 100644
--- a/board/zynqmp/zcu102/pm_cfg_obj.c
+++ b/board/zynqmp/zcu102/pm_cfg_obj.c
@@ -30,6 +30,9 @@
 
 #define SUSPEND_TIMEOUT	0xFFFFFFFFU
 
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
 #define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
 #define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
 #define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
@@ -51,7 +54,7 @@ __root const u32 XPm_ConfigObject[] =
 	/* HEADER */
 	2,	/* Number of remaining words in the header */
 	8,	/* Number of sections included in config object */
-	1U,	/* Type of config object as base */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
 	/**********************************************************************/
 	/* MASTER SECTION */
 	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
@@ -81,7 +84,7 @@ __root const u32 XPm_ConfigObject[] =
 
 
 	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
-	49,				/* Number of slaves */
+	38,				/* Number of slaves */
 
 	NODE_OCM_BANK_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
@@ -131,10 +134,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_USB_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_TTC_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -155,18 +154,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_ETH_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_2,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_ETH_3,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -179,14 +166,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SPI_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_SPI_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_I2C_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -195,10 +174,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SD_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_SD_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -215,10 +190,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_NAND,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_QSPI,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -227,10 +198,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_CAN_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_CAN_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -263,18 +230,10 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_PCAP,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_RTC,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_VCU,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_PL,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
diff --git a/board/zynqmp/zcu106/pm_cfg_obj.c b/board/zynqmp/zcu106/pm_cfg_obj.c
index 6d15d510e9..54a1afa902 100644
--- a/board/zynqmp/zcu106/pm_cfg_obj.c
+++ b/board/zynqmp/zcu106/pm_cfg_obj.c
@@ -30,6 +30,9 @@
 
 #define SUSPEND_TIMEOUT	0xFFFFFFFFU
 
+#define PM_CONFIG_OBJECT_TYPE_BASE	0x1U
+
+
 #define PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK    0x00000001
 #define PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK    0x00000100
 #define PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK    0x00000200
@@ -51,7 +54,7 @@ __root const u32 XPm_ConfigObject[] =
 	/* HEADER */
 	2,	/* Number of remaining words in the header */
 	8,	/* Number of sections included in config object */
-	1U,	/* Type of config object as base */
+	PM_CONFIG_OBJECT_TYPE_BASE,	/* Type of config object as base */
 	/**********************************************************************/
 	/* MASTER SECTION */
 	PM_CONFIG_MASTER_SECTION_ID, /* Master SectionID */
@@ -81,7 +84,7 @@ __root const u32 XPm_ConfigObject[] =
 
 
 	PM_CONFIG_SLAVE_SECTION_ID,	/* Section ID */
-	49,				/* Number of slaves */
+	38,				/* Number of slaves */
 
 	NODE_OCM_BANK_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
@@ -131,10 +134,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_USB_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_TTC_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -155,18 +154,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_ETH_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_ETH_2,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_ETH_3,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -179,14 +166,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SPI_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_SPI_1,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_I2C_0,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -195,10 +174,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_SD_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_SD_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -215,10 +190,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_NAND,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_QSPI,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -227,10 +198,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_CAN_0,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_CAN_1,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
@@ -259,14 +226,6 @@ __root const u32 XPm_ConfigObject[] =
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
 
-	NODE_PCIE,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
-	NODE_PCAP,
-	PM_SLAVE_FLAG_IS_SHAREABLE,
-	0U, /* IPI Mask */
-
 	NODE_RTC,
 	PM_SLAVE_FLAG_IS_SHAREABLE,
 	PM_CONFIG_IPI_PSU_CORTEXA53_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_0_MASK | PM_CONFIG_IPI_PSU_CORTEXR5_1_MASK, /* IPI Mask */
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 8ceaa6983d..78b62a9ff8 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -15,27 +15,28 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/kria/uboot.fragment"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-smk-k26-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/kv260/kv260_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/kv260-kria/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/kria/kv260/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches board/zynqmp/patches"
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index f4789b9d88..18230cf89b 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -15,21 +15,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu102/zcu102_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu102-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 516f1143ce..21f41a2d8f 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -15,21 +15,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/2022.2_br_1/zcu106/zcu106_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu106-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
