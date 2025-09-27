Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8789CCA468
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F4A9406B7;
	Sun, 28 Sep 2025 10:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFPhOJUp89Fq; Sun, 28 Sep 2025 10:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE90406C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE90406C5;
	Sun, 28 Sep 2025 10:17:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A908198
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D30C40661
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2OkAUCEI2Mh for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4844055B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C4844055B
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BF4C86595; Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 00:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c3653466473c019889a361979e652b238b83a2e
X-Git-Newrev: 696113c2b7cd0eb46e705b7c37956303e359ebeb
X-Patchwork-Hint: ignore
Message-Id: <20250928101712.7BF4C86595@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmenu-wayland: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=696113c2b7cd0eb46e705b7c37956303e359ebeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package has been abandoned for several years. The only package that
previously relied on dmenu-wayland was the swaybar option for the sway package,
and that option now relies on wmenu.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien:
  - add select BR2_LEGACY in legacy option to fix check-package error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |  9 ++++++
 package/Config.in                                  |  1 -
 .../0001-support-cross-compilation.patch           | 32 ----------------------
 package/dmenu-wayland/Config.in                    | 27 ------------------
 package/dmenu-wayland/dmenu-wayland.hash           |  3 --
 package/dmenu-wayland/dmenu-wayland.mk             | 29 --------------------
 6 files changed, 9 insertions(+), 92 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b60b1a8845..2035b34a2f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_DMENU_WAYLAND
+	bool "dmenu-wayland has been removed"
+	select BR2_LEGACY
+	help
+	  The package has been abandoned for several years.
+	  The only package that previously relied on dmenu-wayland
+	  was sway, and that now relies on wmenu. Please select
+	  wmenu instead.
+
 config BR2_PACKAGE_SYLPHEED
 	bool "sylpheed has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 1e0d921913..48ed7cc101 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -308,7 +308,6 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
-	source "package/dmenu-wayland/Config.in"
 	source "package/flutter-packages/Config.in"
 	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
diff --git a/package/dmenu-wayland/0001-support-cross-compilation.patch b/package/dmenu-wayland/0001-support-cross-compilation.patch
deleted file mode 100644
index 3d99330cba..0000000000
--- a/package/dmenu-wayland/0001-support-cross-compilation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cd72cade6250a3ec46dd402b25a0bd55bbb97a88 Mon Sep 17 00:00:00 2001
-From: Rick van Schijndel <rol3517@gmail.com>
-Date: Wed, 20 Dec 2023 16:44:12 -0700
-Subject: [PATCH] support cross-compilation
-
-Marking wayland-scanner as native dependency fixes the path check for
-wayland-scanner.
-
-Upstream: https://github.com/nyyManni/dmenu-wayland/pull/23
-
-Signed-off-by: Rick van Schijndel <rol3517@gmail.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 3ae6f69..8d401ff 100644
---- a/meson.build
-+++ b/meson.build
-@@ -26,7 +26,7 @@ pangocairo          = dependency('pangocairo')
- rt                  = cc.find_library('rt')
- wayland_client      = dependency('wayland-client')
- wayland_protos      = dependency('wayland-protocols')
--wayland_scanner_dep = dependency('wayland-scanner')
-+wayland_scanner_dep = dependency('wayland-scanner', native: true)
- wayland_scanner     = find_program(
-   wayland_scanner_dep.get_pkgconfig_variable('wayland_scanner')
- )
--- 
-2.43.0
-
diff --git a/package/dmenu-wayland/Config.in b/package/dmenu-wayland/Config.in
deleted file mode 100644
index 8a4d0918dc..0000000000
--- a/package/dmenu-wayland/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-config BR2_PACKAGE_DMENU_WAYLAND
-	bool "dmenu-wayland"
-	depends on BR2_USE_MMU # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, pango, wayland
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
-	depends on !BR2_STATIC_LIBS # wayland
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_USE_WCHAR # libglib2, pango
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_CAIRO_PNG
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBXKBCOMMON
-	select BR2_PACKAGE_PANGO
-	select BR2_PACKAGE_WAYLAND
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS
-	help
-	  dmenu-wl is an efficient dynamic menu for wayland (wlroots).
-
-	  https://github.com/nyyManni/dmenu-wayland
-
-comment "dmenu-wayland needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/dmenu-wayland/dmenu-wayland.hash b/package/dmenu-wayland/dmenu-wayland.hash
deleted file mode 100644
index 1248c4ad66..0000000000
--- a/package/dmenu-wayland/dmenu-wayland.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  56340e198a2c58468c6109f3bb07ab8a074487e67b0758b29c9d4fdce7c4d594  dmenu-wayland-a380201dff5bfac2dace553d7eaedb6cea6855f9.tar.gz
-sha256  8d26bccf8a21c5e29dc756beef534403c935766c815bbb6e7eab0598632b9827  LICENSE
diff --git a/package/dmenu-wayland/dmenu-wayland.mk b/package/dmenu-wayland/dmenu-wayland.mk
deleted file mode 100644
index fec984194c..0000000000
--- a/package/dmenu-wayland/dmenu-wayland.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# dmenu-wayland
-#
-################################################################################
-
-DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
-DMENU_WAYLAND_SITE = $(call github,nyyManni,dmenu-wayland,$(DMENU_WAYLAND_VERSION))
-DMENU_WAYLAND_LICENSE = MIT
-DMENU_WAYLAND_LICENSE_FILES = LICENSE
-DMENU_WAYLAND_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
-
-# host-wayland is for wayland-scanner
-DMENU_WAYLAND_DEPENDENCIES = \
-	host-wayland \
-	cairo \
-	libglib2 \
-	libxkbcommon \
-	pango \
-	wayland \
-	wayland-protocols
-
-# By default, sway calls dmenu not dmenu-wl
-define DMENU_WAYLAND_SYMLINK_DMENU_WL
-	ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu
-endef
-DMENU_WAYLAND_POST_INSTALL_TARGET_HOOKS += DMENU_WAYLAND_SYMLINK_DMENU_WL
-
-$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
