Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D27C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 13:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC39141422;
	Mon,  3 Feb 2025 13:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AITJA6eZ75P0; Mon,  3 Feb 2025 13:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99CBB413D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99CBB413D3;
	Mon,  3 Feb 2025 13:01:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59C25185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CC86405C8
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3HlEW8z2lN5 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 13:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4800400FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4800400FC
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 13:01:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8CE9868BA; Mon,  3 Feb 2025 13:01:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 14:01:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bec75ea790e07d99e3140c129e82d21bc611b14
X-Git-Newrev: 4e67d0730ffe1dc0729cad82669ff8abcdbccef3
X-Patchwork-Hint: ignore
Message-Id: <20250203130144.D8CE9868BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new ltp-testsuite runtime
 test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e67d0730ffe1dc0729cad82669ff8abcdbccef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 .../testing/tests/package/test_ltp_testsuite.py    | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 31815b1272..045d5dc2a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1915,6 +1915,7 @@ F:	support/testing/tests/package/test_links.py
 F:	support/testing/tests/package/test_links/
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lrzsz.py
+F:	support/testing/tests/package/test_ltp_testsuite.py
 F:	support/testing/tests/package/test_ltrace.py
 F:	support/testing/tests/package/test_lvm2.py
 F:	support/testing/tests/package/test_lzip.py
diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
new file mode 100644
index 0000000000..a85ceb35a6
--- /dev/null
+++ b/support/testing/tests/package/test_ltp_testsuite.py
@@ -0,0 +1,39 @@
+import os
+
+import infra.basetest
+
+
+class TestLtpTestsuite(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LTP_TESTSUITE=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           kernel_cmdline=["rootwait", "root=/dev/sda"],
+                           options=["-drive", f"file={drive},if=scsi,format=raw"])
+        self.emulator.login()
+
+        # We run a reduced number of tests (read syscall tests) for a
+        # fast execution. See "runltp --help" for option details.
+        cmd = "/usr/lib/ltp-testsuite/runltp"
+        cmd += " -p -q"
+        cmd += " -s ^read0[0-9]*"
+        cmd += " -l /tmp/ltp.log"
+        cmd += " -o /tmp/ltp.output"
+        cmd += " -C /tmp/ltp.failed"
+        cmd += " -T /tmp/ltp.tconf"
+        self.assertRunOk(cmd)
+
+        # We print the LTP run log and check there was zero failure in
+        # our test selection.
+        out, ret = self.emulator.run("cat /tmp/ltp.log")
+        self.assertEqual(ret, 0)
+        self.assertIn("Total Failures: 0", out)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
