From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Sep 2020 23:52:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiredis: fix build with gcc 4.8
Message-ID: <20200905215222.2066726-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is needed to fix a build failure with hiredis 1.0.0

Fixes:
 - http://autobuild.buildroot.org/results/f7aa90d6d6750fb8bf46334513df09360a8c1c7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-Explicitly-set-c99-in-CMake.patch    | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/hiredis/0003-Explicitly-set-c99-in-CMake.patch

diff --git a/package/hiredis/0003-Explicitly-set-c99-in-CMake.patch b/package/hiredis/0003-Explicitly-set-c99-in-CMake.patch
new file mode 100644
index 0000000000..7e6ef8bca4
--- /dev/null
+++ b/package/hiredis/0003-Explicitly-set-c99-in-CMake.patch
@@ -0,0 +1,28 @@
+From 13a35bdb64615e381c5e1151cdd4e78bba71a6db Mon Sep 17 00:00:00 2001
+From: michael-grunder <michael.grunder@gmail.com>
+Date: Fri, 28 Aug 2020 12:35:01 -0700
+Subject: [PATCH] Explicitly set c99 in CMake
+
+See #869
+
+[Retrieved from:
+https://github.com/redis/hiredis/commit/13a35bdb64615e381c5e1151cdd4e78bba71a6db]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1beccc69a..4cbd438d7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -22,6 +22,9 @@ MESSAGE("Detected version: ${VERSION}")
+ 
+ PROJECT(hiredis VERSION "${VERSION}")
+ 
++# Hiredis requires C99
++SET(CMAKE_C_STANDARD 99)
++
+ SET(ENABLE_EXAMPLES OFF CACHE BOOL "Enable building hiredis examples")
+ 
+ SET(hiredis_sources
-- 
2.28.0
