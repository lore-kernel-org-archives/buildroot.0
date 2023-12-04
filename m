Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D728C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 07:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4402881E95;
	Mon,  4 Dec 2023 07:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4402881E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUiuOe_glXvu; Mon,  4 Dec 2023 07:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FCDF81E62;
	Mon,  4 Dec 2023 07:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FCDF81E62
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4382E1BF33C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F2AD413D3
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F2AD413D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nL2ooFyrKAII for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 07:35:14 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99D05410B8
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 07:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99D05410B8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZQpnNfoe8+NLr39WSnJo+eqVWm4A3Y3/2hQdwQJFhho/mR+Lgs4ezqqBredX1GAuGvzXmXYgKGNefx26xbhnci8QCLRsPOx8Ey6LELSqGtiUQJBZyTD5KlEsefqnNyaraMR6V02uV4WPcRMXwybjfLKvqYZmSzVotoRbmEHDbnhWZOD16Ki0rQm+VDNV56a81pwXAXRskNuo6N9d9dBzd+VGK5z1r+/ZZbCEahp85I8feYtVOjg3IUGVBX9fEg6PQDYAHoaTY03GYKINZLSuu9a18joPc0lKuWwgb3vFuyYqNkpdJoFR7OGrUynAmT0rM714mHM3F1dvlaBFL53BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDenh9J0PHaPXc7vAx+ijwIidXSxV4G7MrcwGLsqpG0=;
 b=C/l3uzbehxoFFFIv7onPF2JZEAvLqFo3T2NyAgnZtEQembultfD9L98/FQpa1PlNVrrZi4lOuvyoaRG9pi+kHf5K2D6Oa77Kq+Z+GXEmZl14pgUAo77ZpqS4hD6a/mxY+C4kRqdIWwiI/s2vKN7zD+AbvfmIFSuPbOWmU6/XKOoFJlQg5by5SPUK9//BKxmm+ePxx5jAw4QrdtrYAgCl/bHtbIOEKsS/UVvV6rVoXM/WQu89x8ItqBGi7jR9Z3tUKvwD1fEC2W/pVyQW+zFJV8mtn1OvLhGJ4cSqDf0fELEJ0TU56AEbMeSrJCW6rFPoEUpwaGAoVvupzyLILSOcMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from DS7PR03CA0324.namprd03.prod.outlook.com (2603:10b6:8:2b::24) by
 SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.33; Mon, 4 Dec 2023 07:35:11 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::16) by DS7PR03CA0324.outlook.office365.com
 (2603:10b6:8:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Mon, 4 Dec 2023 07:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 07:35:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 01:35:04 -0600
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 01:35:03 -0600
To: <buildroot@buildroot.org>
Date: Mon, 4 Dec 2023 07:34:37 +0000
Message-ID: <20231204073443.1543587-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204073443.1543587-1-neal.frager@amd.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3595e2-e5d6-4d9f-30cd-08dbf49b8bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xmizcM7gKdRT9YcK4nItM7vqAbNyFGGyTqJpwnTOEBHxal4+qPo0146BYU/68UqHPZYfuQiv7smJc+1SQ/uCcmeewvBcXCnn0gvwf8tJYou97ZTgP+/r4NzUs6mAAJnCQINjCmKFhWPXR/KdwOZOws9iR5ZL/aqslJVAIz7kJqxljAgtHGJk2LvMnePrwT1BnSvXskWfPT8+O3kzooMDeyTsal2NvmiVv6IkKE5xtzqAg3GnqaydDJ61NN65V5Y33MF6zzEK5H2FodGq9MJiuoQZ++/eB/DyqspUBmQLFMDxDzQsz1Pva4/NrWa2pO2ILmW9TDXdnXG296ARTQmYAf7UoFPuybZ3UfzFyBO/uQHk1QMYZrqvDtVvyt3CQDzrayM9L3H5FHLFZNz171kApxStwsDNymdm05Z94NngvBXdpRZ6rHeK3ubi7wowMIrIw5bJUxzV9XlbjnJat1nAPfszMqoLwxwr4+jbJXIJL0szNZtxeq0+ojiZ/8XmKnMl/UhJPjLHC8G0EcXXOGCGYtEGffjsrV+c8FN44Gwmn3WENSQ8H+9PlcePMPacakg+AIFXr9UX7iPPyzDM+4t2PUMrc62RciBNNj1+vOhcd12HDy/wHz5ko4OjwHHz+W4vdfFdC8cwNT2jkdlVkJU2BtQv8ABn9cGysvnAVsSQxPZ1hKLTmQtcIVXKIJYr5EcldYiYhW3oCBdGG/9FKo+7NkMVEah1NXlQq2qvXjb9DSJN/Irfy8CY4J9yBfmJQdBWkZDm+n7GyLHyUA9N32OYCqbuM2XdTdhkiQlwHkZjLA8fouGy3VfG6UjljFSGLlpa
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(36840700001)(40470700004)(46966006)(5660300002)(40460700003)(44832011)(86362001)(4326008)(8676002)(8936002)(2906002)(30864003)(41300700001)(36756003)(2616005)(40480700001)(1076003)(356005)(81166007)(82740400003)(426003)(83380400001)(336012)(478600001)(26005)(6666004)(47076005)(36860700001)(316002)(54906003)(6916009)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:35:10.7697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3595e2-e5d6-4d9f-30cd-08dbf49b8bfd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDenh9J0PHaPXc7vAx+ijwIidXSxV4G7MrcwGLsqpG0=;
 b=3w6sRRcebd6Poc/vfwixUXDIhbNDOTa2r4vSOmeCnLOxawVkCjt5FIlJGiflSbC7dNNsdHJ6vK8IaBrj8baKtDpxJqytnBkNteZJ+cpnT2daK+qbLGRYmV/SS6T7/0cgKDve0/93s/lixAIkuUN/FuwAULHA95iT//ubc6kMvU4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3w6sRRce
Subject: [Buildroot] [PATCH v8 05/10] boot/zynqmp-firmware: new boot firmware
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

This patch adds a new boot firmware to buildroot for building the zynqmp pmufw.
It requires the toolchain-bare-metal package that includes a bare-metal
binutils, gcc and newlib which can be built for the microblaze architecture.

A patch is required to enable parallel building of the pmufw.  This patch has
been submitted upstream internally at AMD / Xilinx and is included with the
2023.2 release of the embeddedsw repository.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
 - builds a bare-metal gcc toolchain instead of requiring an external
   microblaze toolchain
V2->V3:
 - corrected custom cflags option
 - added support for xilinx_v2022.2 version
 - added zynqmp-firmware.hash
V3->V4:
 - no changes
V4->V5:
 - reduced all lines to <80 chars
V5->V6:
 - migrated to toolchain-bare-metal-buildroot
V6->V7:
 - removed patch numbers
 - changed dependency to toolchain-bare-metal-buildroot
 - removed hash since version is configurable
V7->V8:
 - no changes
---
 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/zynqmp-firmware/Config.in                |  22 ++++
 ...akefile-specify-sequential-Makefiles.patch |   1 +
 ...akefile-specify-sequential-Makefiles.patch | 115 ++++++++++++++++++
 boot/zynqmp-firmware/zynqmp-firmware.mk       |  33 +++++
 6 files changed, 173 insertions(+)
 create mode 100644 boot/zynqmp-firmware/Config.in
 create mode 120000 boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
 create mode 100644 boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
 create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53e24aebed..828870c4b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2214,6 +2214,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/zynqmp-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad43..c7478fef2e 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -24,5 +24,6 @@ source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/zynqmp-firmware/Config.in"
 
 endmenu
diff --git a/boot/zynqmp-firmware/Config.in b/boot/zynqmp-firmware/Config.in
new file mode 100644
index 0000000000..b567efe634
--- /dev/null
+++ b/boot/zynqmp-firmware/Config.in
@@ -0,0 +1,22 @@
+config BR2_TARGET_ZYNQMP_FIRMWARE
+	bool "zynqmp-firmware"
+	select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	help
+	  This package builds the PMU Firmware application required
+	  to run U-Boot and Linux in the Zynq MPSoC devices.
+
+if BR2_TARGET_ZYNQMP_FIRMWARE
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2023.2"
+	help
+	  Release version of zynqmp firmware.
+	  Only versions xilinx_v2022.2 and newer are supported.
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building zynqmp firmware.
+
+endif # BR2_TARGET_ZYNQMP_FIRMWARE
diff --git a/boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch b/boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
new file mode 120000
index 0000000000..51cb8a6ae0
--- /dev/null
+++ b/boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
@@ -0,0 +1 @@
+../xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
\ No newline at end of file
diff --git a/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
new file mode 100644
index 0000000000..92dedc7e81
--- /dev/null
+++ b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
@@ -0,0 +1,115 @@
+From 23002defd462845db376425a7b7d975f3deba83d Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 24 Apr 2023 12:53:25 +0100
+Subject: [PATCH] pmufw: misc/Makefile: specify sequential Makefiles
+
+The BSP_SEQUENTIAL_MAKEFILES variable is not properly assigned and exported
+from copy_bsp.sh.
+
+Because of this, no library is built sequentially even if it was desired to
+build them sequentially by assigning to BSP_SEQUENTIAL_MAKEFILES. All the
+libraries are built in parallel.
+
+This patch resolves this issue, so that libraries that must be built
+sequentially are indeed built sequentially.
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ lib/sw_apps/zynqmp_pmufw/misc/Makefile    | 10 +++++++++-
+ lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh |  7 -------
+ lib/sw_apps/zynqmp_pmufw/src/Makefile     |  2 ++
+ 3 files changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/lib/sw_apps/zynqmp_pmufw/misc/Makefile b/lib/sw_apps/zynqmp_pmufw/misc/Makefile
+index a773498512..fe2d23c965 100644
+--- a/lib/sw_apps/zynqmp_pmufw/misc/Makefile
++++ b/lib/sw_apps/zynqmp_pmufw/misc/Makefile
+@@ -7,6 +7,14 @@ PROCESSOR = psu_pmu_0
+ LIBRARIES = ${PROCESSOR}/lib/libxil.a
+ BSP_MAKEFILES := $(wildcard $(PROCESSOR)/libsrc/*/src/Makefile)
+ SUBDIRS := $(patsubst %/Makefile, %, $(BSP_MAKEFILES))
++DRIVERS_LIST=../drivers.txt
++SEQUENTIAL_MAKEFILES := $(shell cat ${DRIVERS_LIST})
++BSP_SEQUENTIAL_MAKEFILES = $(patsubst %, ${PROCESSOR}/libsrc/%/src/Makefile, $(SEQUENTIAL_MAKEFILES))
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilskey/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilfpga/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/xilsecure/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/dppsu/src/Makefile
++BSP_SEQUENTIAL_MAKEFILES += ${PROCESSOR}/libsrc/dpdma/src/Makefile
+ BSP_PARALLEL_MAKEFILES := $(filter-out $(BSP_SEQUENTIAL_MAKEFILES),$(BSP_MAKEFILES))
+ SEQ_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_SEQUENTIAL_MAKEFILES))
+ PAR_SUBDIRS := $(patsubst %/Makefile, %, $(BSP_PARALLEL_MAKEFILES))
+@@ -16,7 +24,7 @@ ifneq (,$(findstring win,$(RDI_PLATFORM)))
+ endif
+ 
+ all:
+-	$(MAKE) --no-print-directory seq_libs
++	$(MAKE) -j1 --no-print-directory seq_libs
+ 	$(MAKE) -j --no-print-directory par_libs
+ 	$(MAKE) --no-print-directory archive
+ 	@echo 'Finished building libraries'
+diff --git a/lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh b/lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh
+index 197f7af844..ac8dd8249e 100755
+--- a/lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh
++++ b/lib/sw_apps/zynqmp_pmufw/misc/copy_bsp.sh
+@@ -29,8 +29,6 @@ STANDALONE_DIR=$EMBEDDED_SW_DIR/lib/bsp/standalone/src
+ # libraries dir
+ SERVICES_DIR=$EMBEDDED_SW_DIR/lib/sw_services
+ 
+-BSP_SEQUENTIAL_MAKEFILES=
+-
+ # creation of BSP folders required
+ if [ -d $BSP_DIR ]; then
+ 	echo "BSP directory already exists"
+@@ -55,14 +53,12 @@ cp -r $SERVICES_DIR/xilfpga/src/interface/zynqmp/xilfpga_pcap.c $BSP_DIR/libsrc/
+ cp -r $SERVICES_DIR/xilfpga/src/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilfpga/src/interface/zynqmp/*.h $BSP_DIR/include/
+ rm -r $BSP_DIR/libsrc/xilfpga/src/interface/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilfpga/src/Makefile"
+ mkdir -p $BSP_DIR/libsrc/xilsecure/src/
+ cp -r $SERVICES_DIR/xilsecure/src/Makefile $BSP_DIR/libsrc/xilsecure/src/
+ cp -r $SERVICES_DIR/xilsecure/src/common/all/* $BSP_DIR/libsrc/xilsecure/src/
+ cp -r $SERVICES_DIR/xilsecure/src/zynqmp/* $BSP_DIR/libsrc/xilsecure/src/
+ cp -r $SERVICES_DIR/xilsecure/src/common/all/*.h $BSP_DIR/include/
+ cp -r $SERVICES_DIR/xilsecure/src/zynqmp/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilsecure/src/Makefile"
+ cp -r $SERVICES_DIR/xilskey/ $BSP_DIR/libsrc/
+ 
+ # remove the xilskey library files which are not required for PMU
+@@ -84,7 +80,6 @@ rm -r $BSP_DIR/libsrc/xilskey/src/include/xilskey_bbram.h
+ # copy the xilskey library header files to include directory
+ cp -r $BSP_DIR/libsrc/xilskey/src/*.h $BSP_DIR/include/
+ cp -r $BSP_DIR/libsrc/xilskey/src/include/*.h $BSP_DIR/include/
+-BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/xilskey/src/Makefile"
+ 
+ # copy bsp standalone code
+ cp -r $STANDALONE_DIR/common/*  $BSP_DIR/libsrc/standalone/src/
+@@ -113,7 +108,6 @@ do
+ 	if [ $line != "avbuf" ] && [ $line != "video_common" ]; then
+ 		cp $WORKING_DIR/x"$line"_g.c $BSP_DIR/libsrc/$line/src/
+ 	fi
+-	BSP_SEQUENTIAL_MAKEFILES="$BSP_SEQUENTIAL_MAKEFILES $BSP_DIR/libsrc/$line/src/Makefile"
+ 
+ done < $DRIVERS_LIST
+ 
+@@ -136,4 +130,3 @@ cp $STANDALONE_DIR/profile/*.h  $BSP_DIR/include/
+ 
+ # no inbyte and outbyte present in standalone
+ cp $WORKING_DIR/inbyte.c $WORKING_DIR/outbyte.c  $BSP_DIR/libsrc/standalone/src/
+-export BSP_SEQUENTIAL_MAKEFILES
+diff --git a/lib/sw_apps/zynqmp_pmufw/src/Makefile b/lib/sw_apps/zynqmp_pmufw/src/Makefile
+index 1750c0a329..8747db5cdf 100644
+--- a/lib/sw_apps/zynqmp_pmufw/src/Makefile
++++ b/lib/sw_apps/zynqmp_pmufw/src/Makefile
+@@ -27,6 +27,8 @@ all: $(EXEC)
+ $(EXEC): $(LIBS) $(OBJS) $(INCLUDES)
+ 	$(CC) -o $@ $(OBJS) $(CC_FLAGS) $(CFLAGS) $(LN_FLAGS) $(LIBPATH) $(LSCRIPT)
+ 
++$(OBJS): $(LIBS)
++
+ $(LIBS):
+ 	echo "Copying BSP files"
+ 	../misc/copy_bsp.sh
+-- 
+2.17.1
+
diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
new file mode 100644
index 0000000000..383d888fba
--- /dev/null
+++ b/boot/zynqmp-firmware/zynqmp-firmware.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# zynqmp-firmware
+#
+################################################################################
+
+ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_SITE = \
+	$(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_LICENSE = MIT
+ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
+ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
+ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
+ZYNQMP_FIRMWARE_DEPENDENCIES = toolchain-bare-metal-buildroot
+
+CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))
+ZYNQMP_FIRMWARE_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
+
+define ZYNQMP_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(ZYNQMP_FIRMWARE_CFLAGS)
+endef
+
+ZYNQMP_PMUFW = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf
+
+define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(ZYNQMP_PMUFW) $(BINARIES_DIR)/pmufw.elf
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
