Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91F3C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 11:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A83660A88;
	Sun, 27 Nov 2022 11:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A83660A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yk3UtkWr7sjJ; Sun, 27 Nov 2022 11:04:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C595E60AA4;
	Sun, 27 Nov 2022 11:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C595E60AA4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD961BF344
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 11:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6D8C40278
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 11:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6D8C40278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjLxHr_DMGCk for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 11:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38EAB40260
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38EAB40260
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 11:04:09 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.33.88])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 959A2780375;
 Sun, 27 Nov 2022 12:04:05 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 12:03:57 +0100
Message-Id: <20221127110358.495420-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669547047;
 bh=m1SXPUyDrv3qdxF+s7r6VTCbWAD4UzeBnP7ZD7+zIBU=;
 h=From:To:Cc:Subject:Date:From;
 b=ePUdNbwfmMwhlRKS71bQkNd5XPtsUnZCcCUZJpakuiOjj5R7d/+wJW7Ij7w0Uu/g+
 i2ltFBTnm+ffGOWdOYCbiJhmX5BBHUM02ppJInMD0KvxRl3L1ATSmAbkOKD0Zazjgz
 OCvYK2Eu1FxQTc1lNWhsAaNog4FrtWrb08qvpSweml5sB9/7dzFbv3l/FIE/o/QD6K
 iEueLRWRdKEsh+tQxZoVYlfp1vaPrFOgawc33hCtfeLKh/7m9alsKdxqQAUrAanypr
 b+xGxnrU5subUGAmo0qqGUhQMIE18aJfxUt0pEhfjNzgxtLrr/mCOP0icmixZTKNJC
 e7EhbFdFY0q1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ePUdNbwf
Subject: [Buildroot] [PATCH next v5 1/2] package/rdma-core: new package
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

This is the userspace components for the Linux Kernel's
drivers/infiniband subsystem.

https://github.com/linux-rdma/rdma-core

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v4 -> v5:
- Update rdma-core from v42.0 to v43.0
  Also add a patch to fix an issue introduced in v43.0
- Update kernel in test from 5.15.68 to 5.15.80
- v5 patch series now includes the perftest package

Changes v3 -> v4:
- Update kernel in test from 5.15.61 to 5.15.68
- Included Thomas' review comments:
  - Moved linux-rdma.fragment to test directory
  - Updated test script to reflect new file location
  - Fixed typo in readme.txt
  - Add a comment in Config.in describing when the
    "rdma" command is needed.

Changes v2 -> v3:
- Update package version from 41.0 to 42.0
- Update kernel in test from 5.15.48 to 5.15.61

Changes v1 -> v2:
- Update package version from 39.0 to 41.0
- Add test_rdma_core.py entry to DEVELOPERS file
- Update kernel in test from 5.15.30 to 5.15.48
- Moved Config.in rdma comment in main pkg description
---
Tested on branch next at commit c45b2f2 with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8  support/testing/tests/package/test_rdma_core.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_rdma_core.TestRdmaCore
    ...
    OK

    ./utils/test-pkg -a -p rdma-core
                             arm-aarch64 [ 1/44]: OK
                   bootlin-aarch64-glibc [ 2/44]: OK
               bootlin-arcle-hs38-uclibc [ 3/44]: OK
                    bootlin-armv5-uclibc [ 4/44]: OK
                     bootlin-armv7-glibc [ 5/44]: OK
                   bootlin-armv7m-uclibc [ 6/44]: SKIPPED
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
                    bootlin-sparc-uclibc [22/44]: SKIPPED
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: FAILED
                            br-arm-basic [27/44]: OK
                    br-arm-full-nothread [28/44]: SKIPPED
                      br-arm-full-static [29/44]: SKIPPED
                   br-i386-pentium4-full [30/44]: OK
                br-i386-pentium-mmx-musl [31/44]: OK
                      br-mips64-n64-full [32/44]: OK
                 br-mips64r6-el-hf-glibc [33/44]: OK
               br-powerpc-603e-basic-cpp [34/44]: OK
               br-powerpc64-power7-glibc [35/44]: OK
                       linaro-aarch64-be [36/44]: OK
                          linaro-aarch64 [37/44]: OK
                              linaro-arm [38/44]: OK
                     sourcery-arm-armv4t [39/44]: OK
                            sourcery-arm [40/44]: OK
                     sourcery-arm-thumb2 [41/44]: OK
                         sourcery-mips64 [42/44]: OK
                           sourcery-mips [43/44]: OK
                          sourcery-nios2 [44/44]: OK
44 builds, 5 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed

Note: Failure of bootlin-xtensa-uclibc is a known issue unrelated to
this package.
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...fix-build-on-MIPS-with-binutils-2.35.patch | 79 +++++++++++++++++++
 package/rdma-core/Config.in                   | 22 ++++++
 package/rdma-core/rdma-core.hash              |  5 ++
 package/rdma-core/rdma-core.mk                | 24 ++++++
 package/rdma-core/readme.txt                  | 75 ++++++++++++++++++
 .../testing/tests/package/test_rdma_core.py   | 43 ++++++++++
 .../test_rdma_core/linux-rdma.fragment        |  9 +++
 9 files changed, 261 insertions(+)
 create mode 100644 package/rdma-core/0001-util-mmio-fix-build-on-MIPS-with-binutils-2.35.patch
 create mode 100644 package/rdma-core/Config.in
 create mode 100644 package/rdma-core/rdma-core.hash
 create mode 100644 package/rdma-core/rdma-core.mk
 create mode 100644 package/rdma-core/readme.txt
 create mode 100644 support/testing/tests/package/test_rdma_core.py
 create mode 100644 support/testing/tests/package/test_rdma_core/linux-rdma.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index ab9cfe5ee9..429900a818 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1699,6 +1699,7 @@ F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-pyalsa/
+F:	package/rdma-core/
 F:	package/riscv-isa-sim/
 F:	package/tinycompress/
 F:	package/z3/
@@ -1713,6 +1714,8 @@ F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_rdma_core.py
+F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_z3.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/package/Config.in b/package/Config.in
index 1a2bda4639..8b507f67f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -571,6 +571,7 @@ endmenu
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
 	source "package/raspi-gpio/Config.in"
+	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
diff --git a/package/rdma-core/0001-util-mmio-fix-build-on-MIPS-with-binutils-2.35.patch b/package/rdma-core/0001-util-mmio-fix-build-on-MIPS-with-binutils-2.35.patch
new file mode 100644
index 0000000000..3cd0028e35
--- /dev/null
+++ b/package/rdma-core/0001-util-mmio-fix-build-on-MIPS-with-binutils-2.35.patch
@@ -0,0 +1,79 @@
+From 40d2c2587d2c2bc2fdd8b33b1b225f236ac00cfe Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sat, 26 Nov 2022 17:45:49 +0100
+Subject: [PATCH] util: mmio: fix build on MIPS with binutils >= 2.35
+
+rdma-core added udma_barrier support for MIPS in:
+https://github.com/linux-rdma/rdma-core/commit/b7c428344ea96d446f6ffe31c620a238a7f25c9e
+This commit is present in rdma-core version >= 43.0.
+See also: https://github.com/linux-rdma/rdma-core/pull/1225
+Before this commit, coherent dma support was disabled for MIPS.
+
+util/mmio.c functions are compiled when coherent dma support is enabled.
+They are always using indirect functions, to select at runtime the best
+function implementation. It is currently used for x86
+sse_mmio_write64_be(), and s390x mmio_memcpy_x64_mio(). In the MIPS
+case, there is ifunc used to always resolve the same function (namely,
+resolve_mmio_write64_be() will always select and return
+pthread_mmio_write64_be().
+
+rdma-core includes a detection of the compiler support for the ifunc
+attribute. See RDMA_Check_C_Compiles(HAVE_FUNC_ATTRIBUTE_IFUNC ...) in
+CMakeLists.txt. When the compiler does not support this attribute,
+rdma-core uses an assembler directive instead. This construct assumes
+that the toolchain and target architecture always support indirect
+functions. This is no longer the case with MIPS.
+
+Binutils, on its side, stopped accepting ifunc for MIPS, in commit:
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=8e4979ac1ea78147ecbcbf81af5e946873dda079
+This commit is present in binutils version >= 2.35.
+See also: https://sourceware.org/bugzilla/show_bug.cgi?id=25803
+We end up in a case where both the compiler and the assembler are not
+accepting indirect functions.
+
+Compiling rdma-core is such configuration (MIPS, rdma-core >= 43,
+binutils >= 2.35) fails with output:
+
+    /tmp/ccXXXXXX.s: Assembler messages:
+    /tmp/ccXXXXXX.s:10: Error: symbol type "gnu_indirect_function" is not supported by MIPS targets
+
+This patch adds a special case for MIPS in which mmio_write64_be()
+always uses pthread_mmio_write64_be(). It fixes the build issue to
+have DMA coherent primitives on MIPS while being compiled with
+binutils >= 2.35.
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ util/mmio.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/util/mmio.c b/util/mmio.c
+index 9c6eb053..62f7ac35 100644
+--- a/util/mmio.c
++++ b/util/mmio.c
+@@ -125,6 +125,15 @@ static bool have_sse(void)
+ 
+ #endif /* defined(__i386__) */
+ 
++#if defined(__mips__)
++
++void mmio_write64_be(void *addr, __be64 val)
++{
++	return pthread_mmio_write64_be(addr, val);
++}
++
++#else
++
+ typedef void (*write64_fn_t)(void *, __be64);
+ 
+ /* This uses the STT_GNU_IFUNC extension to have the dynamic linker select the
+@@ -147,4 +156,6 @@ write64_fn_t resolve_mmio_write64_be(void)
+ 	return &pthread_mmio_write64_be;
+ }
+ 
++#endif /* defined(__mips__) */
++
+ #endif /* SIZEOF_LONG != 8 */
+-- 
+2.38.1
+
diff --git a/package/rdma-core/Config.in b/package/rdma-core/Config.in
new file mode 100644
index 0000000000..437cf903ac
--- /dev/null
+++ b/package/rdma-core/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_RDMA_CORE
+	bool "rdma-core"
+	depends on BR2_USE_MMU # fork() used in rstream example
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBNL
+	help
+	  This is the userspace components for the Linux Kernel's
+	  drivers/infiniband subsystem.
+
+	  Note: The 'rdma' utility program is provided by the
+	  'iproute2' package, when compiled with the package 'libmnl'
+	  also selected. This program is needed to configure
+	  InfiniBand and RDMA networks from the command line.
+
+	  https://github.com/linux-rdma/rdma-core
+
+comment "rdma-core needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
new file mode 100644
index 0000000000..cefa04d8cd
--- /dev/null
+++ b/package/rdma-core/rdma-core.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  fcfb648c91698c0dc2ec8b738148de11e156bfc61acede049c0ee4070b79bc7d  rdma-core-43.0.tar.gz
+sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
+sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
new file mode 100644
index 0000000000..de087cd6f7
--- /dev/null
+++ b/package/rdma-core/rdma-core.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# rdma-core
+#
+################################################################################
+
+RDMA_CORE_VERSION = 43.0
+RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
+RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
+RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
+RDMA_CORE_DEPENDENCIES = libnl
+RDMA_CORE_INSTALL_STAGING = YES
+
+RDMA_CORE_CONF_OPTS = \
+	-DNO_MAN_PAGES=1 \
+	-DNO_PYVERBS=1
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+RDMA_CORE_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
+endif
+
+$(eval $(cmake-package))
diff --git a/package/rdma-core/readme.txt b/package/rdma-core/readme.txt
new file mode 100644
index 0000000000..9a95226ef4
--- /dev/null
+++ b/package/rdma-core/readme.txt
@@ -0,0 +1,75 @@
+Testing rdma-core userspace tools
+=================================
+
+Testing rdma-core using Linux software RoCE implementation:
+https://en.wikipedia.org/wiki/RDMA_over_Converged_Ethernet
+
+Using two systems with working TCP/IP configuration, for example:
+- Server IP: 192.168.123.10
+- Client IP: 192.168.123.20
+
+Make sure firewall configurations are appropriate. Routable RoCE v2
+uses udp/4791. ibv_rc_pingpong uses tcp/18515 for initial
+synchronization.
+
+Note: this test can be executed in two qemu virtual machines with
+bridged networking.
+
+
+Kernel configuration
+--------------------
+
+The Linux Kernel needs some InfiniBand configuration. In this example
+the kernel "rdma_rxe" driver is needed (CONFIG_RDMA_RXE=y). The Kernel
+config fragment file used for package test can be used as a starting
+point. See:
+
+    support/testing/tests/package/test_rdma_core/linux-rdma.fragment
+
+
+Buildroot package configuration
+-------------------------------
+
+For setting up a software RoCE link, the "rdma" program is needed. It
+is provided by the "iproute2" package, when "libmnl" is also
+selected. Make sure to have in your Buildroot configuration:
+
+    BR2_PACKAGE_IPROUTE2=y
+    BR2_PACKAGE_LIBMNL=y
+    BR2_PACKAGE_RDMA_CORE=y
+
+
+Setting up the rdma link
+------------------------
+
+On both server and client:
+
+    modprobe rdma_rxe
+    rdma link add rxe0 type rxe netdev eth0
+
+
+Testing with rping
+------------------
+
+On the server side, run the command:
+
+    rping -s -v
+
+On the client side, run the command:
+
+    rping -c -v -a 192.168.123.10
+
+
+Testing with ibv_rc_pingpong
+----------------------------
+
+To test with the pingpong example using the reliable connected (RC)
+transport:
+
+On the server side, run the command:
+
+    ibv_rc_pingpong -d rxe0 -g 1
+
+On the client side, run the command:
+
+    ibv_rc_pingpong -d rxe0 -g 1 192.168.123.10
diff --git a/support/testing/tests/package/test_rdma_core.py b/support/testing/tests/package/test_rdma_core.py
new file mode 100644
index 0000000000..0ae3778f9f
--- /dev/null
+++ b/support/testing/tests/package/test_rdma_core.py
@@ -0,0 +1,43 @@
+import os
+
+import infra.basetest
+
+
+class TestRdmaCore(infra.basetest.BRTest):
+
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.80"
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
+        self.assertRunOk("rdma link add rxe0 type rxe netdev eth0")
+
+        # ibv_devinfo returns 255 if no devices are found
+        self.assertRunOk("ibv_devinfo -v")
diff --git a/support/testing/tests/package/test_rdma_core/linux-rdma.fragment b/support/testing/tests/package/test_rdma_core/linux-rdma.fragment
new file mode 100644
index 0000000000..e305f27e62
--- /dev/null
+++ b/support/testing/tests/package/test_rdma_core/linux-rdma.fragment
@@ -0,0 +1,9 @@
+CONFIG_INFINIBAND=m
+CONFIG_INFINIBAND_USER_MAD=m
+CONFIG_INFINIBAND_USER_ACCESS=m
+CONFIG_RDMA_RXE=m
+CONFIG_INFINIBAND_IPOIB=m
+CONFIG_INFINIBAND_IPOIB_CM=y
+CONFIG_INFINIBAND_IPOIB_DEBUG_DATA=y
+CONFIG_INFINIBAND_RTRS_CLIENT=m
+CONFIG_INFINIBAND_RTRS_SERVER=m
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
