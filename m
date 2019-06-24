From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 24 Jun 2019 12:46:34 -0600
Subject: [Buildroot] [PATCH 1/1] package/weston: bump to version 6.0.1
Message-ID: <20190624184634.16590-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch which has now been committed upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-Fix-build-with-kernel-4.4.patch      | 40 -------------------
 package/weston/weston.hash                    | 10 ++---
 package/weston/weston.mk                      |  2 +-
 3 files changed, 6 insertions(+), 46 deletions(-)
 delete mode 100644 package/weston/0001-Fix-build-with-kernel-4.4.patch

diff --git a/package/weston/0001-Fix-build-with-kernel-4.4.patch b/package/weston/0001-Fix-build-with-kernel-4.4.patch
deleted file mode 100644
index 89390e0e28..0000000000
--- a/package/weston/0001-Fix-build-with-kernel-4.4.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 137b811ecd566086f7eb42c1e49e7c0cf27fb85e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 10 Jun 2019 12:02:03 +0200
-Subject: [PATCH] Fix build with kernel < 4.4
-
-weston includes input-event-codes.h since version 5.0.91 and
-https://github.com/wayland-project/weston/commit/6e229ca26381bc8191fd9af1e439c311da709aff
-
-input-event-codes.h is available only since kernel 4.4 and
-https://github.com/torvalds/linux/commit/f902dd893427eade90f7eaf858e5ff8b150a5a12
-
-To fix this build failure, replace include on linux/input-event-codes.h
-by linux/input.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/210c2759900f15ea0030d088f6f45cd8bb199b29
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/wayland/weston/merge_requests/184]
----
- compositor/main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/compositor/main.c b/compositor/main.c
-index 945f99ae..bf4062af 100644
---- a/compositor/main.c
-+++ b/compositor/main.c
-@@ -42,7 +42,7 @@
- #include <sys/socket.h>
- #include <libinput.h>
- #include <libevdev/libevdev.h>
--#include <linux/input-event-codes.h>
-+#include <linux/input.h>
- #include <sys/time.h>
- #include <linux/limits.h>
- 
--- 
-2.20.1
-
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index d761600961..a2dddf7a5b 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-March/040356.html
-md5 7c634e262f8a464a076c97fd50ad36b3  weston-6.0.0.tar.xz
-sha1 feac9d9a77037580f39c0085a08a3c17a62dced0  weston-6.0.0.tar.xz
-sha256 546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612  weston-6.0.0.tar.xz
-sha512 127ab64b689f202acca4d9461e4decfd42357e4bbb63493af257b3b20b693a8ab4207b3c6b97663cefeed200505aad5f32b6a064db2e53fa1e201877613b394f  weston-6.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-June/040661.html
+md5 e7b10710ef1eac82258f97bfd41fe534  weston-6.0.1.tar.xz
+sha1 3b39e454b3dc8dc32598790cfcc65728b448378b  weston-6.0.1.tar.xz
+sha256 bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a513155b4  weston-6.0.1.tar.xz
+sha512 3da04ff9b884480ce0824950347185e55584e3938021fe62014423d3d51577eafdda8de650a5de6eb37a842130c9cb14c7a952a560f6be93ff973164363af3d9  weston-6.0.1.tar.xz
 # locally computed
 sha256 0f0de7b7b1f65870139c95dde7abc19ed305631ae7c5d37c386db40cde108632  weston-rel_imx_4.9.51_8mq_ga.tar.gz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 152ffe1cf7..ee3d3be87e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,7 +10,7 @@ WESTON_SITE = https://source.codeaurora.org/external/imx/weston-imx
 WESTON_SITE_METHOD = git
 WESTON_AUTORECONF = YES
 else
-WESTON_VERSION = 6.0.0
+WESTON_VERSION = 6.0.1
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 endif
-- 
2.20.1
