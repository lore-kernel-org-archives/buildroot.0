Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75341C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B392E81221;
	Fri,  7 Aug 2026 09:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2g2FL0xJOP6; Fri,  7 Aug 2026 09:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570BE81237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095239;
	bh=aK+c8t+/cfdNugjCGejlTe5c3BzyVbo3vw2+fQvlGWI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CB7g0BEwvraH9ffZoPSIhR8mb/7Z/FYW0Pt5cGLQgaivD2WsenzDgk2AV8i3M9YKw
	 ieM4yU+R+9djkPxja+4NLO7gvqm0JXMgXtKTW4H5VlCy+xFfKQG1yI0qjpeynaEy12
	 Twoci9zpIf8cw1EasxJ95eT6xEXSLGkKel6Aj+q/HEDVAP6D0pM2xG9ceqtflsCCdv
	 QnVtgW85OiHzcqUYnb+Gxg2K43/Ra5z44sPf9z15zTBS8r5UeGcOP9sun4FLMadF2V
	 u3tjBKmcrNYFw0d8eD9doGQ97agOZwXQi9g80AGqZ5W22C5MBEP3ix0asSScihGa4c
	 hv8BVaA6pZK9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570BE81237;
	Fri,  7 Aug 2026 09:33:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6E7D282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DCD5811FD
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEGeKfE4UwmD for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BC6C81204
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BC6C81204
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5C9E8CA42; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:56 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8c12556150603c52474c897556443200151762f9
X-Git-Newrev: e6e34723304093d51817defd78635408707e802d
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.A5C9E8CA42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: guile:
 new runtime test
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e6e34723304093d51817defd78635408707e802d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 29c988c7fc4f4916f023e08e939e1326056ebf2f)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_guile.py        | 76 ++++++++++++++++++++++
 .../test_guile/rootfs-overlay/root/fact.scm        | 13 ++++
 3 files changed, 91 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a0111b631f..fbe573ebed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1852,6 +1852,8 @@ F:	support/testing/tests/package/test_gnuradio/
 F:	support/testing/tests/package/test_gpsd.py
 F:	support/testing/tests/package/test_gpsd/
 F:	support/testing/tests/package/test_gstreamer1.py
+F:	support/testing/tests/package/test_guile.py
+F:	support/testing/tests/package/test_guile/
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_guile.py b/support/testing/tests/package/test_guile.py
new file mode 100644
index 0000000000..0af4a3f65c
--- /dev/null
+++ b/support/testing/tests/package/test_guile.py
@@ -0,0 +1,76 @@
+import os
+from math import factorial
+
+import infra.basetest
+
+
+class TestGuile(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_guile/rootfs-overlay")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_GENERATE_LOCALE="en_US.UTF-8"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_SYSTEM_ENABLE_NLS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_GUILE=y
+        """
+
+    def guile_cmd(self, guile_expr):
+        return f"guile -q -c '{guile_expr}'"
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+        # Guile needs a locale configured to work properly.
+        self.assertRunOk("export LANG=en_US.UTF-8")
+
+        # Check the program works.
+        self.assertRunOk("guile --version")
+
+        # Check a string output.
+        string = "Hello Buildroot!"
+        cmd = self.guile_cmd(f'(display "{string}")(newline)')
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], string)
+
+        # Check the exit status works.
+        code = 123
+        cmd = self.guile_cmd(f"(exit {code})")
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, code)
+
+        # Check basic artihmetic works.
+        val1 = 123
+        val2 = 456
+        guile_expr = f'(display (* {val1} {val2}))(newline)'
+        cmd = self.guile_cmd(guile_expr)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        expected_result = val1 * val2
+        self.assertEqual(int(output[0]), expected_result)
+
+        # Check we can call a Guile script. We disable auto
+        # compilation to suppress compilation and cache messages.
+        val = 12
+        cmd = f"GUILE_AUTO_COMPILE=0 /root/fact.scm {val}"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        expected_result = factorial(val)
+        self.assertEqual(int(output[0]), expected_result)
diff --git a/support/testing/tests/package/test_guile/rootfs-overlay/root/fact.scm b/support/testing/tests/package/test_guile/rootfs-overlay/root/fact.scm
new file mode 100755
index 0000000000..a937ff4041
--- /dev/null
+++ b/support/testing/tests/package/test_guile/rootfs-overlay/root/fact.scm
@@ -0,0 +1,13 @@
+#! /usr/bin/env guile
+!#
+
+; Adapted from "The Guile Reference Manual"
+; Section 4.3.4 Scripting Examples
+; https://doc.guix.gnu.org/guile/latest/en/html_node/Scripting-Examples.html
+
+(define (fact n)
+  (if (zero? n) 1
+    (* n (fact (- n 1)))))
+
+(display (fact (string->number (cadr (command-line)))))
+(newline)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
