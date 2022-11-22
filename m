Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349F0C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B465D81FF0;
	Tue, 22 Nov 2022 21:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B465D81FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9MhuIsKIdAdM; Tue, 22 Nov 2022 21:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E80681FFB;
	Tue, 22 Nov 2022 21:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E80681FFB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 425D21BF20B
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19A1860ADD
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19A1860ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HktzrKeUiYPi for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:59:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1EFB60A9F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1EFB60A9F
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:59:32 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.84.171])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AFA4DB00535;
 Tue, 22 Nov 2022 22:59:29 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 22:59:12 +0100
Message-Id: <20221122215912.824599-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122215557.789750-1-ju.o@free.fr>
References: <20221122215557.789750-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669154371;
 bh=tQwG+vnZJKrz5a7z90oqO7PCl9zWSzuOj3ZCGUTNrtU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KQSw2pwLFwyFuiesTkXCSHYtdFOSk0K2cKSvjsVWBpELrNQnieOqQ4zCDHsArKfMa
 ZJkFL+w1ItCNPf32yup5ddQhuCiwqYDm/8WniL7cIXnQcUTUlnLU8ErCw7j/+wDpNG
 itBpsRYviSUtGhjWApnqo9EsDVqhrpqhnYiooUteElwYkoWJOu6JuuUqAsRGqWbiuM
 WBV7AYQjhvUdccNa7jtBWvbv9fhibAHVswn+WMM9Ab1JJtyoLEWqxFQ6DNXOLZn5sq
 KbpkCPBSQ5aYUzqhztCeqcCNyNshVOFZ4h3Ng5rwnSpSXruQ27supGhbrjfaObYngs
 9TptvKr7srNjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KQSw2pwL
Subject: [Buildroot] [PATCH next 2/2] package/libjxl: new package
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
 DEVELOPERS                                   |  2 +
 package/Config.in                            |  1 +
 package/libjxl/Config.in                     | 14 ++++++
 package/libjxl/libjxl.hash                   |  4 ++
 package/libjxl/libjxl.mk                     | 29 +++++++++++
 support/testing/tests/package/test_libjxl.py | 53 ++++++++++++++++++++
 6 files changed, 103 insertions(+)
 create mode 100644 package/libjxl/Config.in
 create mode 100644 package/libjxl/libjxl.hash
 create mode 100644 package/libjxl/libjxl.mk
 create mode 100644 support/testing/tests/package/test_libjxl.py

diff --git a/DEVELOPERS b/DEVELOPERS
index fefb40c605..99c274851d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1690,6 +1690,7 @@ F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/highway/
+F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
 F:	package/ptm2human/
@@ -1705,6 +1706,7 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
+F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/package/Config.in b/package/Config.in
index c127cd2477..db8177a5ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1575,6 +1575,7 @@ menu "Graphics"
 	source "package/libgta/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
+	source "package/libjxl/Config.in"
 	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
 	source "package/libpng/Config.in"
diff --git a/package/libjxl/Config.in b/package/libjxl/Config.in
new file mode 100644
index 0000000000..456305083c
--- /dev/null
+++ b/package/libjxl/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBJXL
+	bool "libjxl"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # highway
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # highway
+	depends on BR2_INSTALL_LIBSTDCPP # highway
+	depends on BR2_PACKAGE_HIGHWAY_ARCH_SUPPORTS
+	select BR2_PACKAGE_BROTLI
+	select BR2_PACKAGE_HIGHWAY
+	select BR2_PACKAGE_LCMS2
+	help
+	  libjxl is the reference implementation of JPEG XL (encoder
+	  and decoder).
+
+	  https://github.com/libjxl/libjxl
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
index 0000000000..778f436268
--- /dev/null
+++ b/package/libjxl/libjxl.mk
@@ -0,0 +1,29 @@
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
index 0000000000..a98966569f
--- /dev/null
+++ b/support/testing/tests/package/test_libjxl.py
@@ -0,0 +1,53 @@
+import os
+
+import infra.basetest
+
+
+class TestLibJXL(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it is
+    # armv5, which is not supported by the package.
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
