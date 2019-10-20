From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Oct 2019 11:20:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/proj: add SQLITE3_LIBS to proj.pc.in
Message-ID: <20191020092038.2422-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix a static build failure with libgeotiff

Fixes:
 - http://autobuild.buildroot.org/results/737db533c16f285a02118ab048e8427d3e35803d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....in-add-SQLITE3_LIBS-to-Libs.Private.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/proj/0002-proj.pc.in-add-SQLITE3_LIBS-to-Libs.Private.patch

diff --git a/package/proj/0002-proj.pc.in-add-SQLITE3_LIBS-to-Libs.Private.patch b/package/proj/0002-proj.pc.in-add-SQLITE3_LIBS-to-Libs.Private.patch
new file mode 100644
index 0000000000..112559143e
--- /dev/null
+++ b/package/proj/0002-proj.pc.in-add-SQLITE3_LIBS-to-Libs.Private.patch
@@ -0,0 +1,32 @@
+From 0181fd5fa0d75c5a6339dee9a8eaea95ff4bf0b0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 20 Oct 2019 11:05:42 +0200
+Subject: [PATCH] proj.pc.in: add SQLITE3_LIBS to Libs.Private
+
+Add @SQLITE3_LIBS@ to Libs.Private so applications linking statically
+with proj (such as libgeotiff) will know that they have to link with
+-lsqlite3
+
+Fixes:
+ - http://autobuild.buildroot.org/results/737db533c16f285a02118ab048e8427d3e35803d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OSGeo/PROJ/pull/1686]
+---
+ proj.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/proj.pc.in b/proj.pc.in
+index 001f08a1..67a432f1 100644
+--- a/proj.pc.in
++++ b/proj.pc.in
+@@ -9,5 +9,5 @@ Description: Cartographic Projections Library.
+ Requires:
+ Version: @VERSION@
+ Libs: -L${libdir} -lproj
+-Libs.Private: -lstdc++
++Libs.Private: @SQLITE3_LIBS@ -lstdc++
+ Cflags: -I${includedir}
+-- 
+2.23.0
+
-- 
2.23.0
