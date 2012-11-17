From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:01:47 +0100
Subject: [Buildroot] [git commit] xlib_libXt: bump version to 1.1.3
Message-ID: <20121117081559.56DDE9A05D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37c739f226dbbf8bb4cb64ecf4f1bc7d9551c543
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by the bump of xapp_clipboard, itself needed to avoid the
following build failure:

  http://autobuild.buildroot.org/results/1a4f84ad76ad8c4e70bff6878fc232edf46ff8f1/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...il-don-t-link-makestrs-with-target-cflags.patch |   19 +++++++++----------
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/x11r7/xlib_libXt/xlib_libXt-0001-util-don-t-link-makestrs-with-target-cflags.patch b/package/x11r7/xlib_libXt/xlib_libXt-0001-util-don-t-link-makestrs-with-target-cflags.patch
index aafb352..692d03b 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt-0001-util-don-t-link-makestrs-with-target-cflags.patch
+++ b/package/x11r7/xlib_libXt/xlib_libXt-0001-util-don-t-link-makestrs-with-target-cflags.patch
@@ -1,11 +1,11 @@
-From 9324466141626518e5a67838813562ec6ef62ba3 Mon Sep 17 00:00:00 2001
+From 3f064076c783914cafdff028db303681dae4291d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Thu, 15 Nov 2012 18:31:53 +0100
-Subject: [PATCH] util: don't link makestrs with target cflags
+Subject: [PATCH] libXt: util: don't link makestrs with target cflags
 
 The line:
 
-makestrs_CFLAGS = $(XT_CFLAGS)
+AM_CFLAGS = $(XT_CFLAGS)
 
 in util/Makefile.am is wrong because it adds target cflags to the
 compilation of makestrs, which is built for the build machine, which
@@ -23,19 +23,19 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 2 deletions(-)
 
 diff --git a/util/Makefile.am b/util/Makefile.am
-index 969ecef..cc6f3fc 100644
+index dedfa6b..cc6f3fc 100644
 --- a/util/Makefile.am
 +++ b/util/Makefile.am
 @@ -10,7 +10,6 @@ EXTRA_DIST = \
- 	StrDefs.ht \
- 	string.list
+        StrDefs.ht \
+        string.list
  
--makestrs_CFLAGS = $(XT_CFLAGS)
+-AM_CFLAGS = $(XT_CFLAGS)
  makestrs_SOURCES = makestrs.c
  
  
 diff --git a/util/makestrs.c b/util/makestrs.c
-index 3551cc1..456735b 100644
+index a52866a..00c861f 100644
 --- a/util/makestrs.c
 +++ b/util/makestrs.c
 @@ -27,7 +27,6 @@ in this Software without prior written authorization from The Open Group.
@@ -45,7 +45,6 @@ index 3551cc1..456735b 100644
 -#include <X11/Xos.h>
  #include <stdlib.h>
  #include <unistd.h>
- #if defined(macII) && !defined(__STDC__)  /* stdlib.h fails to define these */
+ 
 -- 
 1.7.9.5
-
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index fd8f079..9f9aaea 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.0.9
+XLIB_LIBXT_VERSION = 1.1.3
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_INSTALL_STAGING = YES
