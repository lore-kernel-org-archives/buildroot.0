Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0AFC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EE7D40516;
	Sun, 12 May 2024 10:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAsx71GSpFeH; Sun, 12 May 2024 10:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D0884053D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D0884053D;
	Sun, 12 May 2024 10:29:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6C21BF290
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64C7A40B21
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FllV-1AVFWQP for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9021B400D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9021B400D8
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:29:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B822870A5; Sun, 12 May 2024 10:29:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:27:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc3464c4b6da12c9d8809ada5bf7b26de0f7414c
X-Git-Newrev: acce2e3a38e849b2f85b7bd423c54c7ab29ec82f
X-Patchwork-Hint: ignore
Message-Id: <20240512102905.7B822870A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add options for
 missing Intel b/g/n cards
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2031083242638451301=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2031083242638451301==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=acce2e3a38e849b2f85b7bd423c54c7ab29ec82f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add firmware files for missing cards from the 802.11bgn product list
in the Linux Firmware Wiki [1].

So far only Wireless-N 130 and 1030 were supported, which use the
6000G2B microcode.

[1] https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi#supported_devices

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 36 ++++++++++++++++++++++++++++++++
 package/linux-firmware/linux-firmware.mk | 30 ++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 7e19d14b1e..fa08b342f1 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -195,6 +195,42 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW54XXX
 	help
 	  Firmware files for the Cypress cyw54xxx FullMAC.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_100
+	bool "Intel iwlwifi 100"
+	help
+	  Firmware files for the Intel Wifi 100 devices supported by
+	  the iwlwifi kernel driver.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_105
+	bool "Intel iwlwifi 105"
+	help
+	  Firmware files for the Intel Wifi 105 devices supported by
+	  the iwlwifi kernel driver.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_135
+	bool "Intel iwlwifi 135"
+	help
+	  Firmware files for the Intel Wifi 135 devices supported by
+	  the iwlwifi kernel driver.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_1000
+	bool "Intel iwlwifi 1000"
+	help
+	  Firmware files for the Intel Wifi 1000 devices supported by
+	  the iwlwifi kernel driver.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2000
+	bool "Intel iwlwifi 2000"
+	help
+	  Firmware files for the Intel Wifi 2000 devices supported by
+	  the iwlwifi kernel driver.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2030
+	bool "Intel iwlwifi 2030"
+	help
+	  Firmware files for the Intel Wifi 2030 devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000
 	bool "Intel iwlwifi 22000"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 3e7cb64a94..8dcd57fb7c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -477,6 +477,36 @@ LINUX_FIRMWARE_FILES += wil6210.*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_100),y)
+LINUX_FIRMWARE_FILES += iwlwifi-100-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_105),y)
+LINUX_FIRMWARE_FILES += iwlwifi-105-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_135),y)
+LINUX_FIRMWARE_FILES += iwlwifi-135-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_1000),y)
+LINUX_FIRMWARE_FILES += iwlwifi-1000-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2000),y)
+LINUX_FIRMWARE_FILES += iwlwifi-2000-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_2030),y)
+LINUX_FIRMWARE_FILES += iwlwifi-2030-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
 LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode iwlwifi-Qu-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware

--===============2031083242638451301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2031083242638451301==--
