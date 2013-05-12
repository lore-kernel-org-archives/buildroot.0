From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 22:13:36 +0200
Subject: [Buildroot] [git commit] package/x11r7: add license informations to
	misc other packages
Message-ID: <20130512202409.339169A166@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cc701cf735fb2fcfc9f4b682e8748ab3b5e8b25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/libxcb.mk                     |    2 ++
 package/x11r7/mcookie/mcookie.mk                   |    1 +
 package/x11r7/mesa3d/mesa3d.mk                     |    3 +++
 package/x11r7/xcb-proto/xcb-proto.mk               |    2 ++
 package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk |    4 ++++
 package/x11r7/xcb-util/xcb-util.mk                 |    4 ++++
 .../xcursor-transparent-theme.mk                   |    2 ++
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk     |    3 +++
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |    3 +++
 9 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 0999dc4..97f6238 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -6,6 +6,8 @@
 LIBXCB_VERSION = 1.8.1
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist/
+LIBXCB_LICENSE = MIT
+LIBXCB_LICENSE_FILES = COPYING
 
 LIBXCB_INSTALL_STAGING = YES
 
diff --git a/package/x11r7/mcookie/mcookie.mk b/package/x11r7/mcookie/mcookie.mk
index b7191a7..cc83f46 100644
--- a/package/x11r7/mcookie/mcookie.mk
+++ b/package/x11r7/mcookie/mcookie.mk
@@ -6,6 +6,7 @@
 
 # Source included in Buildroot
 MCOOKIE_SOURCE =
+MCOOKIE_LICENSE = Public Domain
 
 define MCOOKIE_EXTRACT_CMDS
 	cp package/x11r7/mcookie/mcookie.c $(@D)/
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 397dbb2..84f7c3f 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -7,6 +7,9 @@
 MESA3D_VERSION = 7.10.3
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
+MESA3D_LICENSE = MIT, SGI, Khronos
+MESA3D_LICENSE_FILES = docs/license.html
+
 MESA3D_AUTORECONF = YES
 MESA3D_INSTALL_STAGING = YES
 
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index e76f829..730feb5 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -6,6 +6,8 @@
 XCB_PROTO_VERSION = 1.7.1
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
 XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
+XCB_PROTO_LICENSE = MIT
+XCB_PROTO_LICENSE_FILES = COPYING
 
 XCB_PROTO_INSTALL_STAGING = YES
 
diff --git a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
index 18db52a..8960c77 100644
--- a/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
+++ b/package/x11r7/xcb-util-keysyms/xcb-util-keysyms.mk
@@ -6,6 +6,10 @@
 XCB_UTIL_KEYSYMS_VERSION = 0.3.9
 XCB_UTIL_KEYSYMS_SOURCE = xcb-util-keysyms-$(XCB_UTIL_KEYSYMS_VERSION).tar.bz2
 XCB_UTIL_KEYSYMS_SITE = http://xcb.freedesktop.org/dist/
+
+# unfortunately, no license file
+XCB_UTIL_KEYSYMS_LICENSE = MIT
+
 XCB_UTIL_KEYSYMS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index a1948e1..a16b150 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -6,6 +6,10 @@
 XCB_UTIL_VERSION = 0.3.9
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
+
+# unfortunately, no license file
+XCB_UTIL_LICENSE = MIT
+
 XCB_UTIL_INSTALL_STAGING = YES
 XCB_UTIL_DEPENDENCIES = host-gperf libxcb
 
diff --git a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
index 3ad985b..70f9887 100644
--- a/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
+++ b/package/x11r7/xcursor-transparent-theme/xcursor-transparent-theme.mk
@@ -7,6 +7,8 @@
 XCURSOR_TRANSPARENT_THEME_VERSION = 0.1.1
 XCURSOR_TRANSPARENT_THEME_SITE = http://downloads.yoctoproject.org/releases/matchbox/utils/
 XCURSOR_TRANSPARENT_THEME_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
+XCURSOR_TRANSPARENT_THEME_LICENSE = GPLv2
+XCURSOR_TRANSPARENT_THEME_LICENSE_FILES = COPYING
 
 define ICONS_DEFAULT_CONFIG_INSTALL
         $(INSTALL) -m 0755 -D package/x11r7/xcursor-transparent-theme/index.theme \
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index 1f26743..ae964b4 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -7,6 +7,9 @@
 XDATA_XBITMAPS_VERSION = 1.1.1
 XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
 XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
+XDATA_XBITMAPS_LICENSE = MIT
+XDATA_XBITMAPS_LICENSE_FILES = COPYING
+
 XDATA_XBITMAPS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index e46fbbc..68c3ae2 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -7,6 +7,9 @@
 XDATA_XCURSOR_THEMES_VERSION = 1.0.3
 XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
 XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
+XDATA_XCURSOR_THEMES_LICENSE = MIT
+XDATA_XCURSOR_THEMES_LICENSE_FILES = COPYING
+
 XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
 XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 
