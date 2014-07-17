From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jul 2014 08:34:16 -0300
Subject: [Buildroot] [PATCH] gcc: bump 4.9.x series to version 4.9.1
Message-ID: <1405596856-19446-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/{4.9.0 => 4.9.1}/100-uclibc-conf.patch       |  0
 .../gcc/{4.9.0 => 4.9.1}/301-missing-execinfo_h.patch    |  0
 package/gcc/{4.9.0 => 4.9.1}/302-c99-snprintf.patch      |  0
 .../gcc/{4.9.0 => 4.9.1}/810-arm-softfloat-libgcc.patch  |  0
 .../gcc/{4.9.0 => 4.9.1}/830-arm_unbreak_armv4t.patch    |  0
 .../840-microblaze-enable-dwarf-eh-support.patch         |  0
 package/gcc/{4.9.0 => 4.9.1}/900-musl-support.patch      | 16 +---------------
 .../powerpc-link-with-math-lib.patch.conditional         |  0
 package/gcc/Config.in.host                               |  2 +-
 9 files changed, 2 insertions(+), 16 deletions(-)
 rename package/gcc/{4.9.0 => 4.9.1}/100-uclibc-conf.patch (100%)
 rename package/gcc/{4.9.0 => 4.9.1}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{4.9.0 => 4.9.1}/302-c99-snprintf.patch (100%)
 rename package/gcc/{4.9.0 => 4.9.1}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{4.9.0 => 4.9.1}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{4.9.0 => 4.9.1}/840-microblaze-enable-dwarf-eh-support.patch (100%)
 rename package/gcc/{4.9.0 => 4.9.1}/900-musl-support.patch (98%)
 rename package/gcc/{4.9.0 => 4.9.1}/powerpc-link-with-math-lib.patch.conditional (100%)

diff --git a/package/gcc/4.9.0/100-uclibc-conf.patch b/package/gcc/4.9.1/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/4.9.0/100-uclibc-conf.patch
rename to package/gcc/4.9.1/100-uclibc-conf.patch
diff --git a/package/gcc/4.9.0/301-missing-execinfo_h.patch b/package/gcc/4.9.1/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/4.9.0/301-missing-execinfo_h.patch
rename to package/gcc/4.9.1/301-missing-execinfo_h.patch
diff --git a/package/gcc/4.9.0/302-c99-snprintf.patch b/package/gcc/4.9.1/302-c99-snprintf.patch
similarity index 100%
rename from package/gcc/4.9.0/302-c99-snprintf.patch
rename to package/gcc/4.9.1/302-c99-snprintf.patch
diff --git a/package/gcc/4.9.0/810-arm-softfloat-libgcc.patch b/package/gcc/4.9.1/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/4.9.0/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.9.1/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/4.9.0/830-arm_unbreak_armv4t.patch b/package/gcc/4.9.1/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/4.9.0/830-arm_unbreak_armv4t.patch
rename to package/gcc/4.9.1/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/4.9.0/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/4.9.1/840-microblaze-enable-dwarf-eh-support.patch
similarity index 100%
rename from package/gcc/4.9.0/840-microblaze-enable-dwarf-eh-support.patch
rename to package/gcc/4.9.1/840-microblaze-enable-dwarf-eh-support.patch
diff --git a/package/gcc/4.9.0/900-musl-support.patch b/package/gcc/4.9.1/900-musl-support.patch
similarity index 98%
rename from package/gcc/4.9.0/900-musl-support.patch
rename to package/gcc/4.9.1/900-musl-support.patch
index 958940e..5b3dfa5 100644
--- a/package/gcc/4.9.0/900-musl-support.patch
+++ b/package/gcc/4.9.1/900-musl-support.patch
@@ -13,6 +13,7 @@ https://bitbucket.org/GregorR/musl-cross/src. Compared to the upstream version:
    causing build failure. Bug reported upstream at
    https://bitbucket.org/GregorR/musl-gcc-patches/issue/4/musl-gcc-patches-break-the-build-on.
 
+[Gustavo: remove upstream applied gcc/config/sh/sh.c chunk for 4.9.1]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
 
@@ -441,21 +442,6 @@ Index: b/gcc/config/sh/linux.h
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "_linux"
-Index: b/gcc/config/sh/sh.c
-===================================================================
---- a/gcc/config/sh/sh.c
-+++ b/gcc/config/sh/sh.c
-@@ -70,10 +70,6 @@
- #include "pass_manager.h"
- #include "context.h"
- 
--#include <sstream>
--#include <vector>
--#include <algorithm>
--
- int code_for_indirect_jump_scratch = CODE_FOR_indirect_jump_scratch;
- 
- /* These are some macros to abstract register modes.  */
 Index: b/gcc/configure
 ===================================================================
 --- a/gcc/configure
diff --git a/package/gcc/4.9.0/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.9.1/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.9.0/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.9.1/powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8ec587c..eaff929 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -97,7 +97,7 @@ config BR2_GCC_VERSION
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.3"     if BR2_GCC_VERSION_4_8_X
-	default "4.9.0"     if BR2_GCC_VERSION_4_9_X
+	default "4.9.1"     if BR2_GCC_VERSION_4_9_X
 	default "arc-4.8-R3" if BR2_GCC_VERSION_4_8_ARC
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
-- 
1.8.5.5
