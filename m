Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39188CA1012
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 10:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E2B615B6;
	Sat,  6 Sep 2025 10:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfqnbFHC7vHU; Sat,  6 Sep 2025 10:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DEC661128
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DEC661128;
	Sat,  6 Sep 2025 10:06:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 504AAE0E
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 10:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FE4B40442
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 10:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HP33AucqVzhF for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 10:06:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D26EF4020F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D26EF4020F
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 10:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C777A8374C; Sat,  6 Sep 2025 10:06:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Sep 2025 11:55:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4b47f88cb4652c5bdc4700ee058cdf240f7f9064
X-Git-Newrev: 53e0a4bd355d0d48dad74407de32a096a342649f
X-Patchwork-Hint: ignore
Message-Id: <20250906100605.C777A8374C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: add
 option for mediatek MT7986 firmware (WiFi)
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
Content-Type: multipart/mixed; boundary="===============8718972632210106924=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8718972632210106924==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=53e0a4bd355d0d48dad74407de32a096a342649f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add an option to install the firmware files for Wifi in Mediatek
MT7986 SOC, which are present on BananaPi r3.

Signed-off-by: Mattias Walström <lazzer@gmail.com>
[Julien:
 - fix tabs/spaces to remove check-package errors
 - move config to keep alphabetical order
 - add info in .mk comment
 - reindent LINUX_FIRMWARE_FILES
 - move .mk block to keep alphabetical order
 - fix license file to LICENCE.mediatek
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in         |  5 +++++
 package/linux-firmware/linux-firmware.mk | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index e1bbfc19ec..1f33fbc0bd 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -480,6 +480,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925
 	help
 	  MediaTek MT7925
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7986
+	bool "MediaTek MT7986 SOC WiFi"
+	help
+	  MediaTek MT7986 SOC WiFi
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
 	bool "Qualcomm Atheros 6174"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 59de2ea8b8..7f1a789057 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -432,6 +432,23 @@ LINUX_FIRMWARE_FILES += mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
 endif
 
+# Mediatek MT7986 SoC WiFi
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7986),y)
+LINUX_FIRMWARE_FILES += \
+	mediatek/mt7986_eeprom_mt7975_dual.bin \
+	mediatek/mt7986_eeprom_mt7976.bin \
+	mediatek/mt7986_eeprom_mt7976_dbdc.bin \
+	mediatek/mt7986_eeprom_mt7976_dual.bin \
+	mediatek/mt7986_rom_patch.bin \
+	mediatek/mt7986_rom_patch_mt7975.bin \
+	mediatek/mt7986_wa.bin \
+	mediatek/mt7986_wm.bin \
+	mediatek/mt7986_wm_mt7975.bin \
+	mediatek/mt7986_wo_0.bin \
+	mediatek/mt7986_wo_1.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
 # qca6174
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA6174

--===============8718972632210106924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8718972632210106924==--
