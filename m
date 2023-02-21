Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF68C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0948D8204A;
	Tue, 21 Feb 2023 08:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0948D8204A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NX_OjGbUu2Pm; Tue, 21 Feb 2023 08:24:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD625827C5;
	Tue, 21 Feb 2023 08:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD625827C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 395F11BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13FD5611B8
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13FD5611B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39qdG9Ddd0Y9 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:23:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2507611AE
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2507611AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90E0286549; Tue, 21 Feb 2023 08:23:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:23:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 792f1975175cb995600f7e3ac092fc3c741aa096
X-Git-Newrev: 6a789cd0d1badf7f68749b304f7b2e3d9f9ca2c2
X-Patchwork-Hint: ignore
Message-Id: <20230221082339.90E0286549@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/highway: bump to
 version 1.0.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a789cd0d1badf7f68749b304f7b2e3d9f9ca2c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Dropped patch upstreamed in:
  https://github.com/google/highway/commit/1cab22047a6ef750ef2bc38ad47d6e765d6d376a

- Add an upstream patch, not in 1.0.3 release:
  https://github.com/google/highway/commit/411300d0eec10d5635cbdd064299630c507348e1

- Add a new patch, to fix armv7 builds with vfp < v4.
  Proposed upstream in:
  https://github.com/google/highway/pull/1143

- Add a comment about -DHWY_CMAKE_ARM7=OFF since the name is a bit
  misleading. It should better be ARMV7 or ARMV7_VFPV4.

For change log since 1.0.2, see:
- https://github.com/google/highway/releases/tag/1.0.3

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Check-for-the-presence-of-sys-auxv.h.patch |  62 -----------
 ...0001-Fix-compilation-for-armv7-with-gcc-8.patch |  46 ++++++++
 ...tion-for-armv7-targets-with-vfp-v4-and-gc.patch | 118 +++++++++++++++++++++
 package/highway/highway.hash                       |   2 +-
 package/highway/highway.mk                         |   5 +-
 5 files changed, 169 insertions(+), 64 deletions(-)

diff --git a/package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch b/package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch
deleted file mode 100644
index df86798613..0000000000
--- a/package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 491e3b1c2b8c44a2cfd35db117b02ef0fdf6a8e5 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Wed, 23 Nov 2022 23:27:11 +0100
-Subject: [PATCH] Check for the presence of <sys/auxv.h>
-
-Not all gcc versions are providing <sys/auxv.h>. Checking for
-HWY_ARCH_ARM && HWY_COMPILER_GCC_ACTUAL && HWY_OS_LINUX is not
-sufficient and fail to build in some situations (it was observed for
-some gcc armv7m toolchains).
-
-This patch adds a check for <sys/auxv.h> and include it only if present.
-
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- CMakeLists.txt       | 3 +++
- hwy/detect_targets.h | 2 +-
- hwy/targets.cc       | 2 +-
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b6b14ab..df6b5ab 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -84,6 +84,9 @@ check_cxx_source_compiles(
-   HWY_RISCV
- )
- 
-+include(CheckIncludeFile)
-+check_include_file(sys/auxv.h  HAVE_SYS_AUXV_H)
-+
- if (HWY_ENABLE_CONTRIB)
- # Glob all the traits so we don't need to modify this file when adding
- # additional special cases.
-diff --git a/hwy/detect_targets.h b/hwy/detect_targets.h
-index 7f7e179..f0c6f94 100644
---- a/hwy/detect_targets.h
-+++ b/hwy/detect_targets.h
-@@ -392,7 +392,7 @@
- #define HWY_HAVE_RUNTIME_DISPATCH 1
- // On Arm, currently only GCC does, and we require Linux to detect CPU
- // capabilities.
--#elif HWY_ARCH_ARM && HWY_COMPILER_GCC_ACTUAL && HWY_OS_LINUX
-+#elif HWY_ARCH_ARM && HWY_COMPILER_GCC_ACTUAL && HWY_OS_LINUX && HAVE_SYS_AUXV_H
- #define HWY_HAVE_RUNTIME_DISPATCH 1
- #else
- #define HWY_HAVE_RUNTIME_DISPATCH 0
-diff --git a/hwy/targets.cc b/hwy/targets.cc
-index 2fde4db..abd6a94 100644
---- a/hwy/targets.cc
-+++ b/hwy/targets.cc
-@@ -42,7 +42,7 @@
- #include <cpuid.h>
- #endif  // HWY_COMPILER_MSVC
- 
--#elif HWY_ARCH_ARM && HWY_OS_LINUX
-+#elif HWY_ARCH_ARM && HWY_OS_LINUX && HAVE_SYS_AUXV_H
- #include <asm/hwcap.h>
- #include <sys/auxv.h>
- #endif  // HWY_ARCH_*
--- 
-2.38.1
-
diff --git a/package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch b/package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch
new file mode 100644
index 0000000000..0634460453
--- /dev/null
+++ b/package/highway/0001-Fix-compilation-for-armv7-with-gcc-8.patch
@@ -0,0 +1,46 @@
+From 94cda9cc8cd12345a6dbe70e40f3119d5bf7ee78 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Fri, 10 Feb 2023 21:25:36 +0100
+Subject: [PATCH] Fix compilation for armv7 with gcc < 8
+
+Highway uses the construct __attribute__((target(+neon-vfpv4)) for
+Armv7. The target "+neon-vfpv4" was introduced in gcc 8, in commit [1].
+When using a gcc < 8 (for example, like [2]), compilation fails with
+message:
+
+    In file included from /build/highway-1.0.3/hwy/foreach_target.h:81:0,
+                     from /build/highway-1.0.3/hwy/per_target.cc:20:
+    /build/highway-1.0.3/hwy/per_target.cc: At global scope:
+    /build/highway-1.0.3/hwy/per_target.cc:23:22: error: attribute(target("+neon-vfpv4")) is unknown
+
+This commit protects the definition of HWY_TARGET_STR only when gcc
+version 8 or greater is used for armv7.
+
+[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=e87afe54b86c478ae63569e51e7abb67d3fe3fce
+[2] https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ hwy/ops/set_macros-inl.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/hwy/ops/set_macros-inl.h b/hwy/ops/set_macros-inl.h
+index 051dbb3..00b4b1b 100644
+--- a/hwy/ops/set_macros-inl.h
++++ b/hwy/ops/set_macros-inl.h
+@@ -230,7 +230,12 @@
+ // Can use pragmas instead of -march compiler flag
+ #if HWY_HAVE_RUNTIME_DISPATCH
+ #if HWY_ARCH_ARM_V7
++#if HWY_COMPILER_GCC_ACTUAL >= 800
++// The __attribute__((target(+neon-vfpv4)) was introduced in gcc >= 8.
++// In case we have a gcc < 8, we can still compile by keeping
++// HWY_TARGET_STR undefined.
+ #define HWY_TARGET_STR "+neon-vfpv4"
++#endif
+ #else
+ #define HWY_TARGET_STR "+crypto"
+ #endif  // HWY_ARCH_ARM_V7
+-- 
+2.39.2
+
diff --git a/package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch b/package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch
new file mode 100644
index 0000000000..f29b385501
--- /dev/null
+++ b/package/highway/0002-Fix-compilation-for-armv7-targets-with-vfp-v4-and-gc.patch
@@ -0,0 +1,118 @@
+From 93d4579f90dd6ad26fd0dcda6420b3bb2fdcbc02 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Mon, 20 Feb 2023 23:22:28 +0100
+Subject: [PATCH] Fix compilation for armv7 targets with vfp < v4 and gcc >= 8
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When using a armv7 gcc >= 8 toolchain (like [1]) with Highway
+configured with -DHWY_CMAKE_ARM7=OFF and HWY_ENABLE_CONTRIB=ON,
+compilation fails with error:
+
+    In file included from /build/highway-1.0.3/hwy/ops/arm_neon-inl.h:33,
+                     from /build/highway-1.0.3/hwy/highway.h:358,
+                     from /build/highway-1.0.3/hwy/contrib/sort/shared-inl.h:104,
+                     from /build/highway-1.0.3/hwy/contrib/sort/traits128-inl.h:27,
+                     from /build/highway-1.0.3/hwy/contrib/sort/vqsort_128d.cc:23,
+                     from /build/highway-1.0.3/hwy/foreach_target.h:81,
+                     from /build/highway-1.0.3/hwy/contrib/sort/vqsort_128d.cc:20:
+    /toolchain/lib/gcc/arm-buildroot-linux-gnueabihf/12.2.0/include/arm_neon.h: In function 'void hwy::N_NEON::StoreU(Vec128<long long unsigned int, 2>, Full128<long long unsigned int>, uint64_t*)':
+    /toolchain/lib/gcc/arm-buildroot-linux-gnueabihf/12.2.0/include/arm_neon.h:11052:1: error: inlining failed in call to 'always_inline' 'void vst1q_u64(uint64_t*, uint64x2_t)': target specific option mismatch
+    11052 | vst1q_u64 (uint64_t * __a, uint64x2_t __b)
+          | ^~~~~~~~~
+    /build/highway-1.0.3/hwy/ops/arm_neon-inl.h:2786:12: note: called from here
+     2786 |   vst1q_u64(unaligned, v.raw);
+          |   ~~~~~~~~~^~~~~~~~~~~~~~~~~~
+
+The same errors happen when configured with HWY_ENABLE_EXAMPLES=ON,
+or from client libraries like libjxl (at other places).
+
+The issue is that Highway Arm NEON ops have a dependency on the
+Advanced SIMD (Neon) v2 and the VFPv4 floating-point instructions.
+The SIMD (Neon) v1 and VFPv3 instructions are not supported.
+
+There was several attempts to fix variants of this issues.
+See #834 and #1032.
+
+HWY_NEON target is selected only if __ARM_NEON is defined. See:
+https://github.com/google/highway/blob/1.0.3/hwy/detect_targets.h#L251
+
+This test is not sufficient since __ARM_NEON will be predefined in
+any cases when Neon is enabled (neon-vfpv3, neon-vfpv4).
+
+The issue is that HWY_CMAKE_ARM7=ON implies VFPv4 / NEON SIMD v2.
+When setting HWY_CMAKE_ARM7=OFF, "neon-vfpv4" will not be forced,
+but the code is still using intrinsics assuming VFPv4. Gcc will fail
+with error because code cannot be generated for the selected
+architecture.
+
+This issue can be avoided by adding "-DHWY_DISABLED_TARGETS=HWY_NEON" in
+CXXFLAGS. The problem with this solution is that every client program will
+also need to do the same. This goes against the very purpose of
+"hwy/detect_targets.h".
+
+Technically, Armv7-a processors with VFPv4 can be detected using some
+ACLE (Arm C Language Extensions [2]) predefined macros:
+
+Basically, we want Highway to define HWY_NEON only when the target
+supports SIMDv2/VFPv4 or higher. An older target with vfpv3 only
+(e.g. Cortex-A8, A9, ...) would NOT define HWY_NEON, and therefore
+would fallback on HWY_SCALAR implementation.
+
+However, not all compiler completely support ACLE. There is also
+several versions too. So we cannot easily rely on macros like
+"__ARM_VFPV4__" (which clang predefine, but not gcc).
+
+The alternative solution proposed in this patch, is to declare the
+HWY_NEON target architecture as broken, when we detect the target is
+Armv7-A, but mandatory features for vfpv4 (namely half-float, FMA)
+are missing. Half-floats are tested using the macro __ARM_NEON_FP,
+and the FMA with the macro __ARM_FEATURE_FMA. See ACLE [2]. The
+intent of declaring the target as broken, rather than selecting
+HWY_NEON only if vfpv4 features are detected is to remain a bit
+conservative, since the detection is slithly inaccurate.
+
+For a given compiler/cflags, predefined macros for Arm/ACLE can be
+reviewed with commands like:
+
+    arm-linux-gnueabihf-gcc -mcpu=cortex-a9 -mfpu=neon-vfpv3 -Wp,-dM -E -c - < /dev/null | grep -Fi arm | sort
+    arm-linux-gnueabihf-gcc -mcpu=cortex-a7 -mfpu=neon-vfpv4 -Wp,-dM -E -c - < /dev/null | grep -Fi arm | sort
+    clang -target armv7a -mcpu=cortex-a9 -mfpu=neon-vfpv3 -mfloat-abi=hard -Wp,-dM -E -c - < /dev/null | grep -Fi arm | sort
+    clang -target armv7a -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -Wp,-dM -E -c - < /dev/null | grep -Fi arm | sort
+
+The different values of __ARM_NEON_FP can be seen, depending which
+"-mfpu" is passed. Same for __ARM_FEATURE_FMA.
+
+[1] https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--bleeding-edge-2022.08-1.tar.bz2
+[2] https://github.com/ARM-software/acle/
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ hwy/detect_targets.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/hwy/detect_targets.h b/hwy/detect_targets.h
+index 2beca95..40ae7fe 100644
+--- a/hwy/detect_targets.h
++++ b/hwy/detect_targets.h
+@@ -154,6 +154,16 @@
+      (defined(__BYTE_ORDER) && __BYTE_ORDER == __BIG_ENDIAN))
+ #define HWY_BROKEN_TARGETS (HWY_NEON)
+ 
++// armv7-a without a detected vfpv4 is not supported
++// (for example Cortex-A8, Cortex-A9)
++// vfpv4 always have neon half-float _and_ FMA.
++#elif HWY_ARCH_ARM_V7 && \
++    (__ARM_ARCH_PROFILE == 'A') && \
++    !defined(__ARM_VFPV4__) && \
++        !((__ARM_NEON_FP & 0x2 /* half-float */) && \
++          (__ARM_FEATURE_FMA == 1))
++#define HWY_BROKEN_TARGETS (HWY_NEON)
++
+ // SVE[2] require recent clang or gcc versions.
+ #elif (HWY_COMPILER_CLANG && HWY_COMPILER_CLANG < 1100) || \
+     (HWY_COMPILER_GCC_ACTUAL && HWY_COMPILER_GCC_ACTUAL < 1000)
+-- 
+2.39.2
+
diff --git a/package/highway/highway.hash b/package/highway/highway.hash
index 3ff468443e..16a9282176 100644
--- a/package/highway/highway.hash
+++ b/package/highway/highway.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e8ef71236ac0d97f12d553ec1ffc5b6375d57b5f0b860c7447dd69b6ed1072db  highway-1.0.2.tar.gz
+sha256  566fc77315878473d9a6bd815f7de78c73734acdcb745c3dde8579560ac5440e  highway-1.0.3.tar.gz
 sha256  43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1  LICENSE
diff --git a/package/highway/highway.mk b/package/highway/highway.mk
index ed7f6ca871..56d63a83f9 100644
--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIGHWAY_VERSION = 1.0.2
+HIGHWAY_VERSION = 1.0.3
 HIGHWAY_SITE = $(call github,google,highway,$(HIGHWAY_VERSION))
 HIGHWAY_LICENSE = Apache-2.0
 HIGHWAY_LICENSE_FILES = LICENSE
@@ -35,6 +35,9 @@ endif
 ifeq ($(BR2_ARM_FPU_VFPV4),y)
 HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=ON
 else
+# Highway Armv7 Neon support requires in fact vfpv4 / neon v2. When we
+# are in a vfpv3 case (e.g. Cortex-A8, Cortex-A9) this flag need to be
+# set to off.
 HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=OFF
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
