Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5F2C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD9174F129;
	Mon, 20 Feb 2023 22:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD9174F129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nu66uCKCEld4; Mon, 20 Feb 2023 22:35:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 205984F148;
	Mon, 20 Feb 2023 22:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205984F148
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AC4E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF386416D6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF386416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vUf3tEvWyCh for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6132416DF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6132416DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9334B86495; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 08:21:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7dbe844bae38aba8e6080da3b650b89f702c0f1c
X-Git-Newrev: 1100ead7b3189761765988504609447c88e22da5
X-Patchwork-Hint: ignore
Message-Id: <20230220205213.9334B86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-input-keyboard: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1100ead7b3189761765988504609447c88e22da5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

According to the upstream release notes of version 2.0.0:
https://lists.x.org/archives/xorg-announce/2022-July/003180.html

"This keyboard driver is primarily used with BSD, GNU Hurd, illumos, &
 Solaris systems. Linux systems should instead use either xf86-input-
 libinput or xf86-input-evdev.

 While versions 1.9.0 and earlier had rudimentary support for Linux as
 well, that has been removed in this release."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: Reword help text]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                          |  5 +++++
 package/x11r7/Config.in                                   |  1 -
 package/x11r7/xdriver_xf86-input-keyboard/Config.in       |  5 -----
 .../xdriver_xf86-input-keyboard.hash                      |  4 ----
 .../xdriver_xf86-input-keyboard.mk                        | 15 ---------------
 5 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 852189f0ff..ca25c18b16 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,11 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
+	bool "xf86-input-keyboard removed"
+	help
+	  The X.org keyboard input driver no longer support Linux.
+
 config BR2_TARGET_SUN20I_D1_SPL
 	bool "sun20-d1-spl removed"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
