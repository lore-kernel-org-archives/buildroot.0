Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846E2C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 351E77020B;
	Tue, 21 Feb 2023 01:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 351E77020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GECAIXorZNkt; Tue, 21 Feb 2023 01:58:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA05700BC;
	Tue, 21 Feb 2023 01:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DA05700BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D98421BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B164870038
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B164870038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KctmhIK8ZjKb for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9441570028
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9441570028
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 837B27FF06; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 23:18:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4733f9bd5774171b8309e5c42e0419a0e8264308
X-Git-Newrev: e648d399d8bd609697e78f13f7fa76be06d91a57
X-Patchwork-Hint: ignore
Message-Id: <20230220205259.837B27FF06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libjxl: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e648d399d8bd609697e78f13f7fa76be06d91a57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libjxl is the reference implementation of JPEG XL (encoder and decoder).

https://github.com/libjxl/libjxl

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  2 ++
 package/Config.in                            |  1 +
 package/libjxl/Config.in                     | 25 +++++++++++++
 package/libjxl/libjxl.hash                   |  4 +++
 package/libjxl/libjxl.mk                     | 33 +++++++++++++++++
 support/testing/tests/package/test_libjxl.py | 53 ++++++++++++++++++++++++++++
 toolchain/Config.in                          |  5 +++
 7 files changed, 123 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 28cad8f58f..df2b98ad53 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1688,6 +1688,7 @@ F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/gnupg2/
 F:	package/highway/
+F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
 F:	package/perftest/
@@ -1712,6 +1713,7 @@ F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
diff --git a/package/Config.in b/package/Config.in
index d205bcd816..fff2fb7a93 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1603,6 +1603,7 @@ menu "Graphics"
 	source "package/libgta/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
+	source "package/libjxl/Config.in"
 	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
 	source "package/libpng/Config.in"
diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
new file mode 100644
index 0000000000..da04b89f9b
--- /dev/null
+++ b/package/libjxl/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_LIBJXL
+	bool "libjxl"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # highway
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # highway
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP # highway
+	# libjxl fail to link statically due to libatomic issue
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_81426
+	select BR2_PACKAGE_BROTLI
+	select BR2_PACKAGE_HIGHWAY
+	select BR2_PACKAGE_LCMS2
+	help
+	  libjxl is the reference implementation of JPEG XL (encoder
+	  and decoder).
+
+	  https://github.com/libjxl/libjxl
+
+comment "libjxl needs a toolchain with C++, threads, gcc >= 7, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_81426
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
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
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 01215e0e96..08e4ccad9e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -141,6 +141,11 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81426
+config BR2_TOOLCHAIN_HAS_GCC_BUG_81426
+	bool
+	default y if BR2_sh
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83143
 # Error: invalid operands (*UND* and .text sections) for `-' on sh4.
 # This bug no longer exists in gcc 10.x but reappeared on gcc 11.x and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
