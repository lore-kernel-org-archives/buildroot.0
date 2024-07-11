Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34811C3271E
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 06:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEB1A610F4;
	Thu, 11 Jul 2024 06:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dL64en-NIjHo; Thu, 11 Jul 2024 06:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3232610E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3232610E6;
	Thu, 11 Jul 2024 06:05:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 552461BF3E1
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 06:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42EF681F92
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 06:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBMFSVt6cvM3 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 06:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0B3E81F89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0B3E81F89
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0B3E81F89
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 06:05:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46B65fbm054048;
 Thu, 11 Jul 2024 01:05:41 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46B65fP0000695
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Jul 2024 01:05:41 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Jul 2024 01:05:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 Jul 2024 01:05:41 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46B65eq9021316;
 Thu, 11 Jul 2024 01:05:41 -0500
To: <buildroot@buildroot.org>
Date: Thu, 11 Jul 2024 11:35:31 +0530
Message-ID: <20240711060531.4067193-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1720677941;
 bh=O1Z1UDQjaYnDOXr3SNTsGAiGtZqJzK92pDtBQ9JwBxw=;
 h=From:To:CC:Subject:Date;
 b=IJ1P9OpYQ5d6+Mc2JCaTZkfpLRQ6AeBNz/T7DYyyIRHDf6Klv56Yi0aNNFZlIUvsC
 Mhb4PioQVPoAuG/ho36lRYj+vGXrNPjY6PoEWFBqMLBnxnxcm4u8FVX/53LojYRgoL
 DOgmqPts+JrybTlepslbUW2sx/u6rZkWIMhVOb8g=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=IJ1P9OpY
Subject: [Buildroot] [PATCH v4] boot/ti-k3-boot-firmware: Add config option
 to specify version
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
From: Paresh Bhagat via buildroot <buildroot@buildroot.org>
Reply-To: Paresh Bhagat <p-bhagat@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
 Gyan Gupta <g-gupta@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Syed Mohammed Khasim <khasim@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previously the version of ti-k3-boot-firmware (TI_K3_BOOT_FIRMWARE_VERSION) was
fixed in mk file. Introduce a new config option BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
so that user can change the version for ti-k3-boot-firmware using menuconfig.

This provides greater flexibility for users to select different versions of
ti-k3-boot-firmware without modifying the build script directly.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

---
Changes v3 -> v4:
  - Ti k3 -> TI K3 (Suggested by Andreas Dannenberg)
  - git.ti.org -> git.ti.com (Suggested by Andreas Dannenberg)

Changes v2 -> v3:
  - flexibilty -> flexibility (Suggested by Chirag Shilwant)

Changes v1 -> v2:
  - Fix whitespaces/indentation in Config.in file (Suggested by Bryan Brattlof)

---
 boot/ti-k3-boot-firmware/Config.in            | 30 +++++++++++++++++++
 .../ti-k3-boot-firmware.mk                    |  2 +-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
index d80bb4bdb3..581ec0c3b9 100644
--- a/boot/ti-k3-boot-firmware/Config.in
+++ b/boot/ti-k3-boot-firmware/Config.in
@@ -5,3 +5,33 @@ config BR2_TARGET_TI_K3_BOOT_FIRMWARE
 	  This package downloads and installs the TI-specific ti-sysfw
 	  and ti-dm firmware needed to boot TI K3 platforms (which
 	  include AM62x, AM64x, AM65x and more).
+
+if BR2_TARGET_TI_K3_BOOT_FIRMWARE
+choice
+	prompt "ti-k3-boot-firmware version"
+	default BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
+	help
+	  Select the version of TI K3 boot firmware you want to use.
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
+	bool "09.02.00.009"
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official version from
+	  git.ti.com.
+
+endchoice
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION_VALUE
+	string "Custom ti-k3-boot-firmware version"
+	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_VERSION
+	string
+	default "09.02.00.009"     if BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
+	default BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION_VALUE \
+				if BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
+
+endif
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 9332732ad4..350381ebbe 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
+TI_K3_BOOT_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_BOOT_FIRMWARE_VERSION))
 TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
 TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
