From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Apr 2018 08:55:03 +0200
Subject: [Buildroot] [git commit] package/weston: Bump version to 4.0.0
Message-ID: <20180417065931.24AC388382@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8efd0756a724cea096f089aaf036ee82036321ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream.

Yann's patch was integrated in upstream, see:
https://cgit.freedesktop.org/wayland/weston/commit/?id=fa41bdfbc

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-shared-struct-timespec-is-in-time.h.patch | 44 ----------------------
 package/weston/weston.hash                         | 10 ++---
 package/weston/weston.mk                           |  2 +-
 3 files changed, 6 insertions(+), 50 deletions(-)

diff --git a/package/weston/0002-shared-struct-timespec-is-in-time.h.patch b/package/weston/0002-shared-struct-timespec-is-in-time.h.patch
deleted file mode 100644
index 28476d3225..0000000000
--- a/package/weston/0002-shared-struct-timespec-is-in-time.h.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 47535b50c4178d62b848b3e9d3524e4f6282c815 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 1 Oct 2017 14:17:21 +0200
-Subject: [PATCH] shared: struct timespec is in time.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On the musl C library, tests/timespec-text.c does not build, with the
-following error:
-
-    In file included from tests/timespec-test.c:36:0:
-    ./shared/timespec-util.h:41:21: warning: ???struct timespec??? declared
-    inside parameter list will not be visible outside of this definition
-    or declaration
-     timespec_sub(struct timespec *r,
-                         ^~~~~~~~
-   [...]
-
-Indeed, struct timespec is defined in time.h, so we must include it.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Upstream status: submitted
-    https://lists.freedesktop.org/archives/wayland-devel/2017-October/035306.html
----
- shared/timespec-util.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/shared/timespec-util.h b/shared/timespec-util.h
-index 576b3e8f..34a120ae 100644
---- a/shared/timespec-util.h
-+++ b/shared/timespec-util.h
-@@ -28,6 +28,7 @@
- 
- #include <stdint.h>
- #include <assert.h>
-+#include <time.h>
- 
- #define NSEC_PER_SEC 1000000000
- 
--- 
-2.11.0
-
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 82c97b8cc0..55d87ac3b1 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-August/034749.html
-md5 9c42a4c51a1b9f35d040fa9d45ada36d  weston-3.0.0.tar.xz
-sha1 0a75c2ee10f2453a073411157bb6ed029080669f  weston-3.0.0.tar.xz
-sha256 cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262bd9c35e93723a5  weston-3.0.0.tar.xz
-sha512 b824c39f2a884f6d50d607613f447090621f684c96f7d905f25f6e500dabd03ecb2b1cd1030babc193c3417223cb220103abb792437e1a5ead7229a76b5c7a58  weston-3.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2018-April/037768.html
+md5 33709aa4d5916f89643fca0fc0064b39  weston-4.0.0.tar.xz
+sha1 df1da4a880920c515162e95b18f3709a46690be7  weston-4.0.0.tar.xz
+sha256 a0fc0ae7ef83dfbed12abfe9b8096a24a7dd00705e86fa0db1e619ded18b4b58  weston-4.0.0.tar.xz
+sha512 0af41016ff4eae85779f95b5c5e44b9683f4ef681a8e52256efeebfa38073082b83e039d0db3c94ac22f22f8d8314c9d6cd16611144b260b353fc5bfdd1ded19  weston-4.0.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 3d17a61577..e9de56b2c6 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 3.0.0
+WESTON_VERSION = 4.0.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
