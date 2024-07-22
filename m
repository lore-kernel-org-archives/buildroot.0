Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD25C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 13:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C7A402B3;
	Mon, 22 Jul 2024 13:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsLgGhE6FRGN; Mon, 22 Jul 2024 13:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF292401B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF292401B7;
	Mon, 22 Jul 2024 13:38:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AAB9E1BF2A3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 982EE40153
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 13:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id et6Uvg6bntB5 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 13:38:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24ED840114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24ED840114
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24ED840114
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 13:38:31 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46MDcSCq031619;
 Mon, 22 Jul 2024 08:38:28 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46MDcS7W062386
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Jul 2024 08:38:28 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jul 2024 08:38:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jul 2024 08:38:27 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46MDcRE0115781;
 Mon, 22 Jul 2024 08:38:27 -0500
To: <buildroot@buildroot.org>
Date: Mon, 22 Jul 2024 19:08:04 +0530
Message-ID: <20240722133804.2794134-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721655508;
 bh=Hnz5YkfgdYlZk0wwuXZEQmmfmhn6w496Nt9rnWwf9sw=;
 h=From:To:CC:Subject:Date;
 b=CcpRSkdsJMIlB/O3swLnwFbikwXGppgSLXh+PD3P+6C/O53ySYOh9lEtZCG6uHu4T
 QxJ8vIQuFy9LfqNJZrt4PfxxqP+vaeMfy7sZq9EtuaGFk6xGQf20TBNdfEsadmtC3M
 bAKKMcFgxU6yekkL4vhZiIUlsTlpWwOAAmZph6lA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=CcpRSkds
Subject: [Buildroot] [PATCH v5] boot/ti-k3-boot-firmware: Add config option
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
 Syed Mohammed Khasim <khasim@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previously the version of ti-k3-boot-firmware (TI_K3_BOOT_FIRMWARE_VERSION) was
fixed in mk file. Introduce a new config option 
BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION so that user can change the version 
for ti-k3-boot-firmware using menuconfig.

This provides greater flexibility for users to select different versions of
ti-k3-boot-firmware without modifying the build script directly. Note that
there might be version difference between ti-k3-boot-firmware and u-boot or
ki-k3-r5-bootloader, they should still work together due to TI-SCI protocol
being backward compatible. However, to avoid any potential issues ( e.g. in
case of TIFS-DM ), it is recommended to synchronize these components
when using custom version or sources for the build. For stricter version 
check, hash checking is not disabled.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

---
Changes v4 -> v5:
	- Include recommendation regarding version mismatch in commit msg
	  (Suggested by Bryan and Romain)

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
