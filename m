From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Fri, 19 Aug 2011 08:12:34 -0700
Subject: [Buildroot] [PATCH] libconfuse: bump to version 2.7 take 3
In-Reply-To: <20110819110643.600032d6@skate>
References: <4E4DA5E3.9060707@ethertek.ca> <4E4DEB3A.3030402@ethertek.ca>
 <20110819110643.600032d6@skate>
Message-ID: <4E4E7D62.2060008@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thomas says;

--enable-shared is not needed becauseit is already passed by the AUTOTARGETS infrastructure.

Below is take 3 without--enable-shared .

Old libconfuse version 2.6 is from year 2007 so bump to version 2.7
Updated download URL
Removed libconfuse-2.6-dont-use-werror.patch
Changed := to just =


Signed-off-by: Dan Pattison <dan.pattison@ethertek.ca>
---
  .../libconfuse-2.6-dont-use-werror.patch           |   34 
--------------------
  package/libconfuse/libconfuse.mk                   |   16 +++++----
  2 files changed, 9 insertions(+), 41 deletions(-)
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
index 03aa0bc..f37c76d 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -3,13 +3,15 @@
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

-LIBCONFUSE_CONF_OPT:=--disable-rpath
+LIBCONFUSE_CONF_OPT = --disable-rpath
+
+LIBCONFUSE_DEPENDENCIES = uclibc

  $(eval $(call AUTOTARGETS,package,libconfuse))
-- 
1.6.3.3

Dan Pattison
Ethertek Circuits
