Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE45CCD5BAC
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 19:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFBEC81970;
	Fri, 22 May 2026 19:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsifzLENC0zb; Fri, 22 May 2026 19:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4685281586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779477771;
	bh=V8fx7oFBP5Y5V2XALYJq/8Aak+n9jXfnT76CEGFcBzw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oxPl5PwjIDvUMloYZA/mfWzLLD8JCs7a1udXPX7G3WwG8p7sbgnySiD1qorDjCHbf
	 bGjU/8HClkDDENUp4CG2aLWzZtirbZ62tm437GxrL20KgEU2X1Y7+Pi/eKekn0Id7d
	 a3YhrVRqn4faVPnDTid8EN8/JbuyS0JhdApjdOjbaBxJT+Wi2SvwYdbh2W98QuCR7+
	 GboH3Ak8wc5uelttAHXDz4r7pMfG46q+mfF2tQfR4T2OqCK8rLlTZKd2UlxNNmilF2
	 8Iw+AkNPboN4UCmMktTKC+Ts/ADhndqc/Tw2pg4/JgJXBB7YnU/xuPD8UNJlKy3W0y
	 4YtZTpxHbUMug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4685281586;
	Fri, 22 May 2026 19:22:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 547E1265
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 369B481568
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXMAts843i1b for <buildroot@buildroot.org>;
 Fri, 22 May 2026 19:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4613E814EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4613E814EA
 for <buildroot@buildroot.org>; Fri, 22 May 2026 19:22:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 026A386BD1; Fri, 22 May 2026 19:22:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 May 2026 21:16:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a6401b32e77d0f14c364b5dbfef59d2700d90595
X-Git-Newrev: 10bead0096ce55b5520f34d29427c56ef19cc98a
X-Patchwork-Hint: ignore
Message-Id: <20260522192240.026A386BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: add
 WiFi firmware for MT7927
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10bead0096ce55b5520f34d29427c56ef19cc98a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=238e3a14b64bb43814cc338ced682134d6ea33d6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 58ba60e9c3..3edb3de702 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -491,6 +491,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7925
 	help
 	  MediaTek MT7925
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7927
+	bool "MediaTek MT7927"
+	help
+	  MediaTek MT7927
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7986
 	bool "MediaTek MT7986 SOC WiFi"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c076def399..f7ed7c2d7e 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -438,6 +438,14 @@ LINUX_FIRMWARE_FILES += mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
 endif
 
+# MT7927
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7927),y)
+LINUX_FIRMWARE_FILES += \
+	mediatek/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin \
+	mediatek/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mediatek
+endif
+
 # Mediatek MT7986 SoC WiFi
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7986),y)
 LINUX_FIRMWARE_FILES += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
