From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 12:42:54 +0200
Subject: [Buildroot] [git commit] package/ipmiutil: do not build doc
Message-ID: <20150406104305.62B17819AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca735d8a0b86b7ad274319774df2bca0abfe4ee9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/2ec/2ecfb1143ba89ffa5cdc8096bb175b2c396c4670/
    http://autobuild.buildroot.org/results/c49/c497fc446140694084922d51fe6be308ce5c1c1a/
    http://autobuild.buildroot.org/results/434/434b156b5c9b5c7b65ffe6174cf4e029e7e3ffd8/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipmiutil/0002-no-build-doc.patch |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/ipmiutil/0002-no-build-doc.patch b/package/ipmiutil/0002-no-build-doc.patch
new file mode 100644
index 0000000..f26d22e
--- /dev/null
+++ b/package/ipmiutil/0002-no-build-doc.patch
@@ -0,0 +1,30 @@
+configure: do not build doc
+
+Fixes:
+    http://autobuild.buildroot.org/results/2ec/2ecfb1143ba89ffa5cdc8096bb175b2c396c4670/
+    http://autobuild.buildroot.org/results/c49/c497fc446140694084922d51fe6be308ce5c1c1a/
+    http://autobuild.buildroot.org/results/434/434b156b5c9b5c7b65ffe6174cf4e029e7e3ffd8/
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN ipmiutil-2.9.5.orig/configure.ac ipmiutil-2.9.5/configure.ac
+--- ipmiutil-2.9.5.orig/configure.ac	2015-04-06 12:23:01.020731749 +0200
++++ ipmiutil-2.9.5/configure.ac	2015-04-06 12:24:31.181773510 +0200
+@@ -55,7 +55,7 @@
+ isredhat=0
+ init_scripts="scripts/ipmi_port.sh scripts/ipmiutil_evt scripts/ipmiutil_asy scripts/ipmiutil_wdt"
+ projdir=`pwd`
+-SUBDIR_S="doc scripts lib util"
++SUBDIR_S="scripts lib util"
+ os=Linux
+ 
+ # ltmain.sh, config.sub, et al should have been created, but check to be sure.
+@@ -161,7 +161,7 @@
+ 	LANPLUS_SAM="no"
+ 	LD_SAMX=""
+ 	CFLAGS="-O2"
+-        SUBDIR_S="doc scripts util"
++        SUBDIR_S="scripts util"
+ 	if test "x$cross_compiling" = "xyes"; then
+ 	   # cross-compiling, so link with -static (e.g. Android ARM)
+ 	   CROSS_LFLAGS="-static"
