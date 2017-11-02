From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 12:32:50 +0100
Subject: [Buildroot] [git commit] package/opencv: fix build failure
Message-ID: <20171102112537.5575A7FFBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd609b38325d0b8949dcb6677b4e8ba020932b0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport fix from upstream.

Fixes:

  http://autobuild.buildroot.net/results/b27d324331f6e351e95dd4742f4d0a50af60c590
  http://autobuild.buildroot.net/results/44ed0be0bd94028b7b37e7bf21233adc1753d94b

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-Update-OpenCVCompilerOptions.cmake.patch  | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch b/package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch
new file mode 100644
index 0000000..9a81d93
--- /dev/null
+++ b/package/opencv/0003-Update-OpenCVCompilerOptions.cmake.patch
@@ -0,0 +1,32 @@
+From 126de0cd95418811e302996161e03195bf7e631a Mon Sep 17 00:00:00 2001
+From: neok-m4700 <neok-m4700@users.noreply.github.com>
+Date: Tue, 25 Jul 2017 10:25:20 +0200
+Subject: [PATCH] Update OpenCVCompilerOptions.cmake
+
+misplaced else
+
+[Upstream commit: https://github.com/opencv/opencv/commit/126de0cd95418811e302996161e03195bf7e631a]
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
