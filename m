Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEECC433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 14:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20E75418DD;
	Wed,  4 May 2022 14:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_dI6GslP3DE; Wed,  4 May 2022 14:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B553B418D3;
	Wed,  4 May 2022 14:04:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 614171BF286
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 14:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F8AB61085
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 14:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzVftFZKXP-5 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 14:04:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::602])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C8276058F
 for <buildroot@buildroot.org>; Wed,  4 May 2022 14:04:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RR7nP8bVknxSSTVupW7j1uzi3493MHAmHVucdqG3Dx8jeeiO/qkWz0dBGjl+57of46lW04rjCQzzikPmkEXUYy8KG1KjWNLDTOM+EUHnKn285hcTRLs71nu32HCckYloUHq+WrPCzPkF9HkknXJisBnvgGlbGarSHTnJF3QNR/fas6BV2TDiPjfpkmsS7TXOOzrGFe0sjL3JPlSvN/6aITCgQH9zWUuA7SNHs/ukCu9rm9816NqDdbV75Fi+zz8JxIgstdOE61iV9zDCdTvMEpKTJRSjGN+SgwHf63pCld6pF7pzI7kONV6IlH5mfC1qKY3/boTW7onWjKXxhQ44RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgp1mwEZpfvRZPRBqtera3X+IpwKl5rUs08IZ0NB8Mk=;
 b=ZtXALmkMxQYfJnDUnL6LOE970XoGtDv6weGAqE+U3Zl6+qRXSmErclYfpvQW0gIdKpzZH3z2Qb42c3d3oer2cOIuC2/iOj4Fh5ZnXlJvY2DkOgp7osJ0oaYhGFeuFsC24HpWV/VHYK3zaszCOjgccwxVwOBk1NusQfV+RZiix90SA2TVAbpJh5WHFH8qnmZb+R8nXkssr/n+OhbnUM3c6PaWmI4f1KqGxvSIKCTvFduA3cy0Ztgj4+6IV4nfdLZlxpG+GQc0kO0z7XClm6vC9ifLGe1Tz9NrEcx67GCV4yZ+FEfayfWfycFhLsTjHrk3Q/tZWY/3WbbFH+1TSegxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgp1mwEZpfvRZPRBqtera3X+IpwKl5rUs08IZ0NB8Mk=;
 b=mRp7MhFo8Mhvx2fcqZVn6cs1Xlm/QNNlVVVTh7lC4s9S66ZmjF5FROPi/NcdBSr5b3kKBhoTHdbmUJMxWLxQkQgSyl6ievyeBqgukO77jBBBMOzPgpupRl4rraMP8Yx0OFeuChex8Z0I52lHoVaF5LjfFJBE8IfCFYErIim0MM0=
Received: from DM6PR10CA0008.namprd10.prod.outlook.com (2603:10b6:5:60::21) by
 MN2PR02MB6366.namprd02.prod.outlook.com (2603:10b6:208:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 14:04:27 +0000
Received: from DM3NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::6a) by DM6PR10CA0008.outlook.office365.com
 (2603:10b6:5:60::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Wed, 4 May 2022 14:04:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT058.mail.protection.outlook.com (10.13.5.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 14:04:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 4 May 2022 07:04:20 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 4 May 2022 07:04:20 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=40486 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nmFc4-00069n-4c; Wed, 04 May 2022 07:04:20 -0700
To: <buildroot@buildroot.org>
Date: Wed, 4 May 2022 08:04:17 -0600
Message-ID: <20220504140417.1204631-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 014afab8-8943-4048-75b9-08da2dd70005
X-MS-TrafficTypeDiagnostic: MN2PR02MB6366:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB636614E5E2779B63B1E0655CF0C39@MN2PR02MB6366.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XVsQHrb4lJRdqWyf0JL4JQUhjmdDyx4qcs0ywWmsb3Spti51OQSR0Q5X81+TrUJW9hTC7moGO06Es86iXywPlNFn1Gh5IqlTDd8loiOwUh7lDffCLEhvMJ5kaX1xjKbHo8DDZ8+GRPwio/XNx9IndgUx9a6szUAiPzAmadvt66PBk7/YtgseHqdIMfer3diqyKvllrEW1rJVvqgKvblUMZfP2EoEcvMRYW5Oj6BqAMyRUei7IDGhAMHnD+bHasHgHpZNcLatOKxWa4yK1RV9itDmipbJL69K/9YR41jRGmUI0CkRB3IXJQ8W5hFvam6tlftv1N1QpDUlF22Lo7GPmFU51cEmMz9Izog396+H1WPPwTws7PqGtIb1I7N9PpHZ9sMws/WU8jua5EdfmT1tX4JKupM3IWtekRiiD4sq7j59F6kuSmAI3yhUd4g3iNw325EIWKu5jas/TcK+wTKR3wXqPKzhedK26gvZm0fN9+eWK+IPwfdWjN6rdqov9wr43/0Pn8lmolRTDklraZUkSfjAF2k6T9OmOg/TPoVIq/LD+NQxjaAsnRb5ZHzXVjZAQEGrWpyijMXnL+9F9El61vFK78Q9zkkcveX3de++6Jhy6Ba5SU2PD5/Ag0W8AwBGVlOLdp74YqcjGNO1WXNMVXTv4DsHRNy4J12SR7tpHQRbw0MPU+0t2Ih4MK7rgZuteVF20YSLLO8Xm0N+2xKQ7Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(336012)(47076005)(1076003)(2616005)(36756003)(5660300002)(83380400001)(4326008)(8676002)(35950700001)(9786002)(40460700003)(70206006)(70586007)(8936002)(82310400005)(6666004)(26005)(44832011)(6916009)(54906003)(7636003)(19627235002)(316002)(508600001)(2906002)(356005)(86362001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 14:04:26.7141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 014afab8-8943-4048-75b9-08da2dd70005
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT058.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6366
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig: uboot
 dp pll patch
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a u-boot patch that fixes the DP audio and video
PLL configurations for the zynqmp-zcu106-revA evaluation board.

The Linux DP driver expects the DP to be using the following PLL config:
  - DP video PLL should use the VPLL (0x0)
  - DP audio PLL should use the RPLL (0x3)

Register 0xFD1A0070 configures the DP video PLL.
Register 0xFD1A0074 configures the DP audio PLL.

This patch was build and run tested on a zynqmp-zcu106-revA target board.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...zynqmp-zcu106-revA-Fix-DP-PLL-config.patch | 39 +++++++++++++++++++
 configs/zynqmp_zcu106_defconfig               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 board/zynqmp/zcu106/patches/uboot/v1-0001-arm64-zynqmp-zynqmp-zcu106-revA-Fix-DP-PLL-config.patch

diff --git a/board/zynqmp/zcu106/patches/uboot/v1-0001-arm64-zynqmp-zynqmp-zcu106-revA-Fix-DP-PLL-config.patch b/board/zynqmp/zcu106/patches/uboot/v1-0001-arm64-zynqmp-zynqmp-zcu106-revA-Fix-DP-PLL-config.patch
new file mode 100644
index 0000000000..58eb0a1555
--- /dev/null
+++ b/board/zynqmp/zcu106/patches/uboot/v1-0001-arm64-zynqmp-zynqmp-zcu106-revA-Fix-DP-PLL-config.patch
@@ -0,0 +1,39 @@
+From 8e8b766d918877a7e64efce1e1a640d9e541fba2 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Wed, 4 May 2022 14:14:16 +0100
+Subject: [PATCH v1 1/1] arm64: zynqmp: zynqmp-zcu106-revA: Fix DP PLL
+ configuration
+
+This patch fixes the DP audio and video PLL configurations
+for the zynqmp-zcu106-revA evaluation board.
+
+The Linux DP driver expects the DP to be using the following PLL config:
+  - DP video PLL should use the VPLL (0x0)
+  - DP audio PLL should use the RPLL (0x3)
+
+Register 0xFD1A0070 configures the DP video PLL.
+Register 0xFD1A0074 configures the DP audio PLL.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
+index 15f0be1a43..cbc436289f 100644
+--- a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
++++ b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
+@@ -81,8 +81,8 @@ static unsigned long psu_clock_init_data(void)
+ 	psu_mask_write(0xFF5E0104, 0x00000007U, 0x00000000U);
+ 	psu_mask_write(0xFF5E0128, 0x01003F07U, 0x01000F00U);
+ 	psu_mask_write(0xFD1A00A0, 0x01003F07U, 0x01000200U);
+-	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010203U);
+-	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C00U);
++	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010500U);
++	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C03U);
+ 	psu_mask_write(0xFD1A007C, 0x013F3F07U, 0x01011303U);
+ 	psu_mask_write(0xFD1A0060, 0x03003F07U, 0x03000100U);
+ 	psu_mask_write(0xFD1A0068, 0x01003F07U, 0x01000200U);
+-- 
+2.17.1
+
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 96b15eea81..9b6957e826 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -1,4 +1,5 @@
 BR2_aarch64=y
+BR2_GLOBAL_PATCH_DIR="board/zynqmp/zcu106/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
