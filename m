Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F8DCAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37284809A7;
	Mon,  8 Sep 2025 14:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aUqdOzKqewX; Mon,  8 Sep 2025 14:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF0680999
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FF0680999;
	Mon,  8 Sep 2025 14:18:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D38B186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5457740082
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTffNcvgyLH5 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C3EE40074
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C3EE40074
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9912180DA7; Mon,  8 Sep 2025 14:16:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 22:40:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 076888b071516c540bbdac5003e307f052fc81fc
X-Git-Newrev: 4b47f88cb4652c5bdc4700ee058cdf240f7f9064
X-Patchwork-Hint: ignore
Message-Id: <20250908141631.9912180DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add Intel 7 WiFi
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4b47f88cb4652c5bdc4700ee058cdf240f7f9064
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add firmware to support BE20x devices
- extend bluetooth helptext as it already includes the required firmwares

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Julien: reflow BR2_PACKAGE_LINUX_FIRMWARE_IBT help string
    to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in         | 10 ++++++++--
 package/linux-firmware/linux-firmware.mk |  5 +++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 778dfef8a0..e1bbfc19ec 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -81,8 +81,8 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC
 config BR2_PACKAGE_LINUX_FIRMWARE_IBT
 	bool "Intel Wireless Bluetooth"
 	help
-	  Firmware files for Intel 3160/7260/7265/8260/8265 Wireless
-	  bluetooth support.
+	  Firmware files for Intel 3160/7260/7265/8260/8265/9xxx/6E/7
+	  Wireless bluetooth support.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650
 	bool "MediaTek MT7650"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
