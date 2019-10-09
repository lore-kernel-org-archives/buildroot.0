From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 Oct 2019 19:03:24 +0200
Subject: [Buildroot] [PATCH 2/3] package/proj: add -lsdtc++ to Libs.Private
In-Reply-To: <20191009170325.24709-1-fontaine.fabrice@gmail.com>
References: <20191009170325.24709-1-fontaine.fabrice@gmail.com>
Message-ID: <20191009170325.24709-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-proj.pc.in-add-Libs.Private.patch    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/proj/0001-proj.pc.in-add-Libs.Private.patch

diff --git a/package/proj/0001-proj.pc.in-add-Libs.Private.patch b/package/proj/0001-proj.pc.in-add-Libs.Private.patch
new file mode 100644
index 0000000000..5032ede647
--- /dev/null
+++ b/package/proj/0001-proj.pc.in-add-Libs.Private.patch
@@ -0,0 +1,27 @@
+From bdee73f3e0d8b4b6f2b6e0edb945dbd9abfd3255 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 9 Oct 2019 15:24:08 +0200
+Subject: [PATCH] proj.pc.in: add Libs.Private
+
+Add -lstdc++ to Libs.Private to allow packages such as libgeotiff to
+retrieve this dependency when linking statically with proj
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OSGeo/PROJ/pull/1664]
+---
+ proj.pc.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/proj.pc.in b/proj.pc.in
+index a6a5d75f..001f08a1 100644
+--- a/proj.pc.in
++++ b/proj.pc.in
+@@ -9,4 +9,5 @@ Description: Cartographic Projections Library.
+ Requires:
+ Version: @VERSION@
+ Libs: -L${libdir} -lproj
++Libs.Private: -lstdc++
+ Cflags: -I${includedir}
+-- 
+2.23.0
+
-- 
2.23.0
