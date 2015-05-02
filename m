From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 10:17:38 +0200
Subject: [Buildroot] [PATCH 04/10] package/x11r7/xlib_libXt: bump version to
	1.1.5
In-Reply-To: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430554664-19320-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1430554664-19320-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove part of 0001-util-don-t-link-makestrs-with-target-cflags.patch
because it was applied upstream:
http://cgit.freedesktop.org/xorg/lib/libXt/commit/util/makestrs.c?id=f9baaf55ff8cbd4bf018a34f181eda30d03b20dc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-util-don-t-link-makestrs-with-target-cflags.patch |   17 -----------------
 package/x11r7/xlib_libXt/xlib_libXt.hash              |    4 ++--
 package/x11r7/xlib_libXt/xlib_libXt.mk                |    2 +-
 3 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch b/package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch
index 692d03b..ccc684f 100644
--- a/package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch
+++ b/package/x11r7/xlib_libXt/0001-util-don-t-link-makestrs-with-target-cflags.patch
@@ -11,11 +11,6 @@ in util/Makefile.am is wrong because it adds target cflags to the
 compilation of makestrs, which is built for the build machine, which
 leads to build failures when cross-compiling.
 
-We also remove the inclusion of <X11/Xos.h> from makestrs.c, because
-it was the only non-standard header being included (and therefore
-possibly requiring special cflags), but it was in reality not useful
-at all to build makestrs.c.
-
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  util/Makefile.am |    1 -
@@ -34,17 +29,5 @@ index dedfa6b..cc6f3fc 100644
  makestrs_SOURCES = makestrs.c
  
  
-diff --git a/util/makestrs.c b/util/makestrs.c
-index a52866a..00c861f 100644
---- a/util/makestrs.c
-+++ b/util/makestrs.c
-@@ -27,7 +27,6 @@ in this Software without prior written authorization from The Open Group.
- /* Constructs string definitions */
- 
- #include <stdio.h>
--#include <X11/Xos.h>
- #include <stdlib.h>
- #include <unistd.h>
- 
 -- 
 1.7.9.5
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.hash b/package/x11r7/xlib_libXt/xlib_libXt.hash
index 651cf4b..751c370 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.hash
+++ b/package/x11r7/xlib_libXt/xlib_libXt.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002234.html
-sha256	843a97a988f5654872682a4120486d987d853a71651515472f55519ffae2dd57	libXt-1.1.4.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-April/002594.html
+sha256	46eeb6be780211fdd98c5109286618f6707712235fdd19df4ce1e6954f349f1a	libXt-1.1.5.tar.bz2
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 45f1885..4715ac6 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXT_VERSION = 1.1.4
+XLIB_LIBXT_VERSION = 1.1.5
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_LICENSE = MIT
-- 
1.7.10.4
