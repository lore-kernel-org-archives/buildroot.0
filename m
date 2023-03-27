Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30387C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 17:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8A8409B0;
	Mon, 27 Mar 2023 17:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E8A8409B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xs_EWjejDnKr; Mon, 27 Mar 2023 17:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6287D409B4;
	Mon, 27 Mar 2023 17:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6287D409B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A14C1BF336
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BE8381C6E
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 17:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BE8381C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HiHhPkwl1021 for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 17:06:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9445F81BCB
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::615])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9445F81BCB
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 17:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOIqyEplX3nui3PZLweHAJQ6QH7qhvdiJF3iL0X1UxmHxm1pOyuPD1OY5O7IOrvYhO4syhbzSbWogHQiQtkevx/7IQJV6iF4mTmz995iBIllopUxu0cZiCmiF/4e0i5T4XMCehqf2YGy17C1xoYMAFo5TiZtK4ITQJfD0UqeMMby8vLzDRRFHV6wmGqHcE4fJRSPsETKh/HvHMazwBQ15DFI9RMsXMoQO4tIjTIbwWn4zTPJ2NeaCcD7G8f4+UbycXcXxjKHK6tH2Ep+tLtqNKs10YS7icwnlK8cqphg5STqwe/5jMA80Bar41s1XHEBkHPNP1q2KQOW+VGWL3x1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkLDVf0DOBNHz0jTiNcEWLmi/+jWpnHRxWqmEt4WIcA=;
 b=Mbziw3M+Ue6V2mZISPjRucDQhtQ6gVHzGY6FZqoKzH8iIrJe8oGTB32nS4ASJhpx0ZyuZs2E65cu02ohfZ7anezOHFa5CxUAGRu6qJq36mlDRLohLpwbRqZll0ncBJlFQxp/Kn3Em8yMINXsL1uKAd3buugxORs50VW2pfZKD3LpC7RdzZrN0GpwKgvciZ2f8+Hvz+ijFMbBmbAbI4yI2CD5aFMK2zYMThZH5ERAgALawx+nvSA/4cpeinrKcejE/o+OUzO8RgUCyPZXbrRdJ4t/GoQ31Y0kXMV+4XcskBkPt0OHqQpEqfx2+FWrN3gDR2Eexlxlyh262od87cTRGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::21)
 by SJ2PR12MB7920.namprd12.prod.outlook.com (2603:10b6:a03:4cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 17:06:10 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::49) by MW4P220CA0016.outlook.office365.com
 (2603:10b6:303:115::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 17:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.21 via Frontend Transport; Mon, 27 Mar 2023 17:06:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 12:06:09 -0500
Received: from xirengwts08.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 27 Mar 2023 12:06:08 -0500
To: <buildroot@buildroot.org>
Date: Mon, 27 Mar 2023 18:06:03 +0100
Message-ID: <20230327170604.22854-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT040:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: f23a43e1-1aa1-42b1-9596-08db2ee59030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T7LzfaBTwNSD0RaNi2YSAqVI7maeGYIufCiA8GEOmczl67IFtgHWXJB4XBfvJie1G1D6Vln2Jdewo08z8LfbwMmiDaEo1jnomIGV4ujm2eEmgVD1txcrGvdP3bb5uFAQYtL/XxcqB4Feff35ueTb8Cpoal/JG8wFGdAe/snT3RS1641BYRnvRQ3RiG68xQyiYbWAokRxpT8RRE+R3s068PJFGx0tjTlkrUxAZhqqfkLMXOUo1uV2E4bGfoPcBP09n0ThnHKloxylH7IyaQxulrAWfsMne9fAychcGVUKngWaCj0568YsIFXM2iUx6n+j/TZt9v2zvNLveJgg0gG5iKvnt19leZilrUjMyYd1noPyx/WObCsjVn2fe8DkXc+ktzVoiQhVWizy538U9S/bPHG3DvV+llLEPc890Gelm/nQvs8QdDsUr9Lt0sLxrJc2iS1r+lHjo6XKOee4DRW3RjW+isNUmXdRvGjZrsyTIyB4pgeoqzoZBrgKVoOju/YypWg1uxamD1KQ9q8o54FI75KcY4yOt3w4BszHyw21NSWPNXGm5Hu4IoMpEC2VSsquiNeKHojeIFi9qX2crfjZWj7N+EqNAw3iOzqDe0blz7vR6FqlSrpuXZuI8xAsrpoMo1myEOsIRrtprMuwwFBNcDFRNAGxSpNS0dymCHD5opgUMvXR+tsAeE/Q+wjrs2bHag6nOpBTWZy0b/ljePYJhj8+FysB9822x/Q6qwYnf3w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(2616005)(47076005)(336012)(426003)(36860700001)(41300700001)(44832011)(86362001)(36756003)(5660300002)(8936002)(356005)(81166007)(82740400003)(40460700003)(54906003)(478600001)(8676002)(70586007)(70206006)(4326008)(6916009)(2906002)(82310400005)(40480700001)(6666004)(26005)(1076003)(316002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 17:06:10.2986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f23a43e1-1aa1-42b1-9596-08db2ee59030
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkLDVf0DOBNHz0jTiNcEWLmi/+jWpnHRxWqmEt4WIcA=;
 b=WPx2ld/a18jenukhKJpAP6SNHH1kfVzBm/iE1KXwyBHpk6cUZXXm+tbnb6wwVNqowGF3kGvQkwVHhf9UNKDp8F6F757iH1/oJW9TAPjzxJCiSnSu4a4RjXPquCRK0P54TgAqRHQ5bkmV2tyNcBC6DqeojCfBQg9LWkdpEcq1AiY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WPx2ld/a
Subject: [Buildroot] [PATCH v2 1/2] package/zynqmp-firmware: new package
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

This patch adds a new package to buildroot for building the zynqmp pmufw
with the requirement that the user must provide an external microblaze
toolchain.

The below example config options can be used to build the pmufw.elf v2022.2
using the Xilinx toolchain.

BR2_PACKAGE_ZYNQMP_FIRMWARE=y
BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION="v2022.2"
BR2_PACKAGE_ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH="/opt/Xilinx/Vitis/2022.2/gnu/microblaze/lin"
BR2_PACKAGE_ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX="microblaze-xilinx-elf-"

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - switched make command to $(MAKE1)
  - removed kria config and replaced it with custom_flags
  - using call github instead of the https path to the sources
  - removed Xilinx/embeddedsw patch that is no longer required
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/zynqmp-firmware/Config.in          | 32 ++++++++++++++++++++++
 package/zynqmp-firmware/zynqmp-firmware.mk | 30 ++++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 package/zynqmp-firmware/Config.in
 create mode 100644 package/zynqmp-firmware/zynqmp-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54f..d3436d40f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2151,6 +2151,7 @@ F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen/
 F:	package/versal-firmware/
+F:	package/zynqmp-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in b/package/Config.in
index 0f8dab3e71..6c7419490d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -450,6 +450,7 @@ menu "Firmware"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
+	source "package/zynqmp-firmware/Config.in"
 endmenu
 	source "package/18xx-ti-utils/Config.in"
 	source "package/a10disp/Config.in"
diff --git a/package/zynqmp-firmware/Config.in b/package/zynqmp-firmware/Config.in
new file mode 100644
index 0000000000..6513c9a995
--- /dev/null
+++ b/package/zynqmp-firmware/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_ZYNQMP_FIRMWARE
+	bool "zynqmp-firmware"
+	help
+	  This package builds the PMU Firmware application required to run
+	  U-Boot and Linux in the Zynq MPSoC devices.
+
+if BR2_PACKAGE_ZYNQMP_FIRMWARE
+
+config BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION
+	string "firmware version"
+	default "xilinx_v2022.2"
+	help
+	  Release version of zynqmp firmware.
+
+config BR2_PACKAGE_ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH
+	string "external toolchain path"
+	default "/opt/Xilinx/Vitis/2022.2/gnu/microblaze/lin"
+	help
+	  Path to pre-installed external microblaze toolchain.
+
+config BR2_PACKAGE_ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX
+	string "external toolchain prefix"
+	default "microblaze-xilinx-elf-"
+	help
+	  Pre-installed external microblaze toolchain prefix.
+
+config BR2_PACKAGE_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS
+	string "custom cflags"
+	help
+	  Adds additional CFLAGS for building zynqmp firmware.
+
+endif # BR2_PACKAGE_ZYNQMP_FIRMWARE
diff --git a/package/zynqmp-firmware/zynqmp-firmware.mk b/package/zynqmp-firmware/zynqmp-firmware.mk
new file mode 100644
index 0000000000..25c8fbf699
--- /dev/null
+++ b/package/zynqmp-firmware/zynqmp-firmware.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# zynqmp-firmware
+#
+################################################################################
+
+ZYNQMP_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_SITE = $(call github,Xilinx,embeddedsw,$(ZYNQMP_FIRMWARE_VERSION))
+ZYNQMP_FIRMWARE_LICENSE = MIT
+ZYNQMP_FIRMWARE_LICENSE_FILES = license.txt
+ZYNQMP_FIRMWARE_INSTALL_IMAGES = YES
+ZYNQMP_FIRMWARE_INSTALL_TARGET = NO
+
+ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH = $(call qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH))
+ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX = $(call qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX))
+ZYNQMP_CFLAGS = "-Os -flto -ffat-lto-objects $(call qstrip,$(BR2_PACKAGE_ZYNQMP_FIRMWARE_CUSTOM_CFLAGS))"
+
+define ZYNQMP_FIRMWARE_BUILD_CMDS
+	$(MAKE1) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
+		ARCHIVER=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc-ar \
+		CC=$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PATH)/$(ZYNQMP_FIRMWARE_EXTERNAL_TOOLCHAIN_PREFIX)gcc \
+		CFLAGS=$(ZYNQMP_CFLAGS)
+endef
+
+define ZYNQMP_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf $(BINARIES_DIR)/pmufw.elf
+endef
+
+$(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
