Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A75EEB570
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFBA2415FD;
	Fri,  8 Sep 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFBA2415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zrm144GHo7k4; Fri,  8 Sep 2023 20:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C7241620;
	Fri,  8 Sep 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C7241620
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2DFA1BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4AA960BBE
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4AA960BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dapuAceOSLy for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:52:52 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2672460A63
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2672460A63
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 71CFA13F88F;
 Fri,  8 Sep 2023 22:52:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  8 Sep 2023 22:52:42 +0200
Message-ID: <20230908205242.6870-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694206368;
 bh=wxxAvCPzllhO4r8uWgnGdAnP6zL5N0xbR9FF1X3Kc3w=;
 h=From:To:Cc:Subject:Date:From;
 b=Q2kpA9iusV7fxrZGaTpG4ZEpP+Anh+Nc4d2WtqDclCIYFTLlsBtAcQ2VDO/XnY9xH
 TxztOaQnkqWKhFIlOGU5NVQvsCeshIwEALRHagN96TR7MitHLgHh2z7CL77aopaa6O
 C+ljVmEvo5iYtDv5jDsl4B2AAs3rxFg4hvE68q2Tjev7wSVTdA6BZSmwWYl+6i6PbH
 SZv1mdusZL+vgXJgTMV/FSZ7ujLgrwWMPcCcZZAHxogvHdgf9FJ9Z9yvbjaB7v2ZmA
 8rPblNh3xO06Cgl2RPEvaZiZig6+Hw0S7TVrQuoMeJXRok9TWOAllMRhRmA/KgzuZU
 dEb4wU46qNj1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q2kpA9iu
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_less.py:
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
Patch tested on top of branch master at commit d44a888 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_less
    ...
    OK
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_less.py | 57 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 support/testing/tests/package/test_less.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..14b9406507 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1768,6 +1768,7 @@ F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
+F:	support/testing/tests/package/test_less.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lzip.py
diff --git a/support/testing/tests/package/test_less.py b/support/testing/tests/package/test_less.py
new file mode 100644
index 0000000000..3d8c4fc94c
--- /dev/null
+++ b/support/testing/tests/package/test_less.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+
+class TestLess(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_LESS=y
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
+        # Check the program can execute. This command also checks that
+        # the "less" program is from the actual "less" package, rather
+        # than the Busybox implementation (the Busybox "less" applet
+        # does not recognize the "--version" option and would fail).
+        self.assertRunOk("less --version")
+
+        # We create a test file.
+        ref_txt = "Hello Buildroot!"
+        input_fname = "input.txt"
+        self.assertRunOk(f"echo \'{ref_txt}\' > {input_fname}")
+
+        # "less" is mainly an interactive user program and uses
+        # terminal control characters. This test checks a basic "less"
+        # invocation in which there is no user interaction. The
+        # program is expected to give back the input data.
+        output, exit_code = self.emulator.run(f"less -F {input_fname}")
+        self.assertEqual(exit_code, 0)
+        # "less" might insert a carriage-return ^M control character,
+        # which will be converted to a new-line (by the
+        # str.splitlines() in Emulator.run()). We check that our
+        # reference text line is in the output (rather than only
+        # testing output[0]).
+        self.assertIn(ref_txt, output)
+
+        # We redo about the same test, with "less" reading stdin this
+        # time. We also use the "less -o log" option to log the output
+        # into a file. We expect to see our reference text on stdout.
+        output_fname = "output.txt"
+        cmd = f"cat {input_fname} | less -F -o {output_fname}"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn(ref_txt, output)
+
+        # The output file content which logged the output is also
+        # expected to be the same as the input.
+        self.assertRunOk(f"cmp {input_fname} {output_fname}")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
