From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon,  2 Dec 2013 09:00:02 +0100
Subject: [Buildroot] [PATCH 1/2] package: unification of name
	<pkg>_VERSION_MAJOR variable
Message-ID: <1385971203-11645-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently there are two different names of the major version variable:
<PKG>_MAJOR_VERSION and <PKG>_VERSION_MAJOR
This patch unifies them to <PKG>_VERSION_MAJOR

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/gdk-pixbuf/gdk-pixbuf.mk           |    6 +++---
 package/glib-networking/glib-networking.mk |    6 +++---
 package/json-glib/json-glib.mk             |    6 +++---
 package/libsoup/libsoup.mk                 |    6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index d1d590a..1fb8be1 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GDK_PIXBUF_MAJOR_VERSION = 2.28
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).2
+GDK_PIXBUF_VERSION_MAJOR = 2.28
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
-GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_MAJOR_VERSION)
+GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
 GDK_PIXBUF_LICENSE_FILES = COPYING
 GDK_PIXBUF_INSTALL_STAGING = YES
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 99fc591..aa84d79 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_MAJOR_VERSION = 2.36
+GLIB_NETWORKING_VERSION_MAJOR = 2.36
 GLIB_NETWORKING_MINOR_VERSION = 2
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_MAJOR_VERSION).$(GLIB_NETWORKING_MINOR_VERSION)
-GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_MAJOR_VERSION)
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).$(GLIB_NETWORKING_MINOR_VERSION)
+GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 
 GLIB_NETWORKING_INSTALL_STAGING = YES
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 24cc9ab..65425bd 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-JSON_GLIB_MAJOR_VERSION = 0.14
+JSON_GLIB_VERSION_MAJOR = 0.14
 JSON_GLIB_MINOR_VERSION = 2
-JSON_GLIB_VERSION = $(JSON_GLIB_MAJOR_VERSION).$(JSON_GLIB_MINOR_VERSION)
-JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_MAJOR_VERSION)
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).$(JSON_GLIB_MINOR_VERSION)
+JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPLv2.1+
 JSON_GLIB_LICENSE_FILES = COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index d847f24..c94eb06 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBSOUP_MAJOR_VERSION = 2.43
+LIBSOUP_VERSION_MAJOR = 2.43
 LIBSOUP_MINOR_VERSION = 1
-LIBSOUP_VERSION = $(LIBSOUP_MAJOR_VERSION).$(LIBSOUP_MINOR_VERSION)
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).$(LIBSOUP_MINOR_VERSION)
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
-LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
+LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
 LIBSOUP_LICENSE_FILES = COPYING
 LIBSOUP_INSTALL_STAGING = YES
-- 
1.7.9.5
