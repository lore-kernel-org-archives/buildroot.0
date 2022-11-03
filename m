Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4E2C43217
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 11:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE9C60FC6;
	Thu,  3 Nov 2022 11:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE9C60FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MzUyNzv6VPb; Thu,  3 Nov 2022 11:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F4560FAC;
	Thu,  3 Nov 2022 11:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4F4560FAC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A6861BF2C4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 11:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B2B2417A7
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 11:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B2B2417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rdOFH69uk-LR for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 11:23:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA489417A6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA489417A6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 11:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8QnBusgkZ0ReMvZYlkuuZCJnF8DvDw98nncmXxDaLr4tQ4J8N3AjNnKWnhe7iTpap1owCnQRCtrhqohdlIXj5tuf1o+73OVNmMbHFn3e13U5chB5Oqep43O+k4vKJZxXPfTWyomCT9oE6DhqnScQsyDm+HMCYDGgfK5B0AtaqrgM9zz3vE+KlHyEY9/jwjW+wmQpYArTZ0jrvbFGPsHTBzYCuiwBSIdOnz6QhmwKpd/HL1AFVKakh2Iq5MaU7K0eIMK45cC2CgzUxHthpRriivnPzqGQGJcg9L3FTh0d6B8J6TVouwIPXD60zBSs9yQnc59/HcNLFxIKdYk4t9ATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d0xI8yT1kUKqVE98YtyofhVQJvuL2kvj/osnp/IwoA=;
 b=e01TG0jJlkMHvBNG16R3qq2LaINIekxFLWQCcXRaEb7ywhNe6KnZZTA2kV1/Ps/7Gjulkv/OCXT26foT6kyxj57209lKUAaKkH5Lo7uHozjIayDKbBg4aCIcLPo3HXQclZQH1mdYRjxwL4Ly635UBuiEr4JRUbBoBgFDlvXgswAeEwHGk0nZNR4PzqLP48BUCYRsqus92aohBuehR33wkVD7iuj8oyPkKxPT8vUgn1iIOOXwpr1jkSxF28jHdMqvhh3BcJmR8YpbYix6RRJUUVNvoZnMfbbEBi63aGAurlLCDzjQSXWboAZ1xrnhJQCx1IeuwgMPd+oyrdkEOGKfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0070.namprd03.prod.outlook.com (2603:10b6:303:b6::15)
 by BL3PR12MB6449.namprd12.prod.outlook.com (2603:10b6:208:3b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 3 Nov
 2022 11:23:46 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::99) by MW4PR03CA0070.outlook.office365.com
 (2603:10b6:303:b6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Thu, 3 Nov 2022 11:23:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 11:23:44 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 06:23:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 04:23:43 -0700
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 3 Nov 2022 06:23:43 -0500
To: <buildroot@buildroot.org>
Date: Thu, 3 Nov 2022 05:23:39 -0600
Message-ID: <20221103112339.42954-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT031:EE_|BL3PR12MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 00674594-badb-45de-b3c2-08dabd8ddeb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBdmX66ISTT8aLkURJyFvJEJQPdBKgPd4RqlXy88zPR2UFEwxfaZqeneY71AuAy7LDpjRMRBN6KaAQYmygbyRC17VmiUVGtKFvL8gqd3icPLGObi2XkCqCLCDkojgJYSVzlyWUOIJBEe/vWnoC+/Cnsfb4TcHg0f1OYB1dGCvoDUhdclAxOw0GvG7+XJNbbKFQmZr6u8j5JEcmurc4Nk26mHyMgaO15Np3CAZxmMpsqDEb7dL1L7PQX2xAXoLV257YwY6Y/jF8sQCmaVF4vXNMW8Smq28ZPMNkCZoXJkvo70aicNatni3PO/3LjfrIHHimojvphd0503ppls1EnJlqGD1A+/QzRD3++NUMPmzRrt+hl+Gh5Zddwsj6u+yZljhfnD53TIliyxyjFrna9cQmSkJEL6wn4zDCIaeABXO5R9K1Em/D4K5uuWNoP1gjuvTHE9/wnMN2kL/yaXtD5eg/G8oHDlFFrD5Ebvjiz96052Qtvmi1BKdSyJ0EzpighgWV/DpV8Tj2XwT2bIjS0FfzioVdltgVTWnIK/ggA5KlelXjeEdrfM9LqqXtGCXrXRLt3XKYUn8W3KCMvF7Wu2vVyeypb/WqUTrj0OuZXFB25ChwgkpZzR5LFttABkFbnOrcYZ2cD8IJdtCgHR4/MELEGZc6zNisOGDUqPm9JJ4vEON4TowSjjiq/PHOvbsE57PMjY+8qVnbHFinvZqzpH6peoGwv2Zvtvcz8AlniRTcmb6oy4hhNEkj5xwaEhRrRvistKG/VThazluY1d6lVAMZeleVRQxH0+xoumZER8iBmG54vnAwuF6BYRD2cxQDNY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(36756003)(40460700003)(36860700001)(40480700001)(81166007)(54906003)(316002)(82310400005)(6666004)(86362001)(6916009)(47076005)(478600001)(44832011)(8676002)(5660300002)(41300700001)(70586007)(336012)(2616005)(426003)(2906002)(186003)(356005)(8936002)(83380400001)(4326008)(1076003)(70206006)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 11:23:44.9338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00674594-badb-45de-b3c2-08dabd8ddeb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6449
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d0xI8yT1kUKqVE98YtyofhVQJvuL2kvj/osnp/IwoA=;
 b=S+Dh8tBX6anheQhAvycz6jCe4aTTA/WAvpvoJlaUKwCd/taykwO6K9qTlJPFo5gDipAW1daEOElVmxDiQwURuOpqp+C37wwYpKLjiMMrksfkSB+/ACX7NWmBflSEQ+I78kLo671JQisYdj9+BF638MwAobdrPQJmDQygSaNgeHI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=S+Dh8tBX
Subject: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x_defconfig: use
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
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

This patch migrates the u-boot device tree definition
from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
instead for the zynqmp_zcu102 and zynqmp_zcu106 defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 board/zynqmp/zcu102/uboot.fragment | 1 -
 board/zynqmp/zcu106/uboot.fragment | 1 -
 configs/zynqmp_zcu102_defconfig    | 2 +-
 configs/zynqmp_zcu106_defconfig    | 2 +-
 4 files changed, 2 insertions(+), 4 deletions(-)
 delete mode 100644 board/zynqmp/zcu102/uboot.fragment
 delete mode 100644 board/zynqmp/zcu106/uboot.fragment

diff --git a/board/zynqmp/zcu102/uboot.fragment b/board/zynqmp/zcu102/uboot.fragment
deleted file mode 100644
index 52d6d9dff8..0000000000
--- a/board/zynqmp/zcu102/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu102-rev1.0"
diff --git a/board/zynqmp/zcu106/uboot.fragment b/board/zynqmp/zcu106/uboot.fragment
deleted file mode 100644
index cd571171ac..0000000000
--- a/board/zynqmp/zcu106/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
index 66c24c4b64..e27dfdb6c9 100644
--- a/configs/zynqmp_zcu102_defconfig
+++ b/configs/zynqmp_zcu102_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu102/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
index 896fea0ab2..4113a9025a 100644
--- a/configs/zynqmp_zcu106_defconfig
+++ b/configs/zynqmp_zcu106_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynqmp/zcu106/uboot.fragment"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
