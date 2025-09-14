Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF9ECAC592
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 20:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 211C96F682;
	Sun, 14 Sep 2025 20:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NY12KW84_82; Sun, 14 Sep 2025 20:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E2136F69E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2136F69E;
	Sun, 14 Sep 2025 20:39:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F07C4117
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1FF64178F
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjCaNo0TaHIf for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 212EA41754
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 212EA41754
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11930844AB; Sun, 14 Sep 2025 20:39:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 22:34:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e25f5083a0186e18abc2d73a67c72d1d5bd5bdbe
X-Git-Newrev: 2accd86633edadd0b61b96cf3c9ce9bf2115aebc
X-Patchwork-Hint: ignore
Message-Id: <20250914203944.11930844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk4: bump to 4.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2accd86633edadd0b61b96cf3c9ce9bf2115aebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.20.1/NEWS

Also select librsvg as it is required now. (See changes in 4.19.2)

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgtk4/Config.in    | 3 +++
 package/libgtk4/libgtk4.hash | 4 ++--
 package/libgtk4/libgtk4.mk   | 5 +++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 99553fc44e..259226e0e4 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -1,4 +1,5 @@
 comment "libgtk4 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
@@ -12,6 +13,7 @@ comment "libgtk4 needs an OpenGL(ES) EGL backend"
 
 config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
@@ -27,6 +29,7 @@ config BR2_PACKAGE_LIBGTK4
 	select BR2_PACKAGE_GRAPHENE
 	select BR2_PACKAGE_LIBEPOXY
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_TIFF
 	# At least one backend is required
diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
index 636b675d15..6c07161eff 100644
--- a/package/libgtk4/libgtk4.hash
+++ b/package/libgtk4/libgtk4.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk/4.14/gtk-4.14.5.sha256sum
-sha256  5547f2b9f006b133993e070b87c17804e051efda3913feaca1108fa2be41e24d  gtk-4.14.5.tar.xz
+# From https://download.gnome.org/sources/gtk/4.20/gtk-4.20.1.sha256sum
+sha256  bf32fac019171c45681b2c45d05658ee8598c6341572e32a6a6bcb0b5673998d  gtk-4.20.1.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index b00a2facad..029eb5920c 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK4_VERSION_MAJOR = 4.14
-LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).5
+LIBGTK4_VERSION_MAJOR = 4.20
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).1
 LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
 LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
 LIBGTK4_LICENSE = LGPL-2.0+
@@ -21,6 +21,7 @@ LIBGTK4_DEPENDENCIES = \
 	graphene \
 	libepoxy \
 	libglib2 \
+	librsvg \
 	pango \
 	$(TARGET_NLS_DEPENDENCIES)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
