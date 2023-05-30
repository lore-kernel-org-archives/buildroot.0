Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D056FC7EE23
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 07:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4837A4188E;
	Tue, 30 May 2023 07:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4837A4188E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vY7ihoklQgOL; Tue, 30 May 2023 07:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6C1418B5;
	Tue, 30 May 2023 07:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B6C1418B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A21A1BF376
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E356D60BC0
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E356D60BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xuH4XUXLt7Hx for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 07:16:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A7860B90
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::60a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0A7860B90
 for <buildroot@buildroot.org>; Tue, 30 May 2023 07:16:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2hxJPjOYDXsND+A7RWQbLkm89u6I0m/2nfVJ6cxPrchPq/imRYgVo4G7qns6adiUTJJdxQdYKp6ympIIk6JjgYOFI/x8iPHfOAK+TPKck/LclIvqf8cMPSpSW+3o04zTablO3xEHJCtFNx3EgfN2ve6VHm6xKWu1V/BEj3XceBc1xIKZLN171lfLNiEEEK6mLTfG7/i9F79+GFUHDIxg2ZwguM7qpyPpPGdD8e3UUsoCxGEswsF4ElLEqH9h9QN6Xb2XSOU8nlXeK+7mIpwM5zxAQaUS1NPogAA/3nwVMf+le5EpfUG1En0sbI+i15z/m72D6ZanvFFaz/Ds66mGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjQpLfMXSJGCDZSRTYrCAzxaWt4U/0U7gViee358qAA=;
 b=Sbsn/DVk22wBo/FThHFj8N8PZCuGf72HSXfuVQXa+sdRV/CBAi9egBOKDvPWPvWuqI2J9EwnTqHl7E8/1AeWm872iGK0ff0/tDKrF2Jvgfz2G92UssepzyQgIybK0Jb4VEHMOgwyXPsYBw6uqnsaaCe7GKMhJVXZer/i3NpOk63ySXGCW13IA/76GWMPI1BGgANYlD5S1OAmCt5UWJiVZPDJuH882gJzrejBc3AzzuUJun0RlJrNQ+SrQdgoIcXPtCW9pZEyK+ul/omIRmBiBylDK5Rht+k5PZUzmNWQN+AmquUYhlPPcXpvYZ969C1gMbHQaQfM4T0xq1WMns+JRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0302.namprd03.prod.outlook.com (2603:10b6:303:dd::7)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 07:16:07 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::81) by MW4PR03CA0302.outlook.office365.com
 (2603:10b6:303:dd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 07:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.22 via Frontend Transport; Tue, 30 May 2023 07:16:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 30 May
 2023 02:16:05 -0500
Received: from xirengwts07.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 30 May 2023 02:16:04 -0500
To: <buildroot@buildroot.org>
Date: Tue, 30 May 2023 08:15:58 +0100
Message-ID: <20230530071558.24994-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230530071558.24994-1-neal.frager@amd.com>
References: <20230530071558.24994-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|IA0PR12MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7c478a-dfe8-4188-d419-08db60ddbcb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjySlnmDHgJWbjkdlxUGgG39Whx3iRHwv3LpVGhfzhl7CJspLM9CW6gu9jTpehC0qcNowetx05hKc40ZZoCTx5duHLJxUzLhqyXtpvFS5SB53xIvJnqzcpo7vGujHOt6HIQV3rCFkVU9Dz2nKANMrynlyNfNO2hgA5ZqjTCFgyRVViu1FgQLq1OMAGyPpaXbnhN7kpNMeVRkPHmPKgDlufsWTXsuZ1SMGs/F/HRRudezpMTe2v4mTL8Kw3WMB69uryp3nCfRDQSrWoCTDu3te654H861nt4xdfCVr0HrFqV7NQl3lKulD7RvXIf6UnIte3Q699Ys8a/ezK50tiQPps5WmMjc4aIRZhMPMfULeYh9FvASBBHqZnyfvv+amehIIBDPGYuMwYveebnRPxmxoJYC5hZd2ThE02lB/iEpjfWm+I6/qrN8VeE9lJcROHVHVXYk2iSJzMfXaoWyydX40o2eop3/Yv1JxqCqDRMPmTYp1tVt506UF1EIED2jAKe63AekqMnHfAkpZnMSdpW8MaxguR0lPrMZQADSj0G9BFoZFnjlaVJS/f63firjrSEL9jILezSIv/cVPyoUQvwHCsD1hjRKxAbnBZMNb65SiMGxOn5U9wMaomG79oLIgmws/MSaRt5Escp++pl0xVovY2PV23kAc2UCcui2pQobvVduzeoVPraltfwc7bSxdAK2t4aie5yu5PbHKHqGHM/tGQDgbfas030FO2KunU7xJdnwp62xAzfXmRaCne3fy9HczBKuL6gFcUx6i4VXcJ97lxnWsxzgBCHfEzV0aShGWu8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(41300700001)(316002)(6666004)(81166007)(82740400003)(356005)(6916009)(4326008)(86362001)(8936002)(2906002)(82310400005)(8676002)(70586007)(70206006)(2616005)(36756003)(54906003)(44832011)(26005)(1076003)(83380400001)(478600001)(426003)(336012)(47076005)(40480700001)(5660300002)(186003)(36860700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 07:16:07.1460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7c478a-dfe8-4188-d419-08db60ddbcb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjQpLfMXSJGCDZSRTYrCAzxaWt4U/0U7gViee358qAA=;
 b=q0vhZeZjIMrsH4xo9aIyeiUcK47ofsD+wwUJ4LnxRvvqq3dp+QCxZeSsJt9JSiK4TrUpvjPgCbmA3NZd7WpW1YO0yKJmGbwk6iKvkesPQR+HGn1gOYY0quIGixPHs66VPJX+ezg/y15voOy75W2rR6z/VVY5iWLxnHXNTlCpVME=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=q0vhZeZj
Subject: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: bump to
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

This patch bumps the zynqmp_zcu106_defconfig to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01
- ATF v2.8
- PMUFW xilinx_v2023.1
- Updated pm_cfg_obj.c from Vitis v2023.1

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/zcu106/pm_cfg_obj.c | 51 ++++----------------------------
 configs/zynqmp_zcu106_defconfig  | 11 +++----
 2 files changed, 11 insertions(+), 51 deletions(-)

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
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 88295571af..cb4bb1ed3e 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
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
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
