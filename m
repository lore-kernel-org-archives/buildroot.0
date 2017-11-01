From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  1 Nov 2017 21:11:35 +0100
Subject: [Buildroot] [PATCH 2/4] package/opencv: fix build failure
In-Reply-To: <20171101201137.29939-1-s.martin49@gmail.com>
References: <20171101201137.29939-1-s.martin49@gmail.com>
Message-ID: <20171101201137.29939-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport fix from upstream.

Fixes:
  http://autobuild.buildroot.net/results/b27d324331f6e351e95dd4742f4d0a50af60c590
  http://autobuild.buildroot.net/results/44ed0be0bd94028b7b37e7bf21233adc1753d94b

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 .../0003-Update-OpenCVCompilerOptions.cmake.patch  | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch

diff --git a/package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch b/package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch
new file mode 100644
index 0000000000..290eef4d10
--- /dev/null
+++ b/package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch
@@ -0,0 +1,33 @@
+Fetch from upstream: https://github.com/opencv/opencv/commit/126de0cd95418811e302996161e03195bf7e631a
+
+From 126de0cd95418811e302996161e03195bf7e631a Mon Sep 17 00:00:00 2001
+From: neok-m4700 <neok-m4700@users.noreply.github.com>
+Date: Tue, 25 Jul 2017 10:25:20 +0200
+Subject: [PATCH] Update OpenCVCompilerOptions.cmake
+
+misplaced else
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ cmake/OpenCVCompilerOptions.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/OpenCVCompilerOptions.cmake b/cmake/OpenCVCompilerOptions.cmake
+index 9b2a4e42e..7b079c5f9 100644
+--- a/cmake/OpenCVCompilerOptions.cmake
++++ b/cmake/OpenCVCompilerOptions.cmake
+@@ -18,9 +18,9 @@ if(ENABLE_CCACHE AND NOT CMAKE_COMPILER_IS_CCACHE)
+         message(STATUS "Unable to compile program with enabled ccache, reverting...")
+         set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${__OLD_RULE_LAUNCH_COMPILE}")
+       endif()
+-    else()
+-      message(STATUS "Looking for ccache - not found")
+     endif()
++  else()
++    message(STATUS "Looking for ccache - not found")
+   endif()
+ endif()
+ 
+-- 
+2.15.0
+
-- 
2.15.0
