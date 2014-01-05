From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 22:15:48 +0100
Subject: [Buildroot] [git commit] xorg: Bump xlib_libXi version to 1.7.2
Message-ID: <20140105230942.613529C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a6ff1dbfaacaf90d8c2f45bddea2fe6c300945e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs libXfixes, cleanup dependency list (white space)]
Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXi/Config.in     |    3 ++-
 package/x11r7/xlib_libXi/xlib_libXi.mk |   11 +++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXi/Config.in b/package/x11r7/xlib_libXi/Config.in
index ca5ab59..3ae22d6 100644
--- a/package/x11r7/xlib_libXi/Config.in
+++ b/package/x11r7/xlib_libXi/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXI
 	bool "libXi"
+	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XLIB_LIBXFIXES
 	help
 	  X.Org Xi library
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index cac3787..849ce09 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,13 +4,20 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.6.1
+XLIB_LIBXI_VERSION = 1.7.2
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_LICENSE = MIT
 XLIB_LIBXI_LICENSE_FILES = COPYING
 XLIB_LIBXI_INSTALL_STAGING = YES
-XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
+XLIB_LIBXI_DEPENDENCIES = \
+	host-pkgconf \
+	xproto_inputproto \
+	xproto_xproto \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXfixes
+
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
