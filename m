Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7189FC001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FBED4150F;
	Sun, 23 Jul 2023 10:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FBED4150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A378gxL0jwJA; Sun, 23 Jul 2023 10:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D640A4151B;
	Sun, 23 Jul 2023 10:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D640A4151B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 861F11BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6038240A6F
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6038240A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxfZwxrHCVsj for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:30:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F4C740A81
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F4C740A81
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CD9D826A1; Sun, 23 Jul 2023 10:30:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 12:29:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c0d12221e17e53659f3ca161865bd4feb57ad5b
X-Git-Newrev: da0f92fdfcea025c608c279ea29c5eab8bdb1566
X-Patchwork-Hint: ignore
Message-Id: <20230723103002.7CD9D826A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_pixz.py: use test_compressor_base
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
Content-Type: multipart/mixed; boundary="===============1927891710454993174=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1927891710454993174==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=da0f92fdfcea025c608c279ea29c5eab8bdb1566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test_pixz.py test was initially written as a standalone test.

The commit cf132a13
"support/testing/tests/package/test_compressor_base.py: new helper class"
introduced a helper class for testing data compression programs.

This commit rewrites this test to use this helper class.

The test coverage is mostly the same as before the rewrite. Notable
differences are:
- the test file is slightly smaller for faster testing,
- its content layout also slightly different.

Cc: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_pixz.py | 48 ++++++++----------------------
 1 file changed, 13 insertions(+), 35 deletions(-)

diff --git a/support/testing/tests/package/test_pixz.py b/support/testing/tests/package/test_pixz.py
index eeff10eaa1..6620bd4a82 100644
--- a/support/testing/tests/package/test_pixz.py
+++ b/support/testing/tests/package/test_pixz.py
@@ -1,40 +1,18 @@
-import os
+from tests.package.test_compressor_base import TestCompressorBase
 
-import infra.basetest
 
-
-class TestPixz(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+class TestPixz(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
         """
         BR2_PACKAGE_PIXZ=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
         """
-
-    def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
-                           options=["-initrd", cpio_file])
-        self.emulator.login()
-
-        # Prepare input file with random data and zeroes.
-        # We keep the size small (4 MB) for the sake of test time.
-        cmd = "dd if=/dev/urandom of=orig bs=1M count=2 && " \
-              "dd if=/dev/zero of=orig bs=1M count=2 seek=2"
-        self.assertRunOk(cmd)
-
-        # Compress.
-        # We ask for 3 threads for good measure but with a very small file on a
-        # uniprocessor qemu this is only a light validation.
-        cmd = "cp -v orig compressed && pixz -p 3 compressed"
-        self.assertRunOk(cmd, timeout=60)
-
-        # Uncompress.
-        cmd = "cp -v compressed.xz uncompressed.xz && pixz -d uncompressed.xz"
-        self.assertRunOk(cmd)
-
-        # Verify.
-        # The ls is there for debugging.
-        cmd = "ls -l && cmp orig uncompressed"
-        self.assertRunOk(cmd)
+    compress_cmd = "pixz -p3"
+    decompress_cmd = "pixz -d"
+    compressed_file_ext = ".xz"
+
+    def check_integrity_test(self):
+        # Do nothing for the integrity test because "pixz" does not
+        # implement this feature. The "-t" option has other functions:
+        # https://github.com/vasi/pixz/blob/v1.0.7/src/pixz.1.asciidoc#options
+        pass

--===============1927891710454993174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1927891710454993174==--
