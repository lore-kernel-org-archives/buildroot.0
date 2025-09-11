Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D36ACAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFEA80E55;
	Thu, 11 Sep 2025 20:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuHgjLVPXSu5; Thu, 11 Sep 2025 20:04:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16E8680D51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E8680D51;
	Thu, 11 Sep 2025 20:04:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF7EE443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C170A6F596
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx9EluXf5pE9 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 072BA6F58E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 072BA6F58E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:04:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E82388438F; Thu, 11 Sep 2025 20:04:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:59:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b80bb9c4c52d9d8db7e30b2cf8e05306712f54fb
X-Git-Newrev: 1095f674a5b515a2b4aaaad30226e98e22f4d8ca
X-Patchwork-Hint: ignore
Message-Id: <20250911200421.E82388438F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglade: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1095f674a5b515a2b4aaaad30226e98e22f4d8ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libglade requires libgtk2, which we're about to remove, so let's drop
libglade. The last release was in 2009 and it doesn't exist any more on
gitlab.gnome.org.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy               |  7 +++++++
 package/Config.in              |  1 -
 package/libglade/Config.in     | 21 ---------------------
 package/libglade/libglade.hash |  5 -----
 package/libglade/libglade.mk   | 23 -----------------------
 5 files changed, 7 insertions(+), 50 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c65ab01930..26d9e29b2b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LIBGLADE
+	bool "libglade has been removed"
+	select BR2_LEGACY
+	help
+	  The libglade package has been removed, as libgtk2 has been
+	  removed as well.
+
 config BR2_PACKAGE_LEAFPAD
 	bool "leafpad has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index abc7ddcba2..c981d0119c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1758,7 +1758,6 @@ menu "Graphics"
 	source "package/libfreeimage/Config.in"
 	source "package/libgdiplus/Config.in"
 	source "package/libgeotiff/Config.in"
-	source "package/libglade/Config.in"
 	source "package/libglew/Config.in"
 	source "package/libglfw/Config.in"
 	source "package/libglu/Config.in"
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
deleted file mode 100644
index 0f889542fa..0000000000
--- a/package/libglade/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-config BR2_PACKAGE_LIBGLADE
-	bool "libglade"
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on !BR2_STATIC_LIBS # at-spi2-core
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_AT_SPI2_CORE
-	select BR2_PACKAGE_LIBXML2
-	help
-	  Libglade allows you to load glade interface files in a program
-	  at runtime. It doesn't require GLADE to be used, but GLADE is
-	  by far the easiest way to create the interface files.
-
-	  https://download.gnome.org/sources/libglade/
-
-comment "libglade needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libglade/libglade.hash b/package/libglade/libglade.hash
deleted file mode 100644
index b04087e286..0000000000
--- a/package/libglade/libglade.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://download.gnome.org/sources/libglade/2.6/libglade-2.6.4.sha256sum
-sha256  64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec  libglade-2.6.4.tar.bz2
-
-# Hash for license file:
-sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
deleted file mode 100644
index af73d8bd00..0000000000
--- a/package/libglade/libglade.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# libglade
-#
-################################################################################
-
-LIBGLADE_VERSION_MAJOR = 2.6
-LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
-LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
-LIBGLADE_SITE = https://download.gnome.org/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
-LIBGLADE_INSTALL_STAGING = YES
-LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 at-spi2-core libxml2
-LIBGLADE_LICENSE = LGPL-2.0+
-LIBGLADE_LICENSE_FILES = COPYING
-
-define LIBGLADE_INSTALL_FIX
-	rm -rf $(TARGET_DIR)/usr/share/xml/libglade \
-		$(TARGET_DIR)/usr/bin/libglade-convert
-endef
-
-LIBGLADE_POST_INSTALL_TARGET_HOOKS += LIBGLADE_INSTALL_FIX
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
