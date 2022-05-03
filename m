Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DA3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 15:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283854175B;
	Tue,  3 May 2022 15:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwNxDh74GDV6; Tue,  3 May 2022 15:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB914171C;
	Tue,  3 May 2022 15:25:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAE2F1BF342
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 15:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA30E830B8
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 15:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUQdgOr-n7qH for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 15:25:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB3E083027
 for <buildroot@buildroot.org>; Tue,  3 May 2022 15:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlnSVXUfcFysoMzOVxh7y5bgHfOu8i9/rUcVWxFotTrVnSinoYvROZBKXzcYjskJvrHp6rdqNiDajd5JLanuL+RtaS6RJiaTej3aib9jc3odTXxCBTq0lGFAtbR9B+OuqKZaKNhrTPpKn22HGalLSgkLDvLkA1C/OD7VvZy23IMjJEjG20F3+7VZTzjQ/e3nkIotBwgFm2/NVXNTsucIm+w17b0pOJyvKezXrW/+MBBVGGvuLyWplLvp5qtoVuKrGNCRcsLP0kGtNOe95iAd6I9ydn8sAEPZei12Cfkl9rmRqVQTOG97XDYJder89qjl0D/Ya4RdPK4V5WrnaEKg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0YXt0fmEmT+QXIB6JWLTugd6CeBwSf0R5OQOcvTxMI=;
 b=R1v86PW66vfijmhRTCDzHZT0xi70TELz3+yaKZwZYSZ+1zK/zs65QGzZ9ObAZUqmAtnrwFNLZs0u3EVpvLObcp2apv0VvDa4ktlCZygIvoMhvxicuhnJn0Kn+VxRhpx1oslyhiu7dwRb4OrtLbL4DH2pxQKnPmR5ferujHj9kZlYut3wTLZq4PMujz670iOgMqIiz0x+h/W2OuwqAkxKOamgSKmx+iunNso+WvhwLoJHPqi0lLnryMsyvH+iMofUGpxAPONmStPIgHID2f7yYy1DsvM0B2wTE7CnjWBjQQBqxFC2nWQHwsYTngvbKq+lUN4NmWXGm46PVK1BKtjU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0YXt0fmEmT+QXIB6JWLTugd6CeBwSf0R5OQOcvTxMI=;
 b=OtCSimR0cy8FPcOoMqyemv4TFjQhTzWfcxzU/qJAgtr9qrE7dnykX5YogW0WZiBZRglectxy3QWQo+Y43R37ouXoeMveUhswd4c+EvKrDdmu8yWxy5HFdh5pxE8+FLK3YkEG6I+PPzJblSiV/uPWvyzTSOPtyxsI/SlBT9guYbM=
Received: from BN9PR03CA0475.namprd03.prod.outlook.com (2603:10b6:408:139::30)
 by MN2PR02MB6701.namprd02.prod.outlook.com (2603:10b6:208:1d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 15:25:21 +0000
Received: from BN1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::17) by BN9PR03CA0475.outlook.office365.com
 (2603:10b6:408:139::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Tue, 3 May 2022 15:25:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT022.mail.protection.outlook.com (10.13.2.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 15:25:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 08:25:18 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 08:25:18 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 neal.frager@amd.com
Received: from [172.25.185.186] (port=56758 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nluO7-00083x-1t; Tue, 03 May 2022 08:24:31 -0700
To: <buildroot@buildroot.org>
Date: Tue, 3 May 2022 09:24:25 -0600
Message-ID: <20220503152425.1069617-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503152425.1069617-1-neal.frager@amd.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeebc425-a4bb-486d-e0f4-08da2d1922ff
X-MS-TrafficTypeDiagnostic: MN2PR02MB6701:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB6701B0E2EB6639B9B7DEB9CEF0C09@MN2PR02MB6701.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MryCco+jyUvkOHuQm+xf4C0ABk4ugmRUKg//Rc55pzApfnJAWb28M7VlJ099b2eD1way1VEf8xr++j/Fqc5D8W+YkJDTlfnHdId2lnXtSVf5VSDkiZuEBPuS6ydOuiuF4SQ0FAQucKaVHmLXfLdgO9OxO2AYGfoowNkK2UUnkmC/gZUO1TEpnteXoGQkL1cNBjsyPezxiw9a+OrCB9b0j/e+8h4rTIZ7HMaSzimpitB+pcUIqYNzqCm9xwq4M46q8UZo6oQs+F6a7PI9Jxt6NGIijoVz3ig7ca/YGpueeVdrAX8F8IcuyPlzQpwNC+pFhdXXB6ZZEYP25ihGU4TqlUzrfi2TaV4X8mhs0+yapvj4a37AXSwUp+yxFMB5w/6cMUy1rTqVzCIFJgDvPIgScaDbEm8FG3YxsMbtkcXjmiuvhU5UCAgPoovZOuHIpVrcdqkTcXfdghAWTVw5Me1fJhSnYus5CA+hW7ueopUvmcen1KLpbMXGlpTH0jPdbwSIX0b93NlKMXyIwjCrQp2Ksvwd2lg2sUz5X4rcmalnoj+aS9ltkK6/3imsiT66d8CY2Wj9B+Sm8GmnmVnGhURiaAyg2gFza/5Hw4U4I8xo46Y9at8viDR//mCaV+CHXU21HffRWFq1Zhr3G7uyzBphWzZ2v6rpPRKRnhSvIGTDKxbLhrTpnMT0mUzqzUu/69qSrqCeqH1570Pqy23EsU5vDwAx2YWWWMq5vO2uCOlvnmzUT5xMOyFPhveDUs7EO4/gIU/DMiscWUSO3r9tXpAFs4aAQpzxZV0gXLssNELA4uV0agAHRIfaaxE+O9OnqZejbY+NjtX+7fq3KdDQ6yDr5uXiwuN5JzhxOZlZLuHc0wM=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(2906002)(8936002)(40460700003)(35950700001)(82310400005)(9786002)(5660300002)(83380400001)(316002)(8676002)(70586007)(4326008)(6916009)(70206006)(47076005)(336012)(44832011)(2616005)(1076003)(7636003)(26005)(356005)(6666004)(508600001)(54906003)(36756003)(86362001)(102446001)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:25:20.9567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeebc425-a4bb-486d-e0f4-08da2d1922ff
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6701
Subject: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch migrates configs/zynqmp_zcu106_defconfig to tarballs for TF-A, u-boot and Linux.
This patch has zero change in code running on the device.
The goal is to improve build speed and align with the zynq_xxx_defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index c8b507f0db..96b15eea81 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -3,9 +3,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynqmp/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.15_LTS_2022.1"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
@@ -14,16 +13,14 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.6_2022.1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.1)/xlnx_rebase_v2.6_2022.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2022.01_2022.1"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu106/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
