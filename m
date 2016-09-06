From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:50:33 +0200
Subject: [Buildroot] [git commit] package/enlightenment: bump to v0.21.2
Message-ID: <20160906195112.3801282263@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbd0aee306bc0757ff54b7887406c86b8c0fd23c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...uid.h-only-when-Wayland-support-is-enable.patch | 39 ----------------------
 package/enlightenment/enlightenment.hash           |  4 +--
 package/enlightenment/enlightenment.mk             |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/enlightenment/0001-E-include-uuid.h-only-when-Wayland-support-is-enable.patch b/package/enlightenment/0001-E-include-uuid.h-only-when-Wayland-support-is-enable.patch
deleted file mode 100644
index 3f33fa3..0000000
--- a/package/enlightenment/0001-E-include-uuid.h-only-when-Wayland-support-is-enable.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 368c4c7cc5722b2edfe98fb3a8999f8f01bc9b56 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 5 Aug 2016 21:14:46 +0200
-Subject: [PATCH] E: include uuid.h only when Wayland support is enabled.
-
-libuuid is checked only when Wayland support is enabled and
-uuid_t uuid is guarded by HAVE_WAYLAND.
-
-So move include uuid.h below a HAVE_WAYLAND.
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/bin/e_pixmap.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/bin/e_pixmap.c b/src/bin/e_pixmap.c
-index 2bd94a7..0b01473 100644
---- a/src/bin/e_pixmap.c
-+++ b/src/bin/e_pixmap.c
-@@ -2,6 +2,7 @@
- 
- #ifdef HAVE_WAYLAND
- # include "e_comp_wl.h"
-+# include <uuid.h>
- # ifndef EGL_TEXTURE_FORMAT
- #  define EGL_TEXTURE_FORMAT		0x3080
- # endif
-@@ -13,8 +14,6 @@
- # include "e_comp_x.h"
- #endif
- 
--#include <uuid.h>
--
- static Eina_Hash *pixmaps[2] = {NULL};
- static Eina_Hash *aliases[2] = {NULL};
- 
--- 
-2.5.5
-
diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index ecfe537..8abbd96 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://www.enlightenment.org/news/e-0.20.10-release
-sha256	59fd447d120d91d18958a31a5827f97842cc472f2e22f132b2c7d4d208944baf 	enlightenment-0.20.10.tar.xz
+# From https://www.enlightenment.org/news/e-0.21.2-release
+sha256	a877645dc70aee71141013888863b69a1029f575f685e285b570db7c736f253a 	enlightenment-0.21.2.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 34c4f21..a86fb86 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.20.10
+ENLIGHTENMENT_VERSION = 0.21.2
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2c
