From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] libglib2: bump to 2.24.0
Message-ID: <20100727210245.9A4BC835A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fb68d67fd8df75f906b8503bcb9e70e0518a2ea1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/libglib2/Config.in   |    1 +
 package/libglib2/libglib2.mk |    8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 43ca7c0..3d42430 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 43b1a89..622092d 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,8 +3,8 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.22
-LIBGLIB2_VERSION_MINOR = 5
+LIBGLIB2_VERSION_MAJOR = 2.24
+LIBGLIB2_VERSION_MINOR = 0
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
@@ -55,9 +55,9 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 zlib $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
-HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config
+HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-zlib
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES+=libiconv
-- 
1.7.1
