From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 14:04:09 -0300
Subject: [Buildroot] [PATCH 3/5] pango: bump to version 1.38.1
In-Reply-To: <1444842251-4913-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444842251-4913-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1444842251-4913-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pango/0001-no-tests.patch | 21 ++++++++++++---------
 package/pango/pango.hash          |  4 ++--
 package/pango/pango.mk            |  4 ++--
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/package/pango/0001-no-tests.patch b/package/pango/0001-no-tests.patch
index e6777f6..734409d 100644
--- a/package/pango/0001-no-tests.patch
+++ b/package/pango/0001-no-tests.patch
@@ -3,25 +3,28 @@ Prevent Pango to build tests.
 Updated to Pango 1.36.3 by Hadrien Boutteville.
 
 Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
+[Gustavo: update for 1.38.1]
 
---- a/Makefile.am
-+++ b/Makefile.am
+diff -Nura pango-1.38.1.orig/Makefile.am pango-1.38.1/Makefile.am
+--- pango-1.38.1.orig/Makefile.am	2015-10-14 15:41:27.620016974 +0000
++++ pango-1.38.1/Makefile.am	2015-10-14 15:41:54.431240793 +0000
 @@ -1,6 +1,6 @@
  ## Process this file with automake to create Makefile.in.
  
--SUBDIRS= pango modules pango-view examples docs tools tests build
-+SUBDIRS= pango modules pango-view examples docs tools build
+-SUBDIRS= pango pango-view examples docs tools tests build
++SUBDIRS= pango pango-view examples docs tools build
  
  EXTRA_DIST = 			\
  	autogen.sh		\
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -418,7 +418,7 @@ target_alias = @target_alias@
+diff -Nura pango-1.38.1.orig/Makefile.in pango-1.38.1/Makefile.in
+--- pango-1.38.1.orig/Makefile.in	2015-10-14 15:41:27.630016685 +0000
++++ pango-1.38.1/Makefile.in	2015-10-14 15:41:58.753115676 +0000
+@@ -417,7 +417,7 @@
  top_build_prefix = @top_build_prefix@
  top_builddir = @top_builddir@
  top_srcdir = @top_srcdir@
--SUBDIRS = pango modules pango-view examples docs tools tests build
-+SUBDIRS = pango modules pango-view examples docs tools build
+-SUBDIRS = pango pango-view examples docs tools tests build
++SUBDIRS = pango pango-view examples docs tools build
  EXTRA_DIST = \
  	autogen.sh		\
  	pango.pc.in		\
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 3486001..792ac05 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/pango-1.36.8.sha256sum
-sha256	18dbb51b8ae12bae0ab7a958e7cf3317c9acfc8a1e1103ec2f147164a0fc2d07	pango-1.36.8.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/pango/1.36/pango-1.38.1.sha256sum
+sha256	1320569f6c6d75d6b66172b2d28e59c56ee864ee9df202b76799c4506a214eb7	pango-1.38.1.tar.xz
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 75e2d1b..19d6509 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.36
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).8
+PANGO_VERSION_MAJOR = 1.38
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).1
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
-- 
2.4.9
