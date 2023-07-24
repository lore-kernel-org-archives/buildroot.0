Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F4BC0015E
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 10:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E13960F47;
	Mon, 24 Jul 2023 10:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E13960F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uKx4rtvT5tMm; Mon, 24 Jul 2023 10:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43D6360F3A;
	Mon, 24 Jul 2023 10:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43D6360F3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D053A1BF45A
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 10:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88DFD405E1
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 10:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88DFD405E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mMnqIlQQZCm for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 10:35:43 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::612])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A75740182
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 10:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A75740182
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdOWouFDC3FTTkz0PkwRksyb5zgL13AyG6uSvXUT1KuarvNbiziiOlx94RU0NYkTvKNJISbJjc8VGCbdhIeXVHI7NM2N15dBD3LoVbbOfd2oMJJaO2clyVu7ic3QA5Bb3oWD3D75TrAUnXf0ScPD0RPj4HaUIQrLluZ5NeptsZX7hNSELp7Q+DOLBJk0bx1w6cxON4sP2yIyV9PDVkzo0+P3325AJJ/21v3oEVK+XOpo84LdS6XE5E1Py2/1cGzWAy2bqnTxgfcoE0tXwHZmAoG0UVQFqVQxACRUr2V6k7yMGFDisuThirVOL5qjCNxz2nEFtbRrM0PKfoU+Sux6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZWGdzJcevwCCtrrXHnVmvAUPTjn4UUxdcVAn1G7ZmI=;
 b=Bu4H/An1GhxIVsBGtqNvWFNwYeUMuIYkUyo2DZ3biXv7/uOMEKcslfp+k6xbGYzxYslnFHJeFbxxscPFLxMM23ljLOg+kAtkfCrtUZD7ygnyKCnhorIlsyXJmevP+ooEYvZLP2PJJiNJaX0b1pERTgaYnOoZTDEKryCh+GCRAip//t2sF1AcpUqXPeCzZ240Apo3yMnmNp/XQmk+d+4sZrJqUT3d7lr/3nEAusO4zXEwEnFA0wLKuebWzRziZezdKNdD1mb3ORNRLk3yD+3WGu3A9gju0+iB6zO2zGRU3bhLFsN9oeR4lBU0YGaQUrwqNfUnX5KV3cji/AWhQdWeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0325.namprd04.prod.outlook.com (2603:10b6:303:82::30)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 10:35:39 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::bc) by MW4PR04CA0325.outlook.office365.com
 (2603:10b6:303:82::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Mon, 24 Jul 2023 10:35:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.25 via Frontend Transport; Mon, 24 Jul 2023 10:35:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 24 Jul
 2023 05:35:11 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 24 Jul 2023 05:35:11 -0500
To: <buildroot@buildroot.org>
Date: Mon, 24 Jul 2023 11:35:08 +0100
Message-ID: <20230724103508.772579-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a098514-bb04-423c-53ed-08db8c31b939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PrQ5uF1EZqCLOYluBN3GfroExgFNd9lyWjGTKN+fPGiYkKpVaMLCTb8A2II92hQ4Z1mMx1tGSDoA60iSkkSz7JWDXCAiDp1iezl1FU4SH7dsVPJvvrAkPdFAA5LsY8hnOWYDkeo1sXS857mitsmIALn8i3uWtuyJwLpC/ylHj+oGTUQzmuBSDyxFd0udDJW2tzlxdmiSIVIf8dE1OVmH34SjGVhZ7o75ztTVbZK2LiwmJigs1zPvzlLWTHaQCf4foNAZQsuXggQBQmVg5rptCjQgYqPWrYnjqrXhdFf1QBxqFKueZesC9L5X2oEjSibM55V+U3Z0Ao1D7ABfp70jsb9P/fm65353nA0SXVV5FrHHgg3X18GIFQA3rtxtmcZZkMM7PWsUIxWs9fLj7pZs6h6PmbtG/xrmLPlpW5QaNEn/QGFtA1OrUiEZFJj/68XaCgAWz1pfPwhJvVWeG8rbiyrm3GtYgWCFUx/Ac9PRevhAjvaDQ/Iydw50oGoOcJuTK6tKavu4dgBfIY9bRGSnMdA14+TXAvuczyGcve5KmjmzPj6fBKs5/aLeg7ntNL4N5fA441NNI+ZRrVHT50RTevzo0lDs8z+g5UJcC2L4DcxHGNP1KB8XlrO71P+MYxso/iZGRZQhRyQiCrBkeahdhqDIuOHckWz8pgavyP7Fz1RucNQSEqbZpL/cyPhQ7EPcI5dblglFgC+bCXrM9k7kv5za+Ugep19bvg+R6mjjOplLTRbMR/V0BTerrbxqoWaRnosp4b5jIVPYb9ECQEz7AA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(6666004)(478600001)(54906003)(336012)(186003)(2616005)(1076003)(26005)(2906002)(44832011)(70586007)(41300700001)(70206006)(6916009)(4326008)(5660300002)(8676002)(8936002)(316002)(356005)(82740400003)(81166007)(36756003)(40460700003)(86362001)(426003)(36860700001)(47076005)(83380400001)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 10:35:39.0479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a098514-bb04-423c-53ed-08db8c31b939
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZWGdzJcevwCCtrrXHnVmvAUPTjn4UUxdcVAn1G7ZmI=;
 b=h7dcgdFxRCu1iVEXkzuj4VLfozvzo3ZuLtjg3U2EXh1NZELDCNOCWCP0zJ0W4c6KcPhv3IheDUD3pBxuz9USCbHuftHe0cxPQfrHXTW4NzbmGVO4Dhd0tkMUj3T7JNVNzYN4hVlXDchODZF7y3+eFckq+OfY/jFED5MAinv7gGc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h7dcgdFx
Subject: [Buildroot] [PATCH v1 1/1] board/zynqmp: merge post scripts
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

This patch merges the zynqmp post scripts as only one script is needed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/post-build.sh          | 15 ---------------
 board/zynqmp/post-image.sh          | 13 +++++++++++++
 configs/zynqmp_kria_kv260_defconfig |  2 +-
 configs/zynqmp_zcu102_defconfig     |  1 -
 configs/zynqmp_zcu106_defconfig     |  1 -
 5 files changed, 14 insertions(+), 18 deletions(-)
 delete mode 100755 board/zynqmp/post-build.sh

diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
deleted file mode 100755
index 747991e3f1..0000000000
--- a/board/zynqmp/post-build.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-
-# genimage will need to find the extlinux.conf
-# in the binaries directory
-
-CONSOLE="$2"
-ROOT="$3"
-
-mkdir -p "${BINARIES_DIR}"
-cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
-	label linux
-	  kernel /Image
-	  devicetree /system.dtb
-	  append console="${CONSOLE}" root="/dev/${ROOT}" rw rootwait
-	__HEADER_EOF
diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index f44b66342d..4da8a64940 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -12,4 +12,17 @@ FIRST_DT=$(sed -nr \
 
 BOARD_DIR="$(dirname "$0")"
 
+# genimage will need to find the extlinux.conf in the binaries directory
+
+CONSOLE="$2"
+ROOT="$3"
+
+mkdir -p "${BINARIES_DIR}"
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
+	label linux
+	  kernel /Image
+	  devicetree /system.dtb
+	  append console="${CONSOLE}" root="/dev/${ROOT}" rw rootwait
+	__HEADER_EOF
+
 support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index e180d5e7e7..cecb4e9a8e 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh board/zynqmp/kria/kv260/kv260.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/kria/kv260/kv260.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 00b33261b6..f5f33f1783 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -1,6 +1,5 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 88295571af..eb845a9db0 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,6 +1,5 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
