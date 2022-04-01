Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA34C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 16:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDFF260E93;
	Fri,  1 Apr 2022 16:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tOOj8ZJfZkc; Fri,  1 Apr 2022 16:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB9960E21;
	Fri,  1 Apr 2022 16:08:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 310B61BF29D
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 16:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D8A28483B
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 16:08:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=agner.ch
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QCn-dNUr8lA for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 16:08:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0DE0F847BA
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 16:08:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2a02:169:3df5:10::7f8])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 8DA5C5C082C;
 Fri,  1 Apr 2022 18:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1648829282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=9woX58s/zgaHZCQahZxYc7IC2kfdPf0qfiFPSI0sA+A=;
 b=O/LoUVzjLsdQ64EdvuY3vGKh2hhaTCjHttAkJjrsWY02Ust3XEDZfQajwuUyM48jp5bm5O
 k8z9LvekxUhxdl28+5q6uLjAWpkttBOiLjNL1Vk0M3zQ6dTUd+4xn5jTLG+pTuVcRtk40Z
 JuTsEpMhpR3p167eq53WJX38Hx8N+jc=
From: Stefan Agner <stefan@agner.ch>
To: yann.morin.1998@free.fr,
	buildroot@buildroot.org
Date: Fri,  1 Apr 2022 18:07:53 +0200
Message-Id: <e73a57b032c8683fa6f9f45a0cec62468742f5a5.1648829237.git.stefan@agner.ch>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Intel WiFi
 3945ABG/BG/4965AGN
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
Cc: stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Intel WiFi 3945ABG/BG and 4965AGN firmware. This firmware is
required for the iwl4965 and iwl3945 kernel driver.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/linux-firmware/Config.in         | 12 ++++++++++++
 package/linux-firmware/linux-firmware.mk | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4a44d4a2b6..a9a7e914cf 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -199,6 +199,18 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168
 	  Firmware files for the Intel Wifi 3168 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945
+	bool "Intel iwlwifi 3945"
+	help
+	  Firmware files for the Intel Wifi 3945 devices supported by
+	  the iwl4965 kernel driver.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965
+	bool "Intel iwlwifi 4965"
+	help
+	  Firmware files for the Intel Wifi 4965 devices supported by
+	  the iwl3945 kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	bool "Intel iwlwifi 5000"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2eec8a291a..0c725737d0 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -457,6 +457,16 @@ LINUX_FIRMWARE_FILES += iwlwifi-3168-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3945),y)
+LINUX_FIRMWARE_FILES += iwlwifi-3945-2.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_4965),y)
+LINUX_FIRMWARE_FILES += iwlwifi-4965-2.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 # iwlwifi 5000. Multiple files are available (iwlwifi-5000-1.ucode,
 # iwlwifi-5000-2.ucode, iwlwifi-5000-5.ucode), corresponding to
 # different versions of the firmware API. For now, we only install the
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
