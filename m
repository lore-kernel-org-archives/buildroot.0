Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD48FC27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 11:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BBC180F3A;
	Thu,  6 Jun 2024 11:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTQMG7z41T7h; Thu,  6 Jun 2024 11:45:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E7A80F3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58E7A80F3E;
	Thu,  6 Jun 2024 11:45:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 364141BF5DE
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22DCF400AB
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdWbbDVLKXOR for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 11:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8919340185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8919340185
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8919340185
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 11:45:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 456BjNk3017562;
 Thu, 6 Jun 2024 06:45:23 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 456BjN0l104183
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 Jun 2024 06:45:23 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 06:45:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 06:45:23 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 456BjM0s019389;
 Thu, 6 Jun 2024 06:45:22 -0500
To: <buildroot@buildroot.org>
Date: Thu, 6 Jun 2024 17:14:42 +0530
Message-ID: <20240606114442.2052852-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717674323;
 bh=Oi1qbKJ9qww4KrqBs6lQOAbSw5XdPvhhGQGeOtbBSto=;
 h=From:To:CC:Subject:Date;
 b=pFTS4P0kmGPoxVwenqVufuucmBed2iHecR61iiwirv3iDDb2Oys2q10RRBAneoQ7e
 LhIL5V5lDbk7AO4hO3bSpX4f1Yr3BeAX/eC8iV4OXDSCVOcsov6brFR46WV4p+Js1D
 R2/pWXdMOjsdg11pEBAsJ8F8B8jQ/7jgITam9IGo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=pFTS4P0k
Subject: [Buildroot] [PATCH v2] boot/ti-k3-boot-firmware: Add config option
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

Previously the version of ti-k3-boot-firmware (TI_K3_BOOT_FIRMWARE_VERSION) 
was fixed in mk file. Introduce a new config option 
BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION so that user can change the version 
for ti-k3-boot-firmware using menuconfig.

This provides greater flexibilty for users to select different versions of
ti-k3-boot-firmware without modfying the build script directly.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

---
Changes v1 -> v2:
 - Fix whitespaces/indentation in Config.in file (Suggested by Bryan Brattlof)

 boot/ti-k3-boot-firmware/Config.in            | 30 +++++++++++++++++++
 .../ti-k3-boot-firmware.mk                    |  2 +-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
index d80bb4bdb3..1c2382f610 100644
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
+	  Select the version of Ti k3 boot firmware you want to use
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
+	bool "09.02.00.009"
+
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official version from
+	  git.ti.org.
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
