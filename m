From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  4 Jan 2021 22:03:37 +0100
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.48.0
Message-ID: <20210104210337.2472-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pango/Config.in  |  2 +-
 package/pango/pango.hash |  4 ++--
 package/pango/pango.mk   | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pango/Config.in b/package/pango/Config.in
index e810598ee..cf5170c8f 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_PANGO
 	  widget toolkit. Pango forms the core of text and font
 	  handling for GTK+-2.x.
 
-	  http://www.pango.org/
+	  https://pango.gnome.org/
 
 comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_USE_MMU
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 32808c6ca..a672b7cfa 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/pango/1.46/pango-1.46.2.sha256sum
-sha256  d89fab5f26767261b493279b65cfb9eb0955cd44c07c5628d36094609fc51841  pango-1.46.2.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.48/pango-1.48.0.sha256sum
+sha256  391f26f3341c2d7053e0fb26a956bd42360dadd825efe7088b1e9340a65e74e6  pango-1.48.0.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 92bd6c3ea..d719b7659 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.46
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).2
+PANGO_VERSION_MAJOR = 1.48
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).0
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
@@ -13,7 +13,7 @@ PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
 
 PANGO_CONF_OPTS = -Duse_fontconfig=true
-HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=false
+HOST_PANGO_CONF_OPTS = -Duse_fontconfig=true -Dintrospection=disabled
 
 PANGO_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
@@ -34,10 +34,10 @@ HOST_PANGO_DEPENDENCIES = \
 	host-freetype
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-PANGO_CONF_OPTS += -Dintrospection=true
+PANGO_CONF_OPTS += -Dintrospection=enabled
 PANGO_DEPENDENCIES += gobject-introspection
 else
-PANGO_CONF_OPTS += -Dintrospection=false
+PANGO_CONF_OPTS += -Dintrospection=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-- 
2.27.0
