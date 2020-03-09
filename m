From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Mar 2020 19:44:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.0.1
Message-ID: <20200309184420.3846-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...util-remove-the-dependency-on-kcmp.h.patch | 42 -------------------
 package/mesa3d/mesa3d.hash                    |  4 +-
 package/mesa3d/mesa3d.mk                      |  2 +-
 4 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index f4927a28c6..d8205d68af 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.0.0
+MESA3D_HEADERS_VERSION = 20.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch b/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
deleted file mode 100644
index 27ae021e08..0000000000
--- a/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 63ad4535df6a0a938e7391d73adcada05e730c89 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
-Date: Tue, 18 Feb 2020 16:12:23 -0500
-Subject: [PATCH] util: remove the dependency on kcmp.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes: f76cbc7901f7 "util: Add os_same_file_description helper"
-
-Acked-by: Eric Engestrom <eric@engestrom.ch>
-Reviewed-by: Michel D?nzer <mdaenzer@redhat.com>
-Tested-by: Marge Bot <https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3860>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3860>
-
-[ Upstream: https://cgit.freedesktop.org/mesa/mesa/commit/?id=f7bfb10c69dfe48a91e35523cb5ee641bdbf6988 ]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/util/os_file.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/util/os_file.c b/src/util/os_file.c
-index b502ff4..128fe87 100644
---- a/src/util/os_file.c
-+++ b/src/util/os_file.c
-@@ -34,11 +34,12 @@ os_file_create_unique(const char *filename, int filemode)
- #if defined(__linux__)
- 
- #include <fcntl.h>
--#include <linux/kcmp.h>
- #include <sys/stat.h>
- #include <sys/syscall.h>
- #include <unistd.h>
- 
-+/* copied from <linux/kcmp.h> */
-+#define KCMP_FILE 0
- 
- static ssize_t
- readN(int fd, char *buf, size_t len)
--- 
-2.25.1
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e2ec6e625d..be48ef4a89 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-February/000572.html
-sha256 bb6db3e54b608d2536d4000b3de7dd3ae115fc114e8acbb5afff4b3bbed04b34  mesa-20.0.0.tar.xz
+# From https://www.mesa3d.org/relnotes/20.0.1.html
+sha256 6153ba3f8cb0524bbfc08e4db76b408126b2d1be8f789dffe28d1a0461eedde4  mesa-20.0.1.tar.xz
 sha512 3968820029434682fb6644947c76e12b6bb991a3d05cb519a6ea971ecc4aa9b21d03f84b9a452cc21cc77a7981db9e40dd2dfd3ea3dee85b3dd88a59b4842bbb  mesa-20.0.0.tar.xz
 
 # License
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9c9f38d17e..8ca419a4cb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.0.0
+MESA3D_VERSION = 20.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.25.0
