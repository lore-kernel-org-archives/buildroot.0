Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B68C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98177812B1;
	Sat, 19 Jul 2025 10:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41r2CVtivczH; Sat, 19 Jul 2025 10:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 903BD811BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 903BD811BD;
	Sat, 19 Jul 2025 10:49:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11999DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E784961B35
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlkjpKNkhRVM for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D51661441
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D51661441
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CFAD8678A; Sat, 19 Jul 2025 10:49:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 12:45:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57b6f97959d2ea2ab3d1039d7977c8f10423f43f
X-Git-Newrev: 1eaeb6fcb94df5a6a7844918a9b77a0e2b458fd3
X-Patchwork-Hint: ignore
Message-Id: <20250719104953.1CFAD8678A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add support for
 PowerVR rogue
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

commit: https://git.buildroot.net/buildroot/commit/?id=1eaeb6fcb94df5a6a7844918a9b77a0e2b458fd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This "powervr" directory has been present in linux-firmware since
version 20231211.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in           | 5 +++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index b02ee03f56..778dfef8a0 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -735,6 +735,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
 	  Firmware files for Arm Mali 10th generation GPU
 	  needed by the linux panthor kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_POWERVR_ROGUE
+	bool "PowerVR Technologies Rogue GPU firmware"
+	help
+	  Firmware files for PowerVR Technologies Rogue video cards.
+
 endmenu
 
 menu "Serial adapters firmware"
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 7381f0c03a..e980010cd8 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -27,6 +27,7 @@ sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENC
 sha256  a90d3f66704d85889945fec5525ea77622549da83aced1aac99828383f8f1805  LICENCE.mediatek
 sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
 sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENCE.moxa
+sha256  1c9aa6bd6703a7ce1cdb879542fa1d8aca115a327bd819b193c971de9c53f402  LICENSE.powervr
 sha256  0bd9f7cae3cf72b12a63359a725ccbb76ddbd6831372695a9162144329800dd0  LICENCE.qat_firmware
 sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENCE.qla2xxx
 sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENCE.ralink-firmware.txt
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 02e04770d0..40758054e5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -936,6 +936,11 @@ LINUX_FIRMWARE_FILES += arm/mali/arch*/mali_csffw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_POWERVR_ROGUE),y)
+LINUX_FIRMWARE_DIRS += powervr
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.powervr
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
 LINUX_FIRMWARE_FILES += rp2.fw
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
