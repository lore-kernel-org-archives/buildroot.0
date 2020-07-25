From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Jul 2020 18:45:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltris: fix build with gcc 4.8
Message-ID: <20200725164559.398518-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/991d601b30831df61c78dc7109a2f4ab9ace3f84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../ltris/0001-fix-build-with-gcc-4.8.patch   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/ltris/0001-fix-build-with-gcc-4.8.patch

diff --git a/package/ltris/0001-fix-build-with-gcc-4.8.patch b/package/ltris/0001-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..d6bbf6a946
--- /dev/null
+++ b/package/ltris/0001-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,20 @@
+Fix build with gcc 4.8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://sourceforge.net/p/lgames/patches/28]
+Index: ltris/src/bowl.c
+===================================================================
+--- ltris/src/bowl.c	(r?vision 421)
++++ ltris/src/bowl.c	(copie de travail)
+@@ -828,9 +828,10 @@
+ */
+ void bowl_init_block_masks() 
+ {
++	int i;
+ 	int masksize = sizeof(block_masks[0].mask); // same for all
+ 
+-	for (int i = 0; i < 7; i++) {
++	for (i = 0; i < 7; i++) {
+ 		block_masks[i].rx = 2;
+ 		block_masks[i].ry = 2;
+ 		memset(block_masks[i].mask, 0, masksize );
-- 
2.27.0
