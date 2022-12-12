Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E9C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 21:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0F474008B;
	Mon, 12 Dec 2022 21:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F474008B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlmROPQFtgr9; Mon, 12 Dec 2022 21:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B26C241571;
	Mon, 12 Dec 2022 21:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26C241571
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8A471BF30A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8496980FBA
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8496980FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GZVcpuCKTbGt for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 21:14:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2423780D4D
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2423780D4D
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 21:14:32 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout09.t-online.de (Postfix) with SMTP id 7A3F020E35
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 22:14:29 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4q85-0KealF0; Mon, 12 Dec 2022 22:14:29 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45210)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4q84-0005rX-2t
 for buildroot@buildroot.org; Mon, 12 Dec 2022 22:14:28 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 22:14:28 +0100
Message-Id: <20221212211428.2036144-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670879669-EF7E87E2-98372BE2/0/0 CLEAN NORMAL
X-TOI-MSGID: 3544f8f4-9ced-48ce-aeee-dd555cef5e24
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-keyboard:
 remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to the upstream release notes of version 2.0.0:
https://lists.x.org/archives/xorg-announce/2022-July/003180.html

"This keyboard driver is primarily used with BSD, GNU Hurd, illumos, &
 Solaris systems. Linux systems should instead use either xf86-input-
 libinput or xf86-input-evdev.

 While versions 1.9.0 and earlier had rudimentary support for Linux as
 well, that has been removed in this release."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                  |  5 +++++
 package/x11r7/Config.in                           |  1 -
 .../x11r7/xdriver_xf86-input-keyboard/Config.in   |  5 -----
 .../xdriver_xf86-input-keyboard.hash              |  4 ----
 .../xdriver_xf86-input-keyboard.mk                | 15 ---------------
 5 files changed, 5 insertions(+), 25 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-input-keyboard/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
 delete mode 100644 package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 28c6822689..b70d4c7206 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,11 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
+	bool "xf86-input-keyboard removed"
+	help
+	  The X.org keyboard input driver does not support linux.
+
 config BR2_PACKAGE_PYTHON_M2R
 	bool "python-m2r removed"
 	select BR2_LEGACY
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index da79c4e851..4d3613cf4d 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -149,7 +149,6 @@ if BR2_PACKAGE_XORG7
 	menu "X11R7 Drivers"
 		source package/x11r7/xdriver_xf86-input-evdev/Config.in
 		source package/x11r7/xdriver_xf86-input-joystick/Config.in
-		source package/x11r7/xdriver_xf86-input-keyboard/Config.in
 		source package/x11r7/xdriver_xf86-input-libinput/Config.in
 		source package/x11r7/xdriver_xf86-input-mouse/Config.in
 		source package/x11r7/xdriver_xf86-input-synaptics/Config.in
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/Config.in b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
deleted file mode 100644
index ee23033b97..0000000000
--- a/package/x11r7/xdriver_xf86-input-keyboard/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
-	bool "xf86-input-keyboard"
-	select BR2_PACKAGE_XORGPROTO
-	help
-	  Keyboard input driver
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
deleted file mode 100644
index 66e2c3ed95..0000000000
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://lists.x.org/archives/xorg-announce/2016-November/002739.html
-sha256  f7c900f21752683402992b288d5a2826de7a6c0c0abac2aadd7e8a409e170388  xf86-input-keyboard-1.9.0.tar.bz2
-# Locally calculated
-sha256  b91b17c53724c79685e3025a38028b7d48c966fdd239e0efe2d98874d3c139a0  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
deleted file mode 100644
index fb1e289643..0000000000
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-keyboard
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.9.0
-XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_INPUT_KEYBOARD_LICENSE = MIT
-XDRIVER_XF86_INPUT_KEYBOARD_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xorgproto
-XDRIVER_XF86_INPUT_KEYBOARD_CONF_OPTS = --disable-selective-werror
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
