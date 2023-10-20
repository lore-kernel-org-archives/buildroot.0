Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6230CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 11:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46ABB704D4;
	Fri, 20 Oct 2023 11:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46ABB704D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJuO5afJbfAH; Fri, 20 Oct 2023 11:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A6FA704DC;
	Fri, 20 Oct 2023 11:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A6FA704DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 930E31BF3A9
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E3C04EC90
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 11:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3C04EC90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GtiBT5FYbvfl for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 11:43:24 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25FA84EC6B
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 11:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25FA84EC6B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oi+AzBSuIcj/o2TYGCU4bp/lwVJFw+GxUhl7kBe79kNfRdi8T+HFS2iZR0r3AXW9wubXHpc27KAVIi3wg2de/OXVIoSQW0b95qx1uKFlplVOWaYM38kdT+gT+w561C8EDPoOKm2RRxl2BcoKE7ZWU/FQUovN7h/tMdbAfaoHj3zsH7w1e5dxRClE93mGD8o1+Azh5g5dL8LV+UFBMoc192WsUeZTqDX+vFTOT/5tcknl1R/W8vNqHQCXQsQmoYy5JCjslUJgYMU2gTOwkyBcncUdCMm+kDUWMqgD+rySUk51Wmq92YZPCH+RZmJ3NY3oUWFovGtDrBIq8gXUiK7zDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P56YtZcM3VfY6HKfpFSozuB39wMWzOPdgrGcaGy9nGY=;
 b=mCrFO1dvwqOoDpD8lrAm0XETxsMDM7h8cb+31/FZHZU9seClTDymC0iQK1ik05wTbilY6m/LOagriLxugb+bHKJvashHKf+pCeHZpFGreJyKx8hn5027X1G5RhGy3GZN8SVO4lSmjsuLqYLJaaFySaQkRVpYIc4hWjnJF0knLHxrJ/rUj2SQBHiRHPs6Hm9GcjLBid0t/laH5p03LkdOhwC0dX//HW1wiCXSODtD3hAHmUFG/siiVPguL65+axwsdIXy7hQuKMbLq2dLx+nmN0EYTAMvj1lKtuxWT6hOheX139gDKVT+VDlNkRI+SGX54jG4atmANjOjftLknLjPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from SA0PR11CA0001.namprd11.prod.outlook.com (2603:10b6:806:d3::6)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Fri, 20 Oct
 2023 11:43:18 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::3) by SA0PR11CA0001.outlook.office365.com
 (2603:10b6:806:d3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24 via Frontend
 Transport; Fri, 20 Oct 2023 11:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 11:43:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 06:43:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 20 Oct
 2023 04:43:06 -0700
Received: from xirengwts09.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 20 Oct 2023 06:43:05 -0500
To: <buildroot@buildroot.org>
Date: Fri, 20 Oct 2023 12:42:31 +0100
Message-ID: <20231020114236.4129636-5-neal.frager@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: eafe927e-acf9-4578-e524-08dbd161c0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukTclaIn89pH4e+R0UPhqQTl6yRhaSD2bCLW559ODdQs3tQA/UujxvOIs2Z03naECgKFdZXFE+pFQwqc1JSE7VgbOl+cRdyiPiKYaGeE5UIrX46leSESb4WXfdFTkqqbjEdmLZpDQFqvhGpqqvz54OaDJmmO1PzuCD7rlsEdSNwrK7oh9O6Nc71Y3UeRvAstE7rV0hp0OgFkSJ5WE0uvRviVxen6pCh7CNRRfQ4HmpOKSDr3WO3ZvZ0no1LEOStRGk/odXzOpZ1M7PyIesB4zTJ7hDFmU/pQdloobvlGhn4OX125dcCckddokO9Rcf5vLcVV0qm2/Ja41OwQmAicTEb3WMSKIo71JiajfwOwBtlAhOX2t/GtmK42605PehtjYvRupb1aS4kAiT4HYrELdhqRGHA/zCwWDtIMhDSQNouet5ARJbFXvIcFALrcoJ/t6yqtlhkWKBFF6BdOk6QAo++bxOnAVHubj00SvTimvKLre6BL1zfa+O8YsU7WsfYLu9MAIGPxg1iSMBejQ4AeAJvWM4zgcpPbMcFFutzqZVyCQhdlh4YTFgSBUcP+kiBRySMXUqA7rABYTvHJkN11+O5KoME4A1OTXtUZ5YYi6o63gi+VLHL0n9dFkmA/9JQ8xUtWW7t2srxZ0poEOBEWofszOfqQWV5F2LnKvDwGCZENUWNE8vem8mx5oh8zD3BeNJWrI01sBO15of+Es9U1XC43JL2ow8vSOYQpW6y3cqh1KJQQdQeFSbkjhzVr1EOID0Dey6hrX8Vz/eYmWKLshg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(30864003)(40480700001)(2906002)(8936002)(8676002)(478600001)(5660300002)(4326008)(41300700001)(44832011)(70586007)(54906003)(316002)(6916009)(70206006)(40460700003)(26005)(36860700001)(47076005)(83380400001)(356005)(82740400003)(81166007)(36756003)(2616005)(336012)(86362001)(1076003)(426003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:43:17.7848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eafe927e-acf9-4578-e524-08dbd161c0bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P56YtZcM3VfY6HKfpFSozuB39wMWzOPdgrGcaGy9nGY=;
 b=BF2EEZHns6z8CEjmAK/LKte1ZYM/iF58Nc3OVeX97Q/vz935ZfSM8bAmaCx79h2Fz7yUYtJt1Qt1jESOOiTYxVimTuRgLbr5EmkVslwMojA15XHqP9Cf+Itkp3/i0bS0F5dNtNHZVrh5g4Co8V8GeLppmM0IEMzpVpBy4H7wvv0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BF2EEZHn
Subject: [Buildroot] [PATCH v6 05/10] boot/zynqmp-firmware: new boot firmware
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
been submitted upstream internally at AMD / Xilinx and will be included with
the 2023.2 release of the embeddedsw repository.

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
---
 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/zynqmp-firmware/Config.in                |  22 ++++
 ...akefile-specify-sequential-Makefiles.patch |   1 +
 ...akefile-specify-sequential-Makefiles.patch | 115 ++++++++++++++++++
 boot/zynqmp-firmware/zynqmp-firmware.hash     |   3 +
 boot/zynqmp-firmware/zynqmp-firmware.mk       |  33 +++++
 7 files changed, 176 insertions(+)
 create mode 100644 boot/zynqmp-firmware/Config.in
 create mode 120000 boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
 create mode 100644 boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
 create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.hash
 create mode 100644 boot/zynqmp-firmware/zynqmp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 849a5263b5..33d84d4271 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2198,6 +2198,7 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/zynqmp-firmware/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
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
index 0000000000..ce666ca264
--- /dev/null
+++ b/boot/zynqmp-firmware/Config.in
@@ -0,0 +1,22 @@
+config BR2_TARGET_ZYNQMP_FIRMWARE
+	bool "zynqmp-firmware"
+	select BR2_PACKAGE_HOST_TOOLCHAIN_BARE_METAL_BUILDROOT
+	help
+	  This package builds the PMU Firmware application required
+	  to run U-Boot and Linux in the Zynq MPSoC devices.
+
+if BR2_TARGET_ZYNQMP_FIRMWARE
+
+config BR2_TARGET_ZYNQMP_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2023.1"
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
index 0000000000..29c652d6ef
--- /dev/null
+++ b/boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
@@ -0,0 +1,115 @@
+From 23002defd462845db376425a7b7d975f3deba83d Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 24 Apr 2023 12:53:25 +0100
+Subject: [PATCH v1 1/1] pmufw: misc/Makefile: specify sequential Makefiles
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
diff --git a/boot/zynqmp-firmware/zynqmp-firmware.hash b/boot/zynqmp-firmware/zynqmp-firmware.hash
new file mode 100644
index 0000000000..ee2d656110
--- /dev/null
+++ b/boot/zynqmp-firmware/zynqmp-firmware.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  fc0e86027bdba53f5df373bcb38a171d61704db4ff1b4671f3886a87ceec7068  zynqmp-firmware-xilinx_v2022.2.tar.gz
+sha256  9850f893113936b9959cc76cc3e9152e30f815ff1acaa4b45f7a60fe3e1836f0  zynqmp-firmware-xilinx_v2023.1.tar.gz
diff --git a/boot/zynqmp-firmware/zynqmp-firmware.mk b/boot/zynqmp-firmware/zynqmp-firmware.mk
new file mode 100644
index 0000000000..be49cb197d
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
+ZYNQMP_FIRMWARE_DEPENDENCIES = host-newlib-bare-metal
+
+CUSTOM_CFLAGS = $(call qstrip,$(BR2_TARGET_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))
+ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects $(CUSTOM_CFLAGS)"
+
+define ZYNQMP_FIRMWARE_BUILD_CMDS
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(ZYNQMP_CFLAGS)
+endef
+
+PMUFW_PATH = $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf
+
+define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(PMUFW_PATH) $(BINARIES_DIR)/pmufw.elf
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
