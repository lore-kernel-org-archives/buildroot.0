Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D82C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 15:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5DC160A7E;
	Wed, 17 Jul 2024 15:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogx0U3pNERuF; Wed, 17 Jul 2024 15:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E740360AAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E740360AAD;
	Wed, 17 Jul 2024 15:52:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18B2F1BF3E3
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 15:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05C49401B0
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 15:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Geh8iOWfQ_h for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 15:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ACFD400F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ACFD400F2
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 15:52:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 767F686C8A; Wed, 17 Jul 2024 15:52:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 17:51:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e67ab71bf68c378fe3ea430fd325003d0b16c5b6
X-Git-Newrev: faf2a1d2abfbff79fc0603def835066587144420
X-Patchwork-Hint: ignore
Message-Id: <20240717155217.767F686C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk4: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=faf2a1d2abfbff79fc0603def835066587144420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |   1 +
 package/Config.in            |   1 +
 package/libgtk4/Config.in    | 102 ++++++++++++++++++++++++++++++++++
 package/libgtk4/libgtk4.hash |   5 ++
 package/libgtk4/libgtk4.mk   | 129 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 238 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fb4955351c..b39df9bae2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1150,6 +1150,7 @@ F:	package/dado/
 F:	package/ficl/
 F:	package/graphene/
 F:	package/janet/
+F:	package/libgtk4/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/libwpe/
diff --git a/package/Config.in b/package/Config.in
index 5823ab1b76..a7cb768dcd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1703,6 +1703,7 @@ menu "Graphics"
 	source "package/libgta/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
+	source "package/libgtk4/Config.in"
 	source "package/libjxl/Config.in"
 	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
new file mode 100644
index 0000000000..af7f57b80e
--- /dev/null
+++ b/package/libgtk4/Config.in
@@ -0,0 +1,102 @@
+comment "libgtk4 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libgtk4 needs an OpenGL(ES) EGL backend"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_HAS_LIBEGL
+
+config BR2_PACKAGE_LIBGTK4
+	bool "libgtk4"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	# Even in the case of X11/OpenGL, libgtk4 needs epoxy built
+	# with EGL support, see
+	# https://gitlab.gnome.org/GNOME/gtk/-/issues/6866.
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_GRAPHENE
+	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_TIFF
+	# At least one backend is required
+	select BR2_PACKAGE_LIBGTK4_BROADWAY if \
+		!(BR2_PACKAGE_LIBGTK4_X11 || BR2_PACKAGE_LIBGTK4_WAYLAND)
+	help
+	  The GTK version 4 graphical user interface library
+
+	  https://www.gtk.org/
+
+if BR2_PACKAGE_LIBGTK4
+
+config BR2_PACKAGE_LIBGTK4_BROADWAY
+	bool "Broadway GDK backend"
+	default y
+	  help
+	  This enables the Broadway backend for GDK, which provides
+	  support for displaying GTK+ applications in a web browser,
+	  using HTML5 and web sockets.
+
+	  For example, to run gtk4-demo on a target which IP address is
+	  192.168.0.1 and use it from a web browser, execute the
+	  following commands:
+
+	  $ broadwayd -a 192.168.0.1 -p 8080 :2 &
+	  $ export GDK_BACKEND=broadway
+	  $ export BROADWAY_DISPLAY=:2
+	  $ gtk4-demo
+
+	  Then open a web browser at address http://192.168.0.1:8080.
+	  Javascript and web sockets should be enabled.
+
+config BR2_PACKAGE_LIBGTK4_WAYLAND
+	bool "Wayland GDK backend"
+	default y
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  This enables the Wayland backend for GDK.
+
+comment "X11 GDK backend needs an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_LIBGTK4_X11
+	bool "X11 GDK backend"
+	default y
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	help
+	  This enables the X11 backend for GDK.
+
+config BR2_PACKAGE_LIBGTK4_GSTREAMER
+	bool "gstreamer support"
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	help
+	  Enable gstreamer support.
+
+config BR2_PACKAGE_LIBGTK4_DEMO
+	bool "Install libgtk4 demo/example programs"
+	select BR2_PACKAGE_SHARED_MIME_INFO
+	select BR2_PACKAGE_HICOLOR_ICON_THEME
+	help
+	  The GTK source base contains demo/exmaple programs.
+	  This option allows to install them to the target.
+
+endif
diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
new file mode 100644
index 0000000000..efb944f2ae
--- /dev/null
+++ b/package/libgtk4/libgtk4.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/gtk/4.12/gtk-4.12.4.sha256sum
+sha256  ba67c6498e5599f928edafb9e08a320adfaa50ab2f0da6fc6ab2252fc2d57520  gtk-4.12.4.tar.xz
+
+# Hash for license file:
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
new file mode 100644
index 0000000000..8cb7fd0384
--- /dev/null
+++ b/package/libgtk4/libgtk4.mk
@@ -0,0 +1,129 @@
+################################################################################
+#
+# libgtk4
+#
+################################################################################
+
+LIBGTK4_VERSION_MAJOR = 4.12
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).4
+LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
+LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
+LIBGTK4_LICENSE = LGPL-2.0+
+LIBGTK4_LICENSE_FILES = COPYING
+LIBGTK4_CPE_ID_VENDOR = gnome
+LIBGTK4_CPE_ID_PRODUCT = gtk
+LIBGTK4_INSTALL_STAGING = YES
+
+LIBGTK4_DEPENDENCIES = \
+	host-pkgconf \
+	host-libgtk4 \
+	gdk-pixbuf \
+	graphene \
+	libepoxy \
+	libglib2 \
+	pango \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBGTK4_CONF_OPTS = \
+	-Dbuild-tests=false \
+	-Dmedia-ffmpeg=disabled \
+	-Dprint-cpdb=disabled \
+	-Dvulkan=disabled \
+	-Dcloudproviders=disabled \
+	-Dsysprof=disabled \
+	-Dtracker=disabled \
+	-Dcolord=disabled \
+	-Dintrospection=disabled \
+	-Ddocumentation=false \
+	-Dscreenshots=false \
+	-Dman-pages=false
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
+LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
+LIBGTK4_CONF_OPTS += -Dx11-backend=true
+else
+LIBGTK4_CONF_OPTS += -Dx11-backend=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_WAYLAND),y)
+LIBGTK4_DEPENDENCIES += wayland wayland-protocols libxkbcommon
+LIBGTK4_CONF_OPTS += -Dwayland-backend=true
+else
+LIBGTK4_CONF_OPTS += -Dwayland-backend=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_BROADWAY),y)
+LIBGTK4_CONF_OPTS += -Dbroadway-backend=true
+else
+LIBGTK4_CONF_OPTS += -Dbroadway-backend=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_GSTREAMER),y)
+LIBGTK4_CONF_OPTS += -Dmedia-gstreamer=enabled
+LIBGTK4_DEPENDENCIES += gstreamer1 gst1-plugins-base gst1-plugins-bad
+else
+LIBGTK4_CONF_OPTS += -Dmedia-gstreamer=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+LIBGTK4_CONF_OPTS += -Dprint-cups=enabled
+LIBGTK4_DEPENDENCIES += cups
+else
+LIBGTK4_CONF_OPTS += -Dprint-cups=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_DEMO),y)
+LIBGTK4_CONF_OPTS += -Dbuild-demos=true -Dbuild-examples=true
+LIBGTK4_DEPENDENCIES += hicolor-icon-theme shared-mime-info
+else
+LIBGTK4_CONF_OPTS += -Dbuild-demos=false -Dbuild-examples=false
+endif
+
+define LIBGTK4_COMPILE_GLIB_SCHEMAS
+	$(HOST_DIR)/bin/glib-compile-schemas \
+		$(TARGET_DIR)/usr/share/glib-2.0/schemas
+endef
+LIBGTK4_POST_INSTALL_TARGET_HOOKS += LIBGTK4_COMPILE_GLIB_SCHEMAS
+
+# here, we build a native gtk4-update-icon-cache as host-libgtk4
+
+HOST_LIBGTK4_DEPENDENCIES = \
+	host-gdk-pixbuf \
+	host-libglib2 \
+	host-pkgconf
+
+HOST_LIBGTK4_CFLAGS = \
+	-I $(@D)/gtk \
+	`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags --libs gdk-pixbuf-2.0`
+
+define HOST_LIBGTK4_CONFIGURE_CMDS
+	echo "#define BUILD_TOOLS 1" >> $(@D)/gtk/config.h
+	echo "#define GETTEXT_PACKAGE \"gtk40\"" >> $(@D)/gtk/config.h
+	echo "#define GTK_LOCALEDIR \"/usr/share/locale\"" >> $(@D)/gtk/config.h
+	echo "#define HAVE_UNISTD_H 1" >> $(@D)/gtk/config.h
+	echo "#define HAVE_FTW_H 1" >> $(@D)/gtk/config.h
+endef
+
+define HOST_LIBGTK4_BUILD_CMDS
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+		$(@D)/tools/updateiconcache.c $(@D)/gtk/gtkiconcachevalidator.c\
+		$(HOST_LIBGTK4_CFLAGS) \
+		-o $(@D)/tools/gtk4-update-icon-cache
+endef
+
+define HOST_LIBGTK4_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tools/gtk4-update-icon-cache \
+		$(HOST_DIR)/bin/gtk4-update-icon-cache
+endef
+
+# Create icon-theme.cache for each of the icon directories/themes
+# It's not strictly necessary but speeds up lookups
+define LIBGTK4_UPDATE_ICON_CACHE
+	[ ! -d $(TARGET_DIR)/usr/share/icons ] || \
+		find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
+			-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
+endef
+LIBGTK4_TARGET_FINALIZE_HOOKS += LIBGTK4_UPDATE_ICON_CACHE
+
+$(eval $(meson-package))
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
