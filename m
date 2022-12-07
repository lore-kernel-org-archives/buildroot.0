Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28376C4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 12:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EFCF41816;
	Wed,  7 Dec 2022 12:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EFCF41816
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 33IcMKBQm7xT; Wed,  7 Dec 2022 12:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6855841755;
	Wed,  7 Dec 2022 12:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6855841755
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1AB1BF4DB
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 12:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 655C981F34
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 12:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 655C981F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5MwGBnrgIfc for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 12:22:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A1681A34
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::61d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84A1681A34
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 12:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJfCz5KIytEmPLoPahdO9BBm8/X0SDZjQEUdsmMafHgyr87oPsmpW+kNbP9MpxFF+tqp/ntL2R8iQ7vc507gILzd+caCPAtlmbCKFf9zsCCvcOSIkP75S2Msn5q/bI1MdWb/hyrAxpPBq434e2vosyGSmQDSN7ie6p0AcNS6CA9xmeO1nseb3NUiyD85IhSHtDVUMQjGonqs8M5jJMAU58GhBCEh5axY8COmD81VLC4ymLUG6Icc7rC0M9SnVCXxTDJ4DLiaXjubaKWAZFu0k5xnmfQX7bUO/xnkly6NZyCRxysH1Hn8lOzY1rs1yA6lzGBNXZnxWV5OifaiAD+uug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuCv32YX3mEEJt9BZqeQ5h55+D2kzlzTODU22nU/fUM=;
 b=jPhQxlzwA17FK1R3OHT+q+odVqWzniXImdvYwWEcn1GKORlKFSGMeYO4j9rsR8ERM6JU7Oqk1pWUf+xX+H2P7S6MUVBpiT6skaO/0G5Y+hxDAgOsMcYmHCc/yEPAOAwP5KILo04EZRsqu8RinU11wyDHlZeUoNDpecGsl9ueLHJuZ0TWkJS+dsOMnsihmVdgF32R+DIwZ9eNcrmHE+8Ys+uSyDUI3I5+JOuNnThIKl1I36AQSU2Wul2cwgzE5wtJfosxiwjX6F2lctJ7XCURYDeLx2IfAJ6KKvd2w5vjQyjPpBHjrmKygbBxfVyUbtvnQspmGFMfD02EDAmPHSdfXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW2PR16CA0001.namprd16.prod.outlook.com (2603:10b6:907::14) by
 BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 12:22:24 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::a) by MW2PR16CA0001.outlook.office365.com
 (2603:10b6:907::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Wed, 7 Dec 2022 12:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 12:22:22 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 06:22:19 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 04:22:19 -0800
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 06:22:19 -0600
To: <buildroot@buildroot.org>
Date: Wed, 7 Dec 2022 05:21:33 -0700
Message-ID: <20221207122133.14860-2-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207122133.14860-1-neal.frager@amd.com>
References: <20221207122133.14860-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|BY5PR12MB4292:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f89ae9-f7ef-46c3-4a5a-08dad84db195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLko2P4GxVljmC1n0EbA+vkpV7fECr/nb9cXqvDDpLFskJG90xU/2nH18+Rfp8HiTU+i6N1PPt9MHWFOwUo0EhIKdHRZcuqq/aFpCaWxeyz3cL9EjnTK9ApDGL09Vsp3pvfzg7kwjZYTD4Occ7QB+VjITgmk+5aKehHgFgIM+ipvjdJ8tKDyRrrj86dJdI5n0ZQhC1YIaxOojIJPY5ak07q/gG8M2Dr1HVQL3RcEYDykRRL/aYzHBpmtnzNMeIXl/9dFtqjozvAED7h08AkCC2tAGcfuuQ8Ogxi36ftmAJ1vSJuJLD7mkd5DGgG5KItI+OObIS79tfEfiElyWcu+O4KkWSAhDb/00WRVCG95w7PabpwPjIroXEEm42hRkkF7Dek8w+OjUdByZHLpWtTe+8lbcmpf8JuA1bcl266cMgzzn85J77VuUZ7gZ/42TKxuOZ6VOX+jkWocyIxL+Ee09ZFvWC1UQWyBe+46CnxuFltp/8CctZ83F7TywBgRzv5lZO2/3CRp1F9whcT7p+DT/deDv5uDd96gLxpw8dewF/n/KYcVnYywxAEY9QGtPHNfydJJ3Vx80Y5JB3657/my5tWIyWHkZWOXYJLiC+X2Wzo9FVLrfR2Z0mIi+TIuXKImYDKluKbFsb1zNESgG/yk/+sxMVeXJe5CrqywK2SN9DRbd5WPPXOIIdc1dyHN0EdmyPP03OIHG5nTb+pMB3qgCGmxgECstPrTe6NFRv1di3E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(36860700001)(6666004)(86362001)(2616005)(478600001)(1076003)(356005)(82740400003)(186003)(83380400001)(336012)(316002)(40460700003)(54906003)(6916009)(8676002)(81166007)(4326008)(36756003)(8936002)(2906002)(26005)(47076005)(40480700001)(44832011)(5660300002)(426003)(70586007)(19627235002)(70206006)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 12:22:22.8372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f89ae9-f7ef-46c3-4a5a-08dad84db195
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4292
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuCv32YX3mEEJt9BZqeQ5h55+D2kzlzTODU22nU/fUM=;
 b=APO0ca/CHfwuRoc2/9RybKNfKksoTLT6SUSfKFn5yp3NM3HDO2vReaEE/E3SHKBPCwSYuoVDQLJqi8SH5K6YxRjw7Me/a9EL/7xx5rGdtaHy2Rr07Vv9IN12xee69QwCeAuB7K2EtYaWZi51+Xqia7VXY+i0aCMajtff1Puyzew=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=APO0ca/C
Subject: [Buildroot] [PATCH v1 2/2] board/zynqmp/kria/patches: remove patch
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

The 0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
is already committed in the Xilinx 2022.2 u-boot release tag.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 ...qmp-sm-k26-revA-Fix-DP-PLL-configura.patch | 39 -------------------
 configs/zynqmp_kria_kv260_defconfig           |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch

diff --git a/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch b/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
deleted file mode 100644
index 99dc056115..0000000000
--- a/board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c6677ee92c05e3f0f22cc08e3b309a996292562f Mon Sep 17 00:00:00 2001
-From: Neal Frager <neal.frager@amd.com>
-Date: Fri, 13 May 2022 14:02:07 +0100
-Subject: [PATCH 1/1] arm64: zynqmp: zynqmp-sm-k26-revA: Fix DP PLL
- configuration
-
-This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
-
-The Linux DP driver expects the DP to be using the following PLL config:
-  - DP video PLL should use the VPLL (0x0)
-  - DP audio PLL should use the RPLL (0x3)
-  - DP system time clock PLL should use RPLL (0x3)
-
-Register 0xFD1A0070 configures the DP video PLL.
-Register 0xFD1A0074 configures the DP audio PLL.
-Register 0xFD1A007C configures the DP system time clock PLL.
-
-Signed-off-by: Neal Frager <neal.frager@amd.com>
----
- board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c b/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
-index ed025790bc..e5598807e8 100644
---- a/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
-+++ b/board/xilinx/zynqmp/zynqmp-sm-k26-revA/psu_init_gpl.c
-@@ -74,6 +74,9 @@ static unsigned long psu_clock_init_data(void)
- 	psu_mask_write(0xFF5E0128, 0x01003F07U, 0x01000A00U);
- 	psu_mask_write(0xFD1A0060, 0x03003F07U, 0x03000100U);
- 	psu_mask_write(0xFD1A0068, 0x01003F07U, 0x01000200U);
-+	psu_mask_write(0xFD1A0070, 0x013F3F07U, 0x01010500U);
-+	psu_mask_write(0xFD1A0074, 0x013F3F07U, 0x01013C03U);
-+	psu_mask_write(0xFD1A007C, 0x013F3F07U, 0x01013803U);
- 	psu_mask_write(0xFD1A0080, 0x00003F07U, 0x00000200U);
- 	psu_mask_write(0xFD1A0084, 0x07003F07U, 0x07000100U);
- 	psu_mask_write(0xFD1A00B8, 0x01003F07U, 0x01000203U);
--- 
-2.17.1
-
diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index df01ad30b8..04bf21cfd2 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -38,4 +38,3 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_GLOBAL_PATCH_DIR="board/zynqmp/kria/patches"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
