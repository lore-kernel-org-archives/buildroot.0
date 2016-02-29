From: Stanislav Vlasic <svlasic@gmail.com>
Date: Mon, 29 Feb 2016 11:19:23 +0100
Subject: [Buildroot] [PATCH 1/1] libasplib: bump version and change source
	location
Message-ID: <1456741163-6250-1-git-send-email-svlasic@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stanislav Vlasic <svlasic@gmail.com>
---
 .../0001-Fix-linux-detection-with-buildroot.patch  | 31 ----------------------
 package/libasplib/Config.in                        |  5 +---
 package/libasplib/libasplib.hash                   |  2 +-
 package/libasplib/libasplib.mk                     |  4 +--
 4 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 package/libasplib/0001-Fix-linux-detection-with-buildroot.patch

diff --git a/package/libasplib/0001-Fix-linux-detection-with-buildroot.patch b/package/libasplib/0001-Fix-linux-detection-with-buildroot.patch
deleted file mode 100644
index 66f5185..0000000
--- a/package/libasplib/0001-Fix-linux-detection-with-buildroot.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1dc4480e5157e7ac8eb0364446787128f0a156aa Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 20 Dec 2015 22:25:52 +0100
-Subject: [PATCH 1/1] Fix linux detection with buildroot
-
-Inspired by
-http://lists.busybox.net/pipermail/buildroot/2015-July/133312.html
-
-Patch sent upstream: https://github.com/kodi-adsp/asplib/pull/2
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- asplib_utils/os/asplib_base_os.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/asplib_utils/os/asplib_base_os.h b/asplib_utils/os/asplib_base_os.h
-index a2d3b98..9a90b54 100644
---- a/asplib_utils/os/asplib_base_os.h
-+++ b/asplib_utils/os/asplib_base_os.h
-@@ -27,7 +27,7 @@
-   #define TARGET_WINDOWS
- #endif
-   #include "windows/windows_definitions.h"
--#elif defined(__gnu_linux__)
-+#elif (defined(__gnu_linux__) || defined(__linux__))
- #if !defined(TARGET_WINDOWS)
-   #define TARGET_LINUX
- #endif
--- 
-2.6.4
-
diff --git a/package/libasplib/Config.in b/package/libasplib/Config.in
index 71ccfa0..89d5448 100644
--- a/package/libasplib/Config.in
+++ b/package/libasplib/Config.in
@@ -1,14 +1,11 @@
 config BR2_PACKAGE_LIBASPLIB
 	bool "libasplib"
 	depends on BR2_INSTALL_LIBSTDCPP
-	# needs <cpuid.h> from the compiler
-	depends on BR2_i386 || BR2_x86_64
 	help
 	  asplib (Achim's Signal Processing LIBrary), is a small and
 	  lightweight C++ library for digital signal processing.
 
-	  https://github.com/kodi-adsp/asplib
+	  https://github.com/AchimTuran/asplib
 
 comment "asplib needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_i386 || BR2_x86_64
diff --git a/package/libasplib/libasplib.hash b/package/libasplib/libasplib.hash
index 96c6a2c..bbd027d 100644
--- a/package/libasplib/libasplib.hash
+++ b/package/libasplib/libasplib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8979cbd1620dde0603f596d2d05d300355f07e42637bb41ecd564541fa1332f4 libasplib-2fac1bf34efd210b95949fddcbd4a12d287d3e82.tar.gz
+sha256 ccc2718c79a8d684317cc1987ede88b198e1602df47d0f18f03d474eda00af9c libasplib-f7219142e790a329b002a94f3db943abcb183739.tar.gz
diff --git a/package/libasplib/libasplib.mk b/package/libasplib/libasplib.mk
index 27629f5..41aeaeb 100644
--- a/package/libasplib/libasplib.mk
+++ b/package/libasplib/libasplib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBASPLIB_VERSION = 2fac1bf34efd210b95949fddcbd4a12d287d3e82
-LIBASPLIB_SITE = $(call github,kodi-adsp,asplib,$(LIBASPLIB_VERSION))
+LIBASPLIB_VERSION = f7219142e790a329b002a94f3db943abcb183739
+LIBASPLIB_SITE = $(call github,AchimTuran,asplib,$(LIBASPLIB_VERSION))
 LIBASPLIB_LICENSE = GPLv3+
 LIBASPLIB_LICENSE_FILES = LICENSE
 LIBASPLIB_INSTALL_STAGING = YES
-- 
1.9.1
