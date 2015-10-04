From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 15:19:34 +0100
Subject: [Buildroot] [git commit] zxing: bump upstream version,
	drop useless patch
Message-ID: <20151004142056.7655281D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c8aceb2d5db8901df9d4b57cc2a79dc2e7e49f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0001-CMakeLists-add-rules-for-installation.patch patch has been
merged upstream 7 minutes after it was submitted. So let's bump to the
latest upstream version and drop the no longer needed patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...001-CMakeLists-add-rules-for-installation.patch |   33 --------------------
 package/zxing-cpp/zxing-cpp.hash                   |    2 +-
 package/zxing-cpp/zxing-cpp.mk                     |    2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/zxing-cpp/0001-CMakeLists-add-rules-for-installation.patch b/package/zxing-cpp/0001-CMakeLists-add-rules-for-installation.patch
deleted file mode 100644
index 034f200..0000000
--- a/package/zxing-cpp/0001-CMakeLists-add-rules-for-installation.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2bc58a87dd629cef4cd2c62c5132c319bede61fa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 4 Oct 2015 11:49:52 +0100
-Subject: [PATCH] CMakeLists: add rules for installation
-
-This commit adds some CMake rules that allow to do a "make install" to
-install the zxing binary, its library and corresponding header files.
-
-Submitted upstream: https://github.com/glassechidna/zxing-cpp/pull/31
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f49b28d..7151d90 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -68,6 +68,10 @@ file(GLOB_RECURSE ZXING_FILES
- )
- add_executable(zxing ${ZXING_FILES})
- target_link_libraries(zxing libzxing)
-+install(TARGETS zxing libzxing
-+	LIBRARY DESTINATION lib
-+	RUNTIME DESTINATION bin)
-+install(DIRECTORY core/src/zxing/ DESTINATION include/zxing FILES_MATCHING PATTERN "*.h")
- 
- # Add testrunner executable.
- find_package(CPPUNIT)
--- 
-2.6.0
-
diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index bc3b11d..e38a612 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c3934e9e59b7496c9a4db7ad4d8eb43668da4b321ec705feebaf085b185b2d08 zxing-cpp-4abdbb62c9939014eca3e43ac7dfa30daa344536.tar.gz
+sha256 164c0bc9f1ce2ff5659fddce6da71f8cdda091751f3b71140c090b58451a2b04 zxing-cpp-fa34227d26e0b388e65b81936a2681952928f5be.tar.gz
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 64c20f3..7344dc1 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_CPP_VERSION = 4abdbb62c9939014eca3e43ac7dfa30daa344536
+ZXING_CPP_VERSION = fa34227d26e0b388e65b81936a2681952928f5be
 ZXING_CPP_SITE = $(call github,glassechidna,zxing-cpp,$(ZXING_CPP_VERSION))
 ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = COPYING
