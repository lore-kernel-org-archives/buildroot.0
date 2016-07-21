From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 Jul 2016 21:07:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/libdrm: bump version to 2.4.69
Message-ID: <1469128040-4558-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002, applied upstream:
https://cgit.freedesktop.org/mesa/drm/commit/xf86drm.c?id=4031dc17bb728850c9b079c8d5f9cc0a379b9d46

Renumbered patch 0003.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...mic-require-CAS-support-in-libatomic_ops.patch} |  0
 ...nclude-limits.h-to-fix-build-error-on-Sol.patch | 31 ----------------------
 package/libdrm/libdrm.hash                         |  4 +--
 package/libdrm/libdrm.mk                           |  2 +-
 4 files changed, 3 insertions(+), 34 deletions(-)
 rename package/libdrm/{0003-xf86atomic-require-CAS-support-in-libatomic_ops.patch => 0002-xf86atomic-require-CAS-support-in-libatomic_ops.patch} (100%)
 delete mode 100644 package/libdrm/0002-xf86drm.c-Include-limits.h-to-fix-build-error-on-Sol.patch

diff --git a/package/libdrm/0003-xf86atomic-require-CAS-support-in-libatomic_ops.patch b/package/libdrm/0002-xf86atomic-require-CAS-support-in-libatomic_ops.patch
similarity index 100%
rename from package/libdrm/0003-xf86atomic-require-CAS-support-in-libatomic_ops.patch
rename to package/libdrm/0002-xf86atomic-require-CAS-support-in-libatomic_ops.patch
diff --git a/package/libdrm/0002-xf86drm.c-Include-limits.h-to-fix-build-error-on-Sol.patch b/package/libdrm/0002-xf86drm.c-Include-limits.h-to-fix-build-error-on-Sol.patch
deleted file mode 100644
index 03b4524..0000000
--- a/package/libdrm/0002-xf86drm.c-Include-limits.h-to-fix-build-error-on-Sol.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3fed80daf1dcb0b5d20e623d27228726c735e138 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 27 Sep 2015 19:09:47 +0200
-Subject: [PATCH 1/1] xf86drm.c: Include limits.h to fix build error on Solaris
- and with musl
-
-musl's strict implementation requires #include <limits.h> for PATH_MAX.
-
-Patch suggested by evgeny for Solaris:
-https://bugs.freedesktop.org/show_bug.cgi?id=92082
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xf86drm.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/xf86drm.c b/xf86drm.c
-index a9f5c29..ec985eb 100644
---- a/xf86drm.c
-+++ b/xf86drm.c
-@@ -53,6 +53,7 @@
- #include <sys/ioctl.h>
- #include <sys/time.h>
- #include <stdarg.h>
-+#include <limits.h>
- #ifdef HAVE_SYS_MKDEV_H
- # include <sys/mkdev.h> /* defines major(), minor(), and makedev() on Solaris */
- #endif
--- 
-2.5.3
-
diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 8bd3d95..3cfa34e 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2016-April/106211.html
-sha256	5b4bd9a5922929bc716411cb74061fbf31b06ba36feb89bc1358a91a8d0ca9df	libdrm-2.4.68.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-July/002700.html
+sha256	09510cbc75adba7e84fd3ec86586fd352a787fd534a63377de9e19ff85280b33	libdrm-2.4.69.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index e6c7ecd..e62f813 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.68
+LIBDRM_VERSION = 2.4.69
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.8.1
