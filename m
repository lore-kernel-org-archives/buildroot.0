Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47859C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 11:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0070D60D72;
	Tue, 18 Jan 2022 11:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvJprwlMzS4j; Tue, 18 Jan 2022 11:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF2D760C2E;
	Tue, 18 Jan 2022 11:22:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3FF1BF5B5
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 11:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AA2C60C2E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 11:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nn6nZ4PiZtZ7 for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 11:22:45 +0000 (UTC)
X-Greylist: delayed 00:07:00 by SQLgrey-1.8.0
Received: from mx.msync.work (mx.msync.work [IPv6:2a01:4f9:2b:2dc2::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7740B60A97
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 11:22:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5098F265E5E
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1642504540; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=npSiYQAqXSMirZevQh19UqZ/w75K1ckyCSVfh8VbbLg=;
 b=OerBLvSCakcnoHhyFHEtCyjVJ6S17g87n3jYLFQlhwuIySCbC4Y68LLeMTEN7/KjlDxatf
 RftLcQf7jSGH/Kl6WmqSIjGnug5wS68KQOvsZ3G4XqsEPsUCSLrwMKAo7KeRgfnf9zvbLa
 pqmAWD9I7pWWc3p/2x2hbOGxLIv1KIovW5S3Pqgj9aX9WmNyplyoK/fwZkjG5yejHMNHFQ
 7NjTWvGHPRNMLrYCUbLSv2nCxMZB31uD6aaKLjF7T0mUIGyhFWEllIUeJeAVwS+p5vQksF
 pJPdt/YW+KGfGDi/CqkV985Jaur6kDoH5Y+PE52SJ1Gv6Rh14uN9iH054amjEg==
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 14:14:58 +0300
Message-Id: <20220118111457.2491318-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/amlogic-boot-fip: new package
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
From: Vyacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Vyacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Firmware Image Package (FIP) sources to sign Amlogic SoC u-boot binaries
in LibreELEC, Armbian and meta-meson, buildroot.

https://github.com/LibreELEC/amlogic-boot-fip

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 package/amlogic-boot-fip/Config.in            | 17 +++++++++
 .../amlogic-boot-fip/amlogic-boot-fip.hash    |  2 +
 package/amlogic-boot-fip/amlogic-boot-fip.mk  | 37 +++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 package/amlogic-boot-fip/Config.in
 create mode 100644 package/amlogic-boot-fip/amlogic-boot-fip.hash
 create mode 100644 package/amlogic-boot-fip/amlogic-boot-fip.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a91e2dfcde..deda803018 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2894,6 +2894,9 @@ N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
 
+N:	Vyacheslav Bocharov <devel+buildroot@lexina.in>
+F:	package/amlogic-boot-fip/
+
 N:	Wade Berrier <wberrier@gmail.com>
 F:	package/ngrep/
 
diff --git a/package/Config.in b/package/Config.in
index 4df1474b91..df38024af2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -418,6 +418,7 @@ endmenu
 menu "Hardware handling"
 menu "Firmware"
 	source "package/am33x-cm3/Config.in"
+	source "package/amlogic-boot-fip/Config.in"
 	source "package/armbian-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
diff --git a/package/amlogic-boot-fip/Config.in b/package/amlogic-boot-fip/Config.in
new file mode 100644
index 0000000000..ceb09f8247
--- /dev/null
+++ b/package/amlogic-boot-fip/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_AMLOGIC_BOOT_FIP
+	 bool "amlogic-boot-fip"
+	 help
+	   This package enables access to various u-boot
+	   blobs from the LibreELEC amlogic-boot-fip repository.
+
+	   https://github.com/LibreELEC/amlogic-boot-fip
+
+if BR2_PACKAGE_AMLOGIC_BOOT_FIP
+
+config BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD
+	string "Board uboot firmware config"
+	depends on BR2_PACKAGE_AMLOGIC_BOOT_FIP
+	help
+	  Name of the board for which U-Boot firmware should be built 
+	  from amlogic-boot-fip
+endif
diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.hash b/package/amlogic-boot-fip/amlogic-boot-fip.hash
new file mode 100644
index 0000000000..5d6dd237e3
--- /dev/null
+++ b/package/amlogic-boot-fip/amlogic-boot-fip.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdf9d3872457c33a2755cc504f6b0560a62a6ee04437ac28e66623a345ed4936  amlogic-boot-fip-7ff0004e0e4d261ba81334a2f46302bd06704aca-br1.tar.gz
diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.mk b/package/amlogic-boot-fip/amlogic-boot-fip.mk
new file mode 100644
index 0000000000..6f646ae871
--- /dev/null
+++ b/package/amlogic-boot-fip/amlogic-boot-fip.mk
@@ -0,0 +1,37 @@
+
+################################################################################
+#
+# amlogic-boot-fip
+#
+################################################################################
+
+AMLOGIC_BOOT_FIP_VERSION = 7ff0004e0e4d261ba81334a2f46302bd06704aca
+AMLOGIC_BOOT_FIP_SITE = https://github.com/LibreELEC/amlogic-boot-fip
+AMLOGIC_BOOT_FIP_SITE_METHOD = git
+AMLOGIC_BOOT_FIP_INSTALL_IMAGES = YES
+AMLOGIC_BOOT_FIP_DEPENDENCIES = uboot
+
+AMLOGIC_BOOT_FIP_LICENSE = PROPRIETARY
+AMLOGIC_BOOT_FIP_REDISTRIBUTE = NO
+
+AMLOGIC_BOOT_BINS += u-boot.bin.sd.bin
+
+define AMLOGIC_BOOT_FIP_BUILD_CMDS
+    mkdir -p $(@D)/fip
+    cp $(BINARIES_DIR)/u-boot.bin $(@D)/fip/bl33.bin
+    cd "$(@D)"; ./build-fip.sh $(call qstrip,$(BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD)) $(@D)/fip/bl33.bin $(@D)/fip
+endef
+
+ifeq ($(BR2_PACKAGE_AMLOGIC_BOOT_FIP),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD)),)
+$(error No board u-boot firmware config name specified, check your BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD setting)
+endif # qstrip BR2_PACKAGE_AMLOGIC_BOOT_FIP_BOARD
+endif
+
+define AMLOGIC_BOOT_FIP_INSTALL_IMAGES_CMDS
+	$(foreach f,$(AMLOGIC_BOOT_BINS), \
+			cp -dpf "$(@D)/fip/$(f)" "$(BINARIES_DIR)/"
+	)
+endef
+
+$(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
