Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305CFCAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EA57425DC;
	Thu, 11 Sep 2025 20:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eerwAZ-pks12; Thu, 11 Sep 2025 20:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6793D425DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6793D425DA;
	Thu, 11 Sep 2025 20:04:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA740234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFC9C421D4
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3DETcEqP6Ys for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 106F1421D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 106F1421D5
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00E0D8438D; Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:02:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1095f674a5b515a2b4aaaad30226e98e22f4d8ca
X-Git-Newrev: d2a861a861350b9be5df4fdff3a1f4893191f2c0
X-Patchwork-Hint: ignore
Message-Id: <20250911200422.00E0D8438D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsexy: remove package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2a861a861350b9be5df4fdff3a1f4893191f2c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsexy requires libgtk2, which we're about to remove, so let's drop
libsexy. The last release was in 2007.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/libsexy/Config.in    | 11 -----------
 package/libsexy/libsexy.hash |  3 ---
 package/libsexy/libsexy.mk   | 14 --------------
 5 files changed, 7 insertions(+), 29 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 26d9e29b2b..1c14463aae 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LIBSEXY
+	bool "libsexy has been removed"
+	select BR2_LEGACY
+	help
+	  The libsexy package has been removed, as libgtk2 has been
+	  removed as well.
+
 config BR2_PACKAGE_LIBGLADE
 	bool "libglade has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index c981d0119c..a1aa1273da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -417,7 +417,6 @@ comment "X applications"
 comment "X libraries and helper libraries"
 	depends on BR2_PACKAGE_XORG7
 
-	source "package/libsexy/Config.in"
 	source "package/x11r7/xkeyboard-config/Config.in"
 
 comment "X window managers"
diff --git a/package/libsexy/Config.in b/package/libsexy/Config.in
deleted file mode 100644
index a2a2cc820c..0000000000
--- a/package/libsexy/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBSEXY
-	bool "libsexy"
-	depends on BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_LIBXML2
-	help
-	  libsexy is a collection of GTK+ widgets that extend the
-	  functionality of such standard widgets as GtkEntry and
-	  GtkLabel by subclassing them and working around the
-	  limitations of the widgets.
-
-	  https://blog.chipx86.com/tag/libsexy/
diff --git a/package/libsexy/libsexy.hash b/package/libsexy/libsexy.hash
deleted file mode 100644
index 6f47e8ba7c..0000000000
--- a/package/libsexy/libsexy.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e  libsexy-0.1.11.tar.gz
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
deleted file mode 100644
index b079264122..0000000000
--- a/package/libsexy/libsexy.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# libsexy
-#
-################################################################################
-
-LIBSEXY_VERSION = 0.1.11
-LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy
-LIBSEXY_DEPENDENCIES = libgtk2 libxml2
-LIBSEXY_INSTALL_STAGING = YES
-LIBSEXY_LICENSE = LGPL-2.1+
-LIBSEXY_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
