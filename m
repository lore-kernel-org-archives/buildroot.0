Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F2AC636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D4F741583;
	Tue,  7 Feb 2023 21:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D4F741583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XeIYPLfgI9jR; Tue,  7 Feb 2023 21:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99AFC415AE;
	Tue,  7 Feb 2023 21:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99AFC415AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D47A71BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC6DF40B15
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC6DF40B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGMAccP8YjDN for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:36:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 776E740B3A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 776E740B3A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 664E584349; Tue,  7 Feb 2023 21:36:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 22:26:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 700fc2d7bdb53d33368046840ea91c6c4e6b12b0
X-Git-Newrev: 40866ae0ce6e71d01a132dfb7694daa2ec559184
X-Patchwork-Hint: ignore
Message-Id: <20230207213641.664E584349@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk3: bump to version 3.24.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=40866ae0ce6e71d01a132dfb7694daa2ec559184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/37c/37c7db88622c93f1c58aff7431b638143ae741d3/

As the 3.24.5 release tarball was missing a file:
https://gitlab.gnome.org/GNOME/gtk/-/issues/5355

Switch to meson infra and remove autotools specific patches as the autotools
support has been dropped:

https://download.gnome.org/sources/gtk+/3.24/gtk%2B-3.24.36.news

host-libgtk3 is a hack which builds only gtk-update-icon-cache
host-libgtk3 is used by libgtk3 & adwaita-icon-theme

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-bridge.patch => 0001-disable-atk-bridge.patch} | 28 +++----
 package/libgtk3/0001-no-gtk-doc.patch              | 25 -------
 ...-dependency-from-gtk-encode-symbolic-svg.patch} |  0
 package/libgtk3/0002-fix-introspection-check.patch | 28 -------
 package/libgtk3/Config.in                          |  1 +
 package/libgtk3/libgtk3.hash                       |  4 +-
 package/libgtk3/libgtk3.mk                         | 87 +++++-----------------
 7 files changed, 35 insertions(+), 138 deletions(-)

diff --git a/package/libgtk3/0003-disable-atk-bridge.patch b/package/libgtk3/0001-disable-atk-bridge.patch
similarity index 62%
rename from package/libgtk3/0003-disable-atk-bridge.patch
rename to package/libgtk3/0001-disable-atk-bridge.patch
index 390fc012fa..f3e9bff2ba 100644
--- a/package/libgtk3/0003-disable-atk-bridge.patch
+++ b/package/libgtk3/0001-disable-atk-bridge.patch
@@ -5,21 +5,6 @@ add two new packages just for it: at-spi2-core and at-spi2-atk.
 
 Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
---- a/configure.ac
-+++ b/configure.ac
-@@ -1386,11 +1386,7 @@
- # Check for Accessibility Toolkit flags
- ########################################
-
--if test x$enable_x11_backend = xyes; then
--   ATK_PACKAGES="atk atk-bridge-2.0"
--else
--   ATK_PACKAGES="atk"
--fi
-+ATK_PACKAGES="atk"
-
- PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
-
 --- a/gtk/a11y/gtkaccessibility.c
 +++ b/gtk/a11y/gtkaccessibility.c
 @@ -37,10 +37,6 @@
@@ -33,7 +18,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
  static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
                                           guint                  n_param_values,
                                           const GValue          *param_values,
-@@ -988,9 +984,5 @@
+@@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
    _gtk_accessibility_override_atk_util ();
    do_window_event_initialization ();
 
@@ -43,3 +28,14 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 -
    atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
  }
+--- a/meson.build
++++ b/meson.build
+@@ -564,7 +564,7 @@ if x11_enabled
+   xfixes_dep     = dependency('xfixes', required: false)
+   xcomposite_dep = dependency('xcomposite', required: false)
+   fontconfig_dep = dependency('fontconfig', fallback: ['fontconfig', 'fontconfig_dep'])
+-  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req)
++  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req, required: false)
+ 
+   backend_immodules += ['xim']
+ 
diff --git a/package/libgtk3/0001-no-gtk-doc.patch b/package/libgtk3/0001-no-gtk-doc.patch
deleted file mode 100644
index e1d3208022..0000000000
--- a/package/libgtk3/0001-no-gtk-doc.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Same patch as for systemd in commit
-http://git.buildroot.net/buildroot/commit/?id=7144f2f04b70553
-
-Fix deactivation of gtk-doc
-
-The tarball contains the Makefile for building documentation with gtk-doc,
-Unfortunately the AM_CONDITIONAL variable is not the correct one, which
-results in an error when running autoreconf.
-
-This patch fixes this issue.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/gtk-doc.make
-+++ b/gtk-doc.make
-@@ -300,7 +300,7 @@
- #
- # Require gtk-doc when making dist
- #
--if HAVE_GTK_DOC
-+if ENABLE_GTK_DOC
- dist-check-gtkdoc: docs
- else
- dist-check-gtkdoc:
diff --git a/package/libgtk3/0004-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch b/package/libgtk3/0002-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
similarity index 100%
rename from package/libgtk3/0004-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
rename to package/libgtk3/0002-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
diff --git a/package/libgtk3/0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
deleted file mode 100644
index 7edf7db71f..0000000000
--- a/package/libgtk3/0002-fix-introspection-check.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
-
-During autoreconf GOBJECT_INTROSPECTION_CHECK could not be resolved because we
-don't have introspection which provides its custom m4 macro. Reconfigure fails
-with:
-
-gdk/Makefile.am:196: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
-gtk/Makefile.am:1347: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
-
-We avoid to add a copy of introspection.m4 in the m4 directory of libgtk3 by
-adding a check, as performed in Systemd.
-
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -1690,7 +1690,10 @@
- # GObject introspection
- ##################################################
-
--GOBJECT_INTROSPECTION_CHECK(introspection_required_version)
-+m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
-+         [GOBJECT_INTROSPECTION_CHECK(introspection_required_version)],
-+         [AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
-+          enable_introspection=no])
-
- ##################################################
- # colord module
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index bc8cacd9f5..82ca68d2da 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -88,6 +88,7 @@ config BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXI
 	help
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 1715b94e73..9fed2c9df2 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.35.sha256sum
-sha256  ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06965629fef60bd1  gtk+-3.24.35.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.36.sha256sum
+sha256  27a6ef157743350c807ffea59baa1d70226dbede82a5e953ffd58ea6059fe691  gtk+-3.24.36.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 4c93413fb2..283c129cef 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).35
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).36
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
@@ -13,69 +13,42 @@ LIBGTK3_LICENSE_FILES = COPYING
 LIBGTK3_CPE_ID_VENDOR = gnome
 LIBGTK3_CPE_ID_PRODUCT = gtk
 LIBGTK3_INSTALL_STAGING = YES
-LIBGTK3_AUTORECONF = YES
-
-LIBGTK3_CONF_ENV = \
-	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/bin/gtk-update-icon-cache \
-	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/bin/gdk-pixbuf-csource \
-	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/bin/pkgconf
-
-LIBGTK3_CONF_OPTS = \
-	--disable-glibtest \
-	--enable-explicit-deps=no
-HOST_LIBGTK3_CONF_OPTS = --disable-introspection
-
-# Override pkg-config pkgdatadir variable, it needs the prefix
-LIBGTK3_MAKE_OPTS = \
-	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols \
-	LIBS=$(TARGET_NLS_LIBS)
 
 LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango \
 	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender xlib_libXi
-
-LIBGTK3_CONF_OPTS += \
-	--enable-x11-backend \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib
+LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrandr xlib_libXrender xlib_libXi
+LIBGTK3_CONF_OPTS += -Dx11_backend=true
 else
-LIBGTK3_CONF_OPTS += --disable-x11-backend
+LIBGTK3_CONF_OPTS += -Dx11_backend=false
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBGTK3_CONF_OPTS += --enable-introspection
+LIBGTK3_CONF_OPTS += -Dintrospection=true
 LIBGTK3_DEPENDENCIES += gobject-introspection
 else
-LIBGTK3_CONF_OPTS += --disable-introspection
+LIBGTK3_CONF_OPTS += -Dintrospection=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 LIBGTK3_DEPENDENCIES += wayland wayland-protocols libxkbcommon
-LIBGTK3_CONF_OPTS += --enable-wayland-backend
+LIBGTK3_CONF_OPTS += -Dwayland_backend=true
 else
-LIBGTK3_CONF_OPTS += --disable-wayland-backend
+LIBGTK3_CONF_OPTS += -Dwayland_backend=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_BROADWAY),y)
-LIBGTK3_CONF_OPTS += --enable-broadway-backend
+LIBGTK3_CONF_OPTS += -Dbroadway_backend=true
 else
-LIBGTK3_CONF_OPTS += --disable-broadway-backend
+LIBGTK3_CONF_OPTS += -Dbroadway_backend=false
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-LIBGTK3_CONF_OPTS += --enable-xinerama
+LIBGTK3_CONF_OPTS += -Dxinerama=yes
 LIBGTK3_DEPENDENCIES += xlib_libXinerama
 else
-LIBGTK3_CONF_OPTS += --disable-xinerama
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
-LIBGTK3_CONF_OPTS += --enable-xrandr
-LIBGTK3_DEPENDENCIES += xlib_libXrandr
-else
-LIBGTK3_CONF_OPTS += --disable-xrandr
+LIBGTK3_CONF_OPTS += -Dxinerama=no
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
@@ -83,55 +56,35 @@ LIBGTK3_DEPENDENCIES += xlib_libXcursor
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
-LIBGTK3_CONF_OPTS += --enable-xfixes
 LIBGTK3_DEPENDENCIES += xlib_libXfixes
-else
-LIBGTK3_CONF_OPTS += --disable-xfixes
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
-LIBGTK3_CONF_OPTS += --enable-xcomposite
 LIBGTK3_DEPENDENCIES += xlib_libXcomposite
-else
-LIBGTK3_CONF_OPTS += --disable-xcomposite
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
-LIBGTK3_CONF_OPTS += --enable-xdamage
 LIBGTK3_DEPENDENCIES += xlib_libXdamage
-else
-LIBGTK3_CONF_OPTS += --disable-xdamage
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
-LIBGTK3_CONF_OPTS += --enable-xkb
-LIBGTK3_DEPENDENCIES += xlib_libxkbfile
-else
-LIBGTK3_CONF_OPTS += --disable-xkb
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-LIBGTK3_CONF_OPTS += --enable-cups
-LIBGTK3_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
+LIBGTK3_CONF_OPTS += -Dprint_backends=cups
 LIBGTK3_DEPENDENCIES += cups
 else
-LIBGTK3_CONF_OPTS += --disable-cups
+LIBGTK3_CONF_OPTS += -Dprint_backends=auto
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),y)
+LIBGTK3_CONF_OPTS += -Ddemos=true -Dexamples=true
 LIBGTK3_DEPENDENCIES += hicolor-icon-theme shared-mime-info
 else
-define LIBGTK3_REMOVE_DEMOS
-	$(RM) $(TARGET_DIR)/usr/bin/gtk3-demo \
-		$(TARGET_DIR)/usr/bin/gtk3-demo-application
-endef
-LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_REMOVE_DEMOS
+LIBGTK3_CONF_OPTS += -Ddemos=false -Dexamples=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_TESTS),y)
-LIBGTK3_CONF_OPTS += --enable-installed-tests
+LIBGTK3_CONF_OPTS += -Dtests=true -Dinstalled_tests=true
 else
-LIBGTK3_CONF_OPTS += --disable-installed-tests
+LIBGTK3_CONF_OPTS += -Dtests=false -Dinstalled_tests=false
 endif
 
 define LIBGTK3_COMPILE_GLIB_SCHEMAS
@@ -198,5 +151,5 @@ define LIBGTK3_UPDATE_ICON_CACHE
 endef
 LIBGTK3_TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
