From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:50 -0000
Subject: [Buildroot] [git commit branch/next] libiio: Add a patch from
	upstream to fix building without a C++ compiler
Message-ID: <20150808105639.6939A80414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8eb929aae3da863d11dfea0f2dbb3463f60cb420
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This fixes a build issue reported by the autobuilder:

   http://autobuild.buildroot.net/results/5b0d02aa3bdb4cddb0d316c99fada2e7ba9f9c1d/

[Thomas: add autobuilder reference, as suggested by Baruch.]

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ake-fix-build-on-unix-systems-without-cpp.patch |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch b/package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch
new file mode 100644
index 0000000..4839a39
--- /dev/null
+++ b/package/libiio/0002-cmake-fix-build-on-unix-systems-without-cpp.patch
@@ -0,0 +1,36 @@
+From 2e6fa357ffbe755bfecaecad4fc82e3307fe2831 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul.cercueil@analog.com>
+Date: Wed, 22 Jul 2015 10:25:01 +0200
+Subject: [PATCH] CMake: Fix build on UNIX systems without a C++ compiler
+
+Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
+---
+ bindings/csharp/CMakeLists.txt | 2 +-
+ bindings/python/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bindings/csharp/CMakeLists.txt b/bindings/csharp/CMakeLists.txt
+index 8aafb8f..fceab88 100644
+--- a/bindings/csharp/CMakeLists.txt
++++ b/bindings/csharp/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 2.8.7)
+-project(libiio-sharp)
++project(libiio-sharp LANGUAGES NONE)
+ 
+ find_program(MCS_EXECUTABLE
+ 	NAMES mcs csc
+diff --git a/bindings/python/CMakeLists.txt b/bindings/python/CMakeLists.txt
+index 22ffdb4..76ceae8 100644
+--- a/bindings/python/CMakeLists.txt
++++ b/bindings/python/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ cmake_minimum_required(VERSION 2.8.7)
+-project(libiio-py)
++project(libiio-py LANGUAGES NONE)
+ 
+ include(FindPythonInterp)
+ 
+-- 
+2.1.4
+
