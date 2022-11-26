Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4511EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 10:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E19B94161A;
	Sat, 26 Nov 2022 10:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E19B94161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmQUW2RUZl3Q; Sat, 26 Nov 2022 10:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF3F4168E;
	Sat, 26 Nov 2022 10:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF3F4168E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F5691BF578
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 10:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17D34400A6
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 10:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17D34400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONNO3olBOEpc for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 10:54:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14EE14049B
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14EE14049B
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 10:54:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KAPGmWAofrq81P7Cpsj28KpT4aHM11KqXZ6sZX47bmJj7JfL+jJNdKAOhaCfz9Z1pQpdC+YairBUktItQ0+S5WuIpUFgf1vC7y+9zRzwJXTr/0qxg72Jyt+x39tNmUwmxIJmB94KQ+Uykg5O52g+sEKbqsBaYgKP1nowT+zq9vIF7PbicXAsD2axbFfOgCRULHHhUv+qoxIn4F0jb9Mm0aqtw+MhljxO2JeAOd/Fmcy1lRBPP78DwnERBXyHj7r+LlL68u/JgPR46aTaik2EGFTZxuGU1PgjQFMQHnC6QJFWCy/bskYv4Oom9FyL7gcDPp/yzuf+00k/YPsz+CYw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TVTbwAL/K07XOX1AikcWXuJFLhlf9wJNpGWPDB4Otc=;
 b=N1usvSY4FwklL+nKpxSRkn2+ryZKTd/7Xny2CPdyuQT2goW3J0bKwdOyyQxhp5V2BxSd2fhq65lfO8sXezJO1lH2NCZP1S6/2Aj26LMVQJkH8P9dfs7gQuFGgmB/VsguHsKlV6Rhj/17PmLEyAALAoNUKgbKSw4DjbEEa6wLpydTkch2zeXOZe6MkhjuEmeXocoTstW5mENchiGtEcK4etQ5SSfI1nMQH68u6L7YfRf8357U2crXSSQbTTKFhsZGNptnhKydwOkPKYit6MkOFuM8OjDDxeFQKywfRHFthw1Ioy+b9Eb6lDErQpPWsaTqK/I90MKMIKDqT8PGQREe/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0175.namprd04.prod.outlook.com (2603:10b6:303:85::30)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Sat, 26 Nov
 2022 10:53:58 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::3a) by MW4PR04CA0175.outlook.office365.com
 (2603:10b6:303:85::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21 via Frontend
 Transport; Sat, 26 Nov 2022 10:53:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.19 via Frontend Transport; Sat, 26 Nov 2022 10:53:57 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 26 Nov
 2022 04:53:56 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sat, 26 Nov
 2022 02:53:56 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sat, 26 Nov 2022 04:53:55 -0600
To: <buildroot@buildroot.org>
Date: Sat, 26 Nov 2022 03:53:49 -0700
Message-ID: <20221126105350.14687-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221126105350.14687-1-neal.frager@amd.com>
References: <20221126105350.14687-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 96420260-e43e-4a3b-ab20-08dacf9c84c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yb7E2uOPBr2bwOnvzmbGFF91/Nc7/hLjKgGnr3wPm3JinPuScruRcbqygjYRTDsEchbZ5A1Jdc6qgF6oO8TIgcst2O/LPm8abbYfTqj8mP6sZuop4Eclr7DZKKO/39KNogpPNJi46DYAGpsgiELTwDNr5hcvNXV+mZzCG6c95Yx+l9Pl9jRgIyJaBivgmMJmjPttR1DlQob/EYHwzY/EE/Ds5DWXp69VLXfHq/TxX7yefW4Jhbb5nPuB8hxpG+/9jaiYv+y44coIZts9vYA8tfLayH1Ke8znLt2z7UtZeDvAkxYFk3nLbmrLsKEMwihyldL/XaRjcB0yL2EALycqNSr0Ja5rbC0Y1XgfgyNxlrS5KpVDBV26mUIJ3PYEhmAFHoqUWgGY0N1JvG9DaLYKeiwgmzWj3BDWF0h8c/sNAvaGLY3GESTkjj2KgvOs5BTNNmiJOkgz3bXY8f8Av5gP3+KI77uxyWSPh1z9wssChYQ3cg4hoUmaMpdGUF90Kp7BYN6REVAxfbbtnaM3hKNbypZsKxES9DboZNICkRNQFKdEuL5YZ6CDdSt+DYGsyiNq7JziSTfrzIrLoUQb9Jdf+8hTDdeySvS2B526JPGXugVPGXUwAFkr4an9+j2wiLOFpJgPZgTMoRa+NUV/BIi9rzMHMDxpAP5nm3/vwcEsx1phPwdju5j5LQQgtBMBITxtbRK0YOujD4ZGUfOB4ZAj3dT1qDnaopjSLD8D2kfzQ9Zq15tCPIAdYFjjImIEedVl+NxthDZ/cw4RU8Vz/zGG7q1mXmGMM3fKNZSOjB6bthXdN9Gw3kD0NRnzSMhnRMbs
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(54906003)(6916009)(8676002)(4326008)(8936002)(41300700001)(5660300002)(36756003)(316002)(70586007)(70206006)(36860700001)(47076005)(426003)(83380400001)(40480700001)(81166007)(82740400003)(82310400005)(6666004)(478600001)(40460700003)(86362001)(26005)(2616005)(336012)(186003)(1076003)(2906002)(356005)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2022 10:53:57.4178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96420260-e43e-4a3b-ab20-08dacf9c84c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TVTbwAL/K07XOX1AikcWXuJFLhlf9wJNpGWPDB4Otc=;
 b=xxyrq9/8Ep0STUIy8Gl1ocsopwqtFSdZCtw16/kYXsCoIZrk40tj0uG4j6spCle16FTHvBNhWuhtDT1QGuqeeVjWegdPsQw/MDVvn9i7xLMgCSZx8HfM2dcTVjclx5dEzVS4rJeygGKKM7+fwLlU5CT9KTUoEYu6MF8AHHapADU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xxyrq9/8
Subject: [Buildroot] [PATCH v1 2/3] configs/zynqmp_zcu106_defconfig: bump to
 Xilinx 2022.2
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
Cc: michal.simek@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynqmp_zcu106_defconfig to Xilinx release 2022.2.

Xilinx 2022.2 includes:
- U-Boot 2022.01 bug fixes
- Linux bump to Linux 5.15.36 with bug fixes
- TF-A 2.6 bug fixes
- PMUFW bug fixes

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynqmp_zcu106_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 4113a9025a..dcbc4319e8 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.1)/xlnx_rebase_v2.6_2022.1.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
@@ -29,7 +29,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
 BR2_TARGET_UBOOT_ZYNQMP=y
-BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/Xilinx/ubuntu-firmware/raw/v2022.1_22.04_1/xlnx-firmware/zcu106/zcu106_pmufw.elf"
+BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/nealfrager/buildroot-firmware/raw/v2022.2/zcu106/zcu106_pmufw.elf"
 BR2_TARGET_UBOOT_ZYNQMP_PM_CFG="board/zynqmp/zcu106/pm_cfg_obj.c"
 BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
