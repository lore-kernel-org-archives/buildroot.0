From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:37:52 +0100
Subject: [Buildroot] [git commit] package/read-edid: Fix compiler check,
	c++ is not needed
Message-ID: <20151213213755.C493B81861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=637ca57aefdb93aef6e74eb08cf032ed0570a607
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/8c1/8c11e463b68121fe0331acf9f8a42a1d3fef40c7//
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/read-edid/0002-Fix-compiler-check.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/read-edid/0002-Fix-compiler-check.patch b/package/read-edid/0002-Fix-compiler-check.patch
new file mode 100644
index 0000000..6c5f58c
--- /dev/null
+++ b/package/read-edid/0002-Fix-compiler-check.patch
@@ -0,0 +1,19 @@
+Fix compiler check
+
+By default CMake looks for c++ which the project does not need.
+
+Patch by Thomas:
+http://lists.busybox.net/pipermail/buildroot/2015-December/146865.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr read-edid-3.0.2.org/CMakeLists.txt read-edid-3.0.2/CMakeLists.txt
+--- read-edid-3.0.2.org/CMakeLists.txt	2014-02-05 17:27:26.000000000 +0100
++++ read-edid-3.0.2/CMakeLists.txt	2015-12-13 16:08:43.000000000 +0100
+@@ -1,5 +1,5 @@
+ cmake_minimum_required (VERSION 2.6)
+-project (read-edid)
++project (read-edid C)
+ 
+ option(I2CBUILD "Build I2C get-edid implementation" ON)
+ option(CLASSICBUILD "Build VBE get-edid implementation" ON)
