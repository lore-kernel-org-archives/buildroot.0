Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52677C25B74
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 06:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F350260A7C;
	Tue,  4 Jun 2024 06:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asw8t7yrF0FU; Tue,  4 Jun 2024 06:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5B16101A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA5B16101A;
	Tue,  4 Jun 2024 06:16:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5AE71BF2FF
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C126D413B3
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 06:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8j7v2ZiV5iqa for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 06:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CA6B410C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA6B410C8
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CA6B410C8
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 06:15:58 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4546FvCa021131;
 Tue, 4 Jun 2024 01:15:57 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4546FvXl066834
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Jun 2024 01:15:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 01:15:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 01:15:57 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4546Fu9F077593;
 Tue, 4 Jun 2024 01:15:57 -0500
To: <buildroot@buildroot.org>
Date: Tue, 4 Jun 2024 11:45:56 +0530
Message-ID: <20240604061556.3167647-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717481758;
 bh=31A7wtYh3qG5RFwYzfMv7Y0AzpMiiAKbv+fe8QgpM64=;
 h=From:To:CC:Subject:Date;
 b=otiC+qBTuxBVZrOl2OwJ8FD35d/jHln0vIW77fGonH6zUtpSmSdP7S8nrV3bMBmeh
 j8/9Z943uCbJYG2GecPU6V1jaeeHypActnZNIjjrPLGkEROEdlyYxNHKaj7eDnn7jb
 58qRQp+CP8lqqkLq7h1rr4dcgo8XkmItIEUDvrbo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=otiC+qBT
Subject: [Buildroot] [PATCH 1/1] boot/ti-k3-boot-firmware: Add config option
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
 Syed Mohammed Khasim <khasim@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previously the version of ti-k3-boot-firmware (TI_K3_BOOT_FIRMWARE_VERSION) was
fixed in mk file. Introduce a new config option 
BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION so that user can change the version
for ti-k3-boot-firmware using menuconfig.

This provides greater flexibilty for users to select different versions of
ti-k3-boot-firmware without modfying the build script directly.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 boot/ti-k3-boot-firmware/Config.in            | 30 +++++++++++++++++++
 .../ti-k3-boot-firmware.mk                    |  2 +-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
index d80bb4bdb3..adc201c468 100644
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
+		Select the version of Ti k3 boot firmware you want to use
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
+	bool "09.02.00.009"
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
+	bool "Custom version"
+	help
+      This option allows to use a specific official version from
+      git.ti.org.
+
+endchoice
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION_VALUE
+    string "Custom ti-k3-boot-firmware version"
+    depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_VERSION
+    string
+    default "09.02.00.009"     if BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
+    default BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION_VALUE \
+                if BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
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
