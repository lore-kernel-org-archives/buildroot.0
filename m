From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:38:31 +0100
Subject: [Buildroot] [PATCH 02/36] xorg: Bump xcb-proto & libxcb version to
	1.10
In-Reply-To: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP401025A09E72B56EC74214CD9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

updated pkgconfig variables code taken from OpenELEC:
https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/x11/lib/libxcb/package.mk

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/libxcb/libxcb.mk       |   10 ++++++----
 package/x11r7/xcb-proto/xcb-proto.mk |    2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index dfcf6fa..c3cbfab 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.8.1
+LIBXCB_VERSION = 1.10
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist/
 LIBXCB_LICENSE = MIT
@@ -15,9 +15,11 @@ LIBXCB_INSTALL_STAGING = YES
 LIBXCB_DEPENDENCIES = \
 	host-libxslt xlib_libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python host-pkgconf
-LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
-LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
-	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+LIBXCB_CONF_ENV = PKG_CONFIG="$$PKG_CONFIG \
+	--define-variable=pythondir=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
+	--define-variable=xcbincludedir=$(STAGING_DIR)/usr/share/xcb"
+
 LIBXCB_CONF_OPT = --disable-build-docs
 
 HOST_LIBXCB_CONF_OPT = --disable-build-docs
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 98d0f02..39f06e7 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.7.1
+XCB_PROTO_VERSION = 1.10
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
 XCB_PROTO_SITE = http://xcb.freedesktop.org/dist/
 XCB_PROTO_LICENSE = MIT
-- 
1.7.9.5
