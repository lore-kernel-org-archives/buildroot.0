From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Wed, 11 Mar 2015 12:15:34 -0500
Subject: [Buildroot] [PATCH] ne10: bump to version 1.2.0
Message-ID: <1426094134-48711-1-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.2.0, fixup patch, and add ensure package is installed
ot the staging directory.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 ...sts-don-t-hard-code-thumb-code-generation.patch | 26 ++++++++++++----------
 package/ne10/ne10.mk                               |  3 ++-
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
index 3402b5a..3934587 100644
--- a/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
+++ b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
@@ -1,27 +1,29 @@
-From 00995e0b8a66fbd0eabd206188120bfc1ecdac59 Mon Sep 17 00:00:00 2001
-Message-Id: <00995e0b8a66fbd0eabd206188120bfc1ecdac59.1398245232.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 23 Apr 2014 12:21:37 +0300
+From 9ff39800cec5f1dabba246b253794582d611bc6d Mon Sep 17 00:00:00 2001
+From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
+Date: Fri, 20 Feb 2015 10:44:15 -0600
 Subject: [PATCH] CMakeLists: don't hard code thumb code generation
 
+Migrating to version 1.2.0
+
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2c7f8d62a42b..cec614fba041 100644
+index fdf01ec..34ae26e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -77,7 +77,7 @@ if(ANDROID_PLATFORM)
-       add_subdirectory(android/NE10Demo/jni)
-     endif()
+@@ -84,7 +84,7 @@ if(ANDROID_PLATFORM)
+     ${ANDROID_TOOLCHAIN_PATH}/arm-linux-androideabi-ar
+     ${ANDROID_TOOLCHAIN_PATH}/arm-linux-androideabi-ranlib")
  elseif(GNULINUX_PLATFORM)
--    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
-+    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -march=armv7-a -mfpu=vfp3")
-     set(CMAKE_ASM_FLAGS "-mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -march=armv7-a -mfpu=vfp3")
+     set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
  elseif(IOS_PLATFORM)
      #set minimal target ios version.If not provided this option, Xcode
 -- 
-1.9.2
+1.9.1
 
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index b1897c8..aeaa041 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-NE10_VERSION = v1.0.0
+NE10_VERSION = v1.2.0
 NE10_SITE = $(call github,projectNe10,Ne10,$(NE10_VERSION))
 NE10_LICENSE = BSD-3c or Apache-2.0
 NE10_LICENSE_FILES = doc/LICENSE
+NE10_INSTALL_STAGING = YES
 
 NE10_CONF_OPTS = -DGNULINUX_PLATFORM=ON
 
-- 
1.9.1
