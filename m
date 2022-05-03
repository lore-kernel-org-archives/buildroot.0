Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A0CC4321E
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6078183E2F;
	Tue,  3 May 2022 20:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8DCZPniVGiR; Tue,  3 May 2022 20:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D217F83E05;
	Tue,  3 May 2022 20:08:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9845C1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9420060E64
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwLjiw8fwl2n for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:08:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 204EE60B68
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:08:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C67ED852D8; Tue,  3 May 2022 19:58:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 22:04:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adb8399a9edfc2267817fa606d0d1b3c8628a371
X-Git-Newrev: 40ea68b4b2b5881badeb1204d688058495fda4bc
X-Patchwork-Hint: ignore
Message-Id: <20220503195814.C67ED852D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=40ea68b4b2b5881badeb1204d688058495fda4bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 ...1-Fix-BLAS-library-integer-size-detection.patch | 40 +++++++++++
 package/octave/Config.in                           | 39 +++++++++++
 package/octave/octave.hash                         |  3 +
 package/octave/octave.mk                           | 28 ++++++++
 support/testing/tests/package/test_octave.py       | 79 ++++++++++++++++++++++
 7 files changed, 192 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b0a682d376..292b919137 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1617,6 +1617,7 @@ F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
+F:	package/octave/
 F:	package/ola/
 F:	package/ptm2human/
 F:	package/python-distro/
@@ -1626,6 +1627,7 @@ F:	package/riscv-isa-sim/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
+F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 
diff --git a/package/Config.in b/package/Config.in
index 790dfea123..befeadc27b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -758,6 +758,7 @@ menu "Mono libraries/modules"
 endmenu
 endif
 	source "package/nodejs/Config.in"
+	source "package/octave/Config.in"
 	source "package/openjdk/Config.in"
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
diff --git a/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch b/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch
new file mode 100644
index 0000000000..3fb609de07
--- /dev/null
+++ b/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch
@@ -0,0 +1,40 @@
+From e4dcfefac4215ee66c3dda5b067dd6d06066b0a2 Mon Sep 17 00:00:00 2001
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
+index de7a00a330..383ce27b06 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -781,6 +781,12 @@ if test $ax_blas_ok = no || test $ax_lapack_ok = no; then
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
+2.36.0
+
diff --git a/package/octave/Config.in b/package/octave/Config.in
new file mode 100644
index 0000000000..171bdfa156
--- /dev/null
+++ b/package/octave/Config.in
@@ -0,0 +1,39 @@
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
+comment "octave needs a toolchain w/ C++ and fortran, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_HAS_FORTRAN
diff --git a/package/octave/octave.hash b/package/octave/octave.hash
new file mode 100644
index 0000000000..72d47cdf54
--- /dev/null
+++ b/package/octave/octave.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9e8d1f4d64fa1bcfa30a571e240dc83715dbaede1de96a982bdc89cac7ced42c  octave-7.1.0.tar.lz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
new file mode 100644
index 0000000000..4e828eb734
--- /dev/null
+++ b/package/octave/octave.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# octave
+#
+################################################################################
+
+OCTAVE_VERSION = 7.1.0
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
index 0000000000..31d0105503
--- /dev/null
+++ b/support/testing/tests/package/test_octave.py
@@ -0,0 +1,79 @@
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
+    timeout = 60
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
+
+        # Run some octave self tests
+        octave_modules = [
+            "elfun/atan2d",
+            "elfun/sind",
+            "general/gradient",
+            "general/num2str",
+            "polynomial/poly",
+            "signal/fftconv",
+            "special-matrix/magic",
+            "specfun/isprime",
+            "statistics/corr",
+            "strings/str2num"
+        ]
+
+        for mod in octave_modules:
+            cmd = self.octave_cmd('assert(test(\"{}\"),true)'.format(mod))
+            self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
