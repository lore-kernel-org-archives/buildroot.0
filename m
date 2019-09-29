From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 19:55:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXt: bump version to
 1.2.0
Message-ID: <20190929175550.18569-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://cgit.freedesktop.org/xorg/lib/libXt/commit/?id=0b80bc9904c8d553c760651daca0c964df052c8b
Also removed _AUTORECONF.

Added all hashes provided by upstream.

Updated license hash after upstream commit:
https://cgit.freedesktop.org/xorg/lib/libXt/commit/?id=a8dcb749458a723dd76e342162c5c00b629374fe

Removed configure option install-makestrs after upstream commit:
https://cgit.freedesktop.org/xorg/lib/libXt/commit/?id=345633dc9c79b32a1b391dfb4dfedf87ae9e291b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...n-t-link-makestrs-with-target-cflags.patch | 33 -------------------
 package/x11r7/xlib_libXt/xlib_libXt.hash      | 10 ++++--
 package/x11r7/xlib_libXt/xlib_libXt.mk        |  5 ++-
 3 files changed, 9 insertions(+), 39 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch

diff --git a/package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch b/package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch
deleted file mode 100644
index ccc684fc73..0000000000
--- a/package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3f064076c783914cafdff028db303681dae4291d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 15 Nov 2012 18:31:53 +0100
-Subject: [PATCH] libXt: util: don't link makestrs with target cflags
-
-The line:
-
-AM_CFLAGS = $(XT_CFLAGS)
-
-in util/Makefile.am is wrong because it adds target cflags to the
-compilation of makestrs, which is built for the build machine, which
-leads to build failures when cross-compiling.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- util/Makefile.am |    1 -
- util/makestrs.c  |    1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/util/Makefile.am b/util/Makefile.am
-index dedfa6b..cc6f3fc 100644
---- a/util/Makefile.am
-+++ b/util/Makefile.am
-@@ -10,7 +10,6 @@ EXTRA_DIST = \
-        StrDefs.ht \
-        string.list
- 
--AM_CFLAGS = $(XT_CFLAGS)
- makestrs_SOURCES = makestrs.c
- 
- 
--- 
-1.7.9.5
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
index 60821a8b6a..7f457fb9bc 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.hash
+++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
@@ -1,4 +1,8 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002594.html
-sha256	46eeb6be780211fdd98c5109286618f6707712235fdd19df4ce1e6954f349f1a	libXt-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg/2019-June/059825.html
+md5 a9019421d3ee8b4937b6afd9025f018a  libXt-1.2.0.tar.bz2
+sha1 f6b5ed799bc2e8d721e5407a09c2a8f570963f1b  libXt-1.2.0.tar.bz2
+sha256 b31df531dabed9f4611fc8980bc51d7782967e2aff44c4105251a1acb5a77831  libXt-1.2.0.tar.bz2
+sha512 06248508b6fe5dfba8ceb4518475f656162351d78136eeb5d65086d680dabe9aca7bba3c94347f9c13ef03f82dab3ac19d0952ee610bc8c51c14cee7cf65f0b1  libXt-1.2.0.tar.bz2
+
 # Locally calculated
-sha256 4c8ef0aadc0c1697818b3d07bc5e3d5c909f7e15944e36dea9c6b30853ada9f4 COPYING
+sha256 a2866ccc0b1745149e4a2258d934314d40cbb43bd8318c6fa597f233995b0a81 COPYING
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 946fd517a7..01251c091b 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.1.5
+XLIB_LIBXT_VERSION = 1.2.0
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_LICENSE = MIT
 XLIB_LIBXT_LICENSE_FILES = COPYING
 XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xorgproto xcb-proto libxcb host-xorgproto
-XLIB_LIBXT_CONF_OPTS = --disable-malloc0returnsnull --disable-install-makestrs
-XLIB_LIBXT_AUTORECONF = YES
+XLIB_LIBXT_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
-- 
2.20.1
