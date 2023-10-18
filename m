Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11017CDB484
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 15:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C33D481DED;
	Wed, 18 Oct 2023 15:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C33D481DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45JrSKhehAjJ; Wed, 18 Oct 2023 15:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3839382A2D;
	Wed, 18 Oct 2023 15:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3839382A2D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62C611BF342
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F16D8270B
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 15:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F16D8270B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1kQ4TfVN_8S for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 15:11:15 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::617])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D9B082919
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 15:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D9B082919
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcr37/aarq+5TnkEomaSDnR6I3YjBs3F/qEaZJiRVIod45Lz9wH4xNBRpj4jkM52IPoFsr5f6LMFnC3hNebBgHDhifDeQynLAw8xjvu9wbC2B0ktF81lHYNcHFwJNoFMF4aQ0ZVKiq1pVT4Lv65fB3g2ruSiF/NkPRw6eeQELJogxdHhoRrFyLKqkYhO3sLyqkxhJdMUT9hE0klfmWY9YaQ6LjSMH6riDi774B+wgmFiOBgUxMQoQPC8Z1UWQs4IiLihmmW1Z1Ff3JGzjJ7BhlOaTTHAtdca/4WipTyiNUCD1QPpKiYOruSzE6jjSm5o5+cz6rbWk5nVWLa+8TxBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZySROfk8MM07n3DYjmegVjQUezfXErM8M2aplsmXPw=;
 b=CsQ08egM+1GmGVOooFkvS6+4sqKCwY4gSQn+KZXpQNdZJEIIsWZltZefAegyxJjeq4bwRH4wtadQqoUB0gnCNWb6wXA8D81t96/2yOOSEywLBWCoDKNdmsRm2fI/fxvU3rw52/wXLApFedO8CSb2bEQm4l3RA4RYW9l21U0kmkYr4398WmcwjkY4xgIquPQ2U8j26m/Lg5nk+nO0oIHmXpLcy5XDuxB76Gx89/cBE9sLTySzgm5nDMG4f8tTNC2vdWLA3VLa+Wu/Yz/T2totDkzkN8wwqahxG9PIYXVkqDckNKg5QlxDnv5ySKGIy06VPjsEV3t6Ky9y4x+6HXi67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MN2PR08CA0027.namprd08.prod.outlook.com (2603:10b6:208:239::32)
 by IA0PR12MB7506.namprd12.prod.outlook.com (2603:10b6:208:442::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 15:11:11 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::f5) by MN2PR08CA0027.outlook.office365.com
 (2603:10b6:208:239::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 15:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Wed, 18 Oct 2023 15:11:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 10:10:11 -0500
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 18 Oct 2023 10:10:10 -0500
To: <buildroot@buildroot.org>
Date: Wed, 18 Oct 2023 16:09:30 +0100
Message-ID: <20231018150932.3961564-8-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018150932.3961564-1-neal.frager@amd.com>
References: <20231018150932.3961564-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|IA0PR12MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efbc650-44fd-4ee6-1bca-08dbcfec75f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+Et20vMmQ8kWKnEwS1J1MdcS5goK6/WPtOl9s/AMtd62RmHYp1vaqSD3QroKGZCPnO1Z6QX0874/lLjAQoI6tW6wmV67Gf1ilqHZsrKrMJ9ywc+FttZYQGCdjBzJzr7KhCop18u3Z7ofKBb0a4bEAYudkntFXs5ntv8Kjz9wJ6bbnAPBP0LCsy1oYSWNg36D/I76/46ej6Bl2LBswYDfO+FnQF1wwBCsVt8sdRnKiUsgDhXElOS1cjzd4Rb4b83zo1LMlVPfTdNG8mCez/y8J3VPcZafSiGEobQl+6Ww1ovYqqF9cGgQvl15nL0P8ft7uLGapiege94oX6yzOsRh1g9U7Mgm0vBQpV3oOjxv5coiSlD26J3xl80RfOExE/MfDcXdpaCb/aEE5BckdFC5JlpDlDYH7VpcYQql7Ojf7U78h1MCpN+//Q6k5dvtpNijRy9EhWgd2FiCxjv/oEn2ClNb3jvissbJoSlsQ6D7oQSiYQD1yNOyTy7SFhDCtV/VzO2cU3ekIlx+wRgCw0zcy1nqJnpoN6ew9K+21yaerKJTJbaG0QPsIi0YNaOsKdIYXAsLYk1koKUKOERbqian9/EgMleOu0vxtlj+OHa2wMn/YiogXLdEATZl0unzhrSvVSlHFnf4b3riijrgQ0TD1NELh+57Z2oAew5YFivxQFMYKJJ8/Cpty6iOa0B4VkOYt7gfdfJmRPGE+fETiMpg5ZL6R+sq0GNE/qruH1F1zoVO2SXsMnVgKupsDg0zNcPF/k4BX1EqFFzDCyfVli6Sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(316002)(40460700003)(70586007)(54906003)(6916009)(70206006)(40480700001)(426003)(83380400001)(47076005)(36756003)(26005)(336012)(356005)(81166007)(86362001)(36860700001)(82740400003)(478600001)(2906002)(30864003)(1076003)(2616005)(6666004)(41300700001)(5660300002)(44832011)(4326008)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:11:10.0101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efbc650-44fd-4ee6-1bca-08dbcfec75f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7506
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZySROfk8MM07n3DYjmegVjQUezfXErM8M2aplsmXPw=;
 b=CPFYc77yjd/vY2g8meL9iqpmab/hr2d++QH6eCLjCI+o/RDHoevPgAx4PsYu/uF73bA+7VNehq3ZLaVoKpJKNNQLeW/bmW2VXbQxmUuSUbXqOy5PmFq5CdZO3yJk4q4dOr+Eb55uiGPEomBxM3c39/UK6DMUYn+KP+DRUyphdyY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CPFYc77y
Subject: [Buildroot] [PATCH v5 08/10] boot/versal-firmware: new boot firmware
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

This patch adds a new boot firmware to buildroot for building the versal plm
and psmfw.  It requires the toolchain-bare-metal package that includes a
bare-metal binutils, gcc and newlib which can be built for the microblaze
architecture.

Patches are required to enable parallel building of the versal plm and psmfw
applications.  These two patches have been submitted upstream internally at
AMD / Xilinx and will be included with the 2023.2 release of the embeddedsw
repository.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V4->V5:
 - automatically select bootgen as a needed tool
 - reduce all lines to <80 chars
 - add help for PDI file location which could be URL or local
---
 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/versal-firmware/Config.in                |  38 +++++
 boot/versal-firmware/versal-firmware.hash     |   2 +
 boot/versal-firmware/versal-firmware.mk       |  52 ++++++
 ...al_plm-add-support-of-parallel-build.patch | 157 ++++++++++++++++++
 ..._psmfw-add-support-of-parallel-build.patch |  48 ++++++
 7 files changed, 299 insertions(+)
 create mode 100644 boot/versal-firmware/Config.in
 create mode 100644 boot/versal-firmware/versal-firmware.hash
 create mode 100644 boot/versal-firmware/versal-firmware.mk
 create mode 100644 boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
 create mode 100644 boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index c8e8038d44..9f9e36c674 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2198,6 +2198,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/versal-firmware/
 F:	boot/zynqmp-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index c7478fef2e..da5ccb6b9c 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -23,6 +23,7 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
+source "boot/versal-firmware/Config.in"
 source "boot/vexpress-firmware/Config.in"
 source "boot/zynqmp-firmware/Config.in"
 
diff --git a/boot/versal-firmware/Config.in b/boot/versal-firmware/Config.in
new file mode 100644
index 0000000000..8714c51788
--- /dev/null
+++ b/boot/versal-firmware/Config.in
@@ -0,0 +1,38 @@
+config BR2_TARGET_VERSAL_FIRMWARE
+	bool "versal-firmware"
+	select BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL
+	select BR2_PACKAGE_HOST_BOOTGEN
+	help
+	  This package builds the boot firmware apps for Xilinx versal
+	  boards, so that they can boot u-boot and Linux.
+
+if BR2_TARGET_VERSAL_FIRMWARE
+
+config BR2_TARGET_VERSAL_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2023.1"
+	help
+	  Release version of versal firmware.
+	  Only versions xilinx_v2023.1 and newer are supported.
+	  
+config BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building versal firmware.
+
+config BR2_TARGET_VERSAL_FIRMWARE_PDI
+	string "pdi file location"
+	default "https://github.com/Xilinx/soc-prebuilt-firmware/raw/xilinx_v2023.1/vck190-versal/vpl_gen_fixed.pdi"
+	help
+	  The PDI file defines everything which is board specific for versal.
+	  It gets parsed by the plm.elf during boot.  To boot a custom target
+	  based on versal, this should be configured to point to your Vivado
+	  generated PDI file.
+	  
+	  The location of the PDI can be either a URL for download or a file
+	  in the local repository.
+	  
+	  This config should never be undefined, so default configuration is
+	  for the vck190 evaluation board.
+
+endif # BR2_TARGET_VERSAL_FIRMWARE
diff --git a/boot/versal-firmware/versal-firmware.hash b/boot/versal-firmware/versal-firmware.hash
new file mode 100644
index 0000000000..3a03f9c3ff
--- /dev/null
+++ b/boot/versal-firmware/versal-firmware.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  9850f893113936b9959cc76cc3e9152e30f815ff1acaa4b45f7a60fe3e1836f0  versal-firmware-xilinx_v2023.1.tar.gz
diff --git a/boot/versal-firmware/versal-firmware.mk b/boot/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..6d49a52d37
--- /dev/null
+++ b/boot/versal-firmware/versal-firmware.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# versal-firmware
+#
+################################################################################
+
+VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = \
+	$(call github,Xilinx,embeddedsw,$(VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = MIT
+VERSAL_FIRMWARE_LICENSE_FILES = license.txt
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+VERSAL_FIRMWARE_INSTALL_TARGET = NO
+VERSAL_FIRMWARE_DEPENDENCIES = host-newlib-bare-metal
+
+CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_CUSTOM_CFLAGS))
+VERSAL_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
+
+VERSAL_FIRMWARE_PDI = $(call qstrip,$(BR2_TARGET_VERSAL_FIRMWARE_PDI))
+
+ifneq ($(findstring ://,$(VERSAL_FIRMWARE_PDI)),)
+VERSAL_FIRMWARE_EXTRA_DOWNLOADS = $(VERSAL_FIRMWARE_PDI)
+BR_NO_CHECK_HASH_FOR += $(notdir $(VERSAL_FIRMWARE_PDI))
+PDI_PATH = $(VERSAL_FIRMWARE_DL_DIR)/$(notdir $(VERSAL_FIRMWARE_PDI))
+else ifneq ($(VERSAL_FIRMWARE_PDI),)
+PDI_PATH = $(shell readlink -f $(VERSAL_FIRMWARE_PDI))
+endif #VERSAL_FIRMWARE_PDI
+
+define VERSAL_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(VERSAL_CFLAGS)
+		
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(VERSAL_CFLAGS)
+endef
+
+PLM_PATH = $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf
+PSMFW_PATH = $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(PLM_PATH) $(BINARIES_DIR)/plm.elf
+	$(INSTALL) -D -m 0755 $(PSMFW_PATH) $(BINARIES_DIR)/psmfw.elf
+	$(INSTALL) -D -m 0755 $(PDI_PATH) $(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
+
+$(eval $(generic-package))
diff --git a/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch b/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
new file mode 100644
index 0000000000..84fffc1d82
--- /dev/null
+++ b/boot/versal-firmware/xilinx_v2023.1/0001-sw_apps-versal_plm-add-support-of-parallel-build.patch
@@ -0,0 +1,157 @@
+From 245509f87776c7727973480f08ead6f293a2f3b2 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 4 Sep 2023 07:08:02 +0100
+Subject: [PATCH 1/2] sw_apps:versal_plm: add support of parallel build
+
+The build fails when make command is invoked with -j option.
+The root cause is, BSP_SEQUENTIAL_MAKEFILES variable is not assigned
+and exported properly in copy_bsp.sh file. Also, the 'all' target in
+src/Makefile tries to compile the source code before bsp copy was
+finished when -j option is enabled during build.
+
+Added BSP_SEQUENTIAL_MAKEFILES in the misc/Makefile to resolve the
+export issue and corrected dependency in the src/Makefile to let the bsp
+copy finished before compiling the source.
+
+Signed-off-by: Duvvi Divya <Duvvi.Divya@xilinx.com>
+Acked-by: Sreedhar Kundella <sreedhar.k@xilinx.com>
+---
+ lib/sw_apps/versal_plm/misc/versal/Makefile    | 12 +++++++++++-
+ lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh | 11 -----------
+ lib/sw_apps/versal_plm/src/versal/Makefile     |  2 ++
+ 3 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/lib/sw_apps/versal_plm/misc/versal/Makefile b/lib/sw_apps/versal_plm/misc/versal/Makefile
+index 5c8e719e9c..d735f64530 100644
+--- a/lib/sw_apps/versal_plm/misc/versal/Makefile
++++ b/lib/sw_apps/versal_plm/misc/versal/Makefile
+@@ -7,6 +7,16 @@ PROCESSOR = psv_pmc_0
+ LIBRARIES = ${PROCESSOR}/lib/libxil.a
+ BSP_MAKEFILES := $(wildcard $(PROCESSOR)/libsrc/*/src/Makefile)
+ SUBDIRS := $(patsubst %/Makefile, %, $(BSP_MAKEFILES))
++DRIVERS_LIST=../drivers.txt
++SEQUENTIAL_MAKEFILES := $(shell cat ${DRIVERS_LIST})
++BSP_SEQUENTIAL_MAKEFILES = $(patsubst %, ${PROCESSOR}/libsrc/%/src/Makefile, $(SEQUENTIAL_MAKEFILES))
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilffs/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilpdi/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilplmi/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilpuf/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilloader/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilnvm/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilsecure/src/Makefile
+ BSP_PARALLEL_MAKEFILES := $(filter-out $(BSP_SEQUENTIAL_MAKEFILES),$(BSP_MAKEFILES))
+ SEQ_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_SEQUENTIAL_MAKEFILES))
+ PAR_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_PARALLEL_MAKEFILES))
+@@ -16,7 +26,7 @@ ifneq (,$(findstring win,$(RDI_PLATFORM)))
+ endif
+ 
+ all:
+-	$(MAKE) --no-print-directory seq_libs
++	$(MAKE) -j1 --no-print-directory seq_libs
+ 	$(MAKE) -j --no-print-directory par_libs
+ 	$(MAKE) --no-print-directory archive
+ 	@echo 'Finished building libraries'
+diff --git a/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh b/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh
+index 404e588ae2..244d36e2ee 100755
+--- a/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh
++++ b/lib/sw_apps/versal_plm/misc/versal/copy_bsp.sh
+@@ -29,7 +29,6 @@ STANDALONE_DIR=$EMBEDDED_SW_DIR/lib/bsp/standalone/src
+ 
+ # libraries dir
+ SERVICES_DIR=$EMBEDDED_SW_DIR/lib/sw_services
+-BSP_SEQUENTIAL_MAKEFILES=
+ 
+ # creation of BSP folders required
+ if [ -d $BSP_DIR ]; then
+@@ -52,7 +51,6 @@ fi
+ mkdir -p $BSP_DIR/libsrc/xilffs
+ cp -r $SERVICES_DIR/xilffs/src $BSP_DIR/libsrc/xilffs/
+ cp -r $SERVICES_DIR/xilffs/src/include/* $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilffs/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilpdi/src
+ cp -r $SERVICES_DIR/xilpdi/src/Makefile $BSP_DIR/libsrc/xilpdi/src
+@@ -60,7 +58,6 @@ cp -r $SERVICES_DIR/xilpdi/src/versal/* $BSP_DIR/libsrc/xilpdi/src/
+ cp -r $SERVICES_DIR/xilpdi/src/versal/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilpdi/src/common/* $BSP_DIR/libsrc/xilpdi/src/
+ cp -r $SERVICES_DIR/xilpdi/src/common/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilpdi/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilplmi/src
+ cp -r $SERVICES_DIR/xilplmi/src/Makefile $BSP_DIR/libsrc/xilplmi/src
+@@ -68,14 +65,12 @@ cp -r $SERVICES_DIR/xilplmi/src/versal/* $BSP_DIR/libsrc/xilplmi/src/
+ cp -r $SERVICES_DIR/xilplmi/src/versal/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilplmi/src/common/* $BSP_DIR/libsrc/xilplmi/src/
+ cp -r $SERVICES_DIR/xilplmi/src/common/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilplmi/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilpuf/src
+ cp -r $SERVICES_DIR/xilpuf/src/Makefile $BSP_DIR/libsrc/xilpuf/src
+ cp -r $SERVICES_DIR/xilpuf/src/common/* $BSP_DIR/libsrc/xilpuf/src
+ cp -r $SERVICES_DIR/xilpuf/src/server/* $BSP_DIR/libsrc/xilpuf/src
+ cp -r $BSP_DIR/libsrc/xilpuf/src/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilpuf/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilloader/src
+ cp -r $SERVICES_DIR/xilloader/src/Makefile $BSP_DIR/libsrc/xilloader/src
+@@ -83,7 +78,6 @@ cp -r $SERVICES_DIR/xilloader/src/versal/* $BSP_DIR/libsrc/xilloader/src/
+ cp -r $SERVICES_DIR/xilloader/src/versal/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilloader/src/common/* $BSP_DIR/libsrc/xilloader/src/
+ cp -r $SERVICES_DIR/xilloader/src/common/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilloader/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilpm/src/
+ cp -r $SERVICES_DIR/xilpm/src/versal/common/* $BSP_DIR/libsrc/xilpm/src/
+@@ -94,7 +88,6 @@ cp -r $SERVICES_DIR/xilpm/src/versal_common/server/* $BSP_DIR/libsrc/xilpm/src/
+ cp -r $SERVICES_DIR/xilpm/src/versal_common/server/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilpm/src/versal_common/common/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilpm/src/versal_common/common/* $BSP_DIR/libsrc/xilpm/src/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilpm/src/versal/common/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilnvm/src
+ cp -r $SERVICES_DIR/xilnvm/src/Makefile $BSP_DIR/libsrc/xilnvm/src
+@@ -103,7 +96,6 @@ cp -r $SERVICES_DIR/xilnvm/src/versal/server/* $BSP_DIR/libsrc/xilnvm/src/
+ cp -r $SERVICES_DIR/xilnvm/src/common/server/* $BSP_DIR/libsrc/xilnvm/src/
+ cp -r $SERVICES_DIR/xilnvm/src/common/* $BSP_DIR/libsrc/xilnvm/src/
+ cp $BSP_DIR/libsrc/xilnvm/src/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilnvm/src/Makefile"
+ 
+ mkdir -p $BSP_DIR/libsrc/xilsecure/src
+ cp -r $SERVICES_DIR/xilsecure/src/Makefile $BSP_DIR/libsrc/xilsecure/src
+@@ -115,7 +107,6 @@ cp -r $SERVICES_DIR/xilsecure/src/versal/common/* $BSP_DIR/libsrc/xilsecure/src/
+ cp $BSP_DIR/libsrc/xilsecure/src/*.h $BSP_DIR/include/
+ mv $BSP_DIR/libsrc/xilsecure/src/libxilsecure_pmc.a $BSP_DIR/libsrc/xilsecure/src/libxilsecure.a
+ rm -f $BSP_DIR/libsrc/xilsecure/src/libxilsecure_*.a
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilsecure/src/Makefile"
+ 
+ # copy bsp standalone code
+ cp -r $STANDALONE_DIR/common/*  $BSP_DIR/libsrc/standalone/src/
+@@ -144,7 +135,6 @@ do
+     cp -r $DRIVERS_DIR/$line/src/*.h $BSP_DIR/include/
+ # copy all the HSM generated driver files DRIVER_g.c
+ 	cp $WORKING_DIR/x"$line"_g.c $BSP_DIR/libsrc/$line/src/
+-	BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/$line/src/Makefile"
+ done < $DRIVERS_LIST
+ 
+ #copy the processor code.
+@@ -176,4 +166,3 @@ cp $STANDALONE_DIR/microblaze/*.h  $BSP_DIR/include/
+ 
+ # no inbyte and outbyte present in standalone
+ cp $WORKING_DIR/inbyte.c $WORKING_DIR/outbyte.c  $BSP_DIR/libsrc/standalone/src/
+-export BSP_SEQUENTIAL_MAKEFILES
+diff --git a/lib/sw_apps/versal_plm/src/versal/Makefile b/lib/sw_apps/versal_plm/src/versal/Makefile
+index 15956c8a14..a944225845 100644
+--- a/lib/sw_apps/versal_plm/src/versal/Makefile
++++ b/lib/sw_apps/versal_plm/src/versal/Makefile
+@@ -32,6 +32,8 @@ all: $(EXEC)
+ $(EXEC): $(LIBS) $(OBJS) $(INCLUDES)
+ 	$(CC) -o $@ $(OBJS) $(CC_FLAGS) $(CFLAGS) $(LN_FLAGS) $(LIBPATH) $(LSCRIPT)
+ 
++$(OBJS): $(LIBS)
++
+ $(LIBS):
+ 	echo "Copying BSP files"
+ 	../../misc/versal/copy_bsp.sh
+-- 
+2.25.1
+
diff --git a/boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch b/boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch
new file mode 100644
index 0000000000..7918f20946
--- /dev/null
+++ b/boot/versal-firmware/xilinx_v2023.1/0002-sw_apps-versal_psmfw-add-support-of-parallel-build.patch
@@ -0,0 +1,48 @@
+From 2ed864ef5965b7466fb145f479ce0747123f2ce0 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 4 Sep 2023 07:14:38 +0100
+Subject: [PATCH 2/2] sw_apps:versal_psmfw: add support of parallel build
+
+The PSMFW build fails when make command is invoked with -j option.
+The root cause is, the 'all' target in src/Makefile tries to compile
+the source code before bsp copy was finished when -j option is
+enabled during build.
+
+Corrected dependency in the src/Makefile to let the bsp copy
+finished before compiling the source.
+
+Signed-off-by: Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>
+---
+ lib/sw_apps/versal_psmfw/misc/Makefile       | 2 +-
+ lib/sw_apps/versal_psmfw/src/versal/Makefile | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/sw_apps/versal_psmfw/misc/Makefile b/lib/sw_apps/versal_psmfw/misc/Makefile
+index 02d85e492e..92d95d0896 100644
+--- a/lib/sw_apps/versal_psmfw/misc/Makefile
++++ b/lib/sw_apps/versal_psmfw/misc/Makefile
+@@ -17,7 +17,7 @@ ifneq (,$(findstring win,$(RDI_PLATFORM)))
+ endif
+ 
+ all:
+-	$(MAKE) --no-print-directory seq_libs
++	$(MAKE) -j1 --no-print-directory seq_libs
+ 	$(MAKE) -j --no-print-directory par_libs
+ 	$(MAKE) --no-print-directory archive
+ 	@echo 'Finished building libraries'
+diff --git a/lib/sw_apps/versal_psmfw/src/versal/Makefile b/lib/sw_apps/versal_psmfw/src/versal/Makefile
+index 1572bbbca9..3f1589283b 100644
+--- a/lib/sw_apps/versal_psmfw/src/versal/Makefile
++++ b/lib/sw_apps/versal_psmfw/src/versal/Makefile
+@@ -33,6 +33,8 @@ all: $(EXEC)
+ $(EXEC): $(LIBS) $(OBJS) $(INCLUDES)
+ 	$(CC) -o $@ $(OBJS) $(CC_FLAGS) $(CFLAGS) $(LN_FLAGS) $(LIBPATH) $(LSCRIPT)
+ 
++$(OBJS): $(LIBS)
++
+ $(LIBS):
+ 	echo "Copying BSP files"
+ 	../../misc/copy_bsp.sh
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
