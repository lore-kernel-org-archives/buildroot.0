Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1FFC4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 18:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C196F812D8;
	Mon, 26 Dec 2022 18:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C196F812D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEKvfog3HbG5; Mon, 26 Dec 2022 18:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECE2C812E7;
	Mon, 26 Dec 2022 18:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE2C812E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2FA71BF31A
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 18:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE78F812E7
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 18:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE78F812E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8UVzKR0OGBe for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 18:03:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B917812D8
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B917812D8
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 18:03:59 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout10.t-online.de (Postfix) with SMTP id 61554F3EC;
 Mon, 26 Dec 2022 19:03:55 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p9rpK-1ta3aD0; Mon, 26 Dec 2022 19:03:54 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44994)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p9rpK-0003M5-01;
 Mon, 26 Dec 2022 19:03:54 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 19:03:53 +0100
Message-Id: <20221226180353.1897840-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672077834-3FFEEB8C-696D9AA2/0/0 CLEAN NORMAL
X-TOI-MSGID: 7d398259-5641-4b39-8a84-918d5633094f
Subject: [Buildroot] [PATCH 1/1] package/dvb-firmware: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/dvb-firmware/Config.in         | 16 +++++++++++++
 package/dvb-firmware/dvb-firmware.hash |  2 ++
 package/dvb-firmware/dvb-firmware.mk   | 32 ++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)
 create mode 100644 package/dvb-firmware/Config.in
 create mode 100644 package/dvb-firmware/dvb-firmware.hash
 create mode 100644 package/dvb-firmware/dvb-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cb9201bfb7..99118ee7be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -335,6 +335,7 @@ F:	package/dht/
 F:	package/dovecot/
 F:	package/dovecot-pigeonhole/
 F:	package/dtv-scan-tables/
+F:	package/dvb-firmware/
 F:	package/eudev/
 F:	package/exim/
 F:	package/fetchmail/
diff --git a/package/Config.in b/package/Config.in
index bdbf8ee01a..1215f339d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -434,6 +434,7 @@ menu "Firmware"
 	source "package/armbian-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/brcmfmac_sdio-firmware-rpi/Config.in"
+	source "package/dvb-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
diff --git a/package/dvb-firmware/Config.in b/package/dvb-firmware/Config.in
new file mode 100644
index 0000000000..6a1c3cd6be
--- /dev/null
+++ b/package/dvb-firmware/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_DVB_FIRMWARE
+	bool "dvb-firmware"
+	help
+	  Firmware files for DVB devices.
+
+	  https://github.com/LibreELEC/dvb-firmware
+
+if BR2_PACKAGE_DVB_FIRMWARE
+
+config BR2_PACKAGE_DVB_FIRMWARE_FILES
+	string "dvb-firmware-files"
+	help
+	  Whitespace separated list of firmware files,
+	  leave empty for all.
+
+endif
diff --git a/package/dvb-firmware/dvb-firmware.hash b/package/dvb-firmware/dvb-firmware.hash
new file mode 100644
index 0000000000..b1cb4c69b7
--- /dev/null
+++ b/package/dvb-firmware/dvb-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f23b14cf75b45a381c5894b8057c66812a30506a9731f9ff64e9142a8f834cda  dvb-firmware-1.4.2.tar.gz
diff --git a/package/dvb-firmware/dvb-firmware.mk b/package/dvb-firmware/dvb-firmware.mk
new file mode 100644
index 0000000000..769c6ea716
--- /dev/null
+++ b/package/dvb-firmware/dvb-firmware.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# dvb-firmware
+#
+################################################################################
+
+DVB_FIRMWARE_VERSION = 1.4.2
+DVB_FIRMWARE_SITE = $(call github,LibreELEC,dvb-firmware,$(DVB_FIRMWARE_VERSION))
+DVB_FIRMWARE_LICENSE = PROPRIETARY
+DVB_FIRMWARE_REDISTRIBUTE = NO
+
+ifeq ($(call qstrip,$(BR2_PACKAGE_DVB_FIRMWARE_FILES)),)
+
+define DVB_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware
+	cd $(@D)/firmware ; \
+	find . -type f -exec $(INSTALL) -D -m 0644 {} $(TARGET_DIR)/lib/firmware/{} \;
+endef
+
+else
+
+define DVB_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware
+	$(foreach t,$(call qstrip,$(BR2_PACKAGE_DVB_FIRMWARE_FILES)), \
+		$(INSTALL) -D -m 0644 $(@D)/firmware/$(t) \
+			$(TARGET_DIR)/lib/firmware/$(t)
+	)
+endef
+
+endif
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
