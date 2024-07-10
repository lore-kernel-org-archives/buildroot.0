Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8811C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 22:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1AD040710;
	Wed, 10 Jul 2024 22:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69u6x0-1QanE; Wed, 10 Jul 2024 22:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 762C040711
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 762C040711;
	Wed, 10 Jul 2024 22:03:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE3F1BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22B0E61073
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 22:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4QeSeVbzn9X for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 22:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C7BB607DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C7BB607DE
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 22:03:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4806384924; Wed, 10 Jul 2024 22:03:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 00:02:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 623bd47c26caa72e772d9ccb073eb806fae950ea
X-Git-Newrev: a2f6d71e55e8924f0ae17c5f5050ed3b87ffaec0
X-Patchwork-Hint: ignore
Message-Id: <20240710220341.4806384924@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add WiFi and BT
 firmware for MT7925
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2f6d71e55e8924f0ae17c5f5050ed3b87ffaec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index fa08b342f1..1f00afe4e8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -79,6 +79,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922_BT
 	help
 	  Firmware files for MediaTek MT7922 bluetooth support
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925_BT
+	bool "MediaTek MT7925"
+	help
+	  Firmware files for MediaTek MT7925 bluetooth support
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	bool "Qualcomm Atheros Rome 6174A Bluetooth"
 	help
@@ -444,6 +449,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922
 	help
 	  MediaTek MT7922
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925
+	bool "MediaTek MT7925"
+	help
+	  MediaTek MT7925
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
 	bool "Qualcomm Atheros 6174"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ecf27e1642..beab374965 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -404,6 +404,20 @@ LINUX_FIRMWARE_FILES += mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
 endif
 
+# MT7925
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925),y)
+LINUX_FIRMWARE_FILES += \
+	mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin \
+	mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
+# Mediatek MT7925 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925_BT),y)
+LINUX_FIRMWARE_FILES += mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
 # qca6174
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA6174
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
