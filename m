Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02273C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 22:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 974A68225D;
	Thu, 24 Nov 2022 22:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 974A68225D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ONAbfVX69XSY; Thu, 24 Nov 2022 22:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FAF88225A;
	Thu, 24 Nov 2022 22:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FAF88225A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E3611BF2B4
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 22:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65D718225A
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 22:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65D718225A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FY1dG19udVk4 for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 22:06:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4742D82259
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4742D82259
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 22:06:19 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.166.93])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C21F12003DA;
 Thu, 24 Nov 2022 23:06:14 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 23:05:52 +0100
Message-Id: <20221124220552.2836398-2-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124220552.2836398-1-ju.o@free.fr>
References: <20221124220552.2836398-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669327577;
 bh=yQ9CDDnMGVUqLtwxX9gau+1wrCa4D6A0ihxDwJT+IWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t43h/Pq/eK0At+PT6yDJSovtdGE0pwOLqxeSW56iJBTH+ellL2k2v5gJ35jedcc0s
 xhBfpvub9ItKeksULVsP+dM00Y/K7T4r8bxeVs/4K95iQn5JzUAghWENhx3vazEv2k
 XR6fgX5koY9SWg0BidAp7riUy3ykdGbbZMuGEjgK/ocEEUxj31Bjbcgy5IDldM0cjS
 aNEAevmFddoPqhYZYdnOH00ho30paERcNjxCOhH02iSSY65mcqGn0bNkCIUTCLuWzk
 IxmkqybUmKbjptpK9ryByk8eVqj0bBAmcOYfWgCMDYRz3JhVefsKs1JmXMGQnkIfwN
 ePtdYaJKfR13Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=t43h/Pq/
Subject: [Buildroot] [PATCH next v2 2/2] package/libjxl: new package
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

libjxl is the reference implementation of JPEG XL (encoder and decoder).

https://github.com/libjxl/libjxl

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- Included Thomas' comments:
- Removed: depends on BR2_PACKAGE_HIGHWAY_ARCH_SUPPORTS
- Added, to workaround build/link failures:
  - depends on !BR2_STATIC_LIBS
  - depends on !BR2_sh4
- Added missing Config.in comment
- Added optional libpng dependency, when selected

Tested on branch next at commit 1692691 with commands:

    make check-package
    ...
    0 warnings generated

    python -m flake8 support/testing/tests/package/test_libjxl.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_libjxl.TestLibJXL
    ...
    OK

    ./utils/test-pkg -a -p libjxl
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
                      bootlin-sh4-uclibc [20/44]: SKIPPED
                   bootlin-sparc64-glibc [21/44]: OK
                    bootlin-sparc-uclibc [22/44]: OK
                    bootlin-x86-64-glibc [23/44]: OK
                     bootlin-x86-64-musl [24/44]: OK
                   bootlin-x86-64-uclibc [25/44]: OK
                   bootlin-xtensa-uclibc [26/44]: FAILED
                            br-arm-basic [27/44]: SKIPPED
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
                     sourcery-arm-armv4t [39/44]: SKIPPED
                            sourcery-arm [40/44]: SKIPPED
                     sourcery-arm-thumb2 [41/44]: SKIPPED
                         sourcery-mips64 [42/44]: SKIPPED
                           sourcery-mips [43/44]: SKIPPED
                          sourcery-nios2 [44/44]: OK
44 builds, 11 skipped, 1 build failed, 0 legal-info failed, 0 show-info failed

Note: Failure of bootlin-xtensa-uclibc is a known issue unrelated to
this package.

Note 2: relaxing the arch dependencies of the highway and libjxl
packages revealed few bugs. Notably a gcc sh4 issue, and a libjxl
issue in static configuration with toolchains needing libatomic.
Those cases are just excluded for now.
---
 DEVELOPERS                                   |  2 +
 package/Config.in                            |  1 +
 package/libjxl/Config.in                     | 23 +++++++++
 package/libjxl/libjxl.hash                   |  4 ++
 package/libjxl/libjxl.mk                     | 33 ++++++++++++
 support/testing/tests/package/test_libjxl.py | 53 ++++++++++++++++++++
 6 files changed, 116 insertions(+)
 create mode 100644 package/libjxl/Config.in
 create mode 100644 package/libjxl/libjxl.hash
 create mode 100644 package/libjxl/libjxl.mk
 create mode 100644 support/testing/tests/package/test_libjxl.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 13655bfab4..6279ba6454 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1694,6 +1694,7 @@ F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/highway/
+F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
 F:	package/ptm2human/
@@ -1709,6 +1710,7 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/package/Config.in b/package/Config.in
index 0a06ebe978..1e539d7393 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1576,6 +1576,7 @@ menu "Graphics"
 	source "package/libgta/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
+	source "package/libjxl/Config.in"
 	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
 	source "package/libpng/Config.in"
diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
new file mode 100644
index 0000000000..6a15bde107
--- /dev/null
+++ b/package/libjxl/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_LIBJXL
+	bool "libjxl"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # highway
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # highway
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP # highway
+	# libjxl fail to link statically due to libatomic issue
+	depends on !BR2_STATIC_LIBS
+	# GCC bug on sh4: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81426
+	depends on !BR2_sh4
+	select BR2_PACKAGE_BROTLI
+	select BR2_PACKAGE_HIGHWAY
+	select BR2_PACKAGE_LCMS2
+	help
+	  libjxl is the reference implementation of JPEG XL (encoder
+	  and decoder).
+
+	  https://github.com/libjxl/libjxl
+
+comment "libjxl needs a toolchain with C++, threads, gcc >= 7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
new file mode 100644
index 0000000000..e71d32e61d
--- /dev/null
+++ b/package/libjxl/libjxl.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256  3114bba1fabb36f6f4adc2632717209aa6f84077bc4e93b420e0d63fa0455c5e  libjxl-0.7.0.tar.gz
+sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
+sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
new file mode 100644
index 0000000000..cc24ba258c
--- /dev/null
+++ b/package/libjxl/libjxl.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# libjxl
+#
+################################################################################
+
+LIBJXL_VERSION = 0.7.0
+LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
+LIBJXL_LICENSE = BSD-3-Clause
+LIBJXL_LICENSE_FILES = LICENSE PATENTS
+LIBJXL_CPE_ID_VENDOR = libjxl_project
+LIBJXL_INSTALL_STAGING = YES
+
+LIBJXL_DEPENDENCIES = \
+	brotli \
+	lcms2 \
+	highway
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBJXL_DEPENDENCIES += libpng
+endif
+
+LIBJXL_CONF_OPTS = \
+	-DJPEGXL_BUNDLE_LIBPNG=OFF \
+	-DJPEGXL_BUNDLE_SKCMS=OFF \
+	-DJPEGXL_ENABLE_DOXYGEN=OFF \
+	-DJPEGXL_ENABLE_JNI=OFF \
+	-DJPEGXL_ENABLE_MANPAGES=OFF \
+	-DJPEGXL_ENABLE_OPENEXR=OFF \
+	-DJPEGXL_ENABLE_SJPEG=OFF \
+	-DJPEGXL_ENABLE_SKCMS=OFF
+
+$(eval $(cmake-package))
diff --git a/support/testing/tests/package/test_libjxl.py b/support/testing/tests/package/test_libjxl.py
new file mode 100644
index 0000000000..b6d5ffc9ce
--- /dev/null
+++ b/support/testing/tests/package/test_libjxl.py
@@ -0,0 +1,53 @@
+import os
+
+import infra.basetest
+
+
+class TestLibJXL(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG is not used as it is armv5
+    # and the image encoding would take too long (several minutes).
+    # We also add GraphicsMagick to generate and compare images for
+    # the test.
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
+        BR2_PACKAGE_GRAPHICSMAGICK=y
+        BR2_PACKAGE_LIBJXL=y
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
+        ref = "/var/tmp/reference.ppm"
+        jxl = "/var/tmp/encoded.jxl"
+        dec = "/var/tmp/decoded.ppm"
+
+        cmd = "gm convert IMAGE:LOGO {}".format(ref)
+        self.assertRunOk(cmd)
+
+        cmd = "cjxl {} {}".format(ref, jxl)
+        self.assertRunOk(cmd, timeout=30)
+
+        cmd = "djxl {} {}".format(jxl, dec)
+        self.assertRunOk(cmd)
+
+        cmd = "gm compare -metric mse -maximum-error 1e-3 {} {}".format(
+            ref, dec)
+        self.assertRunOk(cmd)
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
