Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409FCCD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 17:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F54581F24;
	Sun, 17 Sep 2023 17:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F54581F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jreyw2P6O7XR; Sun, 17 Sep 2023 17:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEF2C81F27;
	Sun, 17 Sep 2023 17:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEF2C81F27
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1EB71BF3AE
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 17:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9F8441757
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 17:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9F8441757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mb2qGa0NICG for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 17:12:57 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3303041731
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 17:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3303041731
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5E83813F8C6;
 Sun, 17 Sep 2023 19:12:49 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 19:12:44 +0200
Message-ID: <20230917171244.139679-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694970774;
 bh=JsiAiDdDCGEV/X6Hytwh6MyVIF07oIYVUUIuudG6DMk=;
 h=From:To:Cc:Subject:Date:From;
 b=eebPdHIFP6zjlBwwxk2N7nW/szPnk1rez1GuVnC7gpkI9qrxoTIj6JE2YqzTWRMby
 7XvLmz9Nn3O1FrxlGi0LCGMCL+UBFlukJzk/+DZ0oP7hxKs+g/9YBC+bTAzjpZBfDs
 tqWQT8qd9OStfYD5GQsA9pFpjFX7L1hsQj8oAQ5WFbmprnhA2grsp9V8+RYUoEK6LI
 ryHiaGkVgMTYopnSvnnVOAc6uNzKs3QxSfr/Xv6wVp9Ra6xoKQNM0DAG5/X1Ygv4AV
 ypiZ6zR31LfW07VUpRoLjFoqZJSGn8vJ4DBlwQfsJLwYdQXGkfq+U/NJQRIVY7L5dy
 ydHxtm1AojzDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eebPdHIF
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_tcl.py:
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 7af8dee with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_tcl
    ...
    OK

Note: for the record, writing this test caught the issue fixed in
commit 7af8dee "package/tcl: add mandatory dependency to zlib". It also
identifed a toolchain issue with the proposed fix:
https://patchwork.ozlabs.org/project/buildroot/patch/20230917152303.1300577-1-yann.morin.1998@free.fr/
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_tcl.py     | 52 +++++++++++++++++++
 .../rootfs-overlay/root/factorial.tcl         | 11 ++++
 3 files changed, 65 insertions(+)
 create mode 100644 support/testing/tests/package/test_tcl.py
 create mode 100755 support/testing/tests/package/test_tcl/rootfs-overlay/root/factorial.tcl

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
index 0000000000..5986ebff01
--- /dev/null
+++ b/support/testing/tests/package/test_tcl.py
@@ -0,0 +1,52 @@
+import math
+import os
+
+import infra.basetest
+
+
+class TestTcl(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_TCL=y
+        # BR2_PACKAGE_TCL_SHLIB_ONLY is not set
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/test_tcl/rootfs-overlay")
+        )
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
