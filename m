Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FA7C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 18:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00F4640018;
	Sun, 24 Dec 2023 18:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F4640018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aPqOLdIPn5UF; Sun, 24 Dec 2023 18:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E19BC404D8;
	Sun, 24 Dec 2023 18:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E19BC404D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4926B1BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B39C8149B
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 18:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B39C8149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJxqtl3ZAThq for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 18:49:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BFD38148F
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 18:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BFD38148F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 027EE8286B; Sun, 24 Dec 2023 18:49:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 19:48:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df89e73e92abcddfdfa5d61cd00757a7c80a699d
X-Git-Newrev: 2f6b1b8e6893003efcc72185cd468dcb0b088b2d
X-Patchwork-Hint: ignore
Message-Id: <20231224184932.027EE8286B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dmenu-wayland: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f6b1b8e6893003efcc72185cd468dcb0b088b2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The traditional dmenu is only running under X; dmenu-wayland is an
implementation that runs only on (some) wayland compositors; Sway
uses it by default as its menu bar.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr:
  - _SYNC_4 is an arch dependency, so comment should be hidden
  - add a few missing comments for first-level dependencies
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-support-cross-compilation.patch           | 32 ++++++++++++++++++++++
 package/dmenu-wayland/Config.in                    | 27 ++++++++++++++++++
 package/dmenu-wayland/dmenu-wayland.hash           |  3 ++
 package/dmenu-wayland/dmenu-wayland.mk             | 28 +++++++++++++++++++
 6 files changed, 92 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b5158ba986..9492ebe79b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -33,6 +33,7 @@ F:	package/vulkan-tools/
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
+F:	package/dmenu-wayland/
 F:	package/fcft/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
diff --git a/package/Config.in b/package/Config.in
index 28924f650e..b0e18436ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/dmenu-wayland/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
diff --git a/package/dmenu-wayland/0001-support-cross-compilation.patch b/package/dmenu-wayland/0001-support-cross-compilation.patch
new file mode 100644
index 0000000000..3d99330cba
--- /dev/null
+++ b/package/dmenu-wayland/0001-support-cross-compilation.patch
@@ -0,0 +1,32 @@
+From cd72cade6250a3ec46dd402b25a0bd55bbb97a88 Mon Sep 17 00:00:00 2001
+From: Rick van Schijndel <rol3517@gmail.com>
+Date: Wed, 20 Dec 2023 16:44:12 -0700
+Subject: [PATCH] support cross-compilation
+
+Marking wayland-scanner as native dependency fixes the path check for
+wayland-scanner.
+
+Upstream: https://github.com/nyyManni/dmenu-wayland/pull/23
+
+Signed-off-by: Rick van Schijndel <rol3517@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3ae6f69..8d401ff 100644
+--- a/meson.build
++++ b/meson.build
+@@ -26,7 +26,7 @@ pangocairo          = dependency('pangocairo')
+ rt                  = cc.find_library('rt')
+ wayland_client      = dependency('wayland-client')
+ wayland_protos      = dependency('wayland-protocols')
+-wayland_scanner_dep = dependency('wayland-scanner')
++wayland_scanner_dep = dependency('wayland-scanner', native: true)
+ wayland_scanner     = find_program(
+   wayland_scanner_dep.get_pkgconfig_variable('wayland_scanner')
+ )
+-- 
+2.43.0
+
diff --git a/package/dmenu-wayland/Config.in b/package/dmenu-wayland/Config.in
new file mode 100644
index 0000000000..8a4d0918dc
--- /dev/null
+++ b/package/dmenu-wayland/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_DMENU_WAYLAND
+	bool "dmenu-wayland"
+	depends on BR2_USE_MMU # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, pango, wayland
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_USE_WCHAR # libglib2, pango
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  dmenu-wl is an efficient dynamic menu for wayland (wlroots).
+
+	  https://github.com/nyyManni/dmenu-wayland
+
+comment "dmenu-wayland needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/dmenu-wayland/dmenu-wayland.hash b/package/dmenu-wayland/dmenu-wayland.hash
new file mode 100644
index 0000000000..1248c4ad66
--- /dev/null
+++ b/package/dmenu-wayland/dmenu-wayland.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  56340e198a2c58468c6109f3bb07ab8a074487e67b0758b29c9d4fdce7c4d594  dmenu-wayland-a380201dff5bfac2dace553d7eaedb6cea6855f9.tar.gz
+sha256  8d26bccf8a21c5e29dc756beef534403c935766c815bbb6e7eab0598632b9827  LICENSE
diff --git a/package/dmenu-wayland/dmenu-wayland.mk b/package/dmenu-wayland/dmenu-wayland.mk
new file mode 100644
index 0000000000..33a73c0153
--- /dev/null
+++ b/package/dmenu-wayland/dmenu-wayland.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# dmenu-wayland
+#
+################################################################################
+
+DMENU_WAYLAND_VERSION = a380201dff5bfac2dace553d7eaedb6cea6855f9
+DMENU_WAYLAND_SITE = $(call github,nyyManni,dmenu-wayland,$(DMENU_WAYLAND_VERSION))
+DMENU_WAYLAND_LICENSE = MIT
+DMENU_WAYLAND_LICENSE_FILES = LICENSE
+
+# host-wayland is for wayland-scanner
+DMENU_WAYLAND_DEPENDENCIES = \
+	host-wayland \
+	cairo \
+	libglib2 \
+	libxkbcommon \
+	pango \
+	wayland \
+	wayland-protocols
+
+# By default, sway calls dmenu not dmenu-wl
+define DMENU_WAYLAND_SYMLINK_DMENU_WL
+	ln -sf dmenu-wl $(TARGET_DIR)/usr/bin/dmenu
+endef
+DMENU_WAYLAND_POST_INSTALL_TARGET_HOOKS += DMENU_WAYLAND_SYMLINK_DMENU_WL
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
