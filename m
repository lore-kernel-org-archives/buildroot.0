Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CA4CDB482
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 11:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B990D824D4;
	Wed, 18 Oct 2023 11:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B990D824D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fnFk4ZhKf-8v; Wed, 18 Oct 2023 11:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9243824CB;
	Wed, 18 Oct 2023 11:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9243824CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3401BF865
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F72C42078
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 11:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F72C42078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0yr_OMKKs_Un for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 11:14:11 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::607])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F40DE42077
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 11:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F40DE42077
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb2VSPNwH0SUte2kU0VPaC2/wHJKvoqyoVmku+Z1Gs3vbW3g9aEhG+fkGLEq3uVbEmpsb6Bk12OfKkNv0k5oIZaE+skIZq1eR+cMKRUZmBo6Ths1LPA/0hYlVrNs0PiOSTcnZdNGslVf6QvV2PJv8zF5Cr/eNY9qGUVfIeOzzT0IvtZewLnOisFZA7D/lGhPpDeyLEE/8HEMUO9s8ej5+FfsEK4//KKzTuqbGKpHoDPDnIJ1dClAJNP1TZHvl9RdAS7ZzeZms3ebDuj7L1jSwjLM5/dsrQgPhxby88MoJrwTwTVD7qdjLImyQA8zC4cBS4TE4Msc9hdYNNNaIxy8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1mYZSIm68RG0prA+7RhlC6zvQ/pqZHf43x28ZpCbkQ=;
 b=Td41S8DYeAgMnd9fI6VrjzKu2Ue1kPuL1+eElKUkkB3wsysE2ImYYDkcqZnfJM++aEM63TOkwx02934g0l/OUhJije6/rkintJ6k/ieevVe8Xwn1abhBF0mez1LifoKFeyn8KeCvUo11xdYnaAh+ydIbory0K5SLSqzrtWyiEkAtJmGIWxLVPU8kg/tRY/CoIZOZjVsFgSfInaCdqwyeTfh5mL27/w9jjZLVAh32QRYLkdLNYRaI+pDs2p9rfYF2Zac6ODRQW6UAcU5I04Op9zAi6Oy0FUEzftc43QusIIFsgWP6FooJpSORDVY1BahwTE/IQGhjqV4G7qXtacwQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SN7PR04CA0157.namprd04.prod.outlook.com (2603:10b6:806:125::12)
 by DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 11:14:08 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:125:cafe::a5) by SN7PR04CA0157.outlook.office365.com
 (2603:10b6:806:125::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23 via Frontend
 Transport; Wed, 18 Oct 2023 11:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 11:14:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 06:14:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 06:14:06 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 06:14:05 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 12:13:57 +0100
Message-ID: <20231018111357.2898095-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|DM4PR12MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: b50b005b-58c3-44f1-6122-08dbcfcb5864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5sCTQIkADZjeAs42aBuPqXx/TAZF0VusgldZuKuJ9pgmcAx45OkOajEP3XImtvamcj5EUqX1lvr9pYs4iQkhYrZ1LKMbU6tIecW98oL5FQe+e+UGJ0/O9pXlc5oe+0hmwbQMxzDBa6SMzVvgEOStwqQ+/CfBhtIYJ0Cwx6r9Ycjw1F5/vXMkBwow+5TY2Wb9hLicLpd+si70jGN2ewFQtuWLpMfpKl4jtcASnNcz0+U9+3irZ1QwsaCRcfE/FkwQ0S/QjXucopOxN9y+J3tP760hUXfUjyLt0Zs5IfhlEnlJepRI8Fg+JO2qTrDngX+5pqME4v5nvZdmiQlsFmAUOkv27fgH4hV7hlpkdfbWZoYkjPBv114jxeqTTZCMtENNEFylLgxe9LWlp0nAjYMOOH+e1RHyb0DZM8jZ37FIkBrINTmQDe8scaAZsVoGnAn2+f+AD9t0HMtiH+QUf2CxiJ38dX0t+TJPpBXEsk4wgnW5rjMiWsqEUY9jqVwPKR7nhbmIfX94MpWdb2S6lyTR1/xMLP/ac4Uw2X0AfBofykiv+0sIsjN6oQl+RfcaPXkCkqHSfQKwj1X+G0Gewmh1bqsW4PsrWIlX6jfFAIcE1tft2twi13QituOajxkw4b++QEuwdNkG4vhW5ZKS3niUHxxBczZHuSOi41ZiDkHa2ZbBZzMw3LCq44sns4JuRTuYoB8M5ukgExDnzdzfFierkus6uDz64K//6JjEoAANTK4Jr1SzYKIdQs3FIl9KKZ4Dq/ZULMxQZ5c+4BwXRPmyag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(47076005)(336012)(40480700001)(36756003)(426003)(82740400003)(356005)(1076003)(81166007)(26005)(2616005)(83380400001)(8936002)(8676002)(4326008)(966005)(5660300002)(478600001)(70206006)(70586007)(6916009)(54906003)(316002)(41300700001)(6666004)(2906002)(86362001)(44832011)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:14:07.0716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b50b005b-58c3-44f1-6122-08dbcfcb5864
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5168
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1mYZSIm68RG0prA+7RhlC6zvQ/pqZHf43x28ZpCbkQ=;
 b=19hxPJsEuBHWUAly+zX8X/qtZyBf7V/Bm6jXh1043K1D5GtoUqsM0COFO1O+789H0TO5MAcRe5AI/cx9JVTMVIQeFTTrbfP7y1f9Xw6h51yApXf3gGYknWSfWdJk0+S1UI8Ct7VmKhvFqBaUNAjUOA+jUtJhwIyciE3M2s0iNqI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=19hxPJsE
Subject: [Buildroot] [PATCH v2 1/1] configs/zynq_zc702_defconfig: new
 defconfig
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for Xilinx Zynq ZC702 starter kit.

ZC702 features can be found here:
https://www.xilinx.com/products/boards-and-kits/ek-z7-zc702-g.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - corrected commit message to zynq_zc702_defconfig
---
 DEVELOPERS                   |  1 +
 configs/zynq_zc702_defconfig | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 configs/zynq_zc702_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 57015e245e..e4729010fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2193,6 +2193,7 @@ F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
 F:	configs/versal_vck190_defconfig
+F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
new file mode 100644
index 0000000000..e85285a832
--- /dev/null
+++ b/configs/zynq_zc702_defconfig
@@ -0,0 +1,33 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc702"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zc702"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
