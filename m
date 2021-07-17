From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 17 Jul 2021 15:21:44 +0200
Subject: [Buildroot] [PATCH] package/lua-lunix: fix build with musl
Message-ID: <20210717132144.1503495-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

see http://autobuild.buildroot.net/results/7d192a0a1d58d258b77906cf936949b2f47373cd/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../0002-remove-link-with-librt.patch         | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/lua-lunix/0002-remove-link-with-librt.patch

diff --git a/package/lua-lunix/0002-remove-link-with-librt.patch b/package/lua-lunix/0002-remove-link-with-librt.patch
new file mode 100644
index 000000000..7b1c8ddd5
--- /dev/null
+++ b/package/lua-lunix/0002-remove-link-with-librt.patch
@@ -0,0 +1,36 @@
+From aeaff83b9ae42547b8728edac000f3d41d5e44aa Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sat, 17 Jul 2021 13:21:38 +0200
+Subject: [PATCH] remove link with librt
+
+librt is not available with musl
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ lunix-rel-20170920/lunix-20170920-1.rockspec | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/lunix-rel-20170920/lunix-20170920-1.rockspec b/lunix-rel-20170920/lunix-20170920-1.rockspec
+index 741179d..76cafeb 100644
+--- a/lunix-rel-20170920/lunix-20170920-1.rockspec
++++ b/lunix-rel-20170920/lunix-20170920-1.rockspec
+@@ -26,16 +26,6 @@ build = {
+ 		};
+ 	};
+ 	platforms = {
+-		linux = {
+-			modules = {
+-				["unix"] = {
+-					libraries = {
+-						-- glibc <= 2.17 needs to link with librt
+-						"rt";
+-					};
+-				};
+-			};
+-		};
+ 		osx = {
+ 			modules = {
+ 				["unix"] = {
+-- 
+2.30.2
+
-- 
2.30.2
