From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 17:47:08 +0100
Subject: [Buildroot] [git commit] pango: bump to version 1.40.4
Message-ID: <20170306164717.54A048229D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a10d7bc8dd5c85bd46898823bd02ace5819802cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update test-disabling patch for new version, and git format it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-build-disable-tests-from-building.patch   | 39 ++++++++++++++++++++++
 package/pango/0001-no-tests.patch                  | 30 -----------------
 package/pango/pango.hash                           |  4 +--
 package/pango/pango.mk                             |  2 +-
 4 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/package/pango/0001-build-disable-tests-from-building.patch b/package/pango/0001-build-disable-tests-from-building.patch
new file mode 100644
index 0000000..c518a34
--- /dev/null
+++ b/package/pango/0001-build-disable-tests-from-building.patch
@@ -0,0 +1,39 @@
+From cde9a78711e8eaed0aefb9e36288f22918e8d4b2 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 2 Mar 2017 09:41:41 -0300
+Subject: [PATCH] build: disable tests from building
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Makefile.am | 2 +-
+ Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9e31b34..32e5c29 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to create Makefile.in.
+ 
+-SUBDIRS= pango pango-view examples docs tools tests win32
++SUBDIRS= pango pango-view examples docs tools win32
+ 
+ EXTRA_DIST = 			\
+ 	autogen.sh		\
+diff --git a/Makefile.in b/Makefile.in
+index 6b6f6c7..ed0cfa2 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -418,7 +418,7 @@ target_alias = @target_alias@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-SUBDIRS = pango pango-view examples docs tools tests win32
++SUBDIRS = pango pango-view examples docs tools win32
+ EXTRA_DIST = \
+ 	autogen.sh		\
+ 	pango.pc.in		\
+-- 
+2.10.2
+
diff --git a/package/pango/0001-no-tests.patch b/package/pango/0001-no-tests.patch
deleted file mode 100644
index 734409d..0000000
--- a/package/pango/0001-no-tests.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Prevent Pango to build tests.
-
-Updated to Pango 1.36.3 by Hadrien Boutteville.
-
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-[Gustavo: update for 1.38.1]
-
-diff -Nura pango-1.38.1.orig/Makefile.am pango-1.38.1/Makefile.am
---- pango-1.38.1.orig/Makefile.am	2015-10-14 15:41:27.620016974 +0000
-+++ pango-1.38.1/Makefile.am	2015-10-14 15:41:54.431240793 +0000
-@@ -1,6 +1,6 @@
- ## Process this file with automake to create Makefile.in.
- 
--SUBDIRS= pango pango-view examples docs tools tests build
-+SUBDIRS= pango pango-view examples docs tools build
- 
- EXTRA_DIST = 			\
- 	autogen.sh		\
-diff -Nura pango-1.38.1.orig/Makefile.in pango-1.38.1/Makefile.in
---- pango-1.38.1.orig/Makefile.in	2015-10-14 15:41:27.630016685 +0000
-+++ pango-1.38.1/Makefile.in	2015-10-14 15:41:58.753115676 +0000
-@@ -417,7 +417,7 @@
- top_build_prefix = @top_build_prefix@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = pango pango-view examples docs tools tests build
-+SUBDIRS = pango pango-view examples docs tools build
- EXTRA_DIST = \
- 	autogen.sh		\
- 	pango.pc.in		\
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 1ea9f6b..9908c4a 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.3.sha256sum
-sha256	abba8b5ce728520c3a0f1535eab19eac3c14aeef7faa5aded90017ceac2711d3	pango-1.40.3.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.40/pango-1.40.4.sha256sum
+sha256	f8fdc5fc66356dc4edf915048cceeee065a0e0cb70b3b2598f62bda320129a3e	pango-1.40.4.tar.xz
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index b45bf9a..d4957f9 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.40
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).3
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
