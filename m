Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386EDEEB57B
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E803460C22;
	Sun, 10 Sep 2023 16:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E803460C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4iwnwtnN6b9; Sun, 10 Sep 2023 16:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0940F60E77;
	Sun, 10 Sep 2023 16:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0940F60E77
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 157B41BF263
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3C78606F2
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C78606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nA8mG23OOfGB for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:35:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C05560736
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C05560736
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14D1B86B40; Sun, 10 Sep 2023 16:35:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 18:32:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56e7ca5dbc466f301ef6f5810177cfc17f73b9ae
X-Git-Newrev: b492a5414e49ea18309eb17e8f1d3cc81d92b3fa
X-Patchwork-Hint: ignore
Message-Id: <20230910163504.14D1B86B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_less.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=b492a5414e49ea18309eb17e8f1d3cc81d92b3fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_less.py | 57 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 648058fcbe..a7410d61fa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1741,6 +1741,7 @@ F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_kmscube.py
 F:	support/testing/tests/package/test_kmscube/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
