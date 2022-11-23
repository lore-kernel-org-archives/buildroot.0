Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EB4C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 14:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B65F417D5;
	Wed, 23 Nov 2022 14:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B65F417D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CP3K0Ku9msUU; Wed, 23 Nov 2022 14:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D983417DF;
	Wed, 23 Nov 2022 14:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D983417DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDA31BF3E9
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6012381FCD
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 14:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6012381FCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zB2akwk00Tdv for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 14:55:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AB6981FCB
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AB6981FCB
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 14:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfUGv70plNfH+Q0MPubzNUCbtLZzqhM60Wc1YV79TyKZk6pMxF5xy12Prif9QskS/mzzcUcYFeU4R3ZLh42QckUxd0KFJJgVFZ0VdR6age6UxB6WpCSv3NCbdV3Qj1EKTciFgAV+lX9DBgHi0mblCxS4ro8TEBQZ7cQenorvX6E55p0OQnl+jfFGzgsTVvzjTt2AijjsrhpaFHbmISNWiTxZVvcuREF/v4LT2iUhCSvoQpjArlOxbsqVHreizIHbRMSWzHmO5zhK+gia7dLaG3Z5H2vVgGTpfvL98ebQLGGgH24vPYeiGIOn7rqxKF3snrW5N7YDAnspVXihJe83dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAjf5doX9mOEQEptuPmDJL39KbANkM8rNc7PIK+jT7M=;
 b=OYciE0p7cy4654ExJqD0wlm9J3fY9fE4pEA/4mlP7H8LmGvYRFt37Snk59wtwKWfqm36IILZpQKEhE55cyYZ8fM76r2M817p0sGeJ6todIx6+4+74HDHeuQoRmxUBpNpewyidWTPYKrirl4DEWGCfa+BBlkD/R17Ky3gYayDFXCnKHahD78sGhl19xA7n7/hYF757ikP2iwbxuv6rcI5qAHkAFmBVPMkkpKZeUpMP6jasdEhSc/iKSutw6e6gmdiEudwzHlodHAc9xwCYH5S1YYgZFjzO+UK4jSXiwlrZBfahUaMV5i8ycrrUVUdSoZj3uVAqDXlJoaFib9EJmblWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=buildroot.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
Received: from MW4PR04CA0220.namprd04.prod.outlook.com (2603:10b6:303:87::15)
 by PH8PR12MB7374.namprd12.prod.outlook.com (2603:10b6:510:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 14:55:36 +0000
Received: from CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::ef) by MW4PR04CA0220.outlook.office365.com
 (2603:10b6:303:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Wed, 23 Nov 2022 14:55:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT114.mail.protection.outlook.com (10.13.174.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 14:55:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 08:55:34 -0600
Received: from xcoapps68.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 23 Nov 2022 08:55:33 -0600
To: <buildroot@buildroot.org>
Date: Wed, 23 Nov 2022 07:55:30 -0700
Message-ID: <20221123145531.9603-1-neal.frager@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT114:EE_|PH8PR12MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ee3ea4-69d5-4777-b7ce-08dacd62c702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oLWIaGFMx4wiEt7+fYXNd+9CRUp90YPCApU70hSrfoF7YyQ4VkUZJWRnUiN7/STqrMHknMAYfhWVhYwurJOv3grIFjYE1S9QnopJY/Jpom19teMTREnLFF3gMLXv4cPpoFSziE/UUhjtKqGjk0pi1qhoWsdnyhZtgIh/uNPMoxmn/Wi7TRRb0RpNO6NaCv45CnDV7Vv9CLL61GrEFtc6A7SxGGMX6NBStHA9EK7BwyndcnnpfYY1yPz+S99HmSpYQWreCA0sTmE1wdbxg1cJs5qEOy6PWvoJ6z1yL2gS4dcEImHLlm4kVl+bsGYDFDKRmRjZHyViURiycTb6LQssSQGnezdrWVml67koRE8QTcQyw6g+vWqq+2IAqylinH1Yft9TEct+70Ky/0SJbDuj1EmcruNTmQTEkhn6IJzjn32I6tG9tHWkmRDumOEDSSxfRAovUJ1R5i8zRF6XoiYfnFtm0JCgoAJZ33tisXh5+6gaN6DVbLZfgTAPrOJufKJHezoEdqvbl5psBK5mV37F0wf1J4qN0EqXI0LT92zgprl9ffc++vgfMrxVUpUTUt/GkRveMszLWpsuAV9cFmycHLKWFhWIc2brMfbHB8lzB9O6HnKrVmSZhS3a9REgf8FopZt6poqhzBR76ICSynLtdzqqAdiSGrQ9BTcVYhTyxMOgxpvAgU/5eG+e6XXrWJ+G3B4UN0B0OJO+1PqRxJSDIJx4KecDmsiMeekIBK2qYDHkxvduWlVaIo2b+zJ0TwpHbDlrFqyPz7Tpt03W060WQw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(86362001)(186003)(47076005)(40480700001)(5660300002)(336012)(40460700003)(426003)(83380400001)(1076003)(2616005)(26005)(81166007)(2906002)(356005)(82740400003)(82310400005)(70586007)(36860700001)(44832011)(966005)(54906003)(4326008)(316002)(8676002)(70206006)(478600001)(41300700001)(6916009)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 14:55:35.3961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ee3ea4-69d5-4777-b7ce-08dacd62c702
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7374
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAjf5doX9mOEQEptuPmDJL39KbANkM8rNc7PIK+jT7M=;
 b=ilDwcjcs3wuB8IpyBDs26cAB2TpATCZvFSyHptanxaRGecxJDWxsz95qaCvVc0M4LnbyW8sMMCTmegsyuMXGTtsD8/vLAtIiswvNqw1oTE2pUNV0GNOCwBGhDrvdiSQ0p1i2pVn4oQWKtGZGEtLoR5wmBm9h2ZWEmNL3QrWEdQc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ilDwcjcs
Subject: [Buildroot] [PATCH v5 1/2] package/versal-firmware: new package
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
