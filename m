From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2021 22:47:05 +0100
Subject: [Buildroot] [git commit] package/libuwsc: disable example
Message-ID: <20210225212514.1622486315@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b3c8ce97fd023cfaca0a5f3f303572c4c789ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BUILD_EXAMPLE=OFF is already passed by cmake-package

Fixes:
 - http://autobuild.buildroot.org/results/f5256d5a3a86112f008506f1910d0600c491a2a0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch    | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch b/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
new file mode 100644
index 0000000000..197dd1de0f
--- /dev/null
+++ b/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
@@ -0,0 +1,34 @@
+From bb71b21eb9407479ad729b3c858b0fc350fae335 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Feb 2021 19:39:59 +0100
+Subject: [PATCH] CMakeLists.txt: add BUILD_EXAMPLE
+
+Allow the user to disable example
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998 at free.fr: backport from upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 110d933..c52ab79 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,11 @@ cmake_minimum_required(VERSION 2.8)
+ 
+ project(libuwsc C)
+ 
++option(BUILD_EXAMPLE "Build example" ON)
++
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
+ 
+ add_subdirectory(src)
+-add_subdirectory(example)
++if(BUILD_EXAMPLE)
++    add_subdirectory(example)
++endif()
+-- 
+2.25.1
+
