Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E8BC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 14:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BEC240FE8;
	Thu,  9 Jun 2022 14:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3akeu5Hh6U0; Thu,  9 Jun 2022 14:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23D4840D7D;
	Thu,  9 Jun 2022 14:05:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83C8B1BF378
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8089E610F8
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0JPJ_5ck0gT for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 14:05:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D30160AD6
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 14:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEUHLNEL6loWIme7nG5u0FStHdpjY3pNmd/SytCkD75TqQ7o8E9PkGuMu3FZ0RFV6sPr2Le7oQqq+K7TCGp+vRji2xjqkogzbPMt8bG14+PxLK/Urso5NiDHzg/OLbw4UEG8zLbOGiIUzuy5dXxStAIyhZz9nU5qctCUTMj9axpIBQP8/VxGMjvDpsFUC5h235gMsIvJmnR5EH91KrHbboY7Q8xVQFV/+dmH2d5Vl3fWa+F13DiVOmBJs6DWxAZp1EnTKEsAy8fbk5nmTysKnO5FUzuSBd8pf4r7ygkmMjXxoYnuWAO42s0X+t//HhuIRlArd0NhuO3LOtC9AtxtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G8p/Xh8OXqWB2XflRycOPsg+MOV/xXkvaDGeMftwps=;
 b=GUB6LfMg5w8ctyfMZtnhniC1LgFLG45FGAq6Xbwtd0xzvC9xN+bTcLX/hTs0rGgHfb73Rqw3E1Iyv2eXz9ktKRIYQRRrYrgqDSju+BegIa4sKZfN/IXK4deBl4L33daOn82kHY0YHZ22ZRdSFjIsfw1PivxnKIswwIVmcDdkVdk8/aRlUgKgVr9ANFwaBNthk79k8BgqnCdw5KLR87J4lFF6zlPnPhZhXeqoA7+DQVqW5UZFyinvgx5Is39xvqtzVT2TsqtgfIxpbOjqz2FRo5VDR+5NRg88r5mQJt1NO2iV93Fv5cbHdnfhl1wDZqC2+FZD7zqwouh5xzd8TSgqsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G8p/Xh8OXqWB2XflRycOPsg+MOV/xXkvaDGeMftwps=;
 b=iFnnEuoQcKFoGpKadtjeyOVh/tabuA6Uy5umtGYkMgB3Z98+CPZMq5ybbNFjjRviLoQlVwaCgScaDKIqORHRPd1vPGGY0KaBtpE75SLSzmyl7KMBOKydcQt0vhiQa4pDi2/LDpKaS0wLUWtuNyw0TZxYRQe+JFH/uk6Ok+/ieUY=
Received: from BN0PR03CA0041.namprd03.prod.outlook.com (2603:10b6:408:e7::16)
 by DM5PR02MB3720.namprd02.prod.outlook.com (2603:10b6:4:b2::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Thu, 9 Jun
 2022 14:04:58 +0000
Received: from BN1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::69) by BN0PR03CA0041.outlook.office365.com
 (2603:10b6:408:e7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Thu, 9 Jun 2022 14:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT047.mail.protection.outlook.com (10.13.3.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 14:04:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 9 Jun 2022 07:04:55 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 9 Jun 2022 07:04:55 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk,
 yann.morin.1998@free.fr, neal.frager@amd.com
Received: from [172.25.185.186] (port=36204 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nzImN-000GMW-Pb; Thu, 09 Jun 2022 07:04:55 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Thu, 9 Jun 2022 08:04:47 -0600
Message-ID: <20220609140449.210030-2-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609140449.210030-1-neal.frager@xilinx.com>
References: <20220609140449.210030-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc7715a5-b450-445e-ecd4-08da4a2108dd
X-MS-TrafficTypeDiagnostic: DM5PR02MB3720:EE_
X-Microsoft-Antispam-PRVS: <DM5PR02MB3720F63C8B865941CFD6AEDFD7A79@DM5PR02MB3720.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhXKstyiitbha+8ZXz2QCvW6IXr3UTgM3ySrVZjiRDlHVSH9kUY29Gao3MVumen/y/BI3n0dAzeGUOQqM6I0asO0d12u09nWDuJlElotpMICNpilVXQg+z/ImweoPyurR6Y194YQuImjR1uLngulytoCDVSAqrjS94yLJDqfgPNisXYifUZnx16S3w2MM2fpuOKqqTEg6GkA3wiSBbIlQNEOGtoTXaBX0iszrnhIujuULyBJsiuxR0K4r9MqjyUbn2K4/RyaTbydzYpvI/csPGFOWfBJp2UEdYAGDAbjHu6yK13MLdqYkgwhJg2IAh5jYtWyoAab4fVOXOU/2hPmgleMkCIU2qbzMOZcbzt2r2PJG8Lw9zwg8moUdFYka7qUZsYQHGjT7l52Qkn5aS0kz+LERYv1hhPkjdKg6MpGSRys5Vlj6D2MfTqtTxws4yp2mLPE6lgkOM0R1FNbiQiILBzgekHxzKiLCpmyIl/b+smBQWvtE7YcFJefbNlBTdVvVlbHZ1Dr5FYfkME1n4ESjmNioUeAtLWzKkVQpgNmN2X5m6U9AQBSS9NAC1YR0JFgWtJgLFYJEGYK/LeaVrD578JjUK4BL2n/eVmCOsQ5umwHtPPEoywMGXMpU4387spH502+nBoTAwZbifNTqpSKDX/UUXzlcIMJMbSsP0N08h7MK/fd/SfgK2gH1AnLLSSuwmuU9OXeuqcsgxdXkBP7UNU9+AnnRawu1gi3bkkxC7JiyIMAlF6I2Pe2MUIJWwSm
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(44832011)(4326008)(7636003)(70586007)(5660300002)(7696005)(6666004)(186003)(336012)(508600001)(8676002)(70206006)(2616005)(1076003)(54906003)(6916009)(2906002)(47076005)(316002)(426003)(26005)(36860700001)(83380400001)(356005)(36756003)(40460700003)(82310400005)(9786002)(8936002)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 14:04:56.7922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7715a5-b450-445e-ecd4-08da4a2108dd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3720
Subject: [Buildroot] [PATCH v2 2/4] configs/zynqmp_zcu10x_defconfig: add
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
Cc: Neal Frager <neal.frager@amd.com>, wesley@sonifex.co.uk,
 luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Neal Frager <neal.frager@amd.com>

This patch enables the zynqmp_zcu102_defconfig and zynqmp_zcu106_defconfig to
auto-generate the extlinux.conf file.

The board/zynqmp/extlinux.conf has been removed as it is no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - squashed zynqmp_zcu102_defconfig and zynqmp_zcu106_defconfig patches together
---
 board/zynqmp/extlinux.conf      | 5 -----
 configs/zynqmp_zcu102_defconfig | 1 +
 configs/zynqmp_zcu106_defconfig | 1 +
 3 files changed, 2 insertions(+), 5 deletions(-)
 delete mode 100644 board/zynqmp/extlinux.conf

diff --git a/board/zynqmp/extlinux.conf b/board/zynqmp/extlinux.conf
deleted file mode 100644
index ae3ec8614a..0000000000
--- a/board/zynqmp/extlinux.conf
+++ /dev/null
@@ -1,5 +0,0 @@
-label linux
-  kernel /Image
-  devicetree /system.dtb
-  append console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait
-
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 5361981f5b..217fa0814b 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -2,6 +2,7 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index e1ea27a496..3d98dffe01 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -2,6 +2,7 @@ BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
