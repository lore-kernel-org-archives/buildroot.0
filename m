Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D28C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED1941864;
	Sun, 24 Jul 2022 12:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EED1941864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2DNNDRmSgwN; Sun, 24 Jul 2022 12:32:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6B3424E7;
	Sun, 24 Jul 2022 12:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A6B3424E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 114C91BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F91A84BA2
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F91A84BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2AlCccMlmJY for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:31:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5471C84C3E
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5471C84C3E
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3ACC785C51; Sun, 24 Jul 2022 12:17:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 14:22:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f748c56f1b1fda2cdbb52c012e12569df7f2618
X-Git-Newrev: e2511d88e83acae4144be89ce5e258b724067bd5
X-Patchwork-Hint: ignore
Message-Id: <20220724121731.3ACC785C51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-keyboard: bump to version
 0.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2511d88e83acae4144be89ce5e258b724067bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch license to LGPL-2.1 except applet/applet.c:
  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/commit/?id=267595f2ef18e46c79f76057ad3c6fb40009ca4f
- Drop expat=yes (not needed since
  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/commit/?id=4cf2976842612a0a278de4515715e4e4228c2987)
- xlib_libXrender is a mandatory dependency since
  https://git.yoctoproject.org/matchbox-keyboard/commit/?id=b38f24036cff3be6c2fbcf9ca9881803e69003ac
- libgtk3 is an optional dependency since
  http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/commit/?id=e4ab2198a5f9611027cb62e6ff41ee2593f07d4a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox-keyboard/Config.in              |  1 +
 package/matchbox-keyboard/matchbox-keyboard.hash |  6 +++---
 package/matchbox-keyboard/matchbox-keyboard.mk   | 24 ++++++++++++++++--------
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/package/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
index b6753f3bec..260a57c6a4 100644
--- a/package/matchbox-keyboard/Config.in
+++ b/package/matchbox-keyboard/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "matchbox-keyboard"
 	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXFT if !BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_MATCHBOX_FAKEKEY
 	select BR2_PACKAGE_MATCHBOX_LIB
diff --git a/package/matchbox-keyboard/matchbox-keyboard.hash b/package/matchbox-keyboard/matchbox-keyboard.hash
index c65fbecff4..43ace650a4 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.hash
+++ b/package/matchbox-keyboard/matchbox-keyboard.hash
@@ -1,4 +1,4 @@
-# From http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/0.1/matchbox-keyboard-0.1.tar.bz2.md5
-md5	50940321d59fee23b38a4941100abf25	matchbox-keyboard-0.1.tar.bz2
 # Locally computed
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  44fc6dc6075090d6f8e43f8667cf8a85bed59b7221a5ee81843454c66e352790  matchbox-keyboard-0.1.1.tar.bz2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  bba6fd8976fa5c669ddc1378a3d8d49a74263d4d39efb9a90cefb3583a813ecc  applet/applet.c
diff --git a/package/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
index 23ab5ad7e5..242c4831d1 100644
--- a/package/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-MATCHBOX_KEYBOARD_VERSION = 0.1
+MATCHBOX_KEYBOARD_VERSION = 0.1.1
 MATCHBOX_KEYBOARD_SOURCE = matchbox-keyboard-$(MATCHBOX_KEYBOARD_VERSION).tar.bz2
-MATCHBOX_KEYBOARD_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchbox-keyboard/$(MATCHBOX_KEYBOARD_VERSION)
-MATCHBOX_KEYBOARD_LICENSE = GPL-2.0+
-MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING
-MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expat
-
-# Workaround bug in configure script
-MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
+MATCHBOX_KEYBOARD_SITE = \
+	http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-keyboard/snapshot
+MATCHBOX_KEYBOARD_LICENSE = LGPL-2.1, GPL-2.0+ (applet.c)
+MATCHBOX_KEYBOARD_LICENSE_FILES = COPYING applet/applet.c
+MATCHBOX_KEYBOARD_DEPENDENCIES = \
+	host-pkgconf matchbox-lib matchbox-fakekey expat xlib_libXrender
+# From git
+MATCHBOX_KEYBOARD_AUTORECONF = YES
 
 define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
 	$(INSTALL) -D -m 0755 package/matchbox-keyboard/mb-applet-kbd-wrapper.sh \
@@ -29,4 +30,11 @@ MATCHBOX_KEYBOARD_CONF_OPTS += --disable-cairo
 MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+MATCHBOX_KEYBOARD_CONF_OPTS += --enable-gtk3-im
+MATCHBOX_KEYBOARD_DEPENDENCIES += libgtk3
+else
+MATCHBOX_KEYBOARD_CONF_OPTS += --disable-gtk3-im
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
