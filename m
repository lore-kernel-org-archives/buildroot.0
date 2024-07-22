Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCFCC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC1C980C57;
	Mon, 22 Jul 2024 20:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlKAiDs6XCEA; Mon, 22 Jul 2024 20:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC3A0810A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC3A0810A8;
	Mon, 22 Jul 2024 20:21:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 522CF1BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EA63810A8
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DI6MQyBgXkMZ for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:21:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DFDA80C57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DFDA80C57
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:21:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59741870E9; Mon, 22 Jul 2024 20:21:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 22:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f17fa2c905845c5a9c5aa55866cd44af176e558a
X-Git-Newrev: b09ae4f0454105afd2b41b2a49f4682d9ee57769
X-Patchwork-Hint: ignore
Message-Id: <20240722202115.59741870E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add 4th runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=b09ae4f0454105afd2b41b2a49f4682d9ee57769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_4th.py | 55 +++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65dc7e6bdd..a1e6a74600 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1830,6 +1830,7 @@ F:	support/testing/tests/package/sample_python_mpmath.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/sample_python_sympy.py
+F:	support/testing/tests/package/test_4th.py
 F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
diff --git a/support/testing/tests/package/test_4th.py b/support/testing/tests/package/test_4th.py
new file mode 100644
index 0000000000..c020c825b3
--- /dev/null
+++ b/support/testing/tests/package/test_4th.py
@@ -0,0 +1,55 @@
+import os
+from math import sqrt
+
+import infra.basetest
+
+
+class Test4th(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_4TH=y
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
+        # We set the DIR4TH variable where 4th demos and libraries are
+        # installed.
+        self.assertRunOk("export DIR4TH=/usr/share/4th/")
+
+        # We run a simple "hello world" demo.
+        out, ret = self.emulator.run("4th cxq demo/hello.4th")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello world!")
+
+        # We run a demo doing some square root maths.
+        out, ret = self.emulator.run("4th cxq demo/squares.4th")
+        self.assertEqual(ret, 0)
+        self.assertTrue(len(out) > 1)
+        for line in out[1:]:
+            columns = line.split()
+            value = float(columns[0])
+            value_sqrt = float(columns[1])
+            result_check = sqrt(value)
+            self.assertAlmostEqual(value_sqrt, result_check, delta=0.1)
+
+        # We run a word count demo and the 4th source file. We save
+        # the word count for a later check.
+        out, ret = self.emulator.run("4th cxq wc.4th /usr/share/4th/wc.4th")
+        self.assertEqual(ret, 0)
+        wc_out = out[0].split()
+
+        # We run the same command using system "wc" command. We expect
+        # the same numbers.
+        out, ret = self.emulator.run("wc /usr/share/4th/wc.4th")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0].split(), wc_out)
+
+        # We run a slightly more complex computation example.
+        self.assertRunOk("4th cxq fractals.4th")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
