Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE7ECD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3265085BAC;
	Tue,  9 Jun 2026 13:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zS84s6NHxNSm; Tue,  9 Jun 2026 13:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07C2885BB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010256;
	bh=cs8l4YAyAHSQnnV7uQhFuOu9aHEY7Xdo9yzq0/M8M/Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OxrNQDmaT3tkdKbQXK38zXX+70GpNuZ5K+j8N5R9+hu+lsQ+0arTTyzuer5j2STWS
	 ATrugz7zjH03PruSYES+gNlLteXMiAc7824bSW2gap5u6TWBJp7fHzOTIONpuWy7H9
	 U9ENcTui//jGCgvq1V5Z7wNCGdxstn5k9aZul54QaR2iyL26L1qFNmnaxaUkzqe7ZM
	 l8JGVZ0c6D070hVEfBHctLoZq5ncbfwkn4PXm+NqDzarDK9NXgV2bCarxj2Ax4i78D
	 7wd8VjvQznY1X3HazOTQwioYn4NEGF1MkS5jDU1k8mTDrajYRJPO2b7s+5GHfzDstg
	 /IOivP4uRbPJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C2885BB2;
	Tue,  9 Jun 2026 13:04:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 462E8196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DC48454B4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5oYP7vV4N0b for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F49541204
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F49541204
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB58C87E68; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:53:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e13cdd9a05fd85abbbdc297a08a7ac63475067e
X-Git-Newrev: 1681beaba367b43657c64832b66f99cf5224444d
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.AB58C87E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: Add MediaTek
 MT7916 WiFi 6E firmware files
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0819826654905271840=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0819826654905271840==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1681beaba367b43657c64832b66f99cf5224444d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 3edb3de702..1f787bde4e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -476,6 +476,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E
 	help
 	  MediaTek MT76x2e
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7916
+	bool "MediaTek MT7916"
+	help
+	  MediaTek MT7916
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921
 	bool "MediaTek MT7921"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f7ed7c2d7e..1e30e2992c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -398,6 +398,15 @@ LINUX_FIRMWARE_FILES += mediatek/mt7662.bin mediatek/mt7662_rom_patch.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
+# MT7916
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7916),y)
+LINUX_FIRMWARE_FILES += mediatek/mt7916_eeprom.bin \
+	mediatek/mt7916_rom_patch.bin \
+	mediatek/mt7916_wa.bin \
+	mediatek/mt7916_wm.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
 # MT7921
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7921),y)
 LINUX_FIRMWARE_FILES += mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin \

--===============0819826654905271840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0819826654905271840==--
