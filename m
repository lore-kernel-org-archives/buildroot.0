Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E9EC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 22:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFB6F4112B;
	Thu, 24 Nov 2022 22:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFB6F4112B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5oeETX5Rhht; Thu, 24 Nov 2022 22:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B4F94115D;
	Thu, 24 Nov 2022 22:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B4F94115D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BEA971BF2B4
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 22:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9473641C54
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 22:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9473641C54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 365r3p3peXL3 for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 22:06:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2679341BFE
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2679341BFE
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 22:06:15 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.166.93])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id D3F832003E3;
 Thu, 24 Nov 2022 23:06:10 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 23:05:51 +0100
Message-Id: <20221124220552.2836398-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669327572;
 bh=teflkn8dxJ7QfK/ipcFnbCsaPKS86fKZk5qgWK700N4=;
 h=From:To:Cc:Subject:Date:From;
 b=XPLs/BnrZitqjVyMBKZCva6bHsLVbhm4+s/i1nGmTGNp6mSYe+r0B291CA4/+aql1
 wFtn7aR96jFgf/vd8E706ag15txda3nzqm0H5sohWNFDkkBQ38JXEIw2fl9tKTlLmp
 xwYoTOFNv6Gtbxoy/SaaOPaax4NeG+oqXRWdCXEj40on4846bVXGgRERYTKZDi5W/g
 HcAAuRvyFKvWbVDHSksGE+x+qNH2WgvVfDcl5AhytBNFLsF105+CO6YfjVpftHGarN
 n5QkyTsdilcPSf0x5afBsTbLc8aY2xPEFUp8u4gf6I4XYEYZhxHihmkrso1lKEaa6z
 zcHhbiZ4q01jA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XPLs/Bnr
Subject: [Buildroot] [PATCH next v2 1/2] package/highway: new package
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Highway is a C++ library that provides portable SIMD/vector intrinsics.

https://github.com/google/highway

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Included Thomas' comments:
- Removed _ARCH_SUPPORTS
- Removed depends on !BR2_arm || BR2_ARM_FPU_VFPV4
  The package will not attempt to build on all arm arch.
- Removed depends on !BR2_RISCV_32
  Highway 1.0.2 supports rv32
- Add a patch to better handle arm toolchains
  not providing <sys/auxv.h>
- Rewrote and simplified the runtime test to now use the
  armv5 default basic config.

Tested on branch next at commit 1692691 with commands:

    make check-package
    ...
    0 warnings generated

    python -m flake8 support/testing/tests/package/test_highway.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_highway.TestHighway
    ...
    OK

    ./utils/test-pkg -a -p highway
                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: OK
                      bootlin-armv7-musl [ 7/44]: OK
                bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/44]: OK
             bootlin-microblazeel-uclibc [10/44]: OK
                bootlin-mipsel32r6-glibc [11/44]: OK
                   bootlin-mipsel-uclibc [12/44]: OK
                     bootlin-nios2-glibc [13/44]: OK
                 bootlin-openrisc-uclibc [14/44]: OK
        bootlin-powerpc64le-power8-glibc [15/44]: OK
           bootlin-powerpc-e500mc-uclibc [16/44]: OK
                   bootlin-riscv32-glibc [17/44]: OK
                   bootlin-riscv64-glibc [18/44]: OK
                    bootlin-riscv64-musl [19/44]: OK
                      bootlin-sh4-uclibc [20/44]: OK
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: OK
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: FAILED
                            br-arm-basic [27/44]: SKIPPED
                    br-arm-full-nothread [28/44]: OK
                      br-arm-full-static [29/44]: OK
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: SKIPPED
                            sourcery-arm [40/44]: SKIPPED
                     sourcery-arm-thumb2 [41/44]: SKIPPED
                         sourcery-mips64 [42/44]: SKIPPED
                           sourcery-mips [43/44]: SKIPPED
                          sourcery-nios2 [44/44]: OK
44 builds, 7 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed

Note: Failure of bootlin-xtensa-uclibc is a known issue unrelated to
this package.
---
 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 ...Check-for-the-presence-of-sys-auxv.h.patch | 62 +++++++++++++++++++
 package/highway/Config.in                     | 30 +++++++++
 package/highway/highway.hash                  |  3 +
 package/highway/highway.mk                    | 51 +++++++++++++++
 support/testing/tests/package/test_highway.py | 22 +++++++
 7 files changed, 171 insertions(+)
 create mode 100644 package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch
 create mode 100644 package/highway/Config.in
 create mode 100644 package/highway/highway.hash
 create mode 100644 package/highway/highway.mk
 create mode 100644 support/testing/tests/package/test_highway.py

diff --git a/DEVELOPERS b/DEVELOPERS
index a2c60f38fd..13655bfab4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1693,6 +1693,7 @@ F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
+F:	package/highway/
 F:	package/octave/
 F:	package/ola/
 F:	package/ptm2human/
@@ -1706,6 +1707,7 @@ F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
diff --git a/package/Config.in b/package/Config.in
index 7ad7e2d487..0a06ebe978 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2007,6 +2007,7 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/gumbo-parser/Config.in"
+	source "package/highway/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libabseil-cpp/Config.in"
diff --git a/package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch b/package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch
new file mode 100644
index 0000000000..df86798613
--- /dev/null
+++ b/package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch
@@ -0,0 +1,62 @@
+From 491e3b1c2b8c44a2cfd35db117b02ef0fdf6a8e5 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Wed, 23 Nov 2022 23:27:11 +0100
+Subject: [PATCH] Check for the presence of <sys/auxv.h>
+
+Not all gcc versions are providing <sys/auxv.h>. Checking for
+HWY_ARCH_ARM && HWY_COMPILER_GCC_ACTUAL && HWY_OS_LINUX is not
+sufficient and fail to build in some situations (it was observed for
+some gcc armv7m toolchains).
+
+This patch adds a check for <sys/auxv.h> and include it only if present.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ CMakeLists.txt       | 3 +++
+ hwy/detect_targets.h | 2 +-
+ hwy/targets.cc       | 2 +-
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b6b14ab..df6b5ab 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -84,6 +84,9 @@ check_cxx_source_compiles(
+   HWY_RISCV
+ )
+ 
++include(CheckIncludeFile)
++check_include_file(sys/auxv.h  HAVE_SYS_AUXV_H)
++
+ if (HWY_ENABLE_CONTRIB)
+ # Glob all the traits so we don't need to modify this file when adding
+ # additional special cases.
+diff --git a/hwy/detect_targets.h b/hwy/detect_targets.h
+index 7f7e179..f0c6f94 100644
+--- a/hwy/detect_targets.h
++++ b/hwy/detect_targets.h
+@@ -392,7 +392,7 @@
+ #define HWY_HAVE_RUNTIME_DISPATCH 1
+ // On Arm, currently only GCC does, and we require Linux to detect CPU
+ // capabilities.
+-#elif HWY_ARCH_ARM && HWY_COMPILER_GCC_ACTUAL && HWY_OS_LINUX
++#elif HWY_ARCH_ARM && HWY_COMPILER_GCC_ACTUAL && HWY_OS_LINUX && HAVE_SYS_AUXV_H
+ #define HWY_HAVE_RUNTIME_DISPATCH 1
+ #else
+ #define HWY_HAVE_RUNTIME_DISPATCH 0
+diff --git a/hwy/targets.cc b/hwy/targets.cc
+index 2fde4db..abd6a94 100644
+--- a/hwy/targets.cc
++++ b/hwy/targets.cc
+@@ -42,7 +42,7 @@
+ #include <cpuid.h>
+ #endif  // HWY_COMPILER_MSVC
+ 
+-#elif HWY_ARCH_ARM && HWY_OS_LINUX
++#elif HWY_ARCH_ARM && HWY_OS_LINUX && HAVE_SYS_AUXV_H
+ #include <asm/hwcap.h>
+ #include <sys/auxv.h>
+ #endif  // HWY_ARCH_*
+-- 
+2.38.1
+
diff --git a/package/highway/Config.in b/package/highway/Config.in
new file mode 100644
index 0000000000..23861f0b94
--- /dev/null
+++ b/package/highway/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_HIGHWAY
+	bool "highway"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_INSTALL_LIBSTDCPP
+	# For gcc bug 58969, see:
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58969
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++11, GCC_BUG_58969
+	help
+	  Highway is a C++ library that provides portable SIMD/vector
+	  intrinsics.
+
+	  https://github.com/google/highway
+
+if BR2_PACKAGE_HIGHWAY
+
+config BR2_PACKAGE_HIGHWAY_CONTRIB
+	bool "Enable Contrib"
+	help
+	  Build Highway contrib library which contains extra
+	  SIMD-related utilities: an image class with aligned rows, a
+	  math library (16 functions already implemented, mostly
+	  trigonometry), and functions for computing dot products and
+	  sorting.
+
+config BR2_PACKAGE_HIGHWAY_EXAMPLES
+	bool "Enable Examples"
+	help
+	  Build Highway examples
+
+endif
diff --git a/package/highway/highway.hash b/package/highway/highway.hash
new file mode 100644
index 0000000000..3ff468443e
--- /dev/null
+++ b/package/highway/highway.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  e8ef71236ac0d97f12d553ec1ffc5b6375d57b5f0b860c7447dd69b6ed1072db  highway-1.0.2.tar.gz
+sha256  43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1  LICENSE
diff --git a/package/highway/highway.mk b/package/highway/highway.mk
new file mode 100644
index 0000000000..cf93ff1051
--- /dev/null
+++ b/package/highway/highway.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# highway
+#
+################################################################################
+
+HIGHWAY_VERSION = 1.0.2
+HIGHWAY_SITE = $(call github,google,highway,$(HIGHWAY_VERSION))
+HIGHWAY_LICENSE = Apache-2.0
+HIGHWAY_LICENSE_FILES = LICENSE
+HIGHWAY_INSTALL_STAGING = YES
+
+HIGHWAY_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_PACKAGE_HIGHWAY_CONTRIB),y)
+HIGHWAY_CONF_OPTS += -DHWY_ENABLE_CONTRIB=ON
+else
+HIGHWAY_CONF_OPTS += -DHWY_ENABLE_CONTRIB=OFF
+endif
+
+# Examples are not installed by cmake. This binary can be useful for
+# quick testing and debug.
+define HIGHWAY_INSTALL_EXAMPLES
+	$(INSTALL) -m 0755 \
+		$(@D)/examples/hwy_benchmark \
+		$(TARGET_DIR)/usr/bin/hwy_benchmark
+endef
+
+ifeq ($(BR2_PACKAGE_HIGHWAY_EXAMPLES),y)
+HIGHWAY_CONF_OPTS += -DHWY_ENABLE_EXAMPLES=ON
+HIGHWAY_POST_INSTALL_TARGET_HOOKS += HIGHWAY_INSTALL_EXAMPLES
+else
+HIGHWAY_CONF_OPTS += -DHWY_ENABLE_EXAMPLES=OFF
+endif
+
+ifeq ($(BR2_ARM_FPU_VFPV4),y)
+HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=ON
+else
+HIGHWAY_CONF_OPTS += -DHWY_CMAKE_ARM7=OFF
+endif
+
+# Workaround for gcc bug 104028 on m68k.
+# See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
+HIGHWAY_CXXFLAGS += -O0
+endif
+
+HIGHWAY_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(HIGHWAY_CXXFLAGS)"
+
+$(eval $(cmake-package))
diff --git a/support/testing/tests/package/test_highway.py b/support/testing/tests/package/test_highway.py
new file mode 100644
index 0000000000..f32363e26f
--- /dev/null
+++ b/support/testing/tests/package/test_highway.py
@@ -0,0 +1,22 @@
+import os
+
+import infra.basetest
+
+
+class TestHighway(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HIGHWAY=y
+        BR2_PACKAGE_HIGHWAY_EXAMPLES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("hwy_benchmark", timeout=20)
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
