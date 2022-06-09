Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF98C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 14:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3503741CF4;
	Thu,  9 Jun 2022 14:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKnO6Q54Qiiq; Thu,  9 Jun 2022 14:05:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E44C741CDB;
	Thu,  9 Jun 2022 14:05:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA4D11BF378
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8AF040D7D
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 14:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCVPBv-8UogX for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 14:05:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::606])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C951400CC
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 14:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUx/uuNPXNwHPoEv6ovUWA8K6ctXNHL2HmJZm6fZ8U7/soJEmkCHGDHv7AudVywfUQKOVWBfecOvP6NZPFf8tgLmHU3Qa3OXlLFGQPUulOtJpU7l3R5ZUnong+17nQMuUTEKaod6SnZ2AbD108vwUDfkLmZs9Ss9EVL2b960LaZZGa7Kbu/i0i0B4PMLlkZOymwz4Po3oS6h8uidB7sV7TSstjyr/TQln6tTcUr9qRMvGiEXbnYTTz85yAeHp4kSmXFfPluWKzAfNMYcUJRfv2oGcX3UVkdyvqO6Iqmami/r40pgJDJLUtmnwf8nnsGAJVoW2CQpwysrV1g/23TiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0elaObVpoSGz21W864i+IEA3/OTc/eRDa6sowEsJqs=;
 b=XxmYqoFq3GdWYxy9qzhpdluxdjpVFuOUjaKhxBD43IMoB1QD7Nrl/udMx02Zv/TnrntNnulilnbN44KUAyG77xuTbY5K0SNQiXvGfHziDs0u1OyovfbHVlJu7FObpEUejlOh1j7AABBXJg+YGQ+UONBbBM9rNwSrXIJDTxzyoYIX55S1+Ot/i0+883pUikmTL7drWtxsWjN6zm8c6KOW7dl4qCLnW83SqcV/0iKaWhgXE9pYnwHK8w6fhquiHrLJahxU6sR5HVNxYX202cZaW1Cm4yP+3yi2oCj/D0Iy1pSefSyFdQOX8M3dGLqlmLa85Fauw//5AYMD/QKi4pBOCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0elaObVpoSGz21W864i+IEA3/OTc/eRDa6sowEsJqs=;
 b=EPAYzcQ8D6sGwgoIS+H6pApPY+OPpz9Wnb3IuW+/sz6sbQlr/88pCU/fQaZBQ9NfhtqNyad1NQBn6SQeuIMZmS/dArhSUTo4Zmu8rUqlJc0mySQB9W+fbruJbOkMrWiQnexJkLIXUZRuHGn0OvAZe58iEh/t1ERdSjHLoVf8xzI=
Received: from BN1PR10CA0013.namprd10.prod.outlook.com (2603:10b6:408:e0::18)
 by SN6PR02MB5565.namprd02.prod.outlook.com (2603:10b6:805:e1::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 14:04:59 +0000
Received: from BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::aa) by BN1PR10CA0013.outlook.office365.com
 (2603:10b6:408:e0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17 via Frontend
 Transport; Thu, 9 Jun 2022 14:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT007.mail.protection.outlook.com (10.13.3.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 14:04:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 9 Jun 2022 07:04:58 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 9 Jun 2022 07:04:58 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 michal.simek@amd.com, wesley@sonifex.co.uk,
 yann.morin.1998@free.fr, neal.frager@amd.com
Received: from [172.25.185.186] (port=36204 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@xilinx.com>)
 id 1nzImQ-000GMW-5z; Thu, 09 Jun 2022 07:04:58 -0700
From: Neal Frager <neal.frager@xilinx.com>
To: <buildroot@buildroot.org>
Date: Thu, 9 Jun 2022 08:04:48 -0600
Message-ID: <20220609140449.210030-3-neal.frager@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609140449.210030-1-neal.frager@xilinx.com>
References: <20220609140449.210030-1-neal.frager@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3f8ff5d-8b6c-4c41-b2c8-08da4a210a7d
X-MS-TrafficTypeDiagnostic: SN6PR02MB5565:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB5565541ACB836EBDB3991EBBD7A79@SN6PR02MB5565.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hj6gDo3rXfUtjoqy9cUos+WAu/AMnuTcn6d7wQn6yUQ5B2Vl3DWO+qToWbvXn+dHRVJEFn6QeJ/XZhuA4HTtOvutpCwjql0VpAfZ7CnywhDsqzByNTw9kywc+Zv1XceFj8t9Gzxmcke0wjOMxhlv9crm4Rnt3XMxLVY3KWh3ltBTVDh4I0Eo52Iequ3G6qHmz2Voup4NLFJOJSDTlk6NBVc8vLCQUrpybvnb8Vcb0N8rTsfW/YlP4w0iHglfTE+of6RgKQiipOxYDxbpnfjRZcW5P/LoC6gLuDz8j7U5Ki2cPGQm+y2R9wlas1QXVa0vmNIqWthFehrmCatAj4FVVc+UhldqvORY5B77yruwAcBM1FeT2mNpAaohoHreuHt061EAIpfPKBJWz/vMLfZyUDoMBD66Dank+xRRTiWqTwlh9rNA0SzW1NBBdmRHHUJORIgLZfAs58KwOWxi8nPy91e0Uft+u/hYt4WQSUdtlQbD9bdVvHbBC2l/WDN/UOdTzFiIHyhwGleXum/qFfaOGztVpGF080FqLB1c9UJ5BNGU+ygw0TI2aII3F21GzIPe1RXtab+9j277end4UbptO597wbd87pOz1wm33uVR3ac/8AcUUgslUyeF2x1dpFRi9NEibG2PjF3mMPLBpML3ESNLDIMoKZqlc1ga5htty14jTKR1g91+yki3DqmZDpm63cLPCrv+q/44yYI77M0A4OB/TUafzustGp47yeISjX7GssTmAZPglwaaKFi4SGCn
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(1076003)(356005)(8936002)(186003)(9786002)(83380400001)(426003)(36860700001)(2616005)(82310400005)(47076005)(336012)(54906003)(316002)(36756003)(70586007)(70206006)(6916009)(7636003)(5660300002)(2906002)(4326008)(8676002)(40460700003)(26005)(7696005)(44832011)(508600001)(6666004)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 14:04:59.5170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f8ff5d-8b6c-4c41-b2c8-08da4a210a7d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5565
Subject: [Buildroot] [PATCH v2 3/4] configs/zynqmp_kria_kv260_defconfig: add
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

This patch enables the zynqmp_kria_kv260_defconfig to auto-generate the
extlinux.conf file.

The board/zynqmp/kria/extlinux.conf and board/zynqmp/kria/post-build.sh have
been removed as they are no longer necessary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - no changes
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
