Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA5BC5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 21:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B75C405F6;
	Mon, 24 Aug 2026 21:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQsrBDFUvf6m; Mon, 24 Aug 2026 21:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787607369;
	bh=JxBgDZDwqgetKFvPGP8uVS70SA5y4Xee8BuhzyMiFkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EwwTKj+x5RmjjgmRLQadiNJk+qjJZikJcvkmrl4vWVf46a/9QDldlAc+H9p2k/zW3
	 CjRBHvnPmFEYlbMBMNbwHCxfoCrX1n+MIRWpggpb1fnDxcMRTN6mWi0oChxX+MjEl2
	 qHo7Y4CqvozSyzwXiD6SDRJLPD2mQ06UmPzRpa2iaWGYCDpAVQjhhUcRpiDdYyAj3G
	 4OzFs3svf60zecQpbPt6gsdnY1fl7TW99kGc6Z8wCCEG8xC3LKkOD2ubuflzzo4tzU
	 T8aHNshsIyQTf7ffEy55HaO/Gmaov+0Ql39YeuzK5MtUKpZdMDeEGkyYCgmg7HHwsk
	 cs1MrpSRBMOUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3AC40603;
	Mon, 24 Aug 2026 21:36:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 564144B8
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 540F660618
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I_Jim4cuW8ZB for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 21:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09A1060614
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:36:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B86F790BCB; Mon, 24 Aug 2026 21:35:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Aug 2026 21:52:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a0c0208e1bc7ee83eb5a058b6c20b5e2ec6e3c1e
X-Git-Newrev: 3d6c68d625cf80cc9a9cf4ce1058248fcfc413a7
X-Patchwork-Hint: ignore
Message-Id: <20260824213510.B86F790BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/heaptrack: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d6c68d625cf80cc9a9cf4ce1058248fcfc413a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add heaptrack, a memory allocation tracer toolkit.

This implementation builds all the command line components, not the
heaptrack_gui graphical visualization program.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                      |  2 ++
 package/Config.in                               |  1 +
 package/heaptrack/Config.in                     | 39 +++++++++++++++++++++++
 package/heaptrack/heaptrack.hash                | 10 ++++++
 package/heaptrack/heaptrack.mk                  | 26 +++++++++++++++
 support/testing/tests/package/test_heaptrack.py | 42 +++++++++++++++++++++++++
 6 files changed, 120 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98c9ee55d3..3a288afb1a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2192,6 +2192,7 @@ F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/agentpp/
 F:	package/exim/
+F:	package/heaptrack/
 F:	package/libpjsip/
 F:	package/linux-tools/linux-tool-usbtools.mk.in
 F:	package/qpid-proton/
@@ -2200,6 +2201,7 @@ F:	package/snmppp/
 F:	package/stm32flash/
 F:	package/unzip/
 F:	support/legal-info/
+F:	support/testing/tests/package/test_heaptrack.py
 
 N:	Lucas De Marchi <lucas.de.marchi@gmail.com>
 F:	package/fswebcam/
diff --git a/package/Config.in b/package/Config.in
index 6058800682..307f7ce86a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -106,6 +106,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/fwts/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
+	source "package/heaptrack/Config.in"
 	source "package/hyperfine/Config.in"
 	source "package/iozone/Config.in"
 	source "package/k3conf/Config.in"
diff --git a/package/heaptrack/Config.in b/package/heaptrack/Config.in
new file mode 100644
index 0000000000..a7ef6f0970
--- /dev/null
+++ b/package/heaptrack/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_HEAPTRACK
+	bool "heaptrack"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libunwind, elfutils
+	depends on BR2_USE_WCHAR # boost, elfutils
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
+	depends on !BR2_STATIC_LIBS # libunwind, elfutils
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no dlmopen() support
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_IOSTREAMS
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	# For heaptrack_print
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LIBUNWIND
+	select BR2_PACKAGE_ZLIB
+	help
+	  Heaptrack traces all memory allocations and annotates these
+	  events with stack traces. Dedicated analysis tools then allow
+	  you to interpret the heap memory profile to find hotspots,
+	  memory leaks, allocation hotspots and temporary allocations.
+
+	  Zstandard offers better (de)compression performance compared
+	  with gzip/zlib, making heaptrack faster and datafiles smaller,
+	  so enabling BR2_PACKAGE_ZSTD is recommended.
+
+	  https://apps.kde.org/heaptrack/
+
+comment "heaptrack needs a glibc or musl toolchain w/ C++, threads, wchar, gcc >= 8, dynamic library"
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/heaptrack/heaptrack.hash b/package/heaptrack/heaptrack.hash
new file mode 100644
index 0000000000..6ad9619f23
--- /dev/null
+++ b/package/heaptrack/heaptrack.hash
@@ -0,0 +1,10 @@
+# Locally calculated
+sha256  e69de2209ab0e16c8e26c1b60feeb852b3a88e46a4f16588c08254e1bd81a183  heaptrack-3e6cce3d210a6672fe6f92de0bed567c49b7a9c5-git4.tar.gz
+
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-only.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
+sha256  6aee5c3d7c55f3d8ff45b1245b8427efaf0a59e9c52d7139c79bff7056e9a611  LICENSES/LGPL-2.1-or-later.txt
+sha256  84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380a8f  LICENSES/BSL-1.0.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff  LICENSES/Apache-2.0.txt
+sha256  42639b2e5507163d35069be166e37a784f48a5f17e3577c16eb48fab215247cd  LICENSES/BSD-3-Clause.txt
diff --git a/package/heaptrack/heaptrack.mk b/package/heaptrack/heaptrack.mk
new file mode 100644
index 0000000000..6ae49ba1a8
--- /dev/null
+++ b/package/heaptrack/heaptrack.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# heaptrack
+#
+################################################################################
+
+HEAPTRACK_SITE_METHOD = git
+HEAPTRACK_SITE = https://invent.kde.org/sdk/heaptrack.git
+HEAPTRACK_VERSION = 3e6cce3d210a6672fe6f92de0bed567c49b7a9c5
+HEAPTRACK_LICENSE = LGPL-2.1-or-later, GPL-2.0-or-later (heaptrack_interpret)
+HEAPTRACK_LICENSE_FILES = \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/BSL-1.0.txt \
+	LICENSES/MIT.txt \
+	LICENSES/Apache-2.0.txt \
+	LICENSES/BSD-3-Clause.txt
+HEAPTRACK_DEPENDENCIES = host-pkgconf boost elfutils libunwind zlib
+HEAPTRACK_CONF_OPTS = -DHEAPTRACK_BUILD_GUI=OFF -DHEAPTRACK_BUILD_PRINT=ON
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+HEAPTRACK_DEPENDENCIES += zstd
+endif
+
+$(eval $(cmake-package))
diff --git a/support/testing/tests/package/test_heaptrack.py b/support/testing/tests/package/test_heaptrack.py
new file mode 100644
index 0000000000..be353f8918
--- /dev/null
+++ b/support/testing/tests/package/test_heaptrack.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestHeaptrack(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
+    # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+    # needed by heaptrack.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.42"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_HEAPTRACK=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", cpio_file])
+
+        self.emulator.login()
+
+        self.assertRunOk("/usr/bin/heaptrack --version")
+        self.assertRunOk("/usr/bin/heaptrack /bin/busybox")
+        self.assertRunOk("/usr/bin/heaptrack -o /tmp/ls.heaptrack ls -al /")
+        self.assertRunOk("/usr/bin/heaptrack_print --file /tmp/ls.heaptrack.gz")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
