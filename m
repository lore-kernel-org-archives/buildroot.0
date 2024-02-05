Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11080C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE19D41805;
	Mon,  5 Feb 2024 14:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE19D41805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyuKaI8wkMA5; Mon,  5 Feb 2024 14:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E0541A7B;
	Mon,  5 Feb 2024 14:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E0541A7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8BF1BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC38A8291A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC38A8291A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47RefbxOgign for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CC4C82865
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC4C82865
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A41486CF1; Mon,  5 Feb 2024 14:56:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 15:55:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b89435db602e3ce39e73562cfd8b01fcc637368c
X-Git-Newrev: c47da268be75a64fe264f4833538be7bae1320c7
X-Patchwork-Hint: ignore
Message-Id: <20240205145609.1A41486CF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add coremark test
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

commit: https://git.buildroot.net/buildroot/commit/?id=c47da268be75a64fe264f4833538be7bae1320c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_coremark.py | 33 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b1178150ed..ebc1af84cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1763,6 +1763,7 @@ F:	support/testing/tests/package/test_bc.py
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
+F:	support/testing/tests/package/test_coremark.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
diff --git a/support/testing/tests/package/test_coremark.py b/support/testing/tests/package/test_coremark.py
new file mode 100644
index 0000000000..8bd2f32143
--- /dev/null
+++ b/support/testing/tests/package/test_coremark.py
@@ -0,0 +1,33 @@
+import os
+
+import infra.basetest
+
+
+class TestCoreMark(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_COREMARK=y
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
+        log_file = "run1.log"
+
+        # Run a CoreMark benchmark.
+        self.assertRunOk(f"coremark > {log_file}", timeout=60)
+
+        # Print the log file on console, for debugging.
+        self.assertRunOk(f"cat {log_file}")
+
+        # The "coremark" program return code is always 0 (success).
+        # So the correct execution is validated from the run log.
+        valid_msg = "Correct operation validated."
+        cmd = f"grep -F '{valid_msg}' {log_file}"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
