From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Nov 2019 09:37:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/zxing-cpp: fix build with cppunit
 and gcc 5
In-Reply-To: <20191109083710.10660-1-fontaine.fabrice@gmail.com>
References: <20191109083710.10660-1-fontaine.fabrice@gmail.com>
Message-ID: <20191109083710.10660-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8c675300aa7e7f2a5a2f0a2ac0f191b8d2ff8c42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Build-with-C-11-on-Unix.patch        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/zxing-cpp/0001-Build-with-C-11-on-Unix.patch

diff --git a/package/zxing-cpp/0001-Build-with-C-11-on-Unix.patch b/package/zxing-cpp/0001-Build-with-C-11-on-Unix.patch
new file mode 100644
index 0000000000..e975775d67
--- /dev/null
+++ b/package/zxing-cpp/0001-Build-with-C-11-on-Unix.patch
@@ -0,0 +1,28 @@
+From 14d0a7196993868e5fb5ef18afd03a2bf2ca8014 Mon Sep 17 00:00:00 2001
+From: Nick <nick@kousu.ca>
+Date: Wed, 20 Mar 2019 00:43:58 -0400
+Subject: [PATCH] Build with C++11 on Unix.
+
+This fixes the opencv wrapper code on Darwin; probably on other platforms too,
+though maybe they are less strict.
+
+[Retrieved (and backported) from:
+https://github.com/glassechidna/zxing-cpp/commit/14d0a7196993868e5fb5ef18afd03a2bf2ca8014]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ccb2ba9..738f4e1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -34,6 +34,8 @@ include(source_files.cmake)
+     add_definitions(-D_CRT_SECURE_NO_WARNINGS)
+     add_definitions(/Za)
+ endif()
++
++set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
+ 
+ # Add libzxing library.
+ file(GLOB_RECURSE LIBZXING_FILES
-- 
2.23.0
