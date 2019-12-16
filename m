From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 21:21:01 +0100
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 2.6.4
Message-ID: <20191216201916.39A4F8B67B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf845faac09fed645b493585d2c20152fca40f11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas:
 - drop patch 0001-pool-Fix-alignment-assertion.patch, which is in
   upstream commit aade9b70aabd8a97dd8a28cda2cf4d0694dd7350, available
   since version 2.6.0
 - further bump to 2.6.4]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-pool-Fix-alignment-assertion.patch        | 30 ----------------------
 package/harfbuzz/harfbuzz.hash                     |  4 +--
 package/harfbuzz/harfbuzz.mk                       |  2 +-
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/harfbuzz/0001-pool-Fix-alignment-assertion.patch b/package/harfbuzz/0001-pool-Fix-alignment-assertion.patch
deleted file mode 100644
index 4dd3e14a46..0000000000
--- a/package/harfbuzz/0001-pool-Fix-alignment-assertion.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From aade9b70aabd8a97dd8a28cda2cf4d0694dd7350 Mon Sep 17 00:00:00 2001
-From: Behdad Esfahbod <behdad@behdad.org>
-Date: Tue, 13 Aug 2019 16:09:20 -0700
-Subject: [PATCH] [pool] Fix alignment assertion
-
-I *think* it should fix https://github.com/harfbuzz/harfbuzz/issues/1901
-
-Ie. if on a system, alignof(void*) < sizeof(void*)...
-
-Downloaded from upstream commit
-https://github.com/harfbuzz/harfbuzz/commit/aade9b70aabd8a97dd8a28cda2cf4d0694dd7350
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/hb-pool.hh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/hb-pool.hh b/src/hb-pool.hh
-index ff0ee194c..2dd84968e 100644
---- a/src/hb-pool.hh
-+++ b/src/hb-pool.hh
-@@ -77,7 +77,7 @@ struct hb_pool_t
- 
-   static_assert (ChunkLen > 1, "");
-   static_assert (sizeof (T) >= sizeof (void *), "");
--  static_assert (alignof (T) % sizeof (void *) == 0, "");
-+  static_assert (alignof (T) % alignof (void *) == 0, "");
- 
-   struct chunk_t
-   {
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 8aa4265e8a..ba54f477aa 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,5 +1,5 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.5.3.tar.xz.sha256
-sha256 fed00dc797b7ba3ca943225f0a854baaed4c1640fff8a31d455cd3b5caec855c  harfbuzz-2.5.3.tar.xz
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.6.4.tar.xz.sha256
+sha256 9413b8d96132d699687ef914ebb8c50440efc87b3f775d25856d7ec347c03c12  harfbuzz-2.6.4.tar.xz
 
 # Locally computed
 sha256 1b32b6e2fea50440c128c5ba482f7691367c46fd0cd573b80fc863bf07964cea  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 3f12a4563d..3006b5ab98 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 2.5.3
+HARFBUZZ_VERSION = 2.6.4
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
