Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D99C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 11:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1E18426F9;
	Sat,  8 Jun 2024 11:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpH66pvX6IgQ; Sat,  8 Jun 2024 11:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F0A426E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48F0A426E2;
	Sat,  8 Jun 2024 11:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D91351BF5DA
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43FC60676
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-K_Aok4gItv for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 11:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDDFA605F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDDFA605F5
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 11:39:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB6DC86F74; Sat,  8 Jun 2024 11:39:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 13:19:03 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4e04997601e873c69bc038cbb3b8ceefdfd8a9ee
X-Git-Newrev: abfb30a0384093b3df5ecd42607fbd6e9e9e47ea
X-Patchwork-Hint: ignore
Message-Id: <20240608113940.BB6DC86F74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/linux-firmware:
 add options for missing Intel b/g/n cards
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6249531449842209369=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6249531449842209369==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=abfb30a0384093b3df5ecd42607fbd6e9e9e47ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Add firmware files for missing cards from the 802.11bgn product list
in the Linux Firmware Wiki [1].

So far only Wireless-N 130 and 1030 were supported, which use the
6000G2B microcode.

[1] https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi#supported_devices

Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit acce2e3a38e849b2f85b7bd423c54c7ab29ec82f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in         | 36 ++++++++++++++++++++++++++++++++
 package/linux-firmware/linux-firmware.mk | 30 ++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 920c0a2ef1..6fb8953c1c 100644
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
index 60e8861abe..b25c972634 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -486,6 +486,36 @@ LINUX_FIRMWARE_FILES += wil6210.*
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

--===============6249531449842209369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6249531449842209369==--
