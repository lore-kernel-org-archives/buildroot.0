Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F968C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 13:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89F864057A;
	Sun, 22 May 2022 13:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFZfme-QmPJJ; Sun, 22 May 2022 13:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9685240386;
	Sun, 22 May 2022 13:16:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 983851BF384
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 13:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86C4A60B5A
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 13:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTTOlIUcUPAJ for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 13:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E027B60A82
 for <buildroot@buildroot.org>; Sun, 22 May 2022 13:15:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQiaDOIVFxTC9IgDu8xAFddG9WmFZ4+yTSEgrKPkMg7ZQ//JSR5z116cdhLhoyG/BTyve36m2GtMfjS7lv3uce/4sI4LAkFJTe6P18es3Sn1CO/Qn/dKfd85gnjX+a6f3dUDusW1G9RPeQvGWNKOkNGWdTHNGA6cl40UCr/tHj33sU2b+8M58Rvt/gMlA5aDK+SBnHpIWQWf4tO4eTowEUmZPRpSOMjlPNb+AfZWUtdEaPfcfy9CETOywOErnfhdn07FY7BcVF2N5zDxQMxGCK+r6lQ1w8zODT2Cr7124YfcEJgSG55MKfoelAtYzMccEjswp9vvHHWOX56Teo/yjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Kt2xbg3TNI5wjRzkeqnxDWRfw3ND+gqXdrWZ9xzH/8=;
 b=b+YaT0+CY7TR94VxRwUTvslAUgCbOaS4B6jHQo8S6xZzQjv9+u8w0huyhE2lrKbh3mBHwxsKdYjV4HgADy3/Yh69InkX6tPTvKvqqtXAIW7uFYPIKa2XedO675iCBp7Tq6dEXiFgCt+mdM94rg2dyvQLcDHdGCCUdIV9mSS589MKlOBAI/w7wJTHE4k2GyCqt9cXvy/etxt9tSNyqeUoUSYF6O6volfZqXQV5z9aGltHmwcyprRUzX/r6Ir4Y/b0ApMsCoY0Zr/FhKzdIkqqkU3m76dqz1ei2/kbknQziO0143Wdsnxk9jOGzjkP7t7DnfAzp3O0YwgaD9eJJKIhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Kt2xbg3TNI5wjRzkeqnxDWRfw3ND+gqXdrWZ9xzH/8=;
 b=IJ6FwCKl8F0iXt62o0stO7paFUPpIUWBY45PpQmdO7xgD8I8pMjXPhtFRJaSCu1Ynrg4GmmM6LDgt+rMytrya1IXhZQA68nJ+bVcZhwHwRGf2diHdFToHlM8kYs7dyXIID8G4fuEqUn/wq/3y6M9K5vY8tFq5W8wbnVX34I8Kd0=
Received: from SN2PR01CA0029.prod.exchangelabs.com (2603:10b6:804:2::39) by
 SJ0PR02MB7615.namprd02.prod.outlook.com (2603:10b6:a03:31b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Sun, 22 May
 2022 13:15:50 +0000
Received: from SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::7a) by SN2PR01CA0029.outlook.office365.com
 (2603:10b6:804:2::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19 via Frontend
 Transport; Sun, 22 May 2022 13:15:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0005.mail.protection.outlook.com (10.97.4.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Sun, 22 May 2022 13:15:49 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 22 May 2022 06:15:45 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 22 May 2022 06:15:45 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk, neal.frager@amd.com
Received: from [172.25.185.186] (port=39774 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nslQv-0004kl-Jg; Sun, 22 May 2022 06:15:45 -0700
To: <buildroot@buildroot.org>
Date: Sun, 22 May 2022 07:15:34 -0600
Message-ID: <20220522131535.1498502-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220522131535.1498502-1-neal.frager@amd.com>
References: <20220522131535.1498502-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3f961ce-dc8e-4a6b-c845-08da3bf530c9
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7615:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB76158994D013144CF8DFACD2F0D59@SJ0PR02MB7615.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: irKzVncB/1strX+2udmO1DQs5wgLk9vMkyNIGAtwZjuoDegQ7a6ZiXctEamGY5iGoL/ZIZMaxpfx405bizApu+ZQj38oZvNGcNgosRCps+IV+4bg4iNkIRz6V5PRjK9wT9Ue3FyAP963QuD+JPrySJ+K9f30cRWrX+Z+po4LjdLbzfegxAokrzlPBPfOxp0ZAsdfuTf4y5mp5doG0Rf5/Nc7gzyj7bSYJ1rQyu+5fqvWnoQbPqf4d389hq/LGmiEfbNt8RSAnQpfCcrr+m9WJb+eNR0jwK4QS4tYQiowjk61W7B7o1o760+VY9Dppjn1gYm3zi3gR8JsrXN2t+ybzWR4mUUoZ3lRjx9qoUqelXFzHMjTHWSVe8jOfXaRwq571aaEYCjyY3vFsGSxfYDt6ksroNNJpybYpAkk8aQHWX+79OZ16s3W22iqdFf4g6bvpJtWYoYP/+QCkEw6mgZcP/czrTNqmturOj1Q+H8FSCiSHwEI8v5kw0E5jbOOU1RXZu2nuiLxrBB7NU+YWdWJesVKGXnMO6GtnV6VC4CQ3HKhxXYoTsPhT1eU2nmAMe+X/QU7n7yUgSYvkRHFp55H6Ru0ltRjfiamaFo/fyVEUh5LVKiHXJi8ymXOx6GMOATtQxJmtURet161WkxrpqYptfkVndVOsXNqeKVeVCCXfYKfhpQzpNf9+UY2JjlMeVsROMTfKb1XADQHbmhz7NJnbQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(356005)(336012)(47076005)(508600001)(9786002)(36756003)(5660300002)(8936002)(7636003)(2616005)(6916009)(1076003)(316002)(83380400001)(4326008)(35950700001)(86362001)(26005)(70206006)(70586007)(54906003)(8676002)(40460700003)(82310400005)(6666004)(2906002)(44832011)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2022 13:15:49.7121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f961ce-dc8e-4a6b-c845-08da3bf530c9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7615
Subject: [Buildroot] [PATCH v1 3/4] configs/zynqmp_zcu106_defconfig: add
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

This patch enables the zynqmp_zcu106_defconfig to auto-generate the
extlinux.conf file.

The board/zynqmp/extlinux.conf has been removed as it is no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/extlinux.conf      | 5 -----
 configs/zynqmp_zcu106_defconfig | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)
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
