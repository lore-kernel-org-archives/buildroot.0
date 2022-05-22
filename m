Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FDFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 13:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7E3A60BB4;
	Sun, 22 May 2022 13:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UI0k5dcoSqPG; Sun, 22 May 2022 13:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73FBC60AF2;
	Sun, 22 May 2022 13:16:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74D861BF384
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 13:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 628C840386
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 13:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aV0RjdwiAf65 for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 13:16:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::625])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA69C400B9
 for <buildroot@buildroot.org>; Sun, 22 May 2022 13:16:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axhwAnFZHNdAHoIBna/xxxgOBoi7X501qLlMjDOldD6yZufFBDF+sY8hkHH/9a6FzqNMgbOd1tSryub9U7Do6drRXvdpsCcJtGT9A3+34hgOTR3G0HjDGOAMsETI26tC6uYDSMy131e/fQs6SN52uIKwZJB8ZSPYixKy74sMNtPa3SjVrO0tmW/LXjRASpomdj3Objp9nf0a/1CSdAWANy9U9uXo5tHCXXD6csTONXoqEjg/CLLTpkCTrExx0qv5f9WZDeBbLUKayJQ1EuhGZ6ZMZgz6Fx6gOAkLLBAAWnHb9RjxPjoFLNji6PshotJ6ZL9GnSZKcdMGaZajMX9swQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MisOy9JDKFZY/F+C5C5FyC/8nsy/UmXX+Tka/L9SrDc=;
 b=FKg6m8fftKZo/lhcYoXtGtSjtbg2/SnLpWONSaxOKyq1TUfvGPUDd/oHLSO4TOip49tlNevcgqtkKMkRTpQZ8XdAQA3NJPQAGQGLjWp93qfyGZS0aG5oYMmeo0B6gqzS+AhaGGcrxuKOjCeaO1pzwY714LERBKk3ZdDyCKqBjZhzdKkO8Pn6CyrehW+Hnfh2H82QvgveGo7J+HV0NpA2hUv2hsxR8P8Oo0qchKH737SUeo4qUXM3wvLDdyIQi7z47bZtErIzeltSBJcD1leNs85vcWRyKsm3sDkDU6Rmlm4DlTXGgPF069Qj0UIxWDWlrNZAqOSKjkWVy+DeACBoWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MisOy9JDKFZY/F+C5C5FyC/8nsy/UmXX+Tka/L9SrDc=;
 b=XTUQQYuJ2gT7Y+DcQbtV8zHzKbCLRTcLZ0ZX7rjL/YYzqetpX0o51d220jvNX1SkU4gKjsiywcS1oCaKcEn7P18kGOWdiESG5oM/9kF6yqAdNB1gfxhCZTdRPhh+YTnlhI/iFxgEqG+2w6azeN0PWS0zNsiVh28isE2YyJBuU9U=
Received: from SN6PR04CA0105.namprd04.prod.outlook.com (2603:10b6:805:f2::46)
 by DM8PR02MB8122.namprd02.prod.outlook.com (2603:10b6:8:1b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Sun, 22 May
 2022 13:16:15 +0000
Received: from SN1NAM02FT0024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::e2) by SN6PR04CA0105.outlook.office365.com
 (2603:10b6:805:f2::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Sun, 22 May 2022 13:16:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0024.mail.protection.outlook.com (10.97.5.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Sun, 22 May 2022 13:16:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 22 May 2022 06:15:48 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 22 May 2022 06:15:48 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=39774 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nslQy-0004kl-6e; Sun, 22 May 2022 06:15:48 -0700
To: <buildroot@buildroot.org>
Date: Sun, 22 May 2022 07:15:35 -0600
Message-ID: <20220522131535.1498502-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220522131535.1498502-1-neal.frager@amd.com>
References: <20220522131535.1498502-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26991de7-3201-4516-65a6-08da3bf53fbf
X-MS-TrafficTypeDiagnostic: DM8PR02MB8122:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB812280FAB8C48C433E3258E2F0D59@DM8PR02MB8122.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JFvhz+cjCStiBzgVz7nLRGDyBhLI9SpWkfFk5re3r37fvl4TmWXN8VhWZHW7wmgDGsjygu/5UX8B7Q2OGlAxsN+c15ZrBjyzKgvnfh/MCPZZWngtxxTV4vMlPs3ps+ic7uAuu1AHfnOjnVHT4Cd8oAi+rU6tnMUTu8SIhyrX9PhNtHTwsHhws7CPfce5YDL67LVGyih00k0Xh97KFWpJancH8ILCJmyKh4Xa9M3gWxbcueN4mE5Ft43K6yc7rTdCLBwozPDohuuC7MFSRu+wzQ5NciFTZv5yuSLvRLmzyK+w+jcER6I4NhYMeFuanwEJqpVZ2/rUwDn2lx8eRTc7n5F3aKeN+elMH3sdpJ5AiML/sszbDd6S1jedI7iNsyjCiLQRQpivuwOeMrzjEUYPtGOuTvSq7ZI7zCuoALbT8cQLuf1meG/Q9dG2YgPQUr8uoCNmJ96BQN/jWeDo1r1tBz76FbPTrh41xPgUSDvDOLGtVvnx+IHhhiJRZMPfO+AcFJy7+HvSp0AFPbhwxnCRBtOQSYpAj4pSosCN76NPl81+31t5n/PuKGMQOosA4AzZeQ16gi7IQMARyOTvzdA1wjB5xdqjxq9bRr9UtEeSCVQDg7NS5p81k/u6uIcjuiXqnbkIwbutsalGFDVh8xdw3Q2I+0OvHJc1Y+cJfzzc+b17LT52UeWdlWFeVBJ69J/ZiYFUgjwY9bnn/G7sw2kPag==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(44832011)(6666004)(82310400005)(35950700001)(316002)(36756003)(5660300002)(86362001)(26005)(2906002)(40460700003)(9786002)(7636003)(4326008)(8676002)(2616005)(6916009)(8936002)(70206006)(54906003)(47076005)(508600001)(1076003)(83380400001)(356005)(336012)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2022 13:16:14.8099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26991de7-3201-4516-65a6-08da3bf53fbf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8122
Subject: [Buildroot] [PATCH v1 4/4] configs/zynqmp_kria_kv260_defconfig: add
 parameters to generate extlinux.conf
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
Cc: wesley@sonifex.co.uk, Neal Frager <neal.frager@amd.com>,
 luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch enables the zynqmp_kria_kv260_defconfig to auto-generate the
extlinux.conf file.

The board/zynqmp/kria/extlinux.conf and board/zynqmp/kria/post-build.sh have
been removed as they are no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/kria/extlinux.conf     | 4 ----
 board/zynqmp/kria/post-build.sh     | 8 --------
 configs/zynqmp_kria_kv260_defconfig | 3 ++-
 3 files changed, 2 insertions(+), 13 deletions(-)
 delete mode 100644 board/zynqmp/kria/extlinux.conf
 delete mode 100755 board/zynqmp/kria/post-build.sh

diff --git a/board/zynqmp/kria/extlinux.conf b/board/zynqmp/kria/extlinux.conf
deleted file mode 100644
index 663aabb7c3..0000000000
--- a/board/zynqmp/kria/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label linux
-  kernel /Image
-  devicetree /system.dtb
-  append console=ttyPS1,115200 root=/dev/mmcblk1p2 rw rootwait
diff --git a/board/zynqmp/kria/post-build.sh b/board/zynqmp/kria/post-build.sh
deleted file mode 100755
index 9fd8bbf2c8..0000000000
--- a/board/zynqmp/kria/post-build.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-# genimage will need to find the extlinux.conf
-# in the binaries directory
-
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index d4a72a0d19..c1366b705c 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -1,7 +1,8 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/kria/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
