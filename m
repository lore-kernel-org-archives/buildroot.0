From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:53 +0100
Subject: [Buildroot] [PATCH 47/51] ne10: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-47-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refresh the patch.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 ...sts-don-t-hard-code-thumb-code-generation.patch | 26 +++++++++++++++++++++
 ...sts-don-t-hard-code-thumb-code-generation.patch | 27 ----------------------
 package/ne10/ne10.mk                               |  2 +-
 3 files changed, 27 insertions(+), 28 deletions(-)
 create mode 100644 package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
 delete mode 100644 package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch

diff --git a/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
new file mode 100644
index 0000000..08fb6f1
--- /dev/null
+++ b/package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch
@@ -0,0 +1,26 @@
+From b682fd6d7e582746672a97146f66aa8120000371 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 23 Apr 2014 12:21:37 +0300
+Subject: [PATCH] CMakeLists: don't hard code thumb code generation
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bd29984..c4f019d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -87,7 +87,7 @@ if(ANDROID_PLATFORM)
+       add_subdirectory(android/NE10Demo/jni)
+     endif()
+ elseif(GNULINUX_PLATFORM)
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -march=armv7-a -mfpu=vfp3")
+     set(CMAKE_ASM_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
+ elseif(IOS_PLATFORM)
+     #set minimal target ios version.If not provided this option, Xcode
+-- 
+2.1.1
+
diff --git a/package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch b/package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch
deleted file mode 100644
index 3402b5a..0000000
--- a/package/ne10/ne10-01-CMakeLists-don-t-hard-code-thumb-code-generation.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 00995e0b8a66fbd0eabd206188120bfc1ecdac59 Mon Sep 17 00:00:00 2001
-Message-Id: <00995e0b8a66fbd0eabd206188120bfc1ecdac59.1398245232.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 23 Apr 2014 12:21:37 +0300
-Subject: [PATCH] CMakeLists: don't hard code thumb code generation
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2c7f8d62a42b..cec614fba041 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -77,7 +77,7 @@ if(ANDROID_PLATFORM)
-       add_subdirectory(android/NE10Demo/jni)
-     endif()
- elseif(GNULINUX_PLATFORM)
--    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -mthumb -march=armv7-a -mfpu=vfp3")
-+    set(CMAKE_C_FLAGS "-O2 -mthumb-interwork -march=armv7-a -mfpu=vfp3")
-     set(CMAKE_ASM_FLAGS "-mthumb-interwork -mthumb -march=armv7-a -mfpu=neon")
- elseif(IOS_PLATFORM)
-     #set minimal target ios version.If not provided this option, Xcode
--- 
-1.9.2
-
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index cb635e4..6611be4 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NE10_VERSION = v1.0.0
+NE10_VERSION = v1.1.2
 NE10_SITE = $(call github,projectNe10,Ne10,$(NE10_VERSION))
 NE10_LICENSE = BSD-3c or Apache-2.0
 NE10_LICENSE_FILES = doc/LICENSE
-- 
2.1.1
