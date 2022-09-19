Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D516ECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 21:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB1541710;
	Mon, 19 Sep 2022 21:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFB1541710
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xigBhVDvuD25; Mon, 19 Sep 2022 21:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B7D1415D8;
	Mon, 19 Sep 2022 21:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B7D1415D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B97471BF39F
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 21:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94CA94016C
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 21:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94CA94016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPiEzkWc3xG0 for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 21:36:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F32F040140
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F32F040140
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 21:36:29 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.2.98])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BDC5619F396;
 Mon, 19 Sep 2022 23:36:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Sep 2022 23:36:16 +0200
Message-Id: <20220919213616.378496-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663623388;
 bh=3EcUZNQ+U6TfwQ3SkUB1PUnfA7aPWxfsy/uVI6AUmyk=;
 h=From:To:Cc:Subject:Date:From;
 b=Gkv6VyG5D+hUJ8nYuxzQH1fFX72yP9E5AZq99YliSAFWyhNwoZwOOmq20aUUCndPQ
 OvI0zVcuesQO887N4h6Zs7Lyl99n5neWQxFCtXj1bmTGdVcMFlwP31vR984mo61LSs
 wEyRIm65u/PkdtdL1Fy+EjXrprZLhTA0ioxTrL7djAQupiHppWDa6etoC6Uel9b22d
 6iD8FvNps49NXbj2JUY8z7s35v9htpoLfyb2GAqKdeg6HPz+nSXaxTnCnTFHPTf3Rr
 dQj9SQqJigM6ApPpP51i3UjN0Qd41L7KPYGYazGtOU8zf693RyRhcn4zifmbLJzviH
 59zNB/Zh21pEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Gkv6VyG5
Subject: [Buildroot] [PATCH v4 1/1] package/rdma-core: new package
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
Tested rdma-core package in qemu_aarch64_virt_defconfig.
Also tested on commit ce4b87b with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8  support/testing/tests/package/test_rdma_core.py
    [no-output]

    ./utils/test-pkg -p rdma-core
    ...
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_rdma_core.TestRdmaCore
    ...
    OK
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 package/rdma-core/Config.in                   | 22 ++++++
 package/rdma-core/rdma-core.hash              |  5 ++
 package/rdma-core/rdma-core.mk                | 24 ++++++
 package/rdma-core/readme.txt                  | 75 +++++++++++++++++++
 .../testing/tests/package/test_rdma_core.py   | 43 +++++++++++
 .../test_rdma_core/linux-rdma.fragment        |  9 +++
 8 files changed, 182 insertions(+)
 create mode 100644 package/rdma-core/Config.in
 create mode 100644 package/rdma-core/rdma-core.hash
 create mode 100644 package/rdma-core/rdma-core.mk
 create mode 100644 package/rdma-core/readme.txt
 create mode 100644 support/testing/tests/package/test_rdma_core.py
 create mode 100644 support/testing/tests/package/test_rdma_core/linux-rdma.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 14b91fca8d..c7262439f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1691,6 +1691,7 @@ F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-pyalsa/
+F:	package/rdma-core/
 F:	package/riscv-isa-sim/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
@@ -1703,6 +1704,8 @@ F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_rdma_core.py
+F:	support/testing/tests/package/test_rdma_core/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index 57c0e7959a..acd46d7435 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -567,6 +567,7 @@ endmenu
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
 	source "package/raspi-gpio/Config.in"
+	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
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
index 0000000000..65eec1ba8b
--- /dev/null
+++ b/package/rdma-core/rdma-core.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  cedfa57258d3cdfadecb7c4ddef43c2d47b874e83350495e601bfa4ace2d73a1  rdma-core-42.0.tar.gz
+sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
+sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
new file mode 100644
index 0000000000..6fd931960d
--- /dev/null
+++ b/package/rdma-core/rdma-core.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# rdma-core
+#
+################################################################################
+
+RDMA_CORE_VERSION = 42.0
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
index 0000000000..a50caa4fcb
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
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.68"
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
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
