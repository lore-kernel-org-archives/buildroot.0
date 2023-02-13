Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B8BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD13A700A6;
	Tue, 21 Feb 2023 01:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD13A700A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udzDmoRWfoU0; Tue, 21 Feb 2023 01:58:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA8970162;
	Tue, 21 Feb 2023 01:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AA8970162
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D66F01BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F7DA70035
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F7DA70035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lq5C7Hr_LrvG for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 829D37001C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 829D37001C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72B05828C8; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 23:18:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 89710c804ede6879db45c8e41aca3607bd2bb051
X-Git-Newrev: 4733f9bd5774171b8309e5c42e0419a0e8264308
X-Patchwork-Hint: ignore
Message-Id: <20230220205259.72B05828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/highway: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4733f9bd5774171b8309e5c42e0419a0e8264308
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Highway is a C++ library that provides portable SIMD/vector intrinsics.

https://github.com/google/highway

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 ...0001-Check-for-the-presence-of-sys-auxv.h.patch | 62 ++++++++++++++++++++++
 package/highway/Config.in                          | 34 ++++++++++++
 package/highway/highway.hash                       |  3 ++
 package/highway/highway.mk                         | 50 +++++++++++++++++
 support/testing/tests/package/test_highway.py      | 22 ++++++++
 7 files changed, 174 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index dcc607ba60..28cad8f58f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1687,6 +1687,7 @@ F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/gnupg2/
+F:	package/highway/
 F:	package/octave/
 F:	package/ola/
 F:	package/perftest/
@@ -1709,6 +1710,7 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_gnupg2.py
+F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
diff --git a/package/Config.in b/package/Config.in
index 511e691ed3..d205bcd816 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2034,6 +2034,7 @@ menu "Other"
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
index 0000000000..f4cef30e01
--- /dev/null
+++ b/package/highway/Config.in
@@ -0,0 +1,34 @@
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
+
+comment "highway needs a toolchain w/ C++, gcc >= 7"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
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
index 0000000000..ed7f6ca871
--- /dev/null
+++ b/package/highway/highway.mk
@@ -0,0 +1,50 @@
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
+ifeq ($(BR2_PACKAGE_HIGHWAY_EXAMPLES),y)
+HIGHWAY_CONF_OPTS += -DHWY_ENABLE_EXAMPLES=ON
+# Examples are not installed by cmake. This binary can be useful for
+# quick testing and debug.
+define HIGHWAY_INSTALL_EXAMPLES
+	$(INSTALL) -m 0755 \
+		$(@D)/examples/hwy_benchmark \
+		$(TARGET_DIR)/usr/bin/hwy_benchmark
+endef
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
