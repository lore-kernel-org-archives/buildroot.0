Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C63CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 09:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFBB0612B2;
	Wed, 18 Oct 2023 09:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFBB0612B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wMKO_vz6jSQ; Wed, 18 Oct 2023 09:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19373610AF;
	Wed, 18 Oct 2023 09:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19373610AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D02411BF5F6
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6CBA40439
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6CBA40439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f16I72YhcAsR for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 09:10:19 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::615])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78D62402E6
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 09:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78D62402E6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlzfyaTA+YF/aLaFBcRXKepyG+HWVJH7GADcJRr9Mbb5Geas3eba7i2FeTaV/6IURvGDY+hymdg+XJQGyru2lHdhzbt475rrCX12BGbtbNgSHEIX0KiIJotG9x3pUiS9Dgqlmkx3STPxBQW28ubwxnZj/nVZVVL8w8rHeYZzhJTln5Rhd+OFTvFHXEo4g97esAvabIju6YkLauVBLePL5uUnkKUU/+VhlcdzjZ1LxBNVx+7p5H4L5BKyGEDyUbvuWTGz5Vbj/AnQHxQnzfKrq6sDP2q8yUMtF9xF65ocFxTdkXUoGnxCXlhJO74FDZ2uNIp3MMGbxoqhpd6z5X8RDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEJsw0Xsg0mvpOF3Fcee5OdXN1XMaYKNQIDRe6xBhUU=;
 b=GZvx1tpjXtWVUm8OLgA51s1QNgK4L1yixxLSiD9wbIT8R3wp0OJAyBoYss3yhHTpOJVsQ9h7V6SQy7FYdKxfsE7hgxzH+l/2vxXdzVhngh/w1U1EvTbkUwegsI1/EfbjJWj/Pb3ZOQLoFyDmvzpMtGkjQreTVjz3+CWV0BRP3SHnn0Mpsko2eo5Q+Pu2qiIhe9EnniDcJuFxdgZ30rRUpBwC18GJ3B0y2ZvuTU0wG+b06g8advf29wsFU9/UPUn4PAe/QyvNus9upzwIGI536nR1azc/u9OgS4Y9aOVV5viFj62FpgvNUMKCwsULlXRDLzTSQsyMuGXEVmAUiUjXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0216.namprd03.prod.outlook.com (2603:10b6:303:b9::11)
 by CY8PR12MB7098.namprd12.prod.outlook.com (2603:10b6:930:62::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 09:10:16 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:b9:cafe::60) by MW4PR03CA0216.outlook.office365.com
 (2603:10b6:303:b9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 09:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.23 via Frontend Transport; Wed, 18 Oct 2023 09:10:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 04:10:14 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 04:10:13 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 10:10:02 +0100
Message-ID: <20231018091002.2162735-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018091002.2162735-1-neal.frager@amd.com>
References: <20231018091002.2162735-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|CY8PR12MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 4781cfa8-9cfb-4337-4e39-08dbcfba0b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9U+HVx5dCiZmJKtvsHKyuR/+aolFIKzfSPRUSA1vS3YyV1x+W3iHtjPM1WemDCxcUJjjWq9++LbQgrotgkm+E3aP2DQ914M1acu3Q1tRDMYJ4z6a0fdmOZWKNE2MoL2sbWSbQ8M0PL+jHiYoTvMlDTzIZO11VDJT53XI5bxzAOwWhYZoipnVg0/Z3u+cos/mEYdyE/w6Zb7w+U+VUshWmlnTgq1mDkHOMcXM+oWHSsHkMxy18SY5kxXPiu0EfrViVBlyMSD8O6Fa09Li6tNKl+Ih+IPWXv5rB8KArpQxM3FQOT4kq4WQqNG8cCQKrXmBZFzzdj23ZhyyB3ekHlO2pAQ1RgFNli1P1GZgCpmihXD0VyvSFfWdVxeyfkXlpK8ZyI+XUq+q9e28GcwostCGNp4uPLG1Euu8Gprye/3c3A2EjARHC6VdF5/IM5TW/YZqq4kCNskP0Fsu/o8qIjw24R6zTS4f0/SJ0ucnfKo97FF0APxUJg9lxAvqBxyyf063OfBZkGV6uF5G93VI2lOXDwWovQePJw+roLK43y/edB7rxU/eyWJD+zM0UeWHwZEmnpGfe40z0hsfBL+Zi4JheRiEk9E52TPEpZGxr0gsJ+BLMnoyInmb2g+9VcjwfETOS7wHWybjV0+nzay2JL28Zllg7zhQvYthVNRxJQdCjeR5ZHVk+jQ5LxqedEfM0ycTSVUZeuN3eO9qY4KFAPJv5XKDxlic8mT/DQwCXNwT+h4j9nya8/vI8XUlBVc8B3qeqGAGDb0jkN1IxeVZ5xE+g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(356005)(70586007)(70206006)(6666004)(6916009)(478600001)(26005)(426003)(336012)(316002)(1076003)(41300700001)(5660300002)(8936002)(8676002)(4326008)(81166007)(2906002)(36756003)(44832011)(86362001)(54906003)(47076005)(83380400001)(36860700001)(82740400003)(2616005)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 09:10:15.6930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4781cfa8-9cfb-4337-4e39-08dbcfba0b00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7098
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEJsw0Xsg0mvpOF3Fcee5OdXN1XMaYKNQIDRe6xBhUU=;
 b=LMbtWMiM4aXV4iwEjrfvOn//a4Tpkst1bOXaXfBUuujUhtAOek+FuXwQc7tqZLzgNQAdGmj3BHrKdS9LisjK0c9dFwP2hhB+e6WPabbI1HoeLzxJ2tE4gxscQWvlRDdSVdt106RKCjjA9p6MzvpsCvvnrrYum5zSi7iXN/pwG9A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LMbtWMiM
Subject: [Buildroot] [PATCH v1 3/3] configs/zynq_microzed_defconfig: bump to
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
Cc: thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps the zynq_microzed_defconfig to xilinx-v2023.2 which includes
the following updates:

- Linux v6.1.30
- U-Boot v2023.01 with additional bug fixes

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 346738f665..d598a46c39 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.2)/xlnx_rebase_v6.1_LTS_2023.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.2)/xlnx_rebase_v2023.01_2023.2.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
