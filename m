From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2016 22:03:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/aumix: bump version to 2.9.1
Message-ID: <1453842198-1428-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- rebased patch 0001
- added AUMIX_GETTEXTIZE = YES to solve
  *** error: gettext infrastructure mismatch: using a Makefile.in.in
  from gettext version 0.17 but the autoconf macros are from gettext
  version 0.19

Fixes
http://autobuild.buildroot.net/results/c8c/c8c7f9a799d1af507a6edd5e02b0bbc8b7b5d068/
http://autobuild.buildroot.net/results/67e/67e6d29e6d6f8d4967a74ec70a754a5b24afc0ce/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/aumix/0001-fix-incorrect-makefile-am.patch | 9 ++++-----
 package/aumix/aumix.hash                           | 4 ++--
 package/aumix/aumix.mk                             | 3 ++-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/aumix/0001-fix-incorrect-makefile-am.patch b/package/aumix/0001-fix-incorrect-makefile-am.patch
index 8d55218..143174d 100644
--- a/package/aumix/0001-fix-incorrect-makefile-am.patch
+++ b/package/aumix/0001-fix-incorrect-makefile-am.patch
@@ -15,15 +15,14 @@ Index: aumix-2.8/src/Makefile.am
 ===================================================================
 --- aumix-2.8.orig/src/Makefile.am
 +++ aumix-2.8/src/Makefile.am
-@@ -7,9 +7,8 @@
+@@ -9,9 +9,8 @@
  		mouse.c common.h curses.h gpm-xterm.h gtk.h interactive.h  \
  		mouse.h play.xpm record.xpm
  localedir	= $(datadir)/locale
 -INCLUDES	= -I../intl -DLOCALEDIR=\"$(localedir)\" -I at includedir@
--CFLAGS		= @CFLAGS@ @GLIB_CFLAGS@ @GTK_CFLAGS@
--LDADD		= -L at libdir@
 +INCLUDES	= -I../intl -DLOCALEDIR=\"$(localedir)\"
-+AM_CFLAGS	= @CFLAGS@ @GLIB_CFLAGS@ @GTK_CFLAGS@
- LIBS		= @LIBS@ @GTK_LIBS@ @INTLLIBS@
+ AM_CFLAGS	= @CFLAGS@ @GLIB_CFLAGS@ @GTK_CFLAGS@
+-LDADD		= -L at libdir@
+ LIBS		= @LIBS@ @GTK_LIBS@ @LIBINTL@
  DEFS		= @DEFS@
  
diff --git a/package/aumix/aumix.hash b/package/aumix/aumix.hash
index dbcd1e5..0463ea0 100644
--- a/package/aumix/aumix.hash
+++ b/package/aumix/aumix.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	636eef7f400c2f3df489c0d2fa21507e88692113561e75a40a26c52bc422d7fc  aumix-2.8.tar.bz2
+# Locally calculated
+sha256	d2ce43d532ef75072c8d4e7922e3bc06be6d97765a508d9ceb0d1766bbe70e29	aumix-2.9.1.tar.bz2
diff --git a/package/aumix/aumix.mk b/package/aumix/aumix.mk
index 8c668d2..eae34d0 100644
--- a/package/aumix/aumix.mk
+++ b/package/aumix/aumix.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-AUMIX_VERSION = 2.8
+AUMIX_VERSION = 2.9.1
 AUMIX_SOURCE = aumix-$(AUMIX_VERSION).tar.bz2
 AUMIX_SITE = http://jpj.net/~trevor/aumix/releases
 AUMIX_AUTORECONF = YES
+AUMIX_GETTEXTIZE = YES
 AUMIX_LICENSE = GPLv2+
 AUMIX_LICENSE_FILES = COPYING
 
-- 
2.7.0.rc3
