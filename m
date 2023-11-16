Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643BAC54FB9
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 12:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6DBB41490;
	Thu, 16 Nov 2023 12:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6DBB41490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uGGcgqXg-gzN; Thu, 16 Nov 2023 12:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0FCE40CBE;
	Thu, 16 Nov 2023 12:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0FCE40CBE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BA2B1BF5A5
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 12:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C04540B67
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 12:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C04540B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCZ63zucsPZr for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 12:37:01 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD3E940A5C
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 12:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD3E940A5C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip0Dzi/69BuPSK8E62P4sMbw4UlAIl7uGy26kgTkBEgQXRcOGLVaXyuJnzJEnRlKC+CLoqI8nUp1RSmSNdbEJQUDrCNW95tyyjKa24MfPaGCeGx+cSV35Zq4XguNfQvJsFKa5h/Wrn+wkxXWmRKyAPcZZsSxwDGePPoeHRg0LhsWv4HFo1kv7blqobde6r9fndewqxtN9xVWnJqdzMrI65FoEIFqxHTMg/ZuAgg/XTVptgQCkivhH/RKAVyKC5lGVOwcx0ycOoOU/bSwKS/bjMHc5KdN62v0OyrxgKyS/dg+WQ6qS7dKbWrrDceHd/O4s5clQjkw/4OWJFnkW1RP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYh4PcAWSW+FhpCSAxWVHXuE33jz3CWprvvDLpBq+tk=;
 b=A47ZMgdyOqCJ4OWMb3W0r3a+r8eNm3+wkXsnj7DL1/lRz673gbuReCed5s7/NEPyVRn4IpTTs+Qq7WGSTUpXlMVqt92iLkKhp75544V3u8YgXWvDed6S9x4M/HcLA3SBHg3cKhFN++aRZ5A9okYKwtsd6Pc7q56gI3fQA2U3f/VAp7CSVxAkKXigkt7XOLsWlux4Yp8rlzgmx1n6byhOVexWHbAAyklKjR7R9Oe1JUQ4547h8G8qkmSXhJ1/7AJrxfLt/6IogMdrsrTwNRha+/KFw/HJRf7wXw+tt239Dg/0HzJBJKTcYFnvZ91FEjr/aec93dEIPWecUBGA8bluCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from MN2PR17CA0034.namprd17.prod.outlook.com (2603:10b6:208:15e::47)
 by BY5PR12MB5000.namprd12.prod.outlook.com (2603:10b6:a03:1d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 12:36:58 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:15e:cafe::ce) by MN2PR17CA0034.outlook.office365.com
 (2603:10b6:208:15e::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 12:36:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 12:36:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 06:36:56 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 06:36:56 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 16 Nov 2023 06:36:55 -0600
To: <buildroot@buildroot.org>
Date: Thu, 16 Nov 2023 12:36:51 +0000
Message-ID: <20231116123651.3461604-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|BY5PR12MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d5d507c-7284-4ef5-a16e-08dbe6a0b896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6YcbN9ePR7seAI9YYv5vLbP8ArSXma66dQm7mZ+gj7DIgIY2SLhwMnKId+ToMwa+vkd5l14GmT3CvpbF8Ql+fBbP8sXmdKZf1A2cLUfYDJQrE35DmycNmX9Gtc6EbM+NRA14eKMzibG/yo3610Uin9o+m1wBFZkf0f3CFpAVMXDDmjmIi9U7JbAhbZTLvB3N5gw+i+x20oZQ9oDP6ghsw3pyuYPtJAWWDQjdCla/IGaiVRNK0JcV0wDNrhM7YnJuU6KLv/L2QcOYdboEIYgSwEzpz4VLksRAyvyfsAupuZAI3/WRkYwtP7atPeq5dmQL+hEe8qUqrOMlPDtKxQpHZcNG53VpPLs/JXgZlTiVMgGr42XUgI5kYh51PB9IcMgn2Jl3DOiIPrTw5tsICD9rEEtked46XatMpgaSwv9D4sq+sdQJEHhBHfPuoLVIE1070+uyoW6BfX4QTXf0SSS3igglomdmPlowf5zYEDWqCRPwEkHJm3Muxj8Bklg0iEFK6en4m5fypgmicGfSWEKX7/zQO0iTw0Zu8P5SOfLmnFFfw63SXuTOELJuSH3KKfU74RQRnYGK8F4JN5KMyyKCgfcZ3Rf4UIng5bT354P/MJU55UZIgnmj9esAEyJI1Ajb/nHC1LIsceg83cSCgbBidRUT3IhewxRocFp7aK+1+sw+8gtDC9PjZ2Tx2/On31KtmrauJokz2t+01h1wiobTI6hlaW7mP3iJy2kwBnQlBw0zFYh0etHx/MHsIQKK5HsVTV+A9uwez3ia6besyf37gQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(46966006)(40470700004)(36840700001)(426003)(336012)(70586007)(70206006)(54906003)(2616005)(1076003)(26005)(6916009)(316002)(478600001)(36756003)(40460700003)(6666004)(86362001)(36860700001)(5660300002)(47076005)(82740400003)(81166007)(356005)(2906002)(41300700001)(83380400001)(40480700001)(8936002)(44832011)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 12:36:56.8623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5d507c-7284-4ef5-a16e-08dbe6a0b896
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYh4PcAWSW+FhpCSAxWVHXuE33jz3CWprvvDLpBq+tk=;
 b=wu02P7Y1y2nXii29663s+WSg9aZA9vw2oXxeMuZLhjtBWSvBCBfnexWUxexkNErdO7RJ18hrcT5BCtHqhE/ayo1z1hulCxQqpHxosP0vK+m/CLBgajKAnmcFPRlR3lpH/R2enPZj+Izvd2Ul5Jc5d0fMtpb5Ia7xezbtDEJxWsQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wu02P7Y1
Subject: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig: bump to
 xilinx-v2023.2
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

This patch bumps the versal_vck190_defconfig to xilinx-v2023.2 which includes
the following updates:

- Linux v6.1.30 with additional bug fixes
- U-Boot v2023.01 with additional bug fixes
- ATF v2.8 with additional bug fixes
- PLM xilinx_v2023.2
- PSMFW xilinx_v2023.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/versal_vck190_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index e30bb35b74..8561b6641a 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.2"
 BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
