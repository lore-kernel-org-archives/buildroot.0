From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:04:12 +0100
Subject: [Buildroot] [PATCH 31/31] package/libvdpau: bump version to 1.2
Message-ID: <20190315180412.20496-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Removed patch 0001, applied upstream
https://gitlab.freedesktop.org/vdpau/libvdpau/commit/1cda354bdfd0c9ca107293b84b52f4464fdbedcc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-missing-configh-include.patch        | 29 -------------------
 package/libvdpau/libvdpau.hash                |  9 +++---
 package/libvdpau/libvdpau.mk                  |  2 +-
 3 files changed, 6 insertions(+), 34 deletions(-)
 delete mode 100644 package/libvdpau/0001-missing-configh-include.patch

diff --git a/package/libvdpau/0001-missing-configh-include.patch b/package/libvdpau/0001-missing-configh-include.patch
deleted file mode 100644
index f96c6fa7bc..0000000000
--- a/package/libvdpau/0001-missing-configh-include.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From: Rico Tzschichholz <ricotz@ubuntu.com>
-Date: Tue, 1 Sep 2015 10:45:11 +0200
-Subject: mesa_dri2: Add missing include of config.h to define _GNU_SOURCE
-
-Fix build with -Wimplicit-function-declaration while secure_getenv() is
-guarded by __USE_GNU.
-
-Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
-Tested-by: Stefan Dirsch <sndirsch@suse.de>
-(cherry picked from commit 1cda354bdfd0c9ca107293b84b52f4464fdbedcc)
-Signed-off-by: Damien Lanson <damien@kal-host.com>
----
- src/mesa_dri2.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/mesa_dri2.c b/src/mesa_dri2.c
-index 51e8794..420ccee 100644
---- a/src/mesa_dri2.c
-+++ b/src/mesa_dri2.c
-@@ -33,6 +33,9 @@
-  *   and Jos? Hiram Soltren (jsoltren at nvidia.com)
-  */
- 
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
- 
- #define NEED_REPLIES
- #include <X11/Xlibint.h>
diff --git a/package/libvdpau/libvdpau.hash b/package/libvdpau/libvdpau.hash
index 55dc6a7e84..7cdc08553c 100644
--- a/package/libvdpau/libvdpau.hash
+++ b/package/libvdpau/libvdpau.hash
@@ -1,4 +1,5 @@
-# From https://lists.freedesktop.org/archives/xorg-announce/2015-August/002630.html
-md5	2fa0b05a4f4d06791eec83bc9c854d14	libvdpau-1.1.1.tar.bz2
-sha1	86516e2a962fd34f65d49115d6ddf15fd912f579	libvdpau-1.1.1.tar.bz2
-sha256	857a01932609225b9a3a5bf222b85e39b55c08787d0ad427dbd9ec033d58d736	libvdpau-1.1.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002958.html
+sha256 6a499b186f524e1c16b4f5b57a6a2de70dfceb25c4ee546515f26073cd33fa06  libvdpau-1.2.tar.bz2
+sha512 86aa3f2a39cb73a597bf417da2eeef73ff01160ed9f54dff3725785ff5a289f47040496de44e2f5292d59657d4746e369b3fa307c4f83a32f7cc28e4cd8bce6f  libvdpau-1.2.tar.bz2
+# Locally computed
+sha256 ce4af7294872ff07f6e82ae5f1f5eba926215b1e2fb6d55d64759de082458d61  COPYING
diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
index 93446dbf28..8a0e34cfff 100644
--- a/package/libvdpau/libvdpau.mk
+++ b/package/libvdpau/libvdpau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVDPAU_VERSION = 1.1.1
+LIBVDPAU_VERSION = 1.2
 LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
 LIBVDPAU_SITE = http://people.freedesktop.org/~aplattner/vdpau
 LIBVDPAU_LICENSE = MIT
-- 
2.20.1
