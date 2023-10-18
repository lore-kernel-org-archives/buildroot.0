Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08F9CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F09982A29;
	Wed, 18 Oct 2023 15:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F09982A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtrP0TMDz2WD; Wed, 18 Oct 2023 15:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F2DE82A0E;
	Wed, 18 Oct 2023 15:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F2DE82A0E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 116271BF342
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B53F41FDD
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B53F41FDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LoYmHiqjLq7G for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:10:59 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::623])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F016B41C59
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F016B41C59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZHw9eg6QGKjeqxl+6unO6jk4O6boUDO4mUVfztLCSaPJNqCRlbPlUtJvACnBTKoudskXEwlnyACpFDDRGgBub+h2BKCXr/VLMwRKEJOBoaaRAxbbO4/fjMRkqQ+WSSqrQiIySyTK8Fguytcafds6PKn3QPIEidaFU1ROAA/WIfYYzYWgtsB5n/ht4lEKBmt9r7V4ukQlAyqiRu5Joe8PmXBiA2UrLafVbtUi/2IzO++UKgX2DU+MMPZ1kzvM3c8aUjYOhaqgDOa57GNeXTeCCSMbgXcnvlgLNKc3JLSFK5kf4HhOa5HwleIFIAepz7KRPgG5bvFUaoGHopE/CFVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ7H6YpSRCyfGwnl39pZP9b3Epuu4QGXFSE5DzZqRfw=;
 b=LSKZbtfnwAQDDcEZL6yTw6D6cnoXvey5DKi5OD/xPsrqL7/Wjvd9kV7cHwZAnOjxF5tZwUx3FYiefAjpYnfkDoi6xU9RGS1QmrOio9+g7U2lRojat/JHCRmhZzoY8ZpF96EQRwXuFTbUvdYwt9GXFzsa8DeP8iB5dJEvDg/VR0zac+WvwHFal6pNM54aZDbacUNu5D7NfIMZ+RiiR1eybHiuynE9vC2zACPu6brsqxYVG48txPlcyIMGTZ8UciQA9uKJKIiOhtALIEFkfbtFllS0CEfkZzk6tikzH/ux/iau63PoEIzioMqVIIzKN6izUlAOxyxThS4XT4CwhhkhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from CY5PR15CA0098.namprd15.prod.outlook.com (2603:10b6:930:7::7) by
 LV3PR12MB9259.namprd12.prod.outlook.com (2603:10b6:408:1b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 18 Oct
 2023 15:10:54 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:7:cafe::d7) by CY5PR15CA0098.outlook.office365.com
 (2603:10b6:930:7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Wed, 18 Oct 2023 15:10:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 15:10:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:10:46 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 10:10:45 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 16:09:31 +0100
Message-ID: <20231018150932.3961564-9-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018150932.3961564-1-neal.frager@amd.com>
References: <20231018150932.3961564-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|LV3PR12MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ac9af5-4934-4776-dfe2-08dbcfec6b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F+Rf302MLh0mipxzg9oXRbCbaYHSP3ItdN4nUTzaTukHTMi0jdDVAaVYQumrntpsS7fWEr7lthB1nxL6g3iV4xif/BK3e1mBnngWRSxYJBCiNpRg/fHVPVs4RdpV6gnb33IUcEfdb8bq2Qe4tu2yQS+X+pQG+1I2vy5LNJLhMWn5ZpjhJQMhVcpB980JIqExmEyP7LlxA+Pd+gIf9IeY4g0Ft3BsinSFO0Nu4oqtsnsiT4P2DNaETcOVxu8VMElMoiP/V90ZGNW1WXOLNDXs4FrCs+IO+UC+cBcz7i+SeYeBziaqFnFGkNMOl1iqh98ZQjyJPfC9hsDRUQye9muoERKLk8kVEl7ZgY83Fii3VW6JCZtRv9lXbqALVwe+bPTRLItn0axfWAfW3MEzDmuL2K/uLUmzTGBcHZv0yonTT5BSz2vYmF5bk04aT3ccM4SotyLjwTKL0HyrIppEhVj0w8wHt7/c55R0+ZNOy4vUB65ZDluc3uGVgHPEH2akICXuazoq5b7Up26wzXZCSrzfXNjcFXlO2LBaIbF3403E0CBJHTM6SUlp1usa+tcJ9NyXLYIazk024phJidWoSgrgQwRMhLLRTyHiVWw8+vao1PLNyheK5ncUBWEflrEpIxHtAsLE2TIgQ/x1iTVHOGjKAU1Kp2UXXRIgfUIwwX4/I3GyfM23cyfcXWFn0/eKQQEA9OoNfDU1vOim2svx24MdeAfCxuYftpBD41U49ck4M0ZcJSneWjHlNCxz9zvpms1Wh87VSM6Eu8FRGKnI7TewsQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(83380400001)(40460700003)(82740400003)(356005)(81166007)(86362001)(5660300002)(36756003)(44832011)(6666004)(8676002)(8936002)(4326008)(1076003)(41300700001)(2616005)(316002)(426003)(336012)(54906003)(2906002)(70206006)(70586007)(26005)(6916009)(478600001)(40480700001)(47076005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:10:51.8864 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ac9af5-4934-4776-dfe2-08dbcfec6b23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9259
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ7H6YpSRCyfGwnl39pZP9b3Epuu4QGXFSE5DzZqRfw=;
 b=rQlr8+B1G8AaRuBBM4jAKVHLCpUo+LT/72PglR76aoG92cMJjhJkkbTidOy/jWxK0ETAGn0yx7nJbtOCM6uWCPgOhmrii7Pmr2GOmpsa+JLjBhfNMummyEFisMeQuZkw53Nexel2QNN5EGnpi4ti2QxkJ9lRJdISAVGtnT/Ylgg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rQlr8+B1
Subject: [Buildroot] [PATCH v5 09/10] configs/versal_vck190_defconfig: build
 plm and psmfw source
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

This patch migrates the versal_vck190_defconfig to use the new
versal-firmware package for building the versal plm and psmfw from source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V5:
 - bootgen is selected automatically now
---
 configs/versal_vck190_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index e30bb35b74..1e2fa6d21f 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -32,11 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
-BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
+BR2_TARGET_VERSAL_FIRMWARE=y
+BR2_TARGET_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
+BR2_TARGET_VERSAL_FIRMWARE_PDI="https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/vck190-versal/vpl_gen_fixed.pdi"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_BOOTGEN=y
 BR2_GLOBAL_PATCH_DIR="board/versal/patches"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
