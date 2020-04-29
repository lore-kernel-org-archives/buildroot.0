From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue, 28 Apr 2020 22:07:45 -0500
Subject: [Buildroot] [PATCH] package/gauche: bump to version 0.9.9
Message-ID: <20200429030745.16892-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update hash file to two space format
* COPYING hash updated due to copyright year

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/gauche/0001-fix-so-suffix.patch | 32 -------------------------
 package/gauche/gauche.hash              |  8 +++----
 package/gauche/gauche.mk                |  2 +-
 3 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 package/gauche/0001-fix-so-suffix.patch

diff --git a/package/gauche/0001-fix-so-suffix.patch b/package/gauche/0001-fix-so-suffix.patch
deleted file mode 100644
index 8a0937681c..0000000000
--- a/package/gauche/0001-fix-so-suffix.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cefd57f76f7faec4143bf1e42ed148cad973c1f4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 12 Aug 2019 23:17:21 +0200
-Subject: [PATCH] configure.ac: fix so suffix
-
-With uclibc or musl configuration, $host does not match to '*-linux-gnu*'.
-
-Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
-[Retrieved (and slightly updated) from:
-https://git.buildroot.net/buildroot/tree/package/gauche/0001-fix-so-suffix.patch]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/shirok/Gauche/pull/508]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 15092a2d6..b82b762a9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -641,7 +641,7 @@ AS_CASE([$host],
-     SHLIB_MAIN_LDFLAGS=""
-     SHLIB_OK=ok
-     ],
--  [*-linux-gnu*|*-*-gnu*|*freebsd*|*dragonfly*], [
-+  [*-linux-*|*-*-gnu*|*freebsd*|*dragonfly*], [
-     SHLIB_SO_CFLAGS="-fPIC"
-     SHLIB_SO_LDFLAGS="$rpath -shared -o"
-     SHLIB_SO_SUFFIX="so"
--- 
-2.20.1
-
diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
index 600c46fbdc..dea23c1e33 100644
--- a/package/gauche/gauche.hash
+++ b/package/gauche/gauche.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/gauche/files/Gauche/
-sha1 ff7878ab19c56b49b4b6d77009300a3592cc903c  Gauche-0.9.8.tgz
-md5 efd1b12cd5708d9e1e4358ab2d2e1e32  Gauche-0.9.8.tgz
+sha1  ad5e15021764b733ec913cca8b77c9a53d4ee997  Gauche-0.9.9.tgz
+md5  20d8ed835ae0bc97cceed78a71f9857b  Gauche-0.9.9.tgz
 # Locally calculated
-sha256 3eb30d1051d8b48999fe46511c9f6983057735312c9832b7db13f9db140db74b  Gauche-0.9.8.tgz
-sha256 d537f80c0bb3cc203bc2675b766b9de9573243026fa3e8ad78368abd4b14aac8  COPYING
+sha256  4ca9325322a7efadb9680d156eb7b53521321c9ca4955c4cbe738bc2e1d7f7fb  Gauche-0.9.9.tgz
+sha256  13cb582677dbcdc5b34313c59b4a014e74ef2f5fd80e514a0bd98fd8a4e45bed  COPYING
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 2a30a2b39a..2520379369 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAUCHE_VERSION = 0.9.8
+GAUCHE_VERSION = 0.9.9
 GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
 GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
 GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
-- 
2.17.1
