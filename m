Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFCAC197A0
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 12:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BE0740BFE;
	Thu, 16 Nov 2023 12:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BE0740BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bexCa015Atu; Thu, 16 Nov 2023 12:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EA1D40C0F;
	Thu, 16 Nov 2023 12:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EA1D40C0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D47F1BF5A5
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 12:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D91142527
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 12:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D91142527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHrUKIYHytc4 for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 12:23:36 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FFBA42206
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 12:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FFBA42206
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFnFNG3z9mDeSCaYvFQcypwnDNeRaHMMCoP8AX7CY8l/FAXQQHdTjsqJSWcyB5WTGg65cujzjXG+2lvcXFB/7+BZKWgJ89em6rhuyQY+FU+UjjkdCQ2SIUyuMm/dgEwT+fCMx2XgNDqyMGK3AMSLWO5mAkROeexUUiJg7dWnDK3cqJFL7f5CkFnm0akgzzhuAcafJBmSO4tsWQbXwIywBgsokVMEJiif8RkOJYnIzeE12ja4RMiwyUo6D7zv6WYf7oJyDIzPurDGzCyIlXDxjMweIkp8nVx24ACa1FeE/3zG0hh3EET5R/TifZHxERdULHlap1aRFi9QypmuM6KBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skyisKBleOT/1d+GLCkGVrSQPZMhWCSOOEqQfT5fiB0=;
 b=LbUAIW76Di3DQ3y8Fs7xOw4zkdsuDIkzN7oFrSaR+hshV53XOGWZ88exMyBmny1PPHbZNm6G/ikp9pcesEGmPeDpNDDS2bWpeQduE+LDvtFHF216HEAAgpEE/Yo4jJSqWnDGKnfAENLV7S2RVEBg13aKKaSrqwRDcXR9hVo+uSHiB1Cq83n9e8rLWLeBjRbt6SoVNnMVmAbE04fr0hoB52hFWXgLgbiGOh9k7kK+TCiM2kiOiQxOopKRAtzKLjrqxMT+Ln9GkOarehWzSkNjKrD/NQ4o/ec0kRCaJf2enTmpwpc53x1Qv6lF2xVaIcjU8pkaPbf9xHzkkC6LgFH+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CH0PR03CA0352.namprd03.prod.outlook.com (2603:10b6:610:11a::21)
 by MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 12:23:32 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::52) by CH0PR03CA0352.outlook.office365.com
 (2603:10b6:610:11a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20 via Frontend
 Transport; Thu, 16 Nov 2023 12:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 12:23:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 16 Nov
 2023 06:23:30 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 16 Nov 2023 06:23:29 -0600
To: <buildroot@buildroot.org>
Date: Thu, 16 Nov 2023 12:23:22 +0000
Message-ID: <20231116122324.3457681-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|MN2PR12MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: ebdea5ff-7e46-46c2-a2b0-08dbe69ed8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BA1gBdVIAFwxo3n5xLAnWAtK4RDJLr2SVQo5YMXEI+kA6nfBJyUIQZiBGGvnPStT4ka0Zce4oXeTHwfTD5ChL+sj6fSuc2BWSioHkaos8Qgdxg65bYcHR6onEL6TaNWdQXsrgybNJHscbekwQ7v1LdewoAvKgAayS6INsNCIPhfKlWt6T16pCzX1FchO0M2cmQKCliSicx9D3xKvnIT5wuUm5xSZw0e8DAkljTt7yeEKigKZ3g6+CychRYRQu/gE8XQZg5XlaQdxWBKjrivNjST5ePk+v7xjhXVaak2gnfBuOQkLMYfMRhR4knsTlc16EBE0EDjeZnhqIzogh7XkTnhbX9Z8f5BJ8yQHEt2ivljQko4qVEmPZLW5JvCEP2VosHT5RxFZjk2LHxeNc+2R7QxP/ZXDJhMdMAN2WuhzM3NngWvGJeYX8sKiIDNduJ6ESncFxYLetKNe6bNcyaUVpNJomq2vc+jDgz36iBBKogr7Lp+0lHpcSA97M4oSKoEbQnHwoxJQpjT75kO3yYdqBRR0Qu4h2NyIVq5W2r7JiZaJHeMfWJiJgbBNy1YAlAimYJkKfaLo8Wmw+v7xerrnOfHK6gRHiLd3crbEku6DJvx3dkdi8qI2OZBAx0+RdXOw0QNi8Unka4eDDJKnynT5K6/k9eL5r8sCeogzVmSxwZcdM0iO3+U5wp3jlHeTplzRPOdz2YqKJiy4OxN4QFVTKM/nTtN9T+YVHPhuq8EV9O3/fEX61+SE38hepi7txhX3wKaxvSqIoAIKHjJmi7W2r2IgP7pRnc4EsPh1Z8hbgOg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(47076005)(356005)(36756003)(81166007)(86362001)(83380400001)(2616005)(44832011)(336012)(426003)(5660300002)(82740400003)(1076003)(40480700001)(26005)(6666004)(41300700001)(40460700003)(478600001)(8936002)(4326008)(8676002)(6916009)(54906003)(316002)(70206006)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 12:23:31.6402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdea5ff-7e46-46c2-a2b0-08dbe69ed8aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skyisKBleOT/1d+GLCkGVrSQPZMhWCSOOEqQfT5fiB0=;
 b=zmOkrMjNsFlZnkVIfOKDfmxF2CGleBm4kW419gTvPYIc+dBrCmDvBWFvMaClijdPXMtsOLIunyPnU00UifnH/2ujpEuAYyiWcP/iINf1G5siG5hA000CTQiDUA0FxQHO0d+8bLTAvv/HLOv0RYls7krGlcGZXQxRVaH8jIHVfrQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zmOkrMjN
Subject: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig: bump to
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

This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2023.2 which includes
the following updates:

- Linux v6.1.30 with additional bug fixes
- U-Boot v2023.01 with additional bug fixes
- ATF v2.8 with additional bug fixes
- PMUFW xilinx_v2023.2

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu102_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 18230cf89b..c920093d8d 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.2)/xlnx_rebase_v2.8_2023.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
@@ -30,7 +30,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/zcu102-zynqmp/pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.2/zcu102-zynqmp/pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu102/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
