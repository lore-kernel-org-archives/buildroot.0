From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Thu, 18 Aug 2011 16:53:07 -0700
Subject: [Buildroot]  [PATCH] libconfuse: bump to version 2.7
Message-ID: <4E4DA5E3.9060707@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My first patch.
Old libconfuse version 2.6 is from year 2007 so bump to version 2.7
Updated download URL
Removed libconfuse-2.6-dont-use-werror.patch
Changed := to just =


Signed-off-by: Dan Pattison <dan.pattison@ethertek.ca>
---
  .../libconfuse-2.6-dont-use-werror.patch           |   34 
--------------------
  package/libconfuse/libconfuse.mk                   |   12 +++---
  2 files changed, 6 insertions(+), 40 deletions(-)
  delete mode 100644 package/libconfuse/libconfuse-2.6-dont-use-werror.patch

diff --git a/package/libconfuse/libconfuse-2.6-dont-use-werror.patch 
b/package/libconfuse/libconfuse-2.6-dont-use-werror.patch
deleted file mode 100644
index 50d0733..0000000
--- a/package/libconfuse/libconfuse-2.6-dont-use-werror.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-confuse: don't compile with -Werror
-
-Werror isn't really a robust setting for !development.
----
- src/Makefile.am |    2 +-
- src/Makefile.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: confuse-2.6/src/Makefile.am
-===================================================================
---- confuse-2.6.orig/src/Makefile.am
-+++ confuse-2.6/src/Makefile.am
-@@ -10,7 +10,7 @@
- DEFS = -DLOCALEDIR=\"$(localedir)\" @DEFS@
-
- if cc_is_gcc
--AM_CFLAGS=-Wall -Werror
-+AM_CFLAGS=-Wall
- endif
-
- LIBS = @LIBS@
-Index: confuse-2.6/src/Makefile.in
-===================================================================
---- confuse-2.6.orig/src/Makefile.in
-+++ confuse-2.6/src/Makefile.in
-@@ -196,7 +196,7 @@
- libconfuse_la_SOURCES = confuse.c lexer.l
- libconfuse_la_LIBADD = $(LTLIBINTL)
- include_HEADERS = confuse.h
-- at cc_is_gcc_TRUE@AM_CFLAGS = -Wall -Werror
-+ at cc_is_gcc_TRUE@AM_CFLAGS = -Wall
- CLEANFILES = *~ \#*\#
- AM_LFLAGS = -Pcfg_yy -olex.yy.c
- all: all-am
diff --git a/package/libconfuse/libconfuse.mk 
b/package/libconfuse/libconfuse.mk
index 03aa0bc..06a85e1 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -3,12 +3,12 @@
  # libconfuse
  #
  #############################################################
-LIBCONFUSE_VERSION:=2.6
-LIBCONFUSE_SOURCE:=confuse-$(LIBCONFUSE_VERSION).tar.gz
-LIBCONFUSE_SITE:=http://bzero.se/confuse/
-LIBCONFUSE_AUTORECONF:=NO
-LIBCONFUSE_INSTALL_STAGING:=YES
-LIBCONFUSE_INSTALL_TARGET:=YES
+LIBCONFUSE_VERSION = 2.7
+LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
+LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
+LIBCONFUSE_AUTORECONF = NO
+LIBCONFUSE_INSTALL_STAGING = YES
+LIBCONFUSE_INSTALL_TARGET = YES

  LIBCONFUSE_CONF_OPT:=--disable-rpath

-- 
1.6.3.3

-- 
Dan Pattison
Ethertek Circuits
