Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B221C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A75F6FBDB;
	Tue, 21 Feb 2023 01:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A75F6FBDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1FpvBXJZir3; Tue, 21 Feb 2023 01:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DEC6FFEA;
	Tue, 21 Feb 2023 01:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DEC6FFEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B774A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 247EB6FC0B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 247EB6FC0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNQ_CBaJns3o for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02C076FBFC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02C076FBFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00C4681979; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 15:03:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ea47e177f093d7378e8e8e1f50d6f4e3fce0a088
X-Git-Newrev: d4ecefa3ccbe29b1e047c97a995a7c966a191583
X-Patchwork-Hint: ignore
Message-Id: <20230220205247.00C4681979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/perftest: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4ecefa3ccbe29b1e047c97a995a7c966a191583
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Open Fabrics Performance Tests.

This is a collection of tests written over uverbs intended
for use as a performance micro-benchmark. The tests may be
used for HW or SW tuning as well as for functional testing.

https://github.com/linux-rdma/perftest

Tested-by: Shamraiz Ashraf <shamraizashraf092@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
[yann.morin.1998@free.fr
  - move all arch-related dependencies to _ARCH_SUPPORTS
  - include musl condition in comment and its dependnecies
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                     |  2 ++
 package/Config.in                              |  1 +
 package/perftest/Config.in                     | 41 ++++++++++++++++++++++
 package/perftest/perftest.hash                 |  3 ++
 package/perftest/perftest.mk                   | 15 ++++++++
 support/testing/tests/package/test_perftest.py | 48 ++++++++++++++++++++++++++
 6 files changed, 110 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 73905748ce..3eb7fba339 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1691,6 +1691,7 @@ F:	package/gnupg2/
 F:	package/glslsandbox-player/
 F:	package/octave/
 F:	package/ola/
+F:	package/perftest/
 F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
@@ -1708,6 +1709,7 @@ F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
+F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
diff --git a/package/Config.in b/package/Config.in
index 1f6db14d56..f32209db95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/oprofile/Config.in"
 	source "package/pax-utils/Config.in"
 	source "package/pcm-tools/Config.in"
+	source "package/perftest/Config.in"
 	source "package/piglit/Config.in"
 	source "package/ply/Config.in"
 	source "package/poke/Config.in"
diff --git a/package/perftest/Config.in b/package/perftest/Config.in
new file mode 100644
index 0000000000..25cd1a9b8d
--- /dev/null
+++ b/package/perftest/Config.in
@@ -0,0 +1,41 @@
+config BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
+	bool
+	# Accurate cycle measurement in perftest is implemented for a
+	# limited set of architectures, see:
+	# https://github.com/linux-rdma/perftest/blob/v4.5-0.20/src/get_clock.h
+	# Note: the package has also a fallback to use "asm/timex.h"
+	# from the Kernel, in
+	# "$(LINUX_DIR)/arch/$(KERNEL_ARCH)/include". It is not
+	# reflected here as this path is not well tested.
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && !BR2_ARM_CPU_ARMV6
+	default y if BR2_aarch64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_riscv
+	depends on BR2_USE_MMU # rdma-core
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # rdma-core
+
+config BR2_PACKAGE_PERFTEST
+	bool "perftest"
+	depends on BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # rdma-core
+	# musl does not define sysconf(_SC_LEVEL1_DCACHE_LINESIZE)
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_PCIUTILS
+	select BR2_PACKAGE_RDMA_CORE
+	help
+	  Open Fabrics Performance Tests.
+
+	  This is a collection of tests written over uverbs intended
+	  for use as a performance micro-benchmark. The tests may be
+	  used for HW or SW tuning as well as for functional testing.
+
+	  https://github.com/linux-rdma/perftest
+
+comment "perftest needs a glibc or uClibc toolchain w/ threads, dynamic library"
+	depends on BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
new file mode 100644
index 0000000000..4333231c44
--- /dev/null
+++ b/package/perftest/perftest.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  32e667dac1c0dd41a3951c5a54b961a8e28db5d9478caea2dfc268a312968c99  perftest-4.5-0.20.tar.gz
+sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
new file mode 100644
index 0000000000..7ad20d0974
--- /dev/null
+++ b/package/perftest/perftest.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perftest
+#
+################################################################################
+
+PERFTEST_VERSION = 4.5-0.20
+PERFTEST_SITE = $(call github,linux-rdma,perftest,v$(PERFTEST_VERSION))
+PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
+PERFTEST_LICENSE_FILES = COPYING
+PERFTEST_DEPENDENCIES = pciutils rdma-core
+# Fetched from Github, with no configure script
+PERFTEST_AUTORECONF = YES
+
+$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_perftest.py b/support/testing/tests/package/test_perftest.py
new file mode 100644
index 0000000000..680b70d784
--- /dev/null
+++ b/support/testing/tests/package/test_perftest.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestPerftest(infra.basetest.BRTest):
+
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.91"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_IPROUTE2=y
+        BR2_PACKAGE_LIBMNL=y
+        BR2_PACKAGE_RDMA_CORE=y
+        BR2_PACKAGE_PERFTEST=y
+        """.format(
+            infra.filepath("tests/package/test_rdma_core/linux-rdma.fragment")
+        )
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
+        # Add the rxe0 interface
+        self.assertRunOk("ip link set dev eth0 up")
+        self.assertRunOk("rdma link add rxe0 type rxe netdev eth0")
+
+        # start a server
+        self.assertRunOk("ib_read_bw > /dev/null 2>&1 &")
+
+        # start a client
+        self.assertRunOk("sleep 1 && ib_read_bw 127.0.0.1")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
