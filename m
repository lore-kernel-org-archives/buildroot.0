Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C432EC4829A
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E85D41B79;
	Mon,  5 Feb 2024 22:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E85D41B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVv9pQ2DmJQB; Mon,  5 Feb 2024 22:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C40EC41B66;
	Mon,  5 Feb 2024 22:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C40EC41B66
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 515831BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B97F81FED
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B97F81FED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nn1IrMFAfxxT for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:21:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58CB681FEA
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58CB681FEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4675386E71; Mon,  5 Feb 2024 22:21:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:20:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d64b36ba1577d6c0169787a14101b2f43ddac206
X-Git-Newrev: 3b342b77938622d89fbe6eca20ed5d251a884569
X-Patchwork-Hint: ignore
Message-Id: <20240205222152.4675386E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add trace-cmd runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b342b77938622d89fbe6eca20ed5d251a884569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_trace_cmd.py    | 54 ++++++++++++++++++++++
 .../package/test_trace_cmd/linux-ftrace.fragment   |  1 +
 3 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a8e1ac9a27..12df3bef13 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1830,6 +1830,8 @@ F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_tcpdump.py
 F:	support/testing/tests/package/test_tesseract_ocr.py
+F:	support/testing/tests/package/test_trace_cmd.py
+F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
diff --git a/support/testing/tests/package/test_trace_cmd.py b/support/testing/tests/package/test_trace_cmd.py
new file mode 100644
index 0000000000..e7d5e13bce
--- /dev/null
+++ b/support/testing/tests/package/test_trace_cmd.py
@@ -0,0 +1,54 @@
+import os
+
+import infra.basetest
+
+
+class TestTraceCmd(infra.basetest.BRTest):
+    # A specific configuration is needed for testing trace-cmd.
+    # The function tracer need to be enabled in the Kernel.
+    kern_fragment = \
+        infra.filepath("tests/package/test_trace_cmd/linux-ftrace.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.74"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_TRACE_CMD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # Record calls to kmalloc() from a simple command.
+        self.assertRunOk("trace-cmd record -e kmalloc ls -l /")
+
+        # Show information about the trace.dat file.
+        self.assertRunOk("trace-cmd dump")
+
+        # Generate a text report of the trace.
+        self.assertRunOk("trace-cmd report > trace.txt")
+
+        # Check we have occurrences of "kmalloc:" in the trace report.
+        cmd = "grep -Fc kmalloc: trace.txt"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEquals(exit_code, 0)
+        self.assertTrue(int(output[0]) > 0)
diff --git a/support/testing/tests/package/test_trace_cmd/linux-ftrace.fragment b/support/testing/tests/package/test_trace_cmd/linux-ftrace.fragment
new file mode 100644
index 0000000000..ef82146616
--- /dev/null
+++ b/support/testing/tests/package/test_trace_cmd/linux-ftrace.fragment
@@ -0,0 +1 @@
+CONFIG_FTRACE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
