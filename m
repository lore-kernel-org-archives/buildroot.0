From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 23:04:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/proj: bump to version 6.3.0
Message-ID: <20200111220435.1892112-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-proj.pc.in-add-Libs.Private.patch    | 27 ----------------
 ....in-add-SQLITE3_LIBS-to-Libs.Private.patch | 32 -------------------
 package/proj/proj.hash                        |  6 ++--
 package/proj/proj.mk                          |  2 +-
 4 files changed, 4 insertions(+), 63 deletions(-)
 delete mode 100644 package/proj/0001-proj.pc.in-add-Libs.Private.patch
 delete mode 100644 package/proj/0002-proj.pc.in-add-SQLITE3_LIBS-to-Libs.Private.patch

diff --git a/package/proj/0001-proj.pc.in-add-Libs.Private.patch b/package/proj/0001-proj.pc.in-add-Libs.Private.patch
deleted file mode 100644
index 5032ede647..0000000000
--- a/package/proj/0001-proj.pc.in-add-Libs.Private.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bdee73f3e0d8b4b6f2b6e0edb945dbd9abfd3255 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 9 Oct 2019 15:24:08 +0200
-Subject: [PATCH] proj.pc.in: add Libs.Private
-
-Add -lstdc++ to Libs.Private to allow packages such as libgeotiff to
-retrieve this dependency when linking statically with proj
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OSGeo/PROJ/pull/1664]
----
- proj.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/proj.pc.in b/proj.pc.in
-index a6a5d75f..001f08a1 100644
---- a/proj.pc.in
-+++ b/proj.pc.in
-@@ -9,4 +9,5 @@ Description: Cartographic Projections Library.
- Requires:
- Version: @VERSION@
- Libs: -L${libdir} -lproj
-+Libs.Private: -lstdc++
- Cflags: -I${includedir}
--- 
-2.23.0
-
diff --git a/package/proj/0002-proj.pc.in-add-SQLITE3_LIBS-to-Libs.Private.patch b/package/proj/0002-proj.pc.in-add-SQLITE3_LIBS-to-Libs.Private.patch
deleted file mode 100644
index 112559143e..0000000000
--- a/package/proj/0002-proj.pc.in-add-SQLITE3_LIBS-to-Libs.Private.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0181fd5fa0d75c5a6339dee9a8eaea95ff4bf0b0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Oct 2019 11:05:42 +0200
-Subject: [PATCH] proj.pc.in: add SQLITE3_LIBS to Libs.Private
-
-Add @SQLITE3_LIBS@ to Libs.Private so applications linking statically
-with proj (such as libgeotiff) will know that they have to link with
--lsqlite3
-
-Fixes:
- - http://autobuild.buildroot.org/results/737db533c16f285a02118ab048e8427d3e35803d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OSGeo/PROJ/pull/1686]
----
- proj.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/proj.pc.in b/proj.pc.in
-index 001f08a1..67a432f1 100644
---- a/proj.pc.in
-+++ b/proj.pc.in
-@@ -9,5 +9,5 @@ Description: Cartographic Projections Library.
- Requires:
- Version: @VERSION@
- Libs: -L${libdir} -lproj
--Libs.Private: -lstdc++
-+Libs.Private: @SQLITE3_LIBS@ -lstdc++
- Cflags: -I${includedir}
--- 
-2.23.0
-
diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index d06de110a4..ade9502b67 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-6.2.0.tar.gz.md5
-md5 5cde556545828beaffbe50b1bb038480 proj-6.2.0.tar.gz
+# Fetched from http://download.osgeo.org/proj/proj-6.3.0.tar.gz.md5
+md5 09243feb4f243a2bdd455035a2007384 proj-6.3.0.tar.gz
 # Locally calculated
-sha256 7f2e0fe63312f1e766057cceb53dc9585c4a335ff6641de45696dbd40d17c340 proj-6.2.1.tar.gz
+sha256 68ce9ba0005d442c2c1d238a3b9bc6654c358159b4af467b91e8d5b407c79c77 proj-6.3.0.tar.gz
 sha256 2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6 COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 3a8ac6c787..2be0004023 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 6.2.1
+PROJ_VERSION = 6.3.0
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
-- 
2.24.1
