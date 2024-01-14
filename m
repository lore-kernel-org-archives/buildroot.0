Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C962C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 08:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0608A60E38;
	Sun, 14 Jan 2024 08:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0608A60E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F04R7y0Mfr8O; Sun, 14 Jan 2024 08:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3775E60BEB;
	Sun, 14 Jan 2024 08:47:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3775E60BEB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 172E31BF578
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57F3B8356C
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F3B8356C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DJpmjCy4YWqe for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A2A78355C
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A2A78355C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5767C860FB; Sun, 14 Jan 2024 08:47:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 09:31:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff8186657cdb0b4d4fd8c8b7cee45fa14fa4490c
X-Git-Newrev: ae794be9cd1ff762e5f89c6e9d857297ee703ff4
X-Patchwork-Hint: ignore
Message-Id: <20240114084701.5767C860FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add WiFi and BT
 firmware for MT7921 and MT7922
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
Content-Type: multipart/mixed; boundary="===============4840307140864077692=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4840307140864077692==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ae794be9cd1ff762e5f89c6e9d857297ee703ff4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although similar in name, they use different kernel driver (with the
exception of common Bluetooth driver, but the firmware file is quite
large anyway, so it's worth having the possibility to be specific).

Signed-off-by: Jan Čermák <sairon@sairon.cz>
[yann.morin.1998@free.fr:
  - add hash for license file
  - reorder alphabeticlly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in           | 20 ++++++++++++++++++++
 package/linux-firmware/linux-firmware.hash |  1 +
 package/linux-firmware/linux-firmware.mk   | 26 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 1221a80984..47b765831c 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -64,6 +64,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650
 	help
 	  Firmware files for MediaTek MT7650 bluetooth support
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921_BT
+	bool "MediaTek MT7921"
+	help
+	  Firmware files for MediaTek MT7921 bluetooth support
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922_BT
+	bool "MediaTek MT7922"
+	help
+	  Firmware files for MediaTek MT7922 bluetooth support
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	bool "Qualcomm Atheros Rome 6174A Bluetooth"
 	help
@@ -383,6 +393,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E
 	help
 	  MediaTek MT76x2e
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921
+	bool "MediaTek MT7921"
+	help
+	  MediaTek MT7921
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922
+	bool "MediaTek MT7922"
+	help
+	  MediaTek MT7922
+
 config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
 	bool "Qualcomm Atheros 6174"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 6722aa14c6..67b03dc1b4 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -18,6 +18,7 @@ sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENS
 sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
 sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
+sha256  a90d3f66704d85889945fec5525ea77622549da83aced1aac99828383f8f1805  LICENCE.mediatek
 sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
 sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENCE.moxa
 sha256  0bd9f7cae3cf72b12a63359a725ccbb76ddbd6831372695a9162144329800dd0  LICENCE.qat_firmware
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d061c9f402..b9a6154331 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -382,6 +382,32 @@ LINUX_FIRMWARE_FILES += mediatek/mt7662.bin mediatek/mt7662_rom_patch.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
+# MT7921
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921),y)
+LINUX_FIRMWARE_FILES += mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin \
+			mediatek/WIFI_RAM_CODE_MT7961_1.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
+# Mediatek MT7921 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921_BT),y)
+LINUX_FIRMWARE_FILES += mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
+# MT7922
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922),y)
+LINUX_FIRMWARE_FILES += mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin \
+			mediatek/WIFI_RAM_CODE_MT7922_1.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
+# Mediatek MT7922 Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7922_BT),y)
+LINUX_FIRMWARE_FILES += mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
 # qca6174
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA6174

--===============4840307140864077692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4840307140864077692==--
