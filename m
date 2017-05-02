From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:50:41 +0200
Subject: [Buildroot] [git commit] package/opencv: bump version to 2.4.13.2
Message-ID: <20170502205045.80C0281D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4da02a8192e72180cf9ceedc39fc1df19e3ab46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/opencv/opencv/commit/c7045184ce220a04796d8e9072ac42d2d362dc71

Renumbered remaining patches.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...xt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch} |  0
 ...ypes_c.h-Fix-compiling-VFP-assembler-code.patch | 37 ----------------------
 package/opencv/opencv.hash                         |  2 +-
 package/opencv/opencv.mk                           |  2 +-
 4 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/opencv/0004-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch b/package/opencv/0003-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
similarity index 100%
rename from package/opencv/0004-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
rename to package/opencv/0003-CMakeLists.txt-Do-not-add-libdl-to-LINKER_LIBS-for-s.patch
diff --git a/package/opencv/0003-types_c.h-Fix-compiling-VFP-assembler-code.patch b/package/opencv/0003-types_c.h-Fix-compiling-VFP-assembler-code.patch
deleted file mode 100644
index 85a23a0..0000000
--- a/package/opencv/0003-types_c.h-Fix-compiling-VFP-assembler-code.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 18c868c47307b786d1bea729dccaad7f8d696cb7 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Tue, 6 Sep 2016 11:49:00 +0200
-Subject: [PATCH 1/1] types_c.h: Fix compiling VFP assembler code
-
-Replace asm by __asm__ according to
-https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html#Alternate-Keywords
-as suggested by Arnout Vandecappelle:
-http://lists.busybox.net/pipermail/buildroot/2016-September/171491.html
-
-to fix build errors in ffmpeg with opencv2 support detected by
-buildroot autobuilders:
-http://autobuild.buildroot.net/results/c32/c32a21240a9933796ee850349a62ff3c2314f25c/build-end.log
-
-Patch sent upstream: https://github.com/opencv/opencv/pull/7242
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- modules/core/include/opencv2/core/types_c.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/core/include/opencv2/core/types_c.h b/modules/core/include/opencv2/core/types_c.h
-index c21cd2c..771715d 100644
---- a/modules/core/include/opencv2/core/types_c.h
-+++ b/modules/core/include/opencv2/core/types_c.h
-@@ -318,7 +318,7 @@ enum {
-     int res; \
-     float temp; \
-     (void)temp; \
--    asm(_asm_string : [res] "=r" (res), [temp] "=w" (temp) : [value] "w" (_value)); \
-+    __asm__(_asm_string : [res] "=r" (res), [temp] "=w" (temp) : [value] "w" (_value)); \
-     return res;
- // 2. version for double
- #ifdef __clang__
--- 
-2.9.3
-
diff --git a/package/opencv/opencv.hash b/package/opencv/opencv.hash
index 9686cb2..2c1842b 100644
--- a/package/opencv/opencv.hash
+++ b/package/opencv/opencv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 94ebcca61c30034d5fb16feab8ec12c8a868f5162d20a9f0396f0f5f6d8bbbff  opencv-2.4.13.tar.gz
+sha256 4b00c110e6c54943cbbb7cf0d35c5bc148133ab2095ee4aaa0ac0a4f67c58080  opencv-2.4.13.2.tar.gz
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 4ae550e..ff5ab02 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV_VERSION = 2.4.13
+OPENCV_VERSION = 2.4.13.2
 OPENCV_SITE = $(call github,itseez,opencv,$(OPENCV_VERSION))
 OPENCV_INSTALL_STAGING = YES
 OPENCV_LICENSE = BSD-3-Clause
