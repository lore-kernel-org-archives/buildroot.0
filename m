Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECD1C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 09:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86337400F9;
	Fri,  7 Jun 2024 09:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DavcKUQ417jM; Fri,  7 Jun 2024 09:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2391C4013C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2391C4013C;
	Fri,  7 Jun 2024 09:03:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 120B81BF419
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1B6B4013C
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 09:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSdEdLnmugSS for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 09:03:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A055400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A055400F9
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A055400F9
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 09:03:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45793PYZ123900;
 Fri, 7 Jun 2024 04:03:25 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45793Oan017703
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jun 2024 04:03:24 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 04:03:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 04:03:24 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45793Nv1086754;
 Fri, 7 Jun 2024 04:03:24 -0500
To: <buildroot@buildroot.org>
Date: Fri, 7 Jun 2024 14:32:36 +0530
Message-ID: <20240607090236.2858457-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717751005;
 bh=70oRkFtYtmad7A1FJE9927r+D/W1f1zavlyYNCfH80U=;
 h=From:To:CC:Subject:Date;
 b=qcNjC+lv66DvajTFqw4T9bZOMivWjob8Yc5TpFbD8jp7dzYlb+jb4gK36BwgJHjwX
 WG/unIrxvg0BTG359AekiEYY7haMiQiVpoIzCXwAjJTInnfyksVQDgSYLZKh/MWjfu
 n8yvHd9SpzMPryZhIpKgWAfwWYHnBTT24N7rBy1s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=qcNjC+lv
Subject: [Buildroot] [PATCH v3] boot/ti-k3-boot-firmware: Add config option
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

This provides greater flexibility for users to select different versions of
ti-k3-boot-firmware without modfying the build script directly.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

---
Changes v2 -> v3:
  - flexibilty -> flexibility (Suggested by Chirag Shilwant)

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
