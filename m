Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CCEC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 10:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2BDB402E6;
	Thu, 24 Nov 2022 10:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2BDB402E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xBizVZpJKpb; Thu, 24 Nov 2022 10:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF9BC400C4;
	Thu, 24 Nov 2022 10:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF9BC400C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC39C1BF3D6
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 10:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 967F1400C4
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 10:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 967F1400C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fP4plAHz0HLW for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 10:21:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F8C40012
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::624])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98F8C40012
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 10:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDW3kldqGjM37EYBHPDaVRiAMQJmjhrSgXZtZ+GGoc93aN6WmJf+MGm5DhJez8X7IaABHlb6V6RE3lLI3hd/SjVqkp84eA8RH+UvH6ebHf96cxcZf3KUhKfgUVdL4GLZBfX9EzO1dQFJ0bl0w03VwiZOEEuF60cpODau1+PVWedjrrqks1YsmLtEB5OzfD6CVPplrmqioZQQf4lISHZLNZs7w5SLP79dBOBHB2GiBHjpRHivEdyCv962yZpOYfPQwB6FW8oygQdxMjgeqLNNWFO/dzRxYAFWKTMGdD46tiY+59qSCHSk/RqREeQyyuDAFmk1XCP6reosK7w8Y8ddKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lwc4TI8Qb8XTaida62zimaflzZDoDaO6veGpQl6CId4=;
 b=fR3YMMreP+xdvP2B/jzai7ta0Ba01IbSY4ik0mUHmEQMI3/tcldxhsXYrMADtHIE0L2UMg9hDEvj2RxWoCmDa1L6RluAPCbNMspA2IhcusLR6UWbNGVBncInuoE9HnIzEPi64obuGzCxt971Chk0zlbWwiRxf9Zv5yaI1ddXbpe3tVxIYW4N6m61FxHdeEJlx3CuNjDLpCXAuzqBcV9TYLpgSmuCLVYsWCsRKQaLB8p3OKqhiF4Xe4/FzLUyEM6vljDuBsOpjJlZzuQGxjLlbqSdyF6is66YTdOSzWgRQcIPhOhDHc8ISU3Gie1nz2e9sdrTYEG8mTUZtLd34C62EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from DS7PR03CA0167.namprd03.prod.outlook.com (2603:10b6:5:3b2::22)
 by MW4PR12MB7168.namprd12.prod.outlook.com (2603:10b6:303:22d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 10:21:54 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::93) by DS7PR03CA0167.outlook.office365.com
 (2603:10b6:5:3b2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19 via Frontend
 Transport; Thu, 24 Nov 2022 10:21:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Thu, 24 Nov 2022 10:21:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 24 Nov
 2022 04:21:52 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 24 Nov 2022 04:21:52 -0600
To: <buildroot@buildroot.org>
Date: Thu, 24 Nov 2022 03:21:43 -0700
Message-ID: <20221124102144.16833-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT065:EE_|MW4PR12MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf76d64-c62b-4590-1c36-08dace05b518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +d1ywwo4dzP9XeyUHdmY3oGXo6hZVwcLi4RtKWVWlI5K4h2zfIY/BM/5k5CnPeytP394ShUOp3VaLbCQ615qyI1eNxLOSFJZAnTAHBxlHEHKcLXq/+Bg28ns9hnFaQz4Yr+n5wD7DtY9gko1PAh0849S92NFZ6udAziRin8KsGQ31cNKV7QK/6YKGnceMLZ4OCRbxI2gh0RcwfQHkGi6gA0GFptFu8KPZwXsmt82qoCJbX0hcP5+Ju5xjVVxsRA4wQmW1oy5cgdoggEsg3OI6ZtYhzUtQT6pZ5o91XxJu0F8I0ifY2HjIdMLJbMxK7QySCPsz8lENQNcZv5X1Ah8DH1bm4j+UeZ33Wb7mf7anrjRiLxrsyghERH+0C0uMeGc04PuGqWJsCTt5tvlSS4rSBF8zU0/hfbU0XMJaGUnSAIOFAzySWwatttPoPgCbK8udnlewkQrNR8jE0DYyBB3YXpb2cFh1cDXq8hLbVgCzBC0LyXTfONtuPzhImRmuJlu6cwR6ZuewSTWmYaR9KzjDVHyRHBXfc7bGnEAmV6ONZd6W3gzqZ84ooIp+HAtiC8tGmIuAf6IZZG9JtrBqkk4mTBCij7uQIi905/PEJG3DixbZ/eCQ9xrSOWl7hznytTk7ehBLiGobOv/srO543M3KUCtsdc6tWLKJs/L8WGW8uC/LEQrL2jn+ZTwTQqsb37/GfEu2e/FzMVlcu0I/Xm8LRfERhg9XqG8B6qxyCUsXjJvtokONHMrhpG1lhci8oXUGWxsMjXVJFFGq7rBpRgw2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(8676002)(4326008)(70586007)(6916009)(86362001)(54906003)(41300700001)(44832011)(8936002)(5660300002)(316002)(70206006)(966005)(36756003)(40480700001)(40460700003)(82310400005)(83380400001)(36860700001)(356005)(82740400003)(2906002)(478600001)(81166007)(186003)(426003)(2616005)(47076005)(336012)(1076003)(26005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 10:21:53.3979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf76d64-c62b-4590-1c36-08dace05b518
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7168
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lwc4TI8Qb8XTaida62zimaflzZDoDaO6veGpQl6CId4=;
 b=UqfK1IeoIGDOg05RTytD0zSNci0y2kJGy644h2+AifH0breR61WGhFMB8STtAj2tvYJlsmkaQBJGcUkf4Ru39254gsv2tKYXdFJPM4HmmGCP5SaOogJcrO1uPN7N/I0brG9ff0Hs4lnzEabcPQocQVml6sQfSR/IY16jvXbTe24=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UqfK1Ieo
Subject: [Buildroot] [PATCH v6 1/2] package/versal-firmware: new package
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
Cc: terry.oneal@amd.com, luca.ceresoli@bootlin.com, kris.chaplin@amd.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support for downloading versal microblaze firmware binaries.
These are necessary for booting Xilinx versal devices.

The location of these binaries is temporary, and will soon be added to the
Xilinx firmware repository.  The temporary location is using the same free
distribution license as the Xilinx firmware repository.

Once these files are available on the Xilinx repository, this package will
be updated to the new location.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - set defaults for version and board name
  - improved format of install commands
V2->V3:
  - no changes
V3->V4:
  - no changes
V4->V5:
  - no changes
V5->V6:
  - no changes
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/versal-firmware/Config.in          | 24 ++++++++++++++++++++++
 package/versal-firmware/versal-firmware.mk | 23 +++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/versal-firmware/Config.in
 create mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2aecdb1c8f..4689453d54 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2154,6 +2154,7 @@ F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen/
+F:	package/versal-firmware/
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in b/package/Config.in
index aef80f9ab0..ebc7df10ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -443,6 +443,7 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
+	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
new file mode 100644
index 0000000000..122ef02175
--- /dev/null
+++ b/package/versal-firmware/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_VERSAL_FIRMWARE
+	bool "versal-firmware"
+	depends on BR2_aarch64
+	help
+	  Pre-built firmware files for Xilinx Versal boards.
+
+	  https://github.com/nealfrager/buildroot-firmware
+
+if BR2_PACKAGE_VERSAL_FIRMWARE
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
+	string "versal firmware version"
+	default v2022.2
+	help
+	  Release version of Versal firmware.
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
+	string "versal board name"
+	default vck190
+	help
+	  Name of Versal target board.
+	  Used for installing the appropriate firmware boot.bin.
+
+endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..cb36d1e045
--- /dev/null
+++ b/package/versal-firmware/versal-firmware.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# versal-firmware
+#
+################################################################################
+
+VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = "Xilinx-Binary-Only or GPL-2.0-or-later"
+
+VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
+
+VERSAL_FIRMWARE_INSTALL_TARGET = NO
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
+		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f) \
+			$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f)
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
