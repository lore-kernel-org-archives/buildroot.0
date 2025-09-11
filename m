Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05967CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC6C1425DD;
	Thu, 11 Sep 2025 20:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsCcUhkrSLfu; Thu, 11 Sep 2025 20:09:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8335242599
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8335242599;
	Thu, 11 Sep 2025 20:09:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 198F9234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB8026F5A2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ah_iD13XbNUM for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5EE36F5A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5EE36F5A8
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:09:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5A38843A1; Thu, 11 Sep 2025 20:09:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:07:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 122d1d1fbd63e775587f58620498276c60fa80cd
X-Git-Newrev: d45984a208016d9acd03ec77b0162acf99947af3
X-Patchwork-Hint: ignore
Message-Id: <20250911200941.B5A38843A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/metacity: remove package
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
Content-Type: multipart/mixed; boundary="===============6692636256328965322=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6692636256328965322==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d45984a208016d9acd03ec77b0162acf99947af3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This window manager requires libgtk2, which we are about to remove, so
let's drop metacity.

Although metacity is still actively developed on gnome.org, it hasn't
seen an update in Buildroot since 2011, so probably nobody is using it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                |  3 --
 Config.in.legacy                                   |  7 +++
 package/Config.in                                  |  1 -
 package/metacity/0001-add-libm-reference.patch     | 51 ----------------------
 package/metacity/0002-gconf.patch                  | 30 -------------
 package/metacity/0003-mag-add-libm-reference.patch | 45 -------------------
 package/metacity/Config.in                         | 18 --------
 package/metacity/Xsession                          |  6 ---
 package/metacity/metacity.hash                     |  5 ---
 package/metacity/metacity.mk                       | 44 -------------------
 10 files changed, 7 insertions(+), 203 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 23b7e734d9..050994c2d2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -731,9 +731,6 @@ package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch lib_pat
 package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch lib_patch.Upstream
 package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch lib_patch.Upstream
 package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch lib_patch.Upstream
-package/metacity/0001-add-libm-reference.patch lib_patch.Upstream
-package/metacity/0002-gconf.patch lib_patch.Upstream
-package/metacity/0003-mag-add-libm-reference.patch lib_patch.Upstream
 package/mfgtools/0001-lnx_def.h-fix-conflicting-declaration-of-__time64_t.patch lib_patch.Upstream
 package/mii-diag/0001-strchr.patch lib_patch.Sob lib_patch.Upstream
 package/mini-snmpd/0001-linux.c-fix-musl-build.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 1c14463aae..6abd11924c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_METACITY
+	bool "metacity has been removed"
+	select BR2_LEGACY
+	help
+	  The metacity package has been removed, as libgtk2 has been
+	  removed as well.
+
 config BR2_PACKAGE_LIBSEXY
 	bool "libsexy has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index a1aa1273da..e039a181eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -426,7 +426,6 @@ comment "X window managers"
 	source "package/evilwm/Config.in"
 	source "package/fluxbox/Config.in"
 	source "package/matchbox/Config.in"
-	source "package/metacity/Config.in"
 	source "package/openbox/Config.in"
 	source "package/ratpoison/Config.in"
 endmenu
diff --git a/package/metacity/0001-add-libm-reference.patch b/package/metacity/0001-add-libm-reference.patch
deleted file mode 100644
index 628501726a..0000000000
--- a/package/metacity/0001-add-libm-reference.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Upstream fix to link metacity itself against libm
-
-The upstream fix is modified to also include the changes on the
-configure script directly, so that autoreconfiguring is not
-needed. Autoreconfiguring cannot be done easily on metacity, due to
-missing AM_GCONF_SOURCE_2 and AM_NLS macros.
-
-http://git.gnome.org/browse/metacity/commit/configure.in?id=9cb0b6ff520ea69bdff6c328a21787202aee1bcc
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-From 9cb0b6ff520ea69bdff6c328a21787202aee1bcc Mon Sep 17 00:00:00 2001
-From: Götz Waschk <waschk@mandriva.org>
-Date: Wed, 22 Oct 2008 12:08:48 +0000
-Subject: add libm reference. Closes #557357.
-
-2008-10-22  Götz Waschk  <waschk@mandriva.org>
-
-        * configure.in: add libm reference.  Closes #557357.
-
-
-svn path=/trunk/; revision=3984
----
-(limited to 'configure.in')
-
-Index: b/configure.in
-===================================================================
---- a/configure.in
-+++ b/configure.in
-@@ -413,7 +413,7 @@
-    AC_DEFINE(HAVE_XSYNC, , [Have the Xsync extension library])
- fi
- 
--METACITY_LIBS="$METACITY_LIBS $XSYNC_LIBS $RANDR_LIBS $SHAPE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
-+METACITY_LIBS="$METACITY_LIBS $XSYNC_LIBS $RANDR_LIBS $SHAPE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS -lm"
- METACITY_MESSAGE_LIBS="$METACITY_MESSAGE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
- METACITY_WINDOW_DEMO_LIBS="$METACITY_WINDOW_DEMO_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
- METACITY_PROPS_LIBS="$METACITY_PROPS_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
-Index: b/configure
-===================================================================
---- a/configure
-+++ b/configure
-@@ -29509,7 +29509,7 @@
- 
- fi
- 
--METACITY_LIBS="$METACITY_LIBS $XSYNC_LIBS $RANDR_LIBS $SHAPE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
-+METACITY_LIBS="$METACITY_LIBS $XSYNC_LIBS $RANDR_LIBS $SHAPE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS -lm"
- METACITY_MESSAGE_LIBS="$METACITY_MESSAGE_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
- METACITY_WINDOW_DEMO_LIBS="$METACITY_WINDOW_DEMO_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
- METACITY_PROPS_LIBS="$METACITY_PROPS_LIBS $X_LIBS $X_PRE_LIBS -lX11 $X_EXTRA_LIBS"
diff --git a/package/metacity/0002-gconf.patch b/package/metacity/0002-gconf.patch
deleted file mode 100644
index 939ef7ef98..0000000000
--- a/package/metacity/0002-gconf.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-[PATCH] fix build with --disable-gconf
-
-src/core/prefs.c still contain a call to gconf_client_set_bool() when
-built with --disable-gconf, breaking the build.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/core/prefs.c |    2 ++
- 1 file changed, 2 insertions(+)
-
-Index: metacity-2.25.1/src/core/prefs.c
-===================================================================
---- metacity-2.25.1.orig/src/core/prefs.c
-+++ metacity-2.25.1/src/core/prefs.c
-@@ -2949,6 +2949,7 @@
- void
- meta_prefs_set_compositing_manager (gboolean whether)
- {
-+#if HAVE_GCONF
-   GError *err = NULL;
- 
-   gconf_client_set_bool (default_client,
-@@ -2962,6 +2963,7 @@
-                     err->message);
-       g_error_free (err);
-     }
-+#endif
- }
- 
- #ifndef HAVE_GCONF
diff --git a/package/metacity/0003-mag-add-libm-reference.patch b/package/metacity/0003-mag-add-libm-reference.patch
deleted file mode 100644
index d47d807558..0000000000
--- a/package/metacity/0003-mag-add-libm-reference.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream patch to fix link against libm
-
-The upstream patch is modified to also include the necessary
-Makefile.in, which avoids the need for autoreconfiguring the
-package. Autoreconfiguring the package unfortunately doesn't work, due
-to AM_GCONF_SOURCE_2 and AM_NLS macros being missing.
-
-http://git.gnome.org/browse/metacity/commit/src/tools/Makefile.am?id=13d0d52eb885598885b6ff4b73c795c8f29c2a6b
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-From 13d0d52eb885598885b6ff4b73c795c8f29c2a6b Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Sun, 02 May 2010 14:50:42 +0000
-Subject: fails to link with pedantic linkers
-
----
-(limited to 'src/tools/Makefile.am')
-
-Index: b/src/tools/Makefile.am
-===================================================================
---- a/src/tools/Makefile.am
-+++ b/src/tools/Makefile.am
-@@ -26,7 +26,7 @@
- 
- metacity_message_LDADD= @METACITY_MESSAGE_LIBS@
- metacity_window_demo_LDADD= @METACITY_WINDOW_DEMO_LIBS@
--metacity_mag_LDADD= @METACITY_WINDOW_DEMO_LIBS@
-+metacity_mag_LDADD= @METACITY_WINDOW_DEMO_LIBS@ -lm
- metacity_grayscale_LDADD = @METACITY_WINDOW_DEMO_LIBS@
- 
- EXTRA_DIST=$(icon_DATA)
-Index: b/src/tools/Makefile.in
-===================================================================
---- a/src/tools/Makefile.in
-+++ b/src/tools/Makefile.in
-@@ -281,7 +281,7 @@
- 
- metacity_message_LDADD = @METACITY_MESSAGE_LIBS@
- metacity_window_demo_LDADD = @METACITY_WINDOW_DEMO_LIBS@
--metacity_mag_LDADD = @METACITY_WINDOW_DEMO_LIBS@
-+metacity_mag_LDADD = @METACITY_WINDOW_DEMO_LIBS@ -lm
- metacity_grayscale_LDADD = @METACITY_WINDOW_DEMO_LIBS@
- EXTRA_DIST = $(icon_DATA)
- all: all-am
diff --git a/package/metacity/Config.in b/package/metacity/Config.in
deleted file mode 100644
index fc106a26b9..0000000000
--- a/package/metacity/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_PACKAGE_METACITY
-	bool "metacity"
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
-	# Metacity configure.ac pretends it can be built without
-	# Composite, but in reality, it doesn't build.
-	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
-	select BR2_PACKAGE_XLIB_LIBXFIXES
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE
-	# We do not directly depend on Xft, but they are needed to get
-	# Xft support in Pango, which we require.
-	select BR2_PACKAGE_XLIB_LIBXFT
-	help
-	  Metacity is a window manager for the X Window System.
-
-	  https://wiki.gnome.org/Projects/Metacity
diff --git a/package/metacity/Xsession b/package/metacity/Xsession
deleted file mode 100755
index 7225921a07..0000000000
--- a/package/metacity/Xsession
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-export GDK_USE_XFT=1
-export LANG="en_US.UTF-8"
-export LC_ALL="en_US.UTF-8"
-/usr/bin/X11/rxvt -bg black -fg gray90 &
-exec /bin/metacity
diff --git a/package/metacity/metacity.hash b/package/metacity/metacity.hash
deleted file mode 100644
index 2aca099038..0000000000
--- a/package/metacity/metacity.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://download.gnome.org/sources/metacity/2.25/metacity-2.25.1.sha256sum
-sha256  fb2ede4ac02d7da08d3c3323fb76afaf945c8cccc07cb2d3a4b7f44fb49f1c47  metacity-2.25.1.tar.bz2
-
-# Locally computed
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
deleted file mode 100644
index 5756658300..0000000000
--- a/package/metacity/metacity.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-################################################################################
-#
-# metacity
-#
-################################################################################
-
-# newer versions need libcanberra-gtk and gnome-doc-utils
-METACITY_VERSION_MAJOR = 2.25
-METACITY_VERSION = $(METACITY_VERSION_MAJOR).1
-METACITY_SOURCE = metacity-$(METACITY_VERSION).tar.bz2
-METACITY_SITE = https://download.gnome.org/sources/metacity/$(METACITY_VERSION_MAJOR)
-METACITY_LICENSE = GPL-2.0+
-METACITY_LICENSE_FILES = COPYING
-
-METACITY_CONF_OPTS = \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	--disable-glibtest \
-	--disable-gconf \
-	--disable-sm \
-	--disable-startup-notification
-
-METACITY_DEPENDENCIES = libgtk2 \
-	xlib_libX11 \
-	host-libxml-parser-perl \
-	xlib_libXcomposite \
-	xlib_libXfixes \
-	xlib_libXrender \
-	xlib_libXdamage \
-	$(TARGET_NLS_DEPENDENCIES)
-
-METACITY_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
-METACITY_DEPENDENCIES += xlib_libXcursor
-endif
-
-define METACITY_INSTALL_XSESSION
-	$(INSTALL) -D package/metacity/Xsession $(TARGET_DIR)/etc/X11/Xsession
-endef
-
-METACITY_POST_INSTALL_TARGET_HOOKS += METACITY_INSTALL_XSESSION
-
-$(eval $(autotools-package))

--===============6692636256328965322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6692636256328965322==--
