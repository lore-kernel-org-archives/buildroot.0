Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B1BC7EE23
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 07:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41AC5402B9;
	Tue, 30 May 2023 07:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41AC5402B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zKbPNs0NQ70; Tue, 30 May 2023 07:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E13F41707;
	Tue, 30 May 2023 07:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E13F41707
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 257841BF376
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4417821FD
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 07:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4417821FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0P9qmrafCb4 for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 07:37:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8102C82126
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8102C82126
 for <buildroot@buildroot.org>; Tue, 30 May 2023 07:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAndOPsDjgQeXnjPh0itWbxbTLKi+RvzBxaDpYxSbM+HtawjhW9yzrrFekYReNqF0ugfNrlogzj82OHG8whQPGEtmKdTgf/DZFLSMeAuyBYjpHq/XjTbG9k+cF4/Qf4C953tEtaMaRoNtAIE35jg+ZVppDybTqzX6d3m6MJdLyV8Ap9P8WWAD29v8SXnWJYv7U+PkXkp8EnMucBPh30yNr03n8DAY+HrEpPpcJxYv6XOeRrm5NhqZ22coXgA32F60m83z2tSJwlC+6tHp/RwX8YQcm8Tx2SlDC8xQSmJxVZYNiDSP+g34QIHDBnxIRJwjAU4pOiBpS+y71+X92M/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEEA8Hgg0qRppVsbnnxqAlIAKMWLRteW/M6JPMjgvwE=;
 b=HcCLkmMJyTl7qwtvuxFn5tLjURxZR3ZyanAMcMv79QPvIevGN1to1/82vp8AV5158fvRfD2Vo3hF8ov2EHDitmkHzj1GtkqYKx4Vmpwmk8wJrIVmJa3yHFpbwbILbEYZWTHQvXp3ZAkKTRJH2Dtyl7hnNz+1UkLSuIhSsxHIXRiSp/MULyoqJIioW+hVVVT56NWV0BNPJSbMAb08n031qqwrh1HhJgFnboy+0XXHmwENVWkAcwbG98+IVQceatYNBVn06MPi0uLVtXQs+QDycnH6Xmr4Co0B6K3Jcy3XgllV8ol9/Mfxgcmk0Yt9epKAXPxB7KKNifMg24A2g4rRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0204.namprd03.prod.outlook.com (2603:10b6:303:b8::29)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 07:37:50 +0000
Received: from CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::2) by MW4PR03CA0204.outlook.office365.com
 (2603:10b6:303:b8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 07:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT114.mail.protection.outlook.com (10.13.174.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 07:37:50 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 30 May
 2023 02:37:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 30 May
 2023 02:37:49 -0500
Received: from xirengwts07.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 30 May 2023 02:37:48 -0500
To: <buildroot@buildroot.org>
Date: Tue, 30 May 2023 08:37:45 +0100
Message-ID: <20230530073745.33917-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT114:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 93839875-d80a-4eeb-2dd0-08db60e0c5aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uHXldmmIUSqBOIiT9mDpkDlQEe31ruol0yOBEloNMCMjigYVSjAmQZXitPsRWstP/ZkMxkYuLqfHdql47lq7LlE3P+2+HhDBXoPGwqZxqDiS8VQqytSlQQoIAVuZcNrZwFjaolimMQf888XDw+8YdRQ1xEMdzl4KvNDSFMcJv0AqVJCJ6U7fBem5hQPcJW5I4tvX2b8gS4PkgWMLDEwqn0gevx+A2dt1MsUrtdRZbL/Q5Da86L35dBxqqGn1rqxC7F4Vy5XuZDhm6qUyrkED1wglJO/Rm7AXWcbMl4ybjsL9h5K+iwwPOEMXBlS6g3l0vayXGtC2NT3xMbN90Kyn9g1ZLd/wWTsRGDkeF4y4mfNoqAjm/6HljO70YZBVijvwMcDXqi5yRmgnclKIERY1XCQc5gRJULZt7oHJED0wdUiQqKkDUB/m+dZdnBK9N0leSIf1YfDI/CjGlOjocMMeZN0hyaJRu1lt+l2fjzK3GwXFMjk3og3QM9BxOJWCaPZsmapZ/kQAS9XFqoS+jhJLDUxgAtP8eQnUO/SYBPukJ4efLXuFNY4Xoc+vnhzyOMekKtjrFa0K6QM6FgF3y8d8uzds9qQ1mCqb/uxtL5tFPVthWH01iq8Q4XXyGgBIbHefqGQbEXhJ03r5NlNfhxQpw76MDo/WUsSSzcB+3HnLX3q3FwsCE06bbT7bjNvZGCpKPObUZ9HXmz5rFCzqudEWLclyALvjlW+i5VKMC+Xj9IsIgOEoKqIRw8caxSmDRXKfID9TuGjAL6GY43+FZXZ7gMTSid/lcfetsL4kSbr9xSw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(54906003)(478600001)(40460700003)(8676002)(8936002)(44832011)(5660300002)(36756003)(2906002)(30864003)(86362001)(82310400005)(81166007)(356005)(6916009)(4326008)(82740400003)(70206006)(70586007)(316002)(40480700001)(41300700001)(2616005)(186003)(1076003)(26005)(36860700001)(47076005)(6666004)(426003)(336012)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 07:37:50.6700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93839875-d80a-4eeb-2dd0-08db60e0c5aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEEA8Hgg0qRppVsbnnxqAlIAKMWLRteW/M6JPMjgvwE=;
 b=LsTO7x4n6fw2FpiHe4H3S0iT+DrTkW3S+qcfGoyHXTgKzbLmg9Zx/bM9BKncPM/WIi6C//c1/veakwAr6slReRMGct9gjBDuCpvjpJ3YKKuegSgpPBVqdf51RDepnw5WokW45BD7Cl39m3hXNhk+PgoccEKWUswRsj6jA2YxFCE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LsTO7x4n
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 bump to xilinx-v2023.1
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

This patch bumps the zynqmp_kria_kv260_defconfig to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01
- ATF v2.8
- PMUFW xilinx_v2023.1
- Updated pm_cfg_obj.c from Vitis v2023.1
- Removed kria u-boot patch which is included with xilinx-v2023.1

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 .checkpackageignore                           |  1 -
 board/zynqmp/kria/kv260/pm_cfg_obj.c          | 69 ++-----------------
 ...-0001-makefile-add-multi_dtb_fit-dep.patch | 32 ---------
 configs/zynqmp_kria_kv260_defconfig           | 12 ++--
 4 files changed, 11 insertions(+), 103 deletions(-)
 delete mode 100644 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index f2dea0dfd9..77f7d5edcd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -104,7 +104,6 @@ board/versal/post-image.sh Shellcheck TrailingSpace
 board/zynq/post-build.sh Shellcheck
 board/zynq/post-image.sh Shellcheck
 board/zynqmp/kria/kv260/kv260.sh Shellcheck TrailingSpace
-board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 board/zynqmp/post-build.sh Shellcheck
 board/zynqmp/post-image.sh Shellcheck
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
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
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index e180d5e7e7..31ab56937a 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
@@ -15,27 +15,27 @@ BR2_TARGET_ROOTFS_EXT2_4=y
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
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
