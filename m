From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:26:13 +0100
Subject: [Buildroot] [git commit] package/xerces: bump version to 3.2.3
Message-ID: <20201205201042.11FFB80E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f115d2de4276972098b8f4cfeb0150c8e851d89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed 0001-cmake-Allow-thread-checks-to-fail-and-fall-back-to-nothreads.patch
  (upstream [1])

[1] https://github.com/apache/xerces-c/commit/c9bfe786331647237b90f5f9e35b4d2cad7aaa69

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...checks-to-fail-and-fall-back-to-nothreads.patch | 38 ----------------------
 package/xerces/xerces.hash                         |  6 ++--
 package/xerces/xerces.mk                           |  2 +-
 3 files changed, 4 insertions(+), 42 deletions(-)

diff --git a/package/xerces/0001-cmake-Allow-thread-checks-to-fail-and-fall-back-to-nothreads.patch b/package/xerces/0001-cmake-Allow-thread-checks-to-fail-and-fall-back-to-nothreads.patch
deleted file mode 100644
index 8bed7711c4..0000000000
--- a/package/xerces/0001-cmake-Allow-thread-checks-to-fail-and-fall-back-to-nothreads.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c9bfe786331647237b90f5f9e35b4d2cad7aaa69 Mon Sep 17 00:00:00 2001
-From: Roger Leigh <rleigh@apache.org>
-Date: Fri, 12 Oct 2018 12:02:58 +0000
-Subject: [PATCH] cmake: Allow thread checks to fail and fall back to nothreads
-
-Closes: #2155
-
-
-git-svn-id: https://svn.apache.org/repos/asf/xerces/c/trunk at 1843653 13f79535-47bb-0310-9956-ffa450edef68
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from: https://github.com/apache/xerces-c/commit/c9bfe786331647237b90f5f9e35b4d2cad7aaa69]
----
- cmake/XercesMutexMgrSelection.cmake | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/cmake/XercesMutexMgrSelection.cmake b/cmake/XercesMutexMgrSelection.cmake
-index 2f1d71c50..ad698840d 100644
---- a/cmake/XercesMutexMgrSelection.cmake
-+++ b/cmake/XercesMutexMgrSelection.cmake
-@@ -19,11 +19,15 @@
- 
- # mutexmgr selection
- 
--option(threads "Threading support" ON)
-+set(xerces_thread_default ON)
-+find_package(Threads)
-+if(NOT TARGET Threads::Threads)
-+  set(xerces_thread_default ON)
-+endif()
- 
--include(CheckCXXSourceCompiles)
-+option(threads "Threading support" ${xerces_thread_default})
- 
--find_package(Threads REQUIRED)
-+include(CheckCXXSourceCompiles)
- 
- function(thread_test outvar)
-   set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index 28db0c6062..c75ce860e8 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,5 +1,5 @@
-# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.2.tar.xz.sha256
-sha256 6daca3b23364d8d883dc77a73f681242f69389e3564543287ed3d073007e0a8e xerces-c-3.2.2.tar.xz
+# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.3.tar.xz.sha256
+sha256  12fc99a9fc1d1a79bd0e927b8b5637a576d6656f45b0d5e70ee3694d379cc149  xerces-c-3.2.3.tar.xz
 
 # Hash for license file
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index ae42b1e62f..d05facf3b5 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.2.2
+XERCES_VERSION = 3.2.3
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
