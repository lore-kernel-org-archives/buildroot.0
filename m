Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73E6CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 09:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B2A0612C5;
	Wed, 18 Oct 2023 09:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B2A0612C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4Hl5AoOOUUT; Wed, 18 Oct 2023 09:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 677A76120F;
	Wed, 18 Oct 2023 09:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 677A76120F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E3031BF5F6
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2376F403C1
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 09:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2376F403C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4f-LGStc6Mvj for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 09:10:17 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7FA140345
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 09:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7FA140345
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHwHvTLtxmCUXZVOBNQL4+5dWTsCwIduNG2gUB3xUHJvmbw7JEqN8UMmSvK/ROOIbagLy5gr5UKWz428rGHZqcUUp0bekfjb3nRvOsYNP/Fj8uXLNz7G4GRAZ6/RPm+g9d5nDFAekI1qqU+l5Z279/lFr3i3cKYR3XdVj04Frm+0mtvhZ/pUZoR+PNXQx7QzTWpL2Tz4Z4GxtdbBj+UJpLNuCQBTkhHaZweYxBMCDEd7aqZRIT5lObYIu8jwV9MgOlIko6IWU9aPkAc49HkWVd5gP9sAwxeiR5eC43Dvh+TkyLzYXAZlq5abR5sEkblL/XOQhHSU1bAysYPp71PPWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSLIPRFpzXS06tWZY6taDGRzYrhAOMTnS7aT+6+LA8c=;
 b=GhjfIKHhF5KPi5b4KfA8wt1Cj6A92fyKk8WI8ds/2g6//4uO7HeE8wVJPV9b13l4BEgOLDbjGel7zNJ20QmCULw2nyGvO18x61ARtzWiQ92E3XsJHgOTyIzTzE3kjXhMUIeOtYXVMA9eEWdPWdBrK9VXH4nFM9UsI2qAzcKZAmToONxPUESMCqAOQi19Ul+0OTo0fccmI5O+DDXs3jmV+T3B2CURztf2AXpGOaqU01WOm8V0kD1UU7w5sSaC1E9NsaqWnOeFkQDZ3Vbj1+caL23+S06dgnvKLlbVNB99RPsrhlvjljAwRjJArj6Jb5auglnDA5RQK+l6sqti9ihQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0228.namprd03.prod.outlook.com (2603:10b6:303:b9::23)
 by PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 09:10:13 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:b9:cafe::7e) by MW4PR03CA0228.outlook.office365.com
 (2603:10b6:303:b9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 09:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.23 via Frontend Transport; Wed, 18 Oct 2023 09:10:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 04:10:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 04:10:12 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 04:10:11 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 10:10:01 +0100
Message-ID: <20231018091002.2162735-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018091002.2162735-1-neal.frager@amd.com>
References: <20231018091002.2162735-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|PH7PR12MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: c778bb9c-4b88-4288-b095-08dbcfba093d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipJ7pQ5799VP5bkNEKGe+RZwAXeq3JGquQ9inixeTgNzsjmFV8cNFvG1w6mJlnbEKE7pNsbEAfnUEFcKiLC2k4vR5afT/ZIx8ZDVf2oqgVmcjUpQ37F8jurTIJoKzobSCeHgplwiW8Q9OaP8pJJv2ToSrNVAgBNTol/BewTiRSZf4lMQIkccZASNeVFtb3g+myjWffefzPRk02jgAfBlx5FnSMUljCYCn1vRilmBbz6cakAtY67IThH/qxxjCGaBlqCPBe8Dpq7vWWYdinBpzEjuWRB30kjjlKT7tp5h0nWH8z2Le7T6uwfeTmXkFXR4AUzGZWFh4h85aTFJMhvIBJBNbFJBKbPslxob0b0IAHjG+PAc8y/JJK0KZWHtBMaXkfmycxW14SoenvfXHeKYIKAvPyE3YkG4LkUkFJMKFh+AaxF8QkmBGeDjmTr1SxyN/7MPQlVww+z0DbhraeCk9beKJ4bC2ZkBd5o1feHVc8uF6C72VynroVyoB1xrWrprIBF7zcni/iVyJaXGb07OyX9Uta2x45B1MP5APwV0uVUSkJhm2f7zbDSOfb+6OtqBHAw+4T4BQsPc/y2YyUZZvySHO3rwKgIV7Y2z0vDo8G3qmq1Gx9s6cDy8qLtP94ppG+iC/dTnvMCYH3f3+V0JIdxDYuVoNG7JTCm4msN+AdIt8hIs6QN8XtkQ3qxMojG6C6jh4zSwHryqR+H98tWnBvNiunitDjDUChHEBvCghTpSLRj2mnOx6zbgF+voohsIrDjLs7/E9E86GNcTu+J+sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(26005)(70586007)(478600001)(6666004)(70206006)(54906003)(6916009)(36860700001)(47076005)(82740400003)(83380400001)(2616005)(86362001)(336012)(1076003)(356005)(81166007)(426003)(41300700001)(36756003)(5660300002)(316002)(2906002)(8936002)(44832011)(4326008)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 09:10:12.7399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c778bb9c-4b88-4288-b095-08dbcfba093d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6467
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSLIPRFpzXS06tWZY6taDGRzYrhAOMTnS7aT+6+LA8c=;
 b=wrBUCdN7ARIchq2tCuIZhxdqUSzzXX1hQacoB7BXpas828DA7ZdntSQFyLb/bXbNDiRSzsrjrHTOwDg97tBBoU6lAS84yfSnMQR1TqtUfgpiST/G/6ZUUUUe0V0zaLkYnNK3ZQ2/Sgtvw5GfZP9VbAWnA/H3Jz9c2b+SMgHR3v4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wrBUCdN7
Subject: [Buildroot] [PATCH v1 2/3] configs/zynq_zed_defconfig: bump to
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

This patch bumps the zynq_zed_defconfig to xilinx-v2023.2 which includes
the following updates:

- Linux v6.1.30
- U-Boot v2023.01 with additional bug fixes

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zed_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index dc167e3bc1..a3a94687f5 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
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
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
