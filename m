Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4850CC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBAC94F044;
	Fri, 28 Feb 2025 17:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMcH6blOLbh5; Fri, 28 Feb 2025 17:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75D944EFFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75D944EFFD;
	Fri, 28 Feb 2025 17:14:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 038F768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACB4342F68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5vW5Zxgm3c6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28A544332B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28A544332B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 171E485E25; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 12:38:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b4006287f86ad52b0f5bf929f4a7f34c1a5720b4
X-Git-Newrev: e602ea0d608b1fe15607ed37f12c88d92b55a4da
X-Patchwork-Hint: ignore
Message-Id: <20250228163034.171E485E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/obsidian-cursors: drop
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e602ea0d608b1fe15607ed37f12c88d92b55a4da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/97ac940d6e279cfa493c6b5d9b4d318d8dda10da/

The tarball is no longer available for direct download as kde-look.org has
hidden the downloads behind a nag screen, there are no reverse dependencies
or DEVELOPERS entry for it and the package has not been updated since it was
added in 2015 by commit ae2faeffb17d ("obsidian-cursors: new package"), so
drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                               |  7 +++++++
 package/Config.in                              |  1 -
 package/obsidian-cursors/Config.in             |  6 ------
 package/obsidian-cursors/obsidian-cursors.hash |  2 --
 package/obsidian-cursors/obsidian-cursors.mk   | 18 ------------------
 5 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2cb7cbd51f..3e3be95004 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_OBSIDIAN_CURSORS
+	bool "obsidian-cursors has been removed"
+	select BR2_LEGACY
+	help
+	  The obsidian cursors package is no longer available for
+	  direct download.
+
 config BR2_PACKAGE_W_SCAN
 	bool "w_scan has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0759a9df47..7da8e10c36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -261,7 +261,6 @@ menu "Fonts, cursors, icons, sounds and themes"
 
 comment "Cursors"
 	source "package/comix-cursors/Config.in"
-	source "package/obsidian-cursors/Config.in"
 
 comment "Fonts"
 	source "package/bitstream-vera/Config.in"
diff --git a/package/obsidian-cursors/Config.in b/package/obsidian-cursors/Config.in
deleted file mode 100644
index 49ec310170..0000000000
--- a/package/obsidian-cursors/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_OBSIDIAN_CURSORS
-	bool "obsidian-cursors"
-	help
-	  Obsidian Cursors is a shiny and clean cursor set.
-
-	  http://kde-look.org/content/show.php/Obsidian+Cursors?content=73135
diff --git a/package/obsidian-cursors/obsidian-cursors.hash b/package/obsidian-cursors/obsidian-cursors.hash
deleted file mode 100644
index a476a0ba05..0000000000
--- a/package/obsidian-cursors/obsidian-cursors.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  3d38fe875f6feae8b7772e02cfda530fcf669479807915cd2c12c149da17cfb9  73135-Obsidian.tar.bz2
diff --git a/package/obsidian-cursors/obsidian-cursors.mk b/package/obsidian-cursors/obsidian-cursors.mk
deleted file mode 100644
index 87a8d62f3e..0000000000
--- a/package/obsidian-cursors/obsidian-cursors.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# obsidian-cursors
-#
-################################################################################
-
-OBSIDIAN_CURSORS_VERSION = 1.0
-OBSIDIAN_CURSORS_SITE = http://kde-look.org/CONTENT/content-files
-OBSIDIAN_CURSORS_SOURCE = 73135-Obsidian.tar.bz2
-OBSIDIAN_CURSORS_LICENSE = GPL
-
-define OBSIDIAN_CURSORS_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/share/cursors/xorg-x11/Obsidian
-	cp -a $(@D)/cursors \
-		$(TARGET_DIR)/usr/share/cursors/xorg-x11/Obsidian
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
