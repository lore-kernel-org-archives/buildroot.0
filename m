Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27C0C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 05:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 645174179D;
	Tue, 16 May 2023 05:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 645174179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdk4rhR6Xj4k; Tue, 16 May 2023 05:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 869D1403CA;
	Tue, 16 May 2023 05:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 869D1403CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9CDD1BF34D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F30E403CA
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 05:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F30E403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwDqBZrncEFY for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 05:41:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C093640136
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C093640136
 for <buildroot@buildroot.org>; Tue, 16 May 2023 05:41:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAS9qzbTfv0cBB/iLOwqizjBP5mc3Sn+LBQwMSduCteSkEnjib4+r3lZiwH/wlmCwLRm/kYVrUmjYCjwDVrQFPEwoeN/qeKYQS+jWOmTDG6O4iTXpgslBrUlJz+JRHFu4hQxuOEJDDOxOT/pnqsK3jUOtiPi5zQLd1MZINITxh55bW/fv8/HGyDGfDNAVRhpWYsN7SISoApd9/YHyQleRwPcR70pNRqSsPSJjESv/2hBCLGLTONhvmay7JJ52IvMVsV/eN7EM7TlE+vrkOE+DTowHKzOCeK5kaLeDoXqT+gPxRgiVQHmujGIQH69LK70G2EM6HFS3zqVK6AmmaKtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eeEZAFIZgQXHZwPnhPHP/5xQMHmMgnqrAl9LCbLlxc=;
 b=iAbMeVOvS0rMEXTtRDzPi6lch3eN2aEdY4MaLBhVAPO409yeGVBtyb2HR8zcrgoKJCQ0UNall3IoVOrU19Nc2pyhAc2QqPK7Fz9uteLjTNq0kc1uQmDFlx9bfkJUICmcc+AJcHfgEc4PeXi0N/Yw7pP341nW8AkzzsWMLwFExPztSNshTofHIqP6CQN/j0koI/IhXwTnnIkS4LmThzJ6/phz8mCgt1pTF1e4xfNRWW4SiZVxDn9qJripKg7PhQzMo85tZnTTMFgllNBGlzbDqZatPd98Vk9fv3oHpY2hVk/W3lz+xCOth23ua1JRQERSUQST+pDwdh70VpscoRu2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0267.namprd03.prod.outlook.com (2603:10b6:5:3b3::32)
 by IA1PR12MB6556.namprd12.prod.outlook.com (2603:10b6:208:3a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 05:41:12 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::b0) by DS7PR03CA0267.outlook.office365.com
 (2603:10b6:5:3b3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 05:41:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:41:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:41:11 -0500
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:41:11 -0500
To: <buildroot@buildroot.org>
Date: Tue, 16 May 2023 06:40:53 +0100
Message-ID: <20230516054053.22133-3-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516054053.22133-1-neal.frager@amd.com>
References: <20230516054053.22133-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT030:EE_|IA1PR12MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e922243-ce65-475a-2e64-08db55d0288b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4/WTJsixjZXu/KalauaaQORmQaTt5c1me8IqW8r0dyM9uIoIFcww/OJdJ5OVWKH4oLZfRDMBJDvFDIPg/++Z2jjZbPQTn41IJG8wGV110AaCaVLgHSTWeQv2vfDsLWU/cml2ESZn/soz2vJVDpxqVth9us7HhRJcjV6V/PqGfMnpyfDiufEmPHDrqkAvLWhdNtGCit1dtOlwTwVuGQgXsrbmb/obhSNTkdP9TVDnUcn/NND7yztdreUzLNZdysZ3Ju7H8s7K63Glsnm7mRHtOQP7KuROPFCFxdTxcAzF0+cbnIfl2GT7ZmjkEbmVzQes6Im/WFCXd9N4pncNabU3M/qkOteT17kqib8wfkBwrU8bZ6QNJgHUUpAhDLA02eNN0reQQVMpJzzLkS3DNJ81rv4rLrjHDaoq2vN0YPN2HOUi51dwrG/82+n9XpBFPxZbJQaJEjzHESk6PXXCbfKm8TcoRjdaGjGnCEhAF6Nag2ZGZ3xPUeqXfONYsO7cG0mZ5yRB8pZid92M9ikLx8xug9UHjrqPEglQUPhUb+EyGdRmfnrQwWSjf1gcxOem9Ye6adUVW1bukwfhE1/TIWij04k9v5Ui/Pz5zldb2MJCtXwVIMQGsug0bALPItKYHmU0s23mUp+ipZQW2QnLFJT/p438dyhyDvw5sJVXvMad+6WSN8mBpJ9FarlP492SqfXdznsxMWM+NxZnHTA5661DR+PNBlYdqSZa3QpBilO79CG3K/jwRvmtAjMaBXwEMfvksUUMfqyABbRUNR5lZ6TMA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(186003)(2616005)(41300700001)(47076005)(6666004)(426003)(336012)(83380400001)(26005)(1076003)(40460700003)(478600001)(54906003)(6916009)(4326008)(70586007)(70206006)(82740400003)(40480700001)(81166007)(356005)(316002)(5660300002)(8936002)(44832011)(8676002)(36756003)(2906002)(82310400005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:41:12.3888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e922243-ce65-475a-2e64-08db55d0288b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6556
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eeEZAFIZgQXHZwPnhPHP/5xQMHmMgnqrAl9LCbLlxc=;
 b=aWk0WnR+W5ZrXYsmOQz9NF72oT9i+CQMX5vnWwCFZrhS+0x3hKp62RhQIL4QFkl1Q+GYkK2oejo2JWByZuBWIKC0DBoUPIzKknFE1D1E+11BwZC1EElt6z2OSKskJYWlloTzUvBGmXlOnkRx9T1YoElixYnWOLEPBCJIizLaRHE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=aWk0WnR+
Subject: [Buildroot] [PATCH v1 3/3] configs/zynq_zed_defconfig: bump to
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

This patch bumps the zynq_zed_defconfig to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 configs/zynq_zed_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index a39911b757..dc167e3bc1 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
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
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynq-zed"
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
