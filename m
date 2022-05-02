Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D5DC433FE
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 08:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73E164051F;
	Mon,  2 May 2022 08:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5AMQ_NUkp3L; Mon,  2 May 2022 08:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5AA540220;
	Mon,  2 May 2022 08:46:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 032D91BF3CE
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E629282CCA
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 08:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TJTYJRBvibei for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 08:46:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5290E82C3C
 for <buildroot@buildroot.org>; Mon,  2 May 2022 08:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8xOp0JUzgqAVddpvJUL5Jb788nvTbfQ3j4bDphBaTvNKiI4Sy0ejat2ICIAXJMpcIUUOMoQWyiLgI9L9M2nUw29lQojMAbgFA/vGMtl7B7bQ7bowzEs2TTpgDaP8CSDh3sxEsLPw7PMAJpfB+WT224LLLWBvm5IDlXgstwkDlkNNXhCU02eG+jryxds+9RYZNhQdae7iIsn9k1Lg+7YZVOz56ZQiCkV/nVhB11X0Z928pFHB7afNOgnjU6wPQBIaDmgwc0PQtWhgOndxn5dnCO5sF+tUZ60liqL0Ow0iWO4dSttQJCz4m+DygYT3xndKswDEKHq+0CCrOn470VTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9unguFVFGrsdAWQzJbZiByN0PqXIxTM4c7VEsLP6jU=;
 b=Ry72wkNBUE6H0wWuwc/ewxuqvI6TJG0XOnwC1/bVGaP1+kUpGPptOh74ADvA94ZODm52+JfMIi2a/j7NhsyicVdcAJF4wz6yz4cTjLj8FBxn7Z8pwhoPZsTcBzRfHJdnwbzqDRCvJUB+bmSZ+NBAFyqrMSCSksa+Y3ko1dbo8a3h4c5LlhF30ZM94EOQxstH46nXg/ZFI39ziX081Uy1GPYsrDQuZdDlB874i88XyYBKGRQ1j79x+lUhqmiQiEpQJgOuOLwHGovvOze5PGWkj5Ga07/lrCI/JN07XGQXfvxO/7RzQGV4AYmxrf/iLYLuHOztSKSOTQ+ebPIEVKNdKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9unguFVFGrsdAWQzJbZiByN0PqXIxTM4c7VEsLP6jU=;
 b=mzoQSqNH9jaPSiycBfu/xuJd6e3rFx5d2lc5sjfuQmeK9U8c5JZPIpKfPkSrRz9VWru37QVSrIynjF1bOs69+KMNzSh7jwEpDFeG4tvJbs1BE3JPdxKr0SJzDXnhe485hefRW22GIonpeX5oxp+uWLcGogheQSEz3NoQepFeIAw=
Received: from DS7PR03CA0002.namprd03.prod.outlook.com (2603:10b6:5:3b8::7) by
 SJ0PR02MB8846.namprd02.prod.outlook.com (2603:10b6:a03:3e2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Mon, 2 May 2022 08:46:15 +0000
Received: from DM3NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::5) by DS7PR03CA0002.outlook.office365.com
 (2603:10b6:5:3b8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Mon, 2 May 2022 08:46:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT056.mail.protection.outlook.com (10.13.4.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 08:46:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 2 May 2022 01:46:14 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 2 May 2022 01:46:14 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, ju.o@free.fr,
 arnout@mind.be, peter@korsgaard.com, neal.frager@amd.com
Received: from [172.25.185.186] (port=40742 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nlRh8-0001bv-Lq; Mon, 02 May 2022 01:46:14 -0700
To: <buildroot@buildroot.org>
Date: Mon, 2 May 2022 02:45:05 -0600
Message-ID: <20220502084506.4054715-4-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502084506.4054715-1-neal.frager@amd.com>
References: <20220502084506.4054715-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89d9a300-e285-44e2-cd6b-08da2c1837a9
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8846:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB884625BFAEB64AABB16D9BCDF0C19@SJ0PR02MB8846.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INZiLDv/3WvBGnfmrBeqod5Mnhxj6wupAL1c7L8Uldv9sRj9FM06UJvjF8Vgnxf2V8uBgJ1GisaLAzAo2cgLLleLeeisEQtPkJBfO3Lkk1zKpvWy5wGrBo3jrCx8+eGNAIXL0bffW321vxpE1T4eVWl6UTe6wDOepEEw//ftRtLCvHSeOYJzm4UyhJA7ujwclyRsg/+bAUI9vleMDvoAhnp2EybdOHKs+2NK5/mddCz6TOWkDr87sspO8hxSxCNdy9AvBtQL2NiAjfI9dy8O2Zs0W1CfiqD0Hynlt7ohak/GpY57w/PjU/0wt/YFqLUv0JVAPcQjKUoiC5OKBrwE+MpH88A0Pnec4d5S9br6JFFptviLHRcVdG51w53n5ks6Ep/gV59twdxJN8qzn2fOxISjc3Sbilf0Gn7Y+etVkd/dWJdLRC6ogf6XtUd5t8etCJmatXGVW2CJzeffS60mMYkvoasf3uh8ixRAS9JfU7YAkrAbn76MYkRfSSH61dviHluiZ2YJwqOwLw7vMhEPGJ5t6uEsvvtIeRZuif7AM4MqrtPxOCIe51Z4jAcpGzEI4VkBbaB09uFYi5TcpY9/fMDfKlb3Tj3+IGS8f+k0poiWAxDJPBSRh1G7EfhywJjQkIHH6NePy5qYMfZDY77VXkD7qlKnlT23emFzJ4v19ayGdWSxuR/jM3O5PSmj2DozfdMBMfPWvczzxs3Bdk2VareSmu0oLFan+KPGz2hjZgI=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(6666004)(26005)(82310400005)(356005)(6916009)(7636003)(2906002)(8936002)(336012)(9786002)(44832011)(4326008)(86362001)(36756003)(1076003)(508600001)(5660300002)(47076005)(2616005)(70586007)(70206006)(54906003)(316002)(83380400001)(40460700003)(35950700001)(8676002)(102446001)(41080700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 08:46:15.0277 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d9a300-e285-44e2-cd6b-08da2c1837a9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8846
Subject: [Buildroot] [PATCH v1 4/4] configs/zynq_qmtech_defconfig: bump to
 ext4 and distro boot
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
Cc: ju.o@free.fr, Neal Frager <neal.frager@amd.com>, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch includes the following updates for configs/zynq_qmtech_defconfig:
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support
  - enables support for host machines without OpenSSL required by U-Boot and Linux

This patch is necessary to support the new board/zynq/post-image.sh.
This patch has been build tested only.
This patch is dependent on the configs/zynq_zc706_defconfig patch.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_qmtech_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_qmtech_defconfig b/configs/zynq_qmtech_defconfig
index 4db3f68b1f..f536b80f57 100644
--- a/configs/zynq_qmtech_defconfig
+++ b/configs/zynq_qmtech_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
@@ -14,9 +15,9 @@ BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-qmtech"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
