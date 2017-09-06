From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  6 Sep 2017 08:13:41 -0400
Subject: [Buildroot] [PATCH v2 1/1] pango: bump to version 1.40.12
Message-ID: <20170906121341.18940-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Fixed the patch refresh to retain the original author (Baruch and Thomas)


 .../0001-build-disable-tests-from-building.patch   | 25 ++++++++++++----------
 package/pango/pango.hash                           |  4 ++--
 package/pango/pango.mk                             |  2 +-
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/package/pango/0001-build-disable-tests-from-building.patch b/package/pango/0001-build-disable-tests-from-building.patch
index c518a34d3..9dfaba56b 100644
--- a/package/pango/0001-build-disable-tests-from-building.patch
+++ b/package/pango/0001-build-disable-tests-from-building.patch
@@ -1,16 +1,19 @@
-From cde9a78711e8eaed0aefb9e36288f22918e8d4b2 Mon Sep 17 00:00:00 2001
+From 1c503a8b2f127c12e58a6e8ba01743c04061df50 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 2 Mar 2017 09:41:41 -0300
+Date: Tue, 5 Sep 2017 07:25:17 -0400
 Subject: [PATCH] build: disable tests from building
 
+[Adam: refresh for pango 1.40.12]
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Makefile.am | 2 +-
  Makefile.in | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 9e31b34..32e5c29 100644
+index 70bf8b0..c69daf0 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,6 +1,6 @@
@@ -19,21 +22,21 @@ index 9e31b34..32e5c29 100644
 -SUBDIRS= pango pango-view examples docs tools tests win32
 +SUBDIRS= pango pango-view examples docs tools win32
  
- EXTRA_DIST = 			\
- 	autogen.sh		\
+ meson_dist_files = \
+ 	pango/pango-features.h.meson \
 diff --git a/Makefile.in b/Makefile.in
-index 6b6f6c7..ed0cfa2 100644
+index 8489ca1..51f6ada 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -418,7 +418,7 @@ target_alias = @target_alias@
+@@ -412,7 +412,7 @@ target_alias = @target_alias@
  top_build_prefix = @top_build_prefix@
  top_builddir = @top_builddir@
  top_srcdir = @top_srcdir@
 -SUBDIRS = pango pango-view examples docs tools tests win32
 +SUBDIRS = pango pango-view examples docs tools win32
- EXTRA_DIST = \
- 	autogen.sh		\
- 	pango.pc.in		\
+ meson_dist_files = \
+ 	pango/pango-features.h.meson \
+ 	pango-view/meson.build \
 -- 
-2.10.2
+2.13.5
 
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 9908c4a53..1b6da7d32 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.4.sha256sum
-sha256	f8fdc5fc66356dc4edf915048cceeee065a0e0cb70b3b2598f62bda320129a3e	pango-1.40.4.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.12.sha256sum
+sha256	75f1a9a8e4e2b28cbc078b50c1fa927ee4ded994d1ade97c5603e2d1f3161cfc	pango-1.40.12.tar.xz
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 7556f0ba8..79283e885 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.40
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).12
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
-- 
2.13.5
