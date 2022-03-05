Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F8CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87F1040185;
	Sat,  5 Mar 2022 20:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEI4YOrnPhVl; Sat,  5 Mar 2022 20:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C30C4099A;
	Sat,  5 Mar 2022 20:07:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC971BF5B4
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 20:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C3E2813CB
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fm4cVbPwDytA for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 20:07:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73493813C0
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 20:07:51 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.173.103.93])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9EB15B004D5;
 Sat,  5 Mar 2022 21:07:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1646510868;
 bh=trwS33LN/V6OJz8CDUiLBGg18RTvE6Y8rrYgnD8LV64=;
 h=From:To:Cc:Subject:Date:From;
 b=KSIis5DBM/RbZF/rJaIy+3x9lEPvoSSMaIagQMRZOdXWbEgQNKDAlqMiyw+keRo33
 sRGugyV37mSm3+RXXmxoLpjjxo0TXuHYvlbaisXjc4rnEq4wrFC/qtzTHsUDHbakSf
 3hMtMsQgmQ7Zw/uF27r8eP9ONu9LWWlvuA8x4psKJ4GU4DIGCeP+FgROu+Mk80ppqm
 Iib7nNh3jY31iGtA2cg9fWr5XFrvkZFl6u38BW7hFVF7KOsMH2yKkWvMz/JaD4I9hH
 Xsi/hRvjkhYCTpwe+P6qoVG86tCa6NToioqSArCw4FMJZ2ToFExFP/YnVuWMroxWvz
 +EAoYpYm8E09Q==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  5 Mar 2022 21:07:30 +0100
Message-Id: <20220305200730.11060-1-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/octave: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GNU Octave is a high-level language, primarily intended for numerical
computations. It provides a convenient command line interface for
solving linear and nonlinear problems numerically, and for performing
other numerical experiments using a language that is mostly compatible
with Matlab. It may also be used as a batch-oriented language. Octave
has extensive tools for solving common numerical linear algebra
problems, finding the roots of nonlinear equations, integrating
ordinary functions, manipulating polynomials, and integrating ordinary
differential and differential-algebraic equations. It is easily
extensible and customizable via user-defined functions written in
Octave's own language, or using dynamically loaded modules written in
C++, C, Fortran, or other languages.

https://www.octave.org/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Package tested with:

   make check-package
   ...
   0 warnings generated

   ./utils/test-pkg -a -p octave
   ...
   45 builds, 35 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

   support/testing/run-tests \
       -d dl -o output_folder \
       tests.package.test_octave.TestOctave
   ...
   OK

From qemu_aarch64_virt_defconfig with Octave, on target:

   octave --eval 'oruntests general'
   ...
   [all general tests passed] 

---
 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 ...-BLAS-library-integer-size-detection.patch | 40 +++++++++++++
 package/octave/Config.in                      | 42 +++++++++++++
 package/octave/octave.hash                    |  3 +
 package/octave/octave.mk                      | 28 +++++++++
 support/testing/tests/package/test_octave.py  | 60 +++++++++++++++++++
 7 files changed, 176 insertions(+)
 create mode 100644 package/octave/0001-Fix-BLAS-library-integer-size-detection.patch
 create mode 100644 package/octave/Config.in
 create mode 100644 package/octave/octave.hash
 create mode 100644 package/octave/octave.mk
 create mode 100644 support/testing/tests/package/test_octave.py

diff --git a/DEVELOPERS b/DEVELOPERS
index b7a7c8771c..af35af0bd3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1611,6 +1611,7 @@ F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
+F:	package/octave/
 F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
@@ -1619,6 +1620,7 @@ F:	package/riscv-isa-sim/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
+F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 
diff --git a/package/Config.in b/package/Config.in
index 8d2d550a64..c87bf04a7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -756,6 +756,7 @@ menu "Mono libraries/modules"
 endmenu
 endif
 	source "package/nodejs/Config.in"
+	source "package/octave/Config.in"
 	source "package/openjdk/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch b/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch
new file mode 100644
index 0000000000..81126c99e7
--- /dev/null
+++ b/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch
@@ -0,0 +1,40 @@
+From 024bea5f3f78db166d3a97aca413cc2b96619673 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sat, 5 Mar 2022 12:36:09 +0100
+Subject: [PATCH] Fix BLAS library integer size detection
+
+When cross-compiling, octave ./configure script fails to detect the BLAS
+library integer size and fails with the message:
+
+    configure: error: unrecognized BLAS library integer size
+
+This patch fixes this detection.
+
+Patch adapted from:
+https://github.com/openembedded/meta-openembedded/commit/0ad153f721ef99de585c4452a997a7104f45d71d
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 31e656fa20..a6a6350b48 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -760,6 +760,12 @@ if test $ax_blas_ok = no || test $ax_lapack_ok = no; then
+   AC_MSG_ERROR([BLAS and LAPACK libraries are required])
+ fi
+ 
++if ac_fn_f77_try_run "$LINENO"; then :
++  ax_blas_integer_size=8
++else
++  ax_blas_integer_size=4
++fi
++
+ case $ax_blas_integer_size in
+   4)
+     HAVE_64_BIT_BLAS=no
+-- 
+2.35.1
+
diff --git a/package/octave/Config.in b/package/octave/Config.in
new file mode 100644
index 0000000000..b504310d19
--- /dev/null
+++ b/package/octave/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_OCTAVE
+	bool "octave"
+	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+	# Some Bootlin x86_64 toolchains (like version
+	# bleeding-edge-2021.11-1) has a file
+	# "x86_64-buildroot-linux-gnu/lib64/libgfortran.la" including
+	# a "dependency_libs=" entry with an incorrect absolute path
+	# to linquadmath.la on the bootlin build host. This breaks
+	# builds using libtool with libgfortran. Those toolchains are
+	# used by the "utils/test-pkg" script.
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BOOTLIN || !BR2_x86_64
+	select BR2_PACKAGE_OPENBLAS
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UTF
+	help
+	  GNU Octave is a high-level language, primarily intended for
+	  numerical computations. It provides a convenient command
+	  line interface for solving linear and nonlinear problems
+	  numerically, and for performing other numerical experiments
+	  using a language that is mostly compatible with Matlab. It
+	  may also be used as a batch-oriented language. Octave has
+	  extensive tools for solving common numerical linear algebra
+	  problems, finding the roots of nonlinear equations,
+	  integrating ordinary functions, manipulating polynomials,
+	  and integrating ordinary differential and
+	  differential-algebraic equations. It is easily extensible
+	  and customizable via user-defined functions written in
+	  Octave's own language, or using dynamically loaded modules
+	  written in C++, C, Fortran, or other languages.
+
+	  https://www.octave.org/
+
+comment "octave needs a toolchain w/ C++11 and fortran"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_HAS_FORTRAN
+
+comment "octave needs the openblas package"
+	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
diff --git a/package/octave/octave.hash b/package/octave/octave.hash
new file mode 100644
index 0000000000..62f6aa3e80
--- /dev/null
+++ b/package/octave/octave.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  40eaa1492ec1baf5084a1694288febdcba568838f4983450f8dac5819934059a  octave-6.4.0.tar.lz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
new file mode 100644
index 0000000000..6048305280
--- /dev/null
+++ b/package/octave/octave.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# octave
+#
+################################################################################
+
+OCTAVE_VERSION = 6.4.0
+OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
+OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
+OCTAVE_LICENSE = GPL-3.0+
+OCTAVE_LICENSE_FILES = COPYING
+OCTAVE_AUTORECONF = YES
+
+OCTAVE_CONF_OPTS = --disable-java
+
+OCTAVE_DEPENDENCIES = \
+	host-gperf \
+	openblas \
+	pcre
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+OCTAVE_CONF_OPTS += --enable-readline
+OCTAVE_DEPENDENCIES += readline
+else
+OCTAVE_CONF_OPTS += --disable-readline
+endif
+
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
new file mode 100644
index 0000000000..f218b219d8
--- /dev/null
+++ b/support/testing/tests/package/test_octave.py
@@ -0,0 +1,60 @@
+import os
+
+import infra.basetest
+
+
+class TestOctave(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
+    # not include gfortran.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.26"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_OCTAVE=y
+        """
+
+    def octave_cmd(self, octave_expr):
+        return "octave --quiet --eval '{}'".format(octave_expr)
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+        # Check Euler identity
+        cmd = self.octave_cmd("assert (exp(i*pi)+1, 0, 1e-10)")
+        self.assertRunOk(cmd)
+
+        # Solve equation system example from Octave homepage
+        octave_expr = "b = [4; 9; 2]; "
+        octave_expr += "A = [ 3 4 5; 1 3 1; 3 5 9 ]; "
+        octave_expr += "x = A \ b; "
+        octave_expr += "assert(x, [-1.5; 4; -1.5], 1e-10)"
+        cmd = self.octave_cmd(octave_expr)
+        self.assertRunOk(cmd)
+
+        # Check octave can fail
+        cmd = self.octave_cmd("assert(false)")
+        _, exit_code = self.emulator.run(cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # Check string output
+        string = "Hello World"
+        cmd = self.octave_cmd("printf(\"{}\\n\")".format(string))
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output, [string])
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
