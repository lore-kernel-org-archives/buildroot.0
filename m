From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Jun 2018 11:59:28 +0200
Subject: [Buildroot] [PATCH 1/1] json-glib: bump to version 1.4.2
Message-ID: <20180609095928.14995-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch to meson-package
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-glib/json-glib.hash | 7 +++++--
 package/json-glib/json-glib.mk   | 6 +++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index 2f190ab934..fae4df36d4 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,2 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.2/json-glib-1.2.8.sha256sum
-sha256 fd55a9037d39e7a10f0db64309f5f0265fa32ec962bf85066087b83a2807f40a  json-glib-1.2.8.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/json-glib/1.4/json-glib-1.4.2.sha256sum
+sha256 2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8  json-glib-1.4.2.tar.xz
+
+# Hash for license file:
+sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 5ee43d9a12..77c0c45323 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.2
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).8
+JSON_GLIB_VERSION_MAJOR = 1.4
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).2
 JSON_GLIB_SITE = http://ftp.gnome.org/pub/GNOME/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+
@@ -17,4 +17,4 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.14.1
