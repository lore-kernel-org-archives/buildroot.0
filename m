Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01B1CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8553B820BB;
	Wed, 18 Oct 2023 15:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8553B820BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3Ml8bxZ_y1P; Wed, 18 Oct 2023 15:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BDD882923;
	Wed, 18 Oct 2023 15:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BDD882923
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98F871BF342
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E9E161064
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E9E161064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oh9AOFHrFbRF for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:10:12 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6F6F60AC0
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F6F60AC0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ge6joQo7cbm5EUfPWckRHghMxvLrgs+X6ywH1WJlC0L3RYKGg54l8kE6bIkqP8BXDzMRwl9hwbv1iPZz4Q5WSi9SNbhZ7Uai9aSx8cAdMf4sp4oNyj+roEgZkWJ4ufwBUk13RM1FAP48mV4mger60q2JJHvcW9SjBZ0jtOTqyP+mtT2Wgs1sWVfr1I3dTniJTLLwpNiUdkFGVeXpZrdcMdEsA7pxRE5shdxkkEWq85u3hVJ7srICq56RkC7cNZ3VC4iHz1mbZ9UKwc798sLMlgRy8eljy4VY+/2zk6wBILRc3pNumq4kDZYheWS+F/qAgqjLKszAHKm53eqnLiMyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TS9J3hJ/TGqk1lMjozwTCosfPsRIVSCt8Cw3o0KMuzI=;
 b=IzUIbxZsyp2sinoAzsjOpYyC7NKKEiOufAjlR31niJPvyEH8+yJZ95rB7TI4+QNjzcHRPso+GXODMCX4YnKKbk+qUhAC24nPE3J+WjQ7oSw2GhYU3anKEWfQpCaaeWOzP64bqGk8iNUhAXxYqCirSq/VMcI/BbR9rWbdFYoqB8xHMgT5DixFT4I51YBaV379ow7we8a0ie7eAx1Dp+ng5UjvHIbmTZO8YZmdMb/tvPVtAiVXCBRpUzI8TKQnZlYn+7U2qZkPF/1dBr7HT5/2WWrO+b1fYHfj3T1MuIe+z/lJN0/EEWfSzUqt6y7EXuGEc1p9XChxYtC9KBQLndRb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MN2PR08CA0009.namprd08.prod.outlook.com (2603:10b6:208:239::14)
 by DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.37; Wed, 18 Oct
 2023 15:10:06 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::f4) by MN2PR08CA0009.outlook.office365.com
 (2603:10b6:208:239::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 15:10:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 15:10:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:10:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:10:03 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 10:10:02 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 16:09:28 +0100
Message-ID: <20231018150932.3961564-6-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018150932.3961564-1-neal.frager@amd.com>
References: <20231018150932.3961564-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DS7PR12MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 571ae12b-0bad-48a8-1323-08dbcfec4f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QL3aqhUBoooCULH6/MeP7ObUDTmEpHDL1xx+e1S0weF6b/rFhcu13h0ANxHjfg8WWoze0Vc8jBwTY47SNSPGAjCqi/Y3ueqbHtueQbM7khpOoxkeNIuQ33WJoIHkhF30QBMiijGtammaJ0ZXAe8gpgi74jz6UdL84xi4ditHhipfXIkANX0ZDvXqv4nmfbFzjzDWdNPVNr6CHrCmRBLuhA1EK+H0Wa7r2PmkaJwX/03e0YY7Bl9gI2XeILEK+gCXnmmUT01IGTirKmqi+Tj4sMUxxub7DOK7Ei2oCqyci7xqAfpCR54ENVx4mbj51y+VgtbI9jZy3oOzjaTNL/aAIRMB4xJjd5wnnwwjOc+sKyg1SMQzo57toLbWFXz5czB0dupmNJZGrcesMJw+kPXF5IK900Rh1UK5nz3PhheWLLPND6eFgRuamKQ4X7fEo3hC0UztNUuvN/wJ90qb7GMtWeEXl9uC0EFRa8fpZzsqjTTws9u7p6Mtdcat5fh5rpEhbBaU0zOU6tu6IpcemtwiaI0fPSZjygDSwNhB2VkxPyLOgH1oC+NMq+QDaHpH9UCtKiW6pb1SuP1ZMC8CR7fH6WAvE3WihQsiRxw71q5+788JF3UbUnJ8hd7phWVtdd1GAHjKH19FZoljl52RGloeyg8H9FXNy9o+xvciYaXn8hJsS9xhlrpPV+fouFlEyPjNHAFJeQCnueQvxPPTJ0oCkU7oLKT1uZ1kB59GrU1x6JJ2SVpGzn2BmcIXDwT9KOF55RpZvntkVgK2iYQC2UWUYA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(5660300002)(2906002)(44832011)(4326008)(8676002)(8936002)(41300700001)(6666004)(70586007)(54906003)(70206006)(6916009)(316002)(40460700003)(478600001)(336012)(26005)(82740400003)(426003)(36756003)(36860700001)(47076005)(40480700001)(1076003)(2616005)(83380400001)(81166007)(356005)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:10:04.7446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 571ae12b-0bad-48a8-1323-08dbcfec4f01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS9J3hJ/TGqk1lMjozwTCosfPsRIVSCt8Cw3o0KMuzI=;
 b=bTTEkfrn9ljLGoWZYTeED2GSyWzHdEKkTDnfnZ31hXYHSGJoLBp/aYVxJbH8avYhHDloJisaPZ4GN4mDmAna4PNbeQasUGKwvHJl6jA/7NzryCZ5anCWwyT4DJTNH+YoksToW80EVUlftXBWot5cU2Tx7NmRleE+8gsfL/VZCAg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bTTEkfrn
Subject: [Buildroot] [PATCH v5 06/10] boot/uboot.mk: new zynqmp pmufw build
 option
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

The new BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option will enable u-boot to
use the zynqmp-firmware package for building a pmufw.elf that gets included in
the generated boot.bin.

If the BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE option is enabled, then the
BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw will
be ignored.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - patch is now backwards compatible for users already using the
   BR2_TARGET_UBOOT_ZYNQMP_PMUFW config for downloading a prebuilt pmufw
V2->V3:
 - no changes
V3->V4:
 - BR2_TARGET_UBOOT_ZYNQMP_PMUFW removed when
   BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE selected
V4->V5:
 - no changes
---
 boot/uboot/Config.in | 19 +++++++++++++++++--
 boot/uboot/uboot.mk  |  5 +++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 21f19db890..ef9e811764 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -514,11 +514,26 @@ config BR2_TARGET_UBOOT_ZYNQMP
 
 if BR2_TARGET_UBOOT_ZYNQMP
 
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
+	bool "Build zynqmp PMU firmware from source"
+	select BR2_TARGET_ZYNQMP_FIRMWARE
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	help
+	  This option instructs u-boot to build the zynqmp pmufw using
+	  the zynqmp-firmware package.  u-boot will then include this
+	  pmufw.elf in the generated boot.bin.
+	  
+	  If this option is selected, the BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+	  prebuilt option will be ignored.
+
+	  This feature requires U-Boot >= 2018.07.
+
 config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
-	string "PMU firmware location"
+	string "Pre-built zynqmp PMU firmware location"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	depends on !BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
 	help
-	  Location of a PMU firmware binary.
+	  Location of a pre-built PMU firmware binary.
 
 	  If not empty, instructs the U-Boot build process to generate
 	  a boot.bin (to be loaded by the ZynqMP boot ROM) containing
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a880..c11e3d89f7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -416,7 +416,12 @@ endef
 
 ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE),y)
+UBOOT_DEPENDENCIES += zynqmp-firmware
+UBOOT_ZYNQMP_PMUFW = $(BINARIES_DIR)/pmufw.elf
+else
 UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_SOURCE
 
 ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
 UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
