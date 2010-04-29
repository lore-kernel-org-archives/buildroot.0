From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 29 Apr 2010 23:00:43 +0300
Subject: [Buildroot] [PATCH] libXtst depends on libXi
Message-ID: <20100429200043.6901.93788.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/x11r7/xlib_libXtst/Config.in       |    1 +
 package/x11r7/xlib_libXtst/xlib_libXtst.mk |    9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXtst/Config.in b/package/x11r7/xlib_libXtst/Config.in
index a8de203..8853bde 100644
--- a/package/x11r7/xlib_libXtst/Config.in
+++ b/package/x11r7/xlib_libXtst/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XLIB_LIBXTST
 	bool "libXtst"
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_RECORDPROTO
 	help
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index 7e6427e..e89cf11 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -7,10 +7,15 @@
 XLIB_LIBXTST_VERSION = 1.1.0
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
 XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXTST_AUTORECONF = NO
 XLIB_LIBXTST_LIBTOOL_PATCH = NO
 XLIB_LIBXTST_INSTALL_STAGING = YES
-XLIB_LIBXTST_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_recordproto
+
+XLIB_LIBXTST_DEPENDENCIES = \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXi \
+	xproto_recordproto
+
 XLIB_LIBXTST_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXtst))
