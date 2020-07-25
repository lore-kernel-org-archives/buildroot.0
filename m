From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 22:22:19 +0200
Subject: [Buildroot] [git commit] package/ltris: fix build with gcc 4.8
Message-ID: <20200725201755.992A186130@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b37c5258999ac95aac7a7433feb43ea01ec2555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/991d601b30831df61c78dc7109a2f4ab9ace3f84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ltris/0001-fix-build-with-gcc-4.8.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

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
+--- ltris/src/bowl.c	(r??vision 421)
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
