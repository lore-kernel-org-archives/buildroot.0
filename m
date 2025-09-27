Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39AFCAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABD28406C4;
	Sun, 28 Sep 2025 10:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aGzuBjj9Wefc; Sun, 28 Sep 2025 10:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFFAF4068C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFFAF4068C;
	Sun, 28 Sep 2025 10:17:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3160B111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98B686071A
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QUEb1d_h3SzL for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EFCD606FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EFCD606FD
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A90086594; Sun, 28 Sep 2025 10:17:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Sep 2025 22:46:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd84d0584393a5f9209120bf83fcb62c86b4947f
X-Git-Newrev: 1c3653466473c019889a361979e652b238b83a2e
X-Patchwork-Hint: ignore
Message-Id: <20250928101712.6A90086594@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wmenu: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c3653466473c019889a361979e652b238b83a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wmenu is an efficient dynamic menu for Sway and wlroots based Wayland
compositors. It provides a Wayland-native dmenu replacement which
maintains the look and feel of dmenu.

Furthermore, as of commit [1], sway uses wmenu instead of dmenu-wayland
with the following commit message:

"""
Switch default config to wmenu-run
This removes the last dependency bit on dmenu. No need for
"swaymsg exec" anymore: wmenu-run handles the xdg-activation
shenanigans.
"""

As such, change sway/Config.in to select wmenu instead of dmenu-wayland when
a user selects swaybar.

[1] https://github.com/swaywm/sway/commit/b44015578a3d53cdd9436850202d4405696c1f52

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in        |  1 +
 package/sway/Config.in   |  2 +-
 package/wmenu/Config.in  | 29 +++++++++++++++++++++++++++++
 package/wmenu/wmenu.hash |  3 +++
 package/wmenu/wmenu.mk   | 20 ++++++++++++++++++++
 5 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index c54be6275e..1e0d921913 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -334,6 +334,7 @@ comment "Graphic applications"
 	source "package/swaybg/Config.in"
 	source "package/tesseract-ocr/Config.in"
 	source "package/tinifier/Config.in"
+	source "package/wmenu/Config.in"
 
 comment "Graphic libraries"
 	source "package/cegui/Config.in"
diff --git a/package/sway/Config.in b/package/sway/Config.in
index d78f792c48..1f4b497af3 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -33,7 +33,7 @@ config BR2_PACKAGE_SWAY_SWAYBAR
 	bool "swaybar"
 	select BR2_PACKAGE_DEJAVU
 	select BR2_PACKAGE_JQ if BR2_PACKAGE_BASH_COMPLETION # Runtime
-	select BR2_PACKAGE_DMENU_WAYLAND # Runtime
+	select BR2_PACKAGE_WMENU # Runtime
 	help
 	  Enable support for swaybar
 
diff --git a/package/wmenu/Config.in b/package/wmenu/Config.in
new file mode 100644
index 0000000000..ce9e70f9f8
--- /dev/null
+++ b/package/wmenu/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_WMENU
+	bool "wmenu"
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
+	  wmenu is an efficient dynamic menu for Sway and wlroots based
+	  Wayland compositors. It provides a Wayland-native dmenu
+	  replacement which maintains the look and feel of dmenu.
+
+	  https://codeberg.org/adnano/wmenu
+
+comment "wmenu needs a toolchain w/ wchar, threads, C++, dynamic library, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/wmenu/wmenu.hash b/package/wmenu/wmenu.hash
new file mode 100644
index 0000000000..c4941001f4
--- /dev/null
+++ b/package/wmenu/wmenu.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4e6aea3f8975fec720f6eb87aad620d5297a8a5a137615e4cf047e95d2b9d308  0.2.0.tar.gz
+sha256  500f0a221b2f3667676f6a084fb4e92ba4f74d09f45bc492e55aec4dd296bff2  LICENSE
diff --git a/package/wmenu/wmenu.mk b/package/wmenu/wmenu.mk
new file mode 100644
index 0000000000..7454dba8b9
--- /dev/null
+++ b/package/wmenu/wmenu.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# wmenu
+#
+################################################################################
+
+WMENU_VERSION = 0.2.0
+WMENU_SOURCE = $(WMENU_VERSION).tar.gz
+WMENU_SITE = https://codeberg.org/adnano/wmenu/archive
+WMENU_LICENSE = MIT
+WMENU_LICENSE_FILES = LICENSE
+WMENU_DEPENDENCIES = \
+	cairo \
+	pango \
+	wayland \
+	libxkbcommon \
+	wayland \
+	wayland-protocols
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
