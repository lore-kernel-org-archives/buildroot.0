From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:16:14 +0100
Subject: [Buildroot] [git commit] jasper: disable C++ compiler check
Message-ID: <20170116124620.BFE227FB2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0852552c69c6fa320f38d9c3c77a6f7f6c099c6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to disable the default cmake C++ compiler check.

Fixes:
http://autobuild.buildroot.net/results/970/97001530e59062c36f27721877cb8b5c3ba8906a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/0001-Disable-C-compiler-check.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/jasper/0001-Disable-C-compiler-check.patch b/package/jasper/0001-Disable-C-compiler-check.patch
new file mode 100644
index 0000000..c1f7271
--- /dev/null
+++ b/package/jasper/0001-Disable-C-compiler-check.patch
@@ -0,0 +1,28 @@
+From e4ed3e2c3fd5a859567f510deeb49a915d96700f Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sat, 14 Jan 2017 21:06:25 +0200
+Subject: [PATCH] Disable C++ compiler check
+
+jasper does not use C++ code. Allow use of toolchains without C++ support.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/mdadams/jasper/pull/110
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6c99b3e7df31..3ac166b060ad 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ cmake_minimum_required (VERSION 2.8.11)
+ 
+-project(JasPer)
++project(JasPer C)
+ 
+ set(CMAKE_MODULE_PATH
+   ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/build/cmake/modules/")
+-- 
+2.11.0
+
