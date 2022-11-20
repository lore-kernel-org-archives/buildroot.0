Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC71DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 13:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 344E9401F1;
	Sun, 20 Nov 2022 13:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 344E9401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KwHYtSf5mvS; Sun, 20 Nov 2022 13:56:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2487640117;
	Sun, 20 Nov 2022 13:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2487640117
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B19FD1BF475
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 13:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 869E840143
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 13:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 869E840143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LTLGQJttqSNs for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 13:56:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A9324010C
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 13:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A9324010C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 522B183FD2; Sun, 20 Nov 2022 13:56:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 14:54:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4f4f2877fcd76ec3b1b3ad56d235ad3bd375e071
X-Git-Newrev: 2ad68ff8df71a485085b0b83ff494081e4d926b7
X-Patchwork-Hint: ignore
Message-Id: <20221120135623.522B183FD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/z3: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ad68ff8df71a485085b0b83ff494081e4d926b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Z3, also known as the Z3 Theorem Prover, is a cross-platform
satisfiability modulo theories (SMT) solver.

https://github.com/Z3Prover/z3

Signed-off-by: Julien Olivain <ju.o@free.fr>
[yann.morin.1998@free.fr:
  - python bindings 'depends on' python, not 'select' it
  - fix check-package in test_z3.py
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 +
 package/Config.in                                  |  1 +
 package/z3/Config.in                               | 23 +++++++++++
 package/z3/z3.hash                                 |  3 ++
 package/z3/z3.mk                                   | 22 +++++++++++
 support/testing/tests/package/test_z3.py           | 44 ++++++++++++++++++++++
 .../package/test_z3/rootfs-overlay/root/z3test.py  | 21 +++++++++++
 .../test_z3/rootfs-overlay/root/z3test.smt2        |  8 ++++
 8 files changed, 124 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bc026da4aa..fb6b329087 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1697,6 +1697,7 @@ F:	package/python-gnupg/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
 F:	package/tinycompress/
+F:	package/z3/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
@@ -1708,6 +1709,7 @@ F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_z3.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index c448e8bd97..7b18859d02 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2190,6 +2190,7 @@ menu "Miscellaneous"
 	source "package/wine/Config.in"
 	source "package/xmrig/Config.in"
 	source "package/xutil_util-macros/Config.in"
+	source "package/z3/Config.in"
 endmenu
 
 menu "Networking applications"
diff --git a/package/z3/Config.in b/package/z3/Config.in
new file mode 100644
index 0000000000..55b0e8bb3b
--- /dev/null
+++ b/package/z3/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_Z3
+	bool "z3"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # c++17
+	# z3 needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
+	depends on !BR2_nios2
+	help
+	  Z3, also known as the Z3 Theorem Prover, is a cross-platform
+	  satisfiability modulo theories (SMT) solver.
+
+	  https://github.com/Z3Prover/z3
+
+if BR2_PACKAGE_Z3
+
+config BR2_PACKAGE_Z3_PYTHON
+	bool "Python bindings"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+
+endif
diff --git a/package/z3/z3.hash b/package/z3/z3.hash
new file mode 100644
index 0000000000..d38c5f1971
--- /dev/null
+++ b/package/z3/z3.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e3a82431b95412408a9c994466fad7252135c8ed3f719c986cd75c8c5f234c7e  z3-4.11.2.tar.gz
+sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
new file mode 100644
index 0000000000..2252e05395
--- /dev/null
+++ b/package/z3/z3.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# z3
+#
+################################################################################
+
+Z3_VERSION = 4.11.2
+Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
+Z3_LICENSE = MIT
+Z3_LICENSE_FILES = LICENSE.txt
+Z3_INSTALL_STAGING = YES
+Z3_SUPPORTS_IN_SOURCE_BUILD = NO
+
+ifeq ($(BR2_PACKAGE_Z3_PYTHON),y)
+Z3_CONF_OPTS += \
+	-DCMAKE_INSTALL_PYTHON_PKG_DIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	-DZ3_BUILD_PYTHON_BINDINGS=ON
+else
+Z3_CONF_OPTS += -DZ3_BUILD_PYTHON_BINDINGS=OFF
+endif
+
+$(eval $(cmake-package))
diff --git a/support/testing/tests/package/test_z3.py b/support/testing/tests/package/test_z3.py
new file mode 100644
index 0000000000..71b074a587
--- /dev/null
+++ b/support/testing/tests/package/test_z3.py
@@ -0,0 +1,44 @@
+import os
+
+import infra.basetest
+
+
+class TestZ3(infra.basetest.BRTest):
+    # Need to use a different toolchain than the default due to
+    # z3 requiring fenv.h not provided by uclibc.
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_Z3=y
+        BR2_PACKAGE_Z3_PYTHON=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           # overlay to add a z3 smt and python test scripts
+           infra.filepath("tests/package/test_z3/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check program executes
+        cmd = "z3 --version"
+        self.assertRunOk(cmd)
+
+        # Run a basic smt2 example
+        cmd = "z3 /root/z3test.smt2"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "unsat")
+
+        # Run a basic python example
+        cmd = "/root/z3test.py"
+        self.assertRunOk(cmd, timeout=10)
diff --git a/support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py b/support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py
new file mode 100755
index 0000000000..98b8e57b56
--- /dev/null
+++ b/support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py
@@ -0,0 +1,21 @@
+#! /usr/bin/env python3
+
+import z3
+
+x = z3.Real('x')
+y = z3.Real('y')
+z = z3.Real('z')
+s = z3.Solver()
+
+s.add(3 * x + 2 * y - z == 1)
+s.add(2 * x - 2 * y + 4 * z == -2)
+s.add(-x + y / 2 - z == 0)
+
+check = s.check()
+model = s.model()
+
+print(check)
+print(model)
+
+assert check == z3.sat
+assert model[x] == 1 and model[y] == -2 and model[z] == -2
diff --git a/support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.smt2 b/support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.smt2
new file mode 100644
index 0000000000..08df9e27a2
--- /dev/null
+++ b/support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.smt2
@@ -0,0 +1,8 @@
+; From https://smtlib.cs.uiowa.edu/examples.shtml
+; Basic Boolean example
+(set-option :print-success false)
+(set-logic QF_UF)
+(declare-const p Bool)
+(assert (and p (not p)))
+(check-sat) ; returns 'unsat'
+(exit)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
