Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30018CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C0F60817;
	Thu,  4 Sep 2025 16:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnfMNIqyrAqB; Thu,  4 Sep 2025 16:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BD57607E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BD57607E5;
	Thu,  4 Sep 2025 16:34:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9997D106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 695BE400A4
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QoGKAaC9J7X for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A125F40097
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A125F40097
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F74187E99; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:11:09 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 76553ff10b01255a506e90cd95f7d00e4710f146
X-Git-Newrev: 3fc2f3d0e274b6fe4030d87a9ffe4d8ec77668b6
X-Patchwork-Hint: ignore
Message-Id: <20250904163335.9F74187E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/b43-firmware: fix
 upstream URL
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fc2f3d0e274b6fe4030d87a9ffe4d8ec77668b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Unfortunately Larry Finger passed away in June 2024 [1], and
lwfinger.com is now squatted, and no longer has the same content as
before, causing a breakage when trying to download the 5.100.138
version of b43-firmware.

Since the exact same file is available from the OpenWrt mirror, and we
already use this mirror for the other b43-firmware version, let's use
the OpenWrt mirror for both.

Fixes:

  https://autobuild.buildroot.org/results/daf0aefbb10299f150c2c6a93df759ad07974752/

[1] https://lore.kernel.org/linux-wireless/77997185-86a6-41c5-af7a-74e4e9064437@lwfinger.net/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b723ff555fd7ddb8c41136414ace4464fe9f5cd5)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/b43-firmware/b43-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/b43-firmware/b43-firmware.mk b/package/b43-firmware/b43-firmware.mk
index 8e9e877692..d4ab8c9b24 100644
--- a/package/b43-firmware/b43-firmware.mk
+++ b/package/b43-firmware/b43-firmware.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
+B43_FIRMWARE_SITE = http://mirror2.openwrt.org/sources
+
 ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_AFTER_3_2),y)
 B43_FIRMWARE_VERSION = 5.100.138
-B43_FIRMWARE_SITE = http://www.lwfinger.com/b43-firmware
 B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION).tar.bz2
 B43_FIRMWARE_DRIVER_FILE = linux/wl_apsta.o
 else ifeq ($(BR2_PACKAGE_B43_FIRMWARE_KERNEL_BEFORE_3_2),y)
 B43_FIRMWARE_VERSION = 5.10.56.27.3
-B43_FIRMWARE_SITE = http://mirror2.openwrt.org/sources
 B43_FIRMWARE_SOURCE = broadcom-wl-$(B43_FIRMWARE_VERSION)_mipsel.tar.bz2
 B43_FIRMWARE_DRIVER_FILE = driver/wl_apsta/wl_prebuilt.o
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
