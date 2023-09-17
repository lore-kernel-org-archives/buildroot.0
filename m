Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949C6CD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3792841476;
	Sun, 17 Sep 2023 20:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3792841476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCsyClRC2OKV; Sun, 17 Sep 2023 20:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA32440629;
	Sun, 17 Sep 2023 20:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA32440629
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D15A41BF399
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB1A160ABA
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB1A160ABA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IO_HC90MGbu for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:21:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3549460A6D
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3549460A6D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B7CD872EF; Sun, 17 Sep 2023 20:21:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:09:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47cbcb70d078ffbc0fbd2d0179d35d9e3ee304ff
X-Git-Newrev: 2031fc88096f8651397cdc2e96a249a6f92ae292
X-Patchwork-Hint: ignore
Message-Id: <20230917202107.1B7CD872EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_tcl.py:
 new runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2031fc88096f8651397cdc2e96a249a6f92ae292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Arnout: use f-string instead of string.format]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_tcl.py          | 50 ++++++++++++++++++++++
 .../test_tcl/rootfs-overlay/root/factorial.tcl     | 11 +++++
 3 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7fae4841e4..e8b78a8d46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1772,6 +1772,8 @@ F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_stress_ng.py
+F:	support/testing/tests/package/test_tcl.py
+F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
diff --git a/support/testing/tests/package/test_tcl.py b/support/testing/tests/package/test_tcl.py
new file mode 100644
index 0000000000..ae94e80a92
--- /dev/null
+++ b/support/testing/tests/package/test_tcl.py
@@ -0,0 +1,50 @@
+import math
+import os
+
+import infra.basetest
+
+
+class TestTcl(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_TCL=y
+        # BR2_PACKAGE_TCL_SHLIB_ONLY is not set
+        BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_tcl/rootfs-overlay")}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Print tcl the interpreter version and patchlevel.
+        tcl_cmds = "puts \"tcl_version: $tcl_version\";"
+        tcl_cmds += "puts \"patchlevel: [info patchlevel]\";"
+        tcl_cmds += "exit 0"
+        cmd = f"echo '{tcl_cmds}' | tclsh"
+        self.assertRunOk(cmd)
+
+        # We check tclsh correctly print a string.
+        txt = "Hello Buildroot"
+        cmd = f"echo 'puts \"{txt}\"; exit 0' | tclsh"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], txt)
+
+        # We check tclsh can return a non-zero exit code.
+        expected_code = 123
+        cmd = f"echo 'exit {expected_code}' | tclsh"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, expected_code)
+
+        # We check a tcl program computing factorial run correctly.
+        input_value = 12
+        expected_output = str(math.factorial(input_value))
+        cmd = f"/root/factorial.tcl {input_value}"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], expected_output)
diff --git a/support/testing/tests/package/test_tcl/rootfs-overlay/root/factorial.tcl b/support/testing/tests/package/test_tcl/rootfs-overlay/root/factorial.tcl
new file mode 100755
index 0000000000..0398f24ceb
--- /dev/null
+++ b/support/testing/tests/package/test_tcl/rootfs-overlay/root/factorial.tcl
@@ -0,0 +1,11 @@
+#! /usr/bin/env tclsh
+
+proc factorial {n} {
+   set f 1
+   for {set i 1} {$i <= $n} {incr i} {
+      set f [expr {$f * $i}]
+   }
+   return $f
+}
+
+puts [factorial [lindex $argv 0]]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
