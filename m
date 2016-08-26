From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 10:53:54 +0200
Subject: [Buildroot] [git commit] domoticz: fix patch for uClibc
	compatibility
Message-ID: <20160826085418.A609182267@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=397962ce1737ba0f920ffc1d3a3ea2bc08b28270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The source files in the domoticz tarballs have DOS line endings, which
don't appear when fetching the source code from Git. Therefore, a patch
generated from the Git repository doesn't apply directly on the source
code extracted from the tarball.

This commit fixes the patch so that it applies cleanly to the
tarball. Notice that the CMakeLists.txt file is not affected, only the
domoticz.cpp file uses DOS line endings.

While we're at it, we change the patch title prefix from [PATCH 1/1] to
just [PATCH].

Fixes:

  http://autobuild.buildroot.net/results/a0539b3551d482411dd4bcd5c9b8c89f77e68475/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...per-check-for-detecting-header-execinfo.h.patch | 33 ++++++++++------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch b/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch
index c4d88a4..55bbb7d 100644
--- a/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch
+++ b/package/domoticz/0001-add-proper-check-for-detecting-header-execinfo.h.patch
@@ -1,7 +1,7 @@
-From 5409696dfcbb05d6e4e67e74c97487b1987639e1 Mon Sep 17 00:00:00 2001
+From f0da50118f7bd01ed7fa97e75b790a8232d8d4dc Mon Sep 17 00:00:00 2001
 From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
 Date: Thu, 25 Aug 2016 17:23:38 +0530
-Subject: [PATCH 1/1] add proper check for detecting header <execinfo.h>
+Subject: [PATCH] add proper check for detecting header <execinfo.h>
 
 domoticz.cpp currently assumes that on GNU/Linux systems header
 <execinfo.h> is available. But that is not true. Since it provided by
@@ -25,11 +25,11 @@ Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
  main/domoticz.cpp | 2 +-
  2 files changed, 8 insertions(+), 1 deletion(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d3113f4..ef32f7b 100644
+Index: b/CMakeLists.txt
+===================================================================
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -61,6 +61,13 @@ SET(EXECUTABLE_OUTPUT_PATH "" CACHE INTERNAL
+@@ -61,6 +61,13 @@
    "Where to put the executables for Domoticz"
    )
  
@@ -43,19 +43,16 @@ index d3113f4..ef32f7b 100644
  #set(CMAKE_EXE_LINKER_FLAGS "-static")
  
  # Macro for setting up precompiled headers. Usage:
-diff --git a/main/domoticz.cpp b/main/domoticz.cpp
-index 69d2ef6..c52e5ac 100644
+Index: b/main/domoticz.cpp
+===================================================================
 --- a/main/domoticz.cpp
 +++ b/main/domoticz.cpp
 @@ -44,7 +44,7 @@
- 	#include <string.h> 
- #endif
- 
--#ifdef __gnu_linux__
-+#ifdef HAVE_EXECINFO_H
- #include <execinfo.h>
- static void dumpstack(void) {
- 	// Notes :
--- 
-2.6.2
-
+ 	#include <string.h> 
+ #endif
+ 
+-#ifdef __gnu_linux__
++#ifdef HAVE_EXECINFO_H
+ #include <execinfo.h>
+ static void dumpstack(void) {
+ 	// Notes :
