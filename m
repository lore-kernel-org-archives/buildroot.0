Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E295FC77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 16:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F2AC84457;
	Mon,  8 May 2023 16:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F2AC84457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxM61chKaJFC; Mon,  8 May 2023 16:06:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3BF84487;
	Mon,  8 May 2023 16:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3BF84487
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3F161BF35B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7187561392
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7187561392
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZM1qUgUV86y for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 16:05:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4971B606E6
 for <buildroot@buildroot.org>; Mon,  8 May 2023 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4971B606E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37DE086147; Mon,  8 May 2023 16:05:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 17:51:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f43af1b997f5f0e9262159be3336d73bd4d0d21
X-Git-Newrev: 2c3ca7bea1de76163aeef432412eb14551ed0581
X-Patchwork-Hint: ignore
Message-Id: <20230508160516.37DE086147@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atk: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c3ca7bea1de76163aeef432412eb14551ed0581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

atk has been merged into at-spi2-core with version 2.45.1.

https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/AT_SPI2_CORE_2_45_1/NEWS
https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/78

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy               |  6 ++++++
 package/Config.in              |  1 -
 package/atk/Config.in          | 14 --------------
 package/atk/atk.hash           |  5 -----
 package/atk/atk.mk             | 25 -------------------------
 package/atkmm/Config.in        |  8 ++++----
 package/atkmm/atkmm.mk         |  2 +-
 package/atkmm2_28/Config.in    |  8 ++++----
 package/atkmm2_28/atkmm2_28.mk |  2 +-
 package/libglade/Config.in     |  2 +-
 package/libglade/libglade.mk   |  2 +-
 package/libgtk2/Config.in      |  2 +-
 package/libgtk2/libgtk2.mk     |  2 +-
 package/libgtk3/Config.in      |  2 +-
 package/libgtk3/libgtk3.mk     |  2 +-
 15 files changed, 22 insertions(+), 61 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7837f5a588..debe8428a5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.05"
 
+config BR2_PACKAGE_ATK
+	bool "atk removed"
+	select BR2_LEGACY
+	help
+	  atk is now part of at-spi2-core.
+
 config BR2_PACKAGE_AT_SPI2_ATK
 	bool "at-spi2-atk removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 92ef7160d0..420ebaa370 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1555,7 +1555,6 @@ endmenu
 menu "Graphics"
 	source "package/assimp/Config.in"
 	source "package/at-spi2-core/Config.in"
-	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
 	source "package/atkmm2_28/Config.in"
 	source "package/bayer2rgb-neon/Config.in"
diff --git a/package/atk/Config.in b/package/atk/Config.in
deleted file mode 100644
index d9371b879b..0000000000
--- a/package/atk/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_ATK
-	bool "atk"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  The ATK accessibility toolkit, needed to build GTK+-2.x.
-
-	  https://gitlab.gnome.org/GNOME/atk
-
-comment "atk needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/atk/atk.hash b/package/atk/atk.hash
deleted file mode 100644
index d8cd69ff1f..0000000000
--- a/package/atk/atk.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
-sha256  ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36  atk-2.38.0.tar.xz
-
-# Hash for license file
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
deleted file mode 100644
index 2820fb486d..0000000000
--- a/package/atk/atk.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# atk
-#
-################################################################################
-
-ATK_VERSION_MAJOR = 2.38
-ATK_VERSION = $(ATK_VERSION_MAJOR).0
-ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
-ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
-ATK_LICENSE = LGPL-2.0+
-ATK_LICENSE_FILES = COPYING
-ATK_INSTALL_STAGING = YES
-ATK_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
-
-ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-ATK_CONF_OPTS += -Dintrospection=true
-ATK_DEPENDENCIES += gobject-introspection
-else
-ATK_CONF_OPTS += -Dintrospection=false
-endif
-
-ATK_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
-
-$(eval $(meson-package))
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index 1f370356ea..571d7e69ad 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM
 	bool "atkmm (latest)"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
-	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
-	depends on BR2_USE_MMU # atk/glibmm -> libglib2
-	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
-	select BR2_PACKAGE_ATK
+	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM
 	select BR2_PACKAGE_LIBSIGC
 
diff --git a/package/atkmm/atkmm.mk b/package/atkmm/atkmm.mk
index 8afd058643..ec63d8ecbc 100644
--- a/package/atkmm/atkmm.mk
+++ b/package/atkmm/atkmm.mk
@@ -11,6 +11,6 @@ ATKMM_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM_VERSION_MAJOR)
 ATKMM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 ATKMM_LICENSE_FILES = COPYING COPYING.tools
 ATKMM_INSTALL_STAGING = YES
-ATKMM_DEPENDENCIES = atk glibmm libsigc host-pkgconf
+ATKMM_DEPENDENCIES = at-spi2-core glibmm libsigc host-pkgconf
 
 $(eval $(meson-package))
diff --git a/package/atkmm2_28/Config.in b/package/atkmm2_28/Config.in
index 2340465b20..e88073b87a 100644
--- a/package/atkmm2_28/Config.in
+++ b/package/atkmm2_28/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_ATKMM2_28
 	bool "atkmm (2.28.x)"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
-	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
-	depends on BR2_USE_MMU # atk/glibmm -> libglib2
-	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
-	select BR2_PACKAGE_ATK
+	depends on BR2_TOOLCHAIN_HAS_THREADS # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_MMU # at-spi2-core/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # at-spi2-core/glibmm -> libglib2
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_GLIBMM2_66
 	select BR2_PACKAGE_LIBSIGC2
 
diff --git a/package/atkmm2_28/atkmm2_28.mk b/package/atkmm2_28/atkmm2_28.mk
index dc57363cf5..b56da61ec0 100644
--- a/package/atkmm2_28/atkmm2_28.mk
+++ b/package/atkmm2_28/atkmm2_28.mk
@@ -11,6 +11,6 @@ ATKMM2_28_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM2_28_VERSION_MA
 ATKMM2_28_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 ATKMM2_28_LICENSE_FILES = COPYING COPYING.tools
 ATKMM2_28_INSTALL_STAGING = YES
-ATKMM2_28_DEPENDENCIES = atk glibmm2_66 libsigc2 host-pkgconf
+ATKMM2_28_DEPENDENCIES = at-spi2-core glibmm2_66 libsigc2 host-pkgconf
 
 $(eval $(meson-package))
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index c97c9becd2..8d0d26f159 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBGLADE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Libglade allows you to load glade interface files in a program
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 21aed60605..af73d8bd00 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -9,7 +9,7 @@ LIBGLADE_VERSION = $(LIBGLADE_VERSION_MAJOR).4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = https://download.gnome.org/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
 LIBGLADE_INSTALL_STAGING = YES
-LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
+LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 at-spi2-core libxml2
 LIBGLADE_LICENSE = LGPL-2.0+
 LIBGLADE_LICENSE_FILES = COPYING
 
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index c75c37fb63..f2888b2f51 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 859925e8d3..608c263e4d 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -23,7 +23,7 @@ LIBGTK2_CONF_ENV = \
 
 LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
-LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk \
+LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango at-spi2-core \
 	gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
 
 LIBGTK2_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 82ca68d2da..34b8d49eb3 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
 	select BR2_PACKAGE_CAIRO_PDF
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index b41049b0ee..d1840ef112 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -14,7 +14,7 @@ LIBGTK3_CPE_ID_VENDOR = gnome
 LIBGTK3_CPE_ID_PRODUCT = gtk
 LIBGTK3_INSTALL_STAGING = YES
 
-LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango \
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 at-spi2-core libglib2 cairo pango \
 	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
