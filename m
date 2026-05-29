Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D474CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE7E680B0C;
	Fri, 29 May 2026 18:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6LggOiM0p4a; Fri, 29 May 2026 18:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB3980A92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780080865;
	bh=LovrbUSWO8AG8PTIh9BSDXgWFTfzK3kvMWlirdy4KmQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cW5nc3RRy7w3VGWlLtm05L4KBGINFzpJoi1ElPLN0XdnIS6BDvZgnTTWsPxp2nXFe
	 hrogQVBPG03x9HelcNNhNxSr+5zd6s/myMiJymQdz+0uzCktZKFA2W/YYql7Llw1PW
	 bF4yFY6tJN614a/d4/0uFjG2uI8n+ytKVjBymMxrdxg7NI2oXhmvxrVOsEI6Qs7HjL
	 1a+TuwoG8l16sD28Y2xr7gZIDvgkbVFPZK2n3Wk2vhRi0cpv1UQfAmxu5uysuR3/MJ
	 OoLvXgPNuTwcLPvceAAvZbES57QvAVzpf7HO/txzzAmAW2Y0NtAcAMbel/7dcsed2L
	 VsqdQQg6d+rwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB3980A92;
	Fri, 29 May 2026 18:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78290288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66770404A2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxBhnRPNoEfq for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE72C40449
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE72C40449
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:54:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25F2C8744C; Fri, 29 May 2026 18:54:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:53:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6e13cdd9a05fd85abbbdc297a08a7ac63475067e
X-Git-Newrev: 1681beaba367b43657c64832b66f99cf5224444d
X-Patchwork-Hint: ignore
Message-Id: <20260529185410.25F2C8744C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: Add
 MediaTek MT7916 WiFi 6E firmware files
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
Content-Type: multipart/mixed; boundary="===============7033101503522364285=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7033101503522364285==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1681beaba367b43657c64832b66f99cf5224444d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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

--===============7033101503522364285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7033101503522364285==--
