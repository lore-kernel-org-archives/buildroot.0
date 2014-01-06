From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 6 Jan 2014 21:40:10 +0100
Subject: [Buildroot] [PATCH 7/8] xorg: Bump xlib_libXxf86dga to version 1.1.4
In-Reply-To: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
References: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP43A3DF1FDB05237A76C20FD9B70@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove patches applied upstream

thanks to Jerzy Grzegorek for the hint

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../xlib_libXxf86dga-0001-fix-compilation.patch    |   27 -------------------
 .../xlib_libXxf86dga-0002-fix-compilation.patch    |   28 --------------------
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 3 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0001-fix-compilation.patch
 delete mode 100644 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0002-fix-compilation.patch

diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0001-fix-compilation.patch b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0001-fix-compilation.patch
deleted file mode 100644
index 23ab117..0000000
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0001-fix-compilation.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Backported from d4f89f7f42484963575b4c7d2fa694051e111e76 
-
-Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
----
-From d4f89f7f42484963575b4c7d2fa694051e111e76 Mon Sep 17 00:00:00 2001
-From: Jeremy Huddleston <jeremyhu@apple.com>
-Date: Fri, 09 Mar 2012 10:48:14 +0000
-Subject: Include <stdint.h> for uintptr_t
-
-Found-by: Tinderbox
-
-Signed-off-by: Jeremy Huddleston <jeremyhu@apple.com>
----
-diff --git a/src/XF86DGA2.c b/src/XF86DGA2.c
-index 32f455b..964de18 100644
---- a/src/XF86DGA2.c
-+++ b/src/XF86DGA2.c
-@@ -21,6 +21,7 @@ Copyright (c) 1995,1996  The XFree86 Project, Inc
- #include <X11/extensions/extutil.h>
- #include <stdio.h>
- 
-+#include <stdint.h>
- 
- /* If you change this, change the Bases[] array below as well */
- #define MAX_HEADS 16
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0002-fix-compilation.patch b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0002-fix-compilation.patch
deleted file mode 100644
index f586e2e..0000000
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga-0002-fix-compilation.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Backported from 56b5a5887349e9d0e1d28da157fe6441ca691f56
-
-Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
----
-From 56b5a5887349e9d0e1d28da157fe6441ca691f56 Mon Sep 17 00:00:00 2001
-From: Jeremy Huddleston <jeremyhu@apple.com>
-Date: Thu, 08 Mar 2012 19:49:36 +0000
-Subject: Build fix when sizeof(off_t) > sizeof(void *)
-
-https://trac.macports.org/ticket/33532
-
-Signed-off-by: Jeremy Huddleston <jeremyhu@apple.com>
----
-diff --git a/src/XF86DGA2.c b/src/XF86DGA2.c
-index e81b486..32f455b 100644
---- a/src/XF86DGA2.c
-+++ b/src/XF86DGA2.c
-@@ -928,7 +928,7 @@ DGAMapPhysical(
-     if ((pMap->fd = open(name, O_RDWR)) < 0)
- 	return False;
-     pMap->virtual = mmap(NULL, size, PROT_READ | PROT_WRITE,
--			MAP_FILE | MAP_SHARED, pMap->fd, (off_t)base);
-+			MAP_FILE | MAP_SHARED, pMap->fd, (off_t)(uintptr_t)base);
-     if (pMap->virtual == (void *)-1)
- 	return False;
-     mprotect(pMap->virtual, size, PROT_READ | PROT_WRITE);
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 95e2d17..6539659 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86DGA_VERSION = 1.1.3
+XLIB_LIBXXF86DGA_VERSION = 1.1.4
 XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_LICENSE = MIT
-- 
1.7.9.5
