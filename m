From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 07:16:14 +0200
Subject: [Buildroot] [git commit] libstrophe: bump to version 0.8.8
Message-ID: <20150924052259.691E981D6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c5cac617999b55e10a3110558063d6af0c4c4a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libstrophe/0001-make-autoreconfable.patch |   17 ++++++++++++-----
 package/libstrophe/libstrophe.mk                  |    3 ++-
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/libstrophe/0001-make-autoreconfable.patch b/package/libstrophe/0001-make-autoreconfable.patch
index 98da3f4..76ca6f2 100644
--- a/package/libstrophe/0001-make-autoreconfable.patch
+++ b/package/libstrophe/0001-make-autoreconfable.patch
@@ -1,13 +1,20 @@
 Make the package autoreconfigurable
 
 Signed-off-by: Denis Bodor <lefinnois@lefinnois.net>
+[Gustavo: update for 0.8.8]
 
-diff -ur libstrophe.orig/Makefile.am libstrophe/Makefile.am
---- libstrophe.orig/Makefile.am	2014-03-02 18:58:36.219753865 +0100
-+++ libstrophe/Makefile.am	2014-03-02 18:58:02.739752477 +0100
+diff -Nura libstrophe-0.8.8.orig/m4/.empty libstrophe-0.8.8/m4/.empty
+--- libstrophe-0.8.8.orig/m4/.empty	1969-12-31 21:00:00.000000000 -0300
++++ libstrophe-0.8.8/m4/.empty	2015-09-23 19:29:37.893688227 -0300
+@@ -0,0 +1,2 @@
++
++
+diff -Nura libstrophe-0.8.8.orig/Makefile.am libstrophe-0.8.8/Makefile.am
+--- libstrophe-0.8.8.orig/Makefile.am	2015-09-23 19:26:10.960492781 -0300
++++ libstrophe-0.8.8/Makefile.am	2015-09-23 19:29:17.265970964 -0300
 @@ -1,4 +1,4 @@
 -AUTOMAKE_OPTIONS = subdir-objects
 +AUTOMAKE_OPTIONS = subdir-objects foreign
  
- CFLAGS = -g -Wall
- 
+ ACLOCAL_AMFLAGS = -I m4
+ AM_CFLAGS = -g -Wall
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 8493692..e6eb834 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.8.6
+LIBSTROPHE_VERSION = 0.8.8
 LIBSTROPHE_SITE = $(call github,strophe,libstrophe,$(LIBSTROPHE_VERSION))
 LIBSTROPHE_DEPENDENCIES = openssl host-pkgconf
+# Doesn't ship configure
 LIBSTROPHE_AUTORECONF = YES
 LIBSTROPHE_LICENSE = MIT or GPLv3
 LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
