Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAA3C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 05:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BED4141C33;
	Tue, 16 May 2023 05:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BED4141C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FjQaFT56nPch; Tue, 16 May 2023 05:41:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E39DC4063B;
	Tue, 16 May 2023 05:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E39DC4063B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E91A21BF8C7
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C205C60FB1
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C205C60FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ICVupusKlMc for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 05:41:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2650260F46
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::620])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2650260F46
 for <buildroot@buildroot.org>; Tue, 16 May 2023 05:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrJEAjPESXnJIL4+WQAPdFN12iZM7DnOuHwdeQNh+ZOTnSMJkQI60jlRu2x20h0hK2DDG+1USp+FOq/ILQfOkmfzWSeuiv4mE+LOZMM9jBjGSnRR+u5d0WVRxGOYUn6RYLpLQs+NujUBfld5rIcnHoC5HWcvqF0iuqQ17m/niKFyG83e0jscJEmnVZe5VCwfRl5FOz6f4btU/K4ieoeaYbowAACyHvWsstmHLux9QaEcZ2jYp3Eb4yZEojRnBx/jvM52pwJbXE4f0Ef6M3XDJPnw0Q3fx+bDNJqJ9zHi1wKJ+RH61Ob43tr2WKWBq7E8c+7syXsGxLiq48yoEH7tFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNWjOkY2ZHe5Q+sC0Bk/Ro3eIYYTcx3JwsEyxyUYNbI=;
 b=gcHSuYRc9ULpiAolE6ht2TArHQkY9s22VILrksr07Fsb9PtZzppJ6mf63dSWg6z5YlwrjN/nBx3mYQ9chOorOVuVpMHkpz9l9g5HNvPe7eEaU54wHxC9NmTJ+mMd8VlxSgaL4x35e5AVGgVg2QBFwz5ejtryWtn6qVMTyEAw2iYyMslKMoQjYyGCWxA1xyI0EETKbcxM+ZKOc+8VgHplu7i8GPpZvjBpLATadsS5VbTWwwvW2V6UNtiFpub3sm8+SYtarMqJMTSwGgoiUOCUd/YS4+YXLH3WEqD3YYOnQV3BBRNXk30fjjgs6J5PKCboXEKN332Vn3G7Ce9ovsxfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0246.namprd03.prod.outlook.com (2603:10b6:5:3b3::11)
 by DM4PR12MB5309.namprd12.prod.outlook.com (2603:10b6:5:390::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 05:41:10 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::2d) by DS7PR03CA0246.outlook.office365.com
 (2603:10b6:5:3b3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Tue, 16 May 2023 05:41:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:41:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:41:09 -0500
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:41:08 -0500
To: <buildroot@buildroot.org>
Date: Tue, 16 May 2023 06:40:52 +0100
Message-ID: <20230516054053.22133-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516054053.22133-1-neal.frager@amd.com>
References: <20230516054053.22133-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT030:EE_|DM4PR12MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: b0591bdc-5061-4a04-e01f-08db55d02752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8TjzxZgFuddUe9UCzLkrng3eZEncvwnr3qGqFXXEPvUHnQCRuh4QsjslDspqhLVMt+b30xMKhrucdf1mOAqzqC8HeLo21C2I9Msx/j2sOUi/pvchph5cXPMbyTqbfiT6OBGDcb0viQZHf4DHl+Sywv5/k6nAbRguH+/Sb0lxMzpKyUMMr1BfAlCncC/E3Cer3qnRHdLzBTxb5g0Fb2fqbjcW9a5tDBJzuJi1HJCypdEfJX8yog52rbxj8fvxSWjjJadEPBtg3CKmyARteNWJBrhiIrVlNXvU9fvh4A5OGSm5sNWZbssi0VZfcb3GaOxAsrVIAcSp91oWlktcEMg5PyQNtDyTsW4lBxBA4uQPdHx1CikPbfMqvZDIROA/uC80kl3YRoFJOaWt41U4HcOvh9MP5vs1c8EfUl+dBnwOnNe7boLs30yUDLMJXWR0rITXGi0ojt+E2ZYPzPvuNPrVeXLEMzaop7yJyc+LgzFjdBP6NIzTZpF2pJbpKd2LIXhAGJlyQjDachZ9UCwTYwbCkh0xeNPdnfU/dhVPVc0ndoyvbh3ULoKjYCw0jVSxXc3yfvhQtT/MK35tcbiQyxX993Rv/YyZ4TGB9TSh63kHK/G8NOgPOzARaUYVjFXAjFeqGk8MoTfcwmFwEBR3sEDPQXmgBp2vtoPb/8iizxQ1nx9Iv0F2mF17+KnGyabtq8V8+2Z/+vqQmAgHuKinVUjAJPGCye/xbXwtU4mM123PFlQa0i1J3oJbVqU8f4TmCuKrfSUs+aAvLMqp4bR4gATUw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(83380400001)(26005)(1076003)(2906002)(47076005)(36756003)(186003)(82310400005)(2616005)(40460700003)(86362001)(36860700001)(426003)(5660300002)(336012)(44832011)(8936002)(8676002)(6666004)(82740400003)(6916009)(356005)(54906003)(4326008)(70586007)(478600001)(41300700001)(40480700001)(81166007)(70206006)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:41:10.3421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0591bdc-5061-4a04-e01f-08db55d02752
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5309
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNWjOkY2ZHe5Q+sC0Bk/Ro3eIYYTcx3JwsEyxyUYNbI=;
 b=msK+TTMGPwh3eyfNW75An2jIf4hm2EMs1NuruaeCSjw8/iOD/bXH2/TZhg4yUstdZn3ckIL4Jp7XOwdk20AimSU33lyteOjhn4MHRXsDrWvVp5WK5An1JdzOkb4SEt2/stvd3mDa2UQbXaseDALBwAsxwvcMOkq0XT+uG4gyWBU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=msK+TTMG
Subject: [Buildroot] [PATCH v1 2/3] configs/zynq_microzed_defconfig: bump to
 xilinx-v2023.1
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

This patch bumps the zynq_microzed_defconfig to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_microzed_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 459a3a40bc..346738f665 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -2,12 +2,12 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
@@ -19,11 +19,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
