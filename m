Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40175C4829A
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA5241B4A;
	Mon,  5 Feb 2024 22:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEA5241B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8Qzop3sQGt1; Mon,  5 Feb 2024 22:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4158E418AA;
	Mon,  5 Feb 2024 22:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4158E418AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44BCD1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EA3A418AA
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA3A418AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHs5t7mWw6Bs for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:21:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CE82418A3
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE82418A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39D0886E70; Mon,  5 Feb 2024 22:21:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:20:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f72ba67d081a728a13f76cb8d18e2b5b781d2a46
X-Git-Newrev: d64b36ba1577d6c0169787a14101b2f43ddac206
X-Patchwork-Hint: ignore
Message-Id: <20240205222152.39D0886E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add ltrace runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=d64b36ba1577d6c0169787a14101b2f43ddac206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_ltrace.py | 32 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 187c8eeca7..a8e1ac9a27 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1790,6 +1790,7 @@ F:	support/testing/tests/package/test_less.py
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
+F:	support/testing/tests/package/test_ltrace.py
 F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
diff --git a/support/testing/tests/package/test_ltrace.py b/support/testing/tests/package/test_ltrace.py
new file mode 100644
index 0000000000..9ef64ba5dd
--- /dev/null
+++ b/support/testing/tests/package/test_ltrace.py
@@ -0,0 +1,32 @@
+import os
+
+import infra.basetest
+
+
+class TestLtrace(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LTRACE=y
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
+        # Check the program can execute
+        self.assertRunOk("ltrace --version")
+
+        # Run ltrace on a ls
+        cmd = "ltrace -a 0 -o ltrace.log ls /"
+        self.assertRunOk(cmd)
+
+        # Check the ltrace log contains occurrences of libc malloc()
+        cmd = "grep -Ec 'malloc\\([0-9]+\\)' ltrace.log"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertGreater(int(out[0]), 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
