Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18BEC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 15:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DCAC4176E;
	Tue,  3 May 2022 15:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iiIQLg0T5BHq; Tue,  3 May 2022 15:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0AA4175D;
	Tue,  3 May 2022 15:25:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12EB41BF342
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 15:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01097401F8
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 15:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mill-rG301RI for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 15:25:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2847C40155
 for <buildroot@buildroot.org>; Tue,  3 May 2022 15:25:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TM5WxL3hTsPgbb9EzeR7vdudr0kPG0kRm0hsKQMwmSVyLJwegb0FSnxo5CD+ijWKn9Uv3qAi/4PCw5QW9GzjYgJ+DhJhZ5/N7nEVDdMHNdee1Vt+3MfpoAltqQTII2GsL0pCfYYxtVj8Bz4I1IIpvrc/wx9Yk7P0dxwVZTuxwZZDL6KJ0vQARxTEDSCK6EfCSzPjJz9+RMYmQQIs/Q0IC32D7DQoRP1DnTlkhWMhUAlUGr0AkvCD+Yem7VQCcc2I8QMtCaQ+nZeoQAGA9CuVvjXYGbzg/YKKLwaT8nCFKvIRioaCCZbgzJg8lpeyZTGZbaavsyTfhMeQruMZEOHfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uRpHSzK3/7vYZM37nxusAx+8VuV+dTsqPMY7tiUOf4=;
 b=TJnrHSijygyHCx01FQo3QmWqDTUeSLI6/2hw/OH1DZ0dRwlesA6IGT/gGW6lW1SM+mY7tCYX2TKN/hq5Dq4vWZvXkJNJBIJYiiw4lyke3jDNz5kQzRwv4M17VAiQu4ysitHbYDq51tLp0g5xr+HVYaCXFM2epHeAceU5A+to4NKCMj5S7WKoPEAUajDWDE7CvLSsEVxG+4OX811DWbhVqcQhNPBbWqliaQCfv6XVDQ9yWhbp0ClijvUqfDBo340tle2NpgbD5GWtte8WyAGOPGFX6uHAS4joEQbw0sW/LyCRr9pDtpBQRueme4dRl3WGaMgINgKL6xs+Rx1IHvb3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.62.198) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uRpHSzK3/7vYZM37nxusAx+8VuV+dTsqPMY7tiUOf4=;
 b=U5sKhTbff6XVhDXWvXl6jmO9IwrxPLAnl8vdLL89zl5YtD5oz76yocc6ETbaIIGvqAC+hRGC/caxiD3QVwuYtKKHo11N0Wyz2YNA4Y8VNUKVSWxFguASLZv8vs0uQqAuP4d9ZpdwLIRGoaJGkANa0YKuOxhAGi5Ofp6WO+pfs6Q=
Received: from SN1PR12CA0051.namprd12.prod.outlook.com (2603:10b6:802:20::22)
 by DM8PR02MB8246.namprd02.prod.outlook.com (2603:10b6:8:1::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Tue, 3 May 2022 15:25:28 +0000
Received: from SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:20:cafe::a5) by SN1PR12CA0051.outlook.office365.com
 (2603:10b6:802:20::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Tue, 3 May 2022 15:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.62.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.62.198 as permitted sender)
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0016.mail.protection.outlook.com (10.97.4.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 15:25:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 08:25:17 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 08:25:17 -0700
Envelope-to: buildroot@buildroot.org, luca@lucaceresoli.net,
 giulio.benetti@benettiengineering.com, peter@korsgaard.com,
 neal.frager@amd.com
Received: from [172.25.185.186] (port=56758 helo=xcoapps69.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <neal.frager@amd.com>)
 id 1nluO4-00083x-Ch; Tue, 03 May 2022 08:24:28 -0700
To: <buildroot@buildroot.org>
Date: Tue, 3 May 2022 09:24:24 -0600
Message-ID: <20220503152425.1069617-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e58d9a0-7bb9-4bdd-b7c6-08da2d192628
X-MS-TrafficTypeDiagnostic: DM8PR02MB8246:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB824694FEEFF802A5E57D20E5F0C09@DM8PR02MB8246.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: riOn3eW4kdVvH0xHKqzZLaeRBX7gJhfSqqOz9nmDJpba3o+0wYyssEMO+TpbmkWCJVxl81e5S+D37cbk+FlF+LsSgvlUZRsQ985eiFyCkpP3M4wvNx/4n21bB/uziY9/B0+4MjFKKS0ECqnXHB9KJr0WzAY7IneBE96Rxtd9joLoQa9APGIB/5CeqLyiVa1zv5nRTRNFzmg8C7nCL6GkP8zdNVeJjF4xFlBfP23ztsELEXZ/ucQAXZ670nDlkZX0zYjMDBwM8ZoD7/R3fmtMGsN1CHH9bqLJ4m2F+/QJknCoj8Zhv9CIwNvK8q9C6EDGH7sQsDoBKf+viKcu3wDgHKxYyGN4J8nI4lxOB1DC8Ok4UljZnBFr8HYSqG27y24JGrWQCsfXVF/2I87ZWpnlgkTK+9efXTU6+K8EP8uPB6kYy5695OMmKBCNcga4eCCk10KQLBTqCe6RYHhgNMZEQp8qPojI4KVzfvSOmPzXhCp3mEnZ0H6TagRkrfELhSbbPU3xI4bOACnqCEPvWteSJwbjyeI2wCMlh44Dx4e9pFh8uNS2D21Ep92kbBbg7FgA3MaBmGYgUPFYTybZqXl6/7y0lFIEnB6wCltuPM/AXekFR4AeV4Cz1UK0i/9JPryNXGJqZcKlcTAXYct3OK8Yu+AD+FWVcsn8AjiasfHqYvgqqQkdn++N/ceN9/phoRVVXsNXK84BQQ6jXBmq7E1+7rN29BMe6DCWszxiKZSvlbwwpsrVfdWgmKTHJY7fEx/n+pt3tJxelcMkWGIgBw5S3eGEYFpY+nqj87KYEzRSWIl3sHxDEnhVkSixMqlYcgqDMOTUyWIg5XtJLv0RLz02VckcCA05oMIOmFx88Ck3eLE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(6666004)(44832011)(54906003)(26005)(8936002)(9786002)(5660300002)(6916009)(40460700003)(356005)(2906002)(508600001)(2616005)(316002)(7636003)(86362001)(36756003)(83380400001)(70206006)(70586007)(8676002)(336012)(1076003)(4326008)(47076005)(35950700001)(82310400005)(102446001)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:25:26.3200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e58d9a0-7bb9-4bdd-b7c6-08da2d192628
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8246
Subject: [Buildroot] [PATCH v1 1/2] configs/zynqmp_zcu102_defconfig:
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

This patch migrates configs/zynqmp_zcu102_defconfig to tarballs for TF-A, u-boot and Linux.
This patch has zero change in code running on the device.
The goal is to improve build speed and align with the zynq_xxx_defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 37df0977a7..cd33621e67 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
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
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
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
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu102/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
