Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737B4C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 14:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2431B81EF5;
	Fri, 23 Aug 2024 14:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLuVjt0YmnEL; Fri, 23 Aug 2024 14:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D6CC81F21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D6CC81F21;
	Fri, 23 Aug 2024 14:31:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6FF1BF2E5
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5829940198
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gy0qdvjDVlca for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 14:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6479B4015C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6479B4015C
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 14:31:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D31886335; Fri, 23 Aug 2024 14:31:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 16:31:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fdbab87a2b9d00743ed9fe6caa6db365d7ca326
X-Git-Newrev: ed2d440a08aba129a737705b2ac4231dc1bb0be4
X-Patchwork-Hint: ignore
Message-Id: <20240823143140.4D31886335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frotz: remove the "frotz" package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed2d440a08aba129a737705b2ac4231dc1bb0be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

I'm not much interested anymore in maintaining the "frotz" package
in buildroot, and since I likely was the only one who really used
it in the past years, I guess it's time remove it now.

Fixes:

  http://autobuild.buildroot.net/results/077e4756e56903f094b935af4ee8829507e0c3de/

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy         |  7 +++++++
 package/Config.in        |  1 -
 package/frotz/Config.in  | 10 ----------
 package/frotz/frotz.hash |  3 ---
 package/frotz/frotz.mk   | 31 -------------------------------
 5 files changed, 7 insertions(+), 45 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0bae66c3bb..d8480106ba 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_FROTZ
+	bool "frotz has been removed"
+	select BR2_LEGACY
+	help
+	  This package was causing build breakage, and was no longer
+	  maintained in Buildroot.
+
 config BR2_PACKAGE_FAN_CTRL
 	bool "fan-ctrl has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 317f859684..211080345a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -293,7 +293,6 @@ menu "Games"
 	source "package/doom-wad/Config.in"
 	source "package/flare-engine/Config.in"
 	source "package/flare-game/Config.in"
-	source "package/frotz/Config.in"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
diff --git a/package/frotz/Config.in b/package/frotz/Config.in
deleted file mode 100644
index 9473f5944d..0000000000
--- a/package/frotz/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_FROTZ
-	bool "frotz"
-	select BR2_PACKAGE_NCURSES
-	help
-	  Frotz is an interpreter for old Infocom adventure games and
-	  other Z-code games. Note that frotz cannot be run as root.
-	  You must add a normal user to your buildroot configuration to
-	  be able to use it.
-
-	  https://661.org/proj/if/frotz/
diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
deleted file mode 100644
index 145aa3800f..0000000000
--- a/package/frotz/frotz.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  bdf9131e6de49108c9f032200cea3cb4011e5ca0c9fbdbf5b0c05f7c56c81395  frotz-2.54.tar.bz2
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
deleted file mode 100644
index 4c477c396d..0000000000
--- a/package/frotz/frotz.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-################################################################################
-#
-# Frotz
-#
-################################################################################
-
-FROTZ_VERSION = 2.54
-FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
-FROTZ_SITE = $(call gitlab,DavidGriffith,frotz,$(FROTZ_VERSION))
-FROTZ_DEPENDENCIES = host-pkgconf ncurses
-FROTZ_LICENSE = GPL-2.0+
-FROTZ_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-FROTZ_CURSES=ncursesw
-FROTZ_UTF8=yes
-else
-FROTZ_CURSES=ncurses
-endif
-
-define FROTZ_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr CONFIG_DIR=/etc \
-		SOUND_TYPE=none CURSES="$(FROTZ_CURSES)" USE_UTF8=$(FROTZ_UTF8) \
-		CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
-endef
-
-define FROTZ_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/frotz $(TARGET_DIR)/usr/bin/frotz
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
