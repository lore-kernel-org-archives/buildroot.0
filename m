From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 13:15:11 +0200
Subject: [Buildroot] [PATCH 1/1] libcue: fix build without C++
Message-ID: <20180430111511.6881-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, CMake assumes that the project is using both C and C++. By
explicitly passing 'C' as argument of the project() macro, we tell
CMake that only C is used, which prevents CMake from checking if a C++
compiler exists.
Patch sent upstream: https://github.com/lipnitsk/libcue/pull/17

Fixes:
 - http://autobuild.buildroot.net/results/a5344d18dbdc86705853fbf8a66d5304de07a9b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-libcue-is-only-implemented-in-C.patch     | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libcue/0001-libcue-is-only-implemented-in-C.patch

diff --git a/package/libcue/0001-libcue-is-only-implemented-in-C.patch b/package/libcue/0001-libcue-is-only-implemented-in-C.patch
new file mode 100644
index 0000000000..bb36172ad1
--- /dev/null
+++ b/package/libcue/0001-libcue-is-only-implemented-in-C.patch
@@ -0,0 +1,34 @@
+From 285dd7fe70878e85f121b990f59e72105ef27688 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 30 Apr 2018 13:06:00 +0200
+Subject: [PATCH] libcue is only implemented in C
+
+By default, CMake assumes that the project is using both C and C++. By
+explicitly passing 'C' as argument of the project() macro, we tell
+CMake that only C is used, which prevents CMake from checking if a C++
+compiler exists.
+
+Fixes:
+ - http://autobuild.buildroot.net/results/a5344d18dbdc86705853fbf8a66d5304de07a9b2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1e4ca25..8c3a1bd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -5,7 +5,7 @@ SET(PACKAGE_SOVERSION 2)
+ 
+ CMAKE_MINIMUM_REQUIRED(VERSION 2.8 FATAL_ERROR)
+ 
+-PROJECT(libcue)
++PROJECT(libcue C)
+ 
+ include(GNUInstallDirs)
+ 
+-- 
+2.14.1
+
-- 
2.14.1
