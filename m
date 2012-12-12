From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Dec 2012 21:20:22 +0100
Subject: [Buildroot] [git commit] package: remove explicit --disable-doc*
	passing
Message-ID: <20121212202109.ED68A9A124@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e10cfb1e766441dd6b268e27ca97436f8b5ed0d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that it is handled globally (pkg-infra: pass --disable-doc if
documentation is not enabled).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/libevas.mk               |    5 -----
 package/fontconfig/fontconfig.mk             |    1 -
 package/sysstat/sysstat.mk                   |    4 ----
 package/x11r7/xlib_libSM/xlib_libSM.mk       |    5 -----
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk |    2 --
 package/x11r7/xlib_xtrans/xlib_xtrans.mk     |    2 --
 6 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 402aa48..2e9e930 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -210,10 +210,5 @@ else
 LIBEVAS_CONF_OPT += --disable-font-loader-eet
 endif
 
-# documentation
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-LIBEVAS_CONF_OPT += --disable-doc
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 9845656..6762126 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -24,7 +24,6 @@ FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 FONTCONFIG_DEPENDENCIES = freetype expat
 
 HOST_FONTCONFIG_CONF_OPT = \
-		--disable-docs \
 		--disable-static
 
 $(eval $(autotools-package))
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 83609a0..0513998 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -9,10 +9,6 @@ SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
 
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-SYSSTAT_CONF_OPT += --disable-documentation
-endif
-
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 SYSSTAT_DEPENDENCIES += gettext
 SYSSTAT_MAKE_OPT += CFLAGS+=-lintl
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index bdbda3f..a8d1eff 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -11,9 +11,4 @@ XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPT = --without-libuuid
 
-ifneq ($(BR2_HAVE_DOCUMENTATION),y)
-# documentation generation is slow
-XLIB_LIBSM_CONF_OPT += --disable-docs
-endif
-
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 7177ae8..5a702e5 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -9,8 +9,6 @@ XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
 XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
-XLIB_LIBXDMCP_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-docs)
-HOST_XLIB_LIBXDMCP_CONF_OPT = --disable-docs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index d47a0ed..8582985 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -8,8 +8,6 @@ XLIB_XTRANS_VERSION = 1.2.6
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_INSTALL_STAGING = YES
-XLIB_XTRANS_CONF_OPT = $(if $(BR2_HAVE_DOCUMENTATION),,--disable-docs)
-HOST_XLIB_XTRANS_CONF_OPT = --disable-docs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
