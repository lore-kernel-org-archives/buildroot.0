From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Oct 2019 10:03:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: import lzma only when needed
Message-ID: <20191019080324.7303-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/49d/49d89e419edc34ec77129d748ac573f89dfddbae/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...dist.py-import-lzma-only-when-needed.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/meson/0002-mdist.py-import-lzma-only-when-needed.patch

diff --git a/package/meson/0002-mdist.py-import-lzma-only-when-needed.patch b/package/meson/0002-mdist.py-import-lzma-only-when-needed.patch
new file mode 100644
index 0000000000..56d1dde0a6
--- /dev/null
+++ b/package/meson/0002-mdist.py-import-lzma-only-when-needed.patch
@@ -0,0 +1,39 @@
+From a3443360c8c0014638366d5bb2f5aa7683d5aec2 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 19 Oct 2019 09:52:06 +0200
+Subject: [PATCH] mdist.py: import lzma only when needed
+
+Source of patch:
+http://lists.busybox.net/pipermail/buildroot/2019-October/262990.html
+http://code.bulix.org/gdxcu4-914360
+
+Fixes https://github.com/mesonbuild/meson/issues/6012
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ mesonbuild/mdist.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mesonbuild/mdist.py b/mesonbuild/mdist.py
+index 7b753826..28e2fced 100644
+--- a/mesonbuild/mdist.py
++++ b/mesonbuild/mdist.py
+@@ -13,7 +13,6 @@
+ # limitations under the License.
+ 
+ 
+-import lzma
+ import gzip
+ import os
+ import sys
+@@ -133,6 +132,7 @@ def create_dist_hg(dist_name, archives, src_root, bld_root, dist_sub, dist_scrip
+     if dist_scripts:
+         mlog.warning('dist scripts are not supported in Mercurial projects')
+     if 'xztar' in archives:
++        import lzma
+         with lzma.open(xzname, 'wb') as xf, open(tarname, 'rb') as tf:
+             shutil.copyfileobj(tf, xf)
+         output_names.append(xzname)
+-- 
+2.20.1
+
-- 
2.20.1
