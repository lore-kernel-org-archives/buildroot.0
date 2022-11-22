Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3D6C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1FD4409F8;
	Tue, 22 Nov 2022 21:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1FD4409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPD25vRyD7TK; Tue, 22 Nov 2022 21:56:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F54404C1;
	Tue, 22 Nov 2022 21:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F54404C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BCB91BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56E9460B16
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56E9460B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTWLn-tOQUjC for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:56:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D530C60ADD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D530C60ADD
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:56:15 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.84.171])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8DA18B00579;
 Tue, 22 Nov 2022 22:56:11 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 22:55:56 +0100
Message-Id: <20221122215557.789750-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669154172;
 bh=0lHyHvEB6kmwxR/Szl6eyAPBS7yT8zeYiJnOIsPgFoQ=;
 h=From:To:Cc:Subject:Date:From;
 b=OKAKlsXeDln6zHAg3DfSkvBFb/tcPLnlSzW7IXBL+y2A1KzcFQQOHWxyeeOsxkrvr
 /6b37t8zMM8mgoO6mYeBDfDIY8T4uCWjT9P/YIS8wHtQ2p6Glzz1iV2MImsXpw9o+K
 KA+eYtE1Phi4jdgCJ2GppJ/BLwjD2JIB4W97+SnmF3E7jGlSrhP/S9CAfSsTzFTkPt
 sYUKmwAZrUGmqkuY7jKYGyMVCaBjF17jMHspZlKo5GYnS7SAHtuDpRgg+huUfSmx07
 cChoSmZd7ayeoNdtGhxTY9ezhf7ni5WTOoLAJmjUUcFx/d+4BEu7pFn+PWLJyvCR0f
 CjdL7bMA1JqFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OKAKlsXe
Subject: [Buildroot] [PATCH next 1/2] package/highway: new package
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
 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 package/highway/Config.in                     | 42 +++++++++++++++
 package/highway/highway.hash                  |  3 ++
 package/highway/highway.mk                    | 51 +++++++++++++++++++
 support/testing/tests/package/test_highway.py | 36 +++++++++++++
 6 files changed, 135 insertions(+)
 create mode 100644 package/highway/Config.in
 create mode 100644 package/highway/highway.hash
 create mode 100644 package/highway/highway.mk
 create mode 100644 support/testing/tests/package/test_highway.py

diff --git a/DEVELOPERS b/DEVELOPERS
index fb6b329087..fefb40c605 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1689,6 +1689,7 @@ F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
+F:	package/highway/
 F:	package/octave/
 F:	package/ola/
 F:	package/ptm2human/
@@ -1702,6 +1703,7 @@ F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
diff --git a/package/Config.in b/package/Config.in
index 7b18859d02..c127cd2477 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2005,6 +2005,7 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/gumbo-parser/Config.in"
+	source "package/highway/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libabseil-cpp/Config.in"
diff --git a/package/highway/Config.in b/package/highway/Config.in
new file mode 100644
index 0000000000..f9a0bc910c
--- /dev/null
+++ b/package/highway/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_HIGHWAY_ARCH_SUPPORTS
+	bool
+	# Supports all BR architectures by default, with few exceptions
+	default y
+	# Armv7 support is only with fpv4, see:
+	# https://github.com/google/highway/blob/1.0.1/CMakeLists.txt#L221
+	depends on !BR2_arm || BR2_ARM_FPU_VFPV4
+	# Risc-V support is 64 bit only, see:
+	# https://github.com/google/highway/blob/1.0.1/CMakeLists.txt#L228
+	depends on !BR2_RISCV_32
+
+config BR2_PACKAGE_HIGHWAY
+	bool "highway"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on BR2_INSTALL_LIBSTDCPP
+	# For gcc bug 58969, see:
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58969
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++11, GCC_BUG_58969
+	depends on BR2_PACKAGE_HIGHWAY_ARCH_SUPPORTS
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
index 0000000000..c85b0c065f
--- /dev/null
+++ b/support/testing/tests/package/test_highway.py
@@ -0,0 +1,36 @@
+import os
+
+import infra.basetest
+
+
+class TestHighway(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it is
+    # armv5, which is not supported by the package.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.79"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_HIGHWAY=y
+        BR2_PACKAGE_HIGHWAY_EXAMPLES=y
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M", "-initrd", img])
+        self.emulator.login()
+
+        self.assertRunOk("hwy_benchmark")
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
