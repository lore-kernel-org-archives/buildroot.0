Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD15DCA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 11:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF8760720;
	Thu,  4 Sep 2025 11:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNsltCbB_76G; Thu,  4 Sep 2025 11:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A2ED60A83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A2ED60A83;
	Thu,  4 Sep 2025 11:41:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01CDC111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 11:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D607C40160
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 11:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYEY39dswEOP for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 11:41:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1330A40148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1330A40148
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1330A40148
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 11:41:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD8871814B9; Thu,  4 Sep 2025 13:41:42 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  4 Sep 2025 13:41:00 +0200
Message-ID: <20250904114108.3169804-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1756986104; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=cpVlaVRSMisMZ46bSJQdkNoH9OYst/KQgNlrpVVAjis=;
 b=vpWICc+goS/HwxNlFAhGE5vKWad+sKLbsoJrgInKCWE5h5bKoUo6yS2RFc7Dn1q76lUhwo
 6IViDi9W2KpizsYL1eJUiH7DEzVs7NJkuHbhKkwlScww2GKhGaemcKm3Udpztp9YAn0KXO
 SE0/rutx6CXIRy1V0puuGCHT48fHDKE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=vpWICc+g
Subject: [Buildroot] [PATCH] package/linux-firmware: add Intel 7 WiFi
 firmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- add firmware to support BE20x devices
- extend bluetooth helptext as it already includes the required firmwares

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/linux-firmware/Config.in         | 8 +++++++-
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 778dfef8a0..181bcfc565 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -81,7 +81,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC
 config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	bool "Intel Wireless Bluetooth"
 	help
-	  Firmware files for Intel 3160/7260/7265/8260/8265 Wireless
+	  Firmware files for Intel 3160/7260/7265/8260/8265/9xxx/6E/7 Wireless
 	  bluetooth support.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650
@@ -355,6 +355,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E
 	  Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devices
 	  supported by the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7
+	bool "Intel iwlwifi 7"
+	help
+	  Firmware files for the Intel Wi-Fi 7 (BE20x) devices
+	  supported by the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ
 	bool "Intel iwlwifi QuZ"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 40758054e5..59de2ea8b8 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -629,6 +629,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7),y)
+LINUX_FIRMWARE_FILES += iwlwifi-gl-c0-fm-c0*.{ucode,pnvm}
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_QUZ),y)
 LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
