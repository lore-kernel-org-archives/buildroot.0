Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69014C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0662060C0A;
	Sun, 12 Mar 2023 09:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0662060C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTxHuHOym-H6; Sun, 12 Mar 2023 09:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3533F607C1;
	Sun, 12 Mar 2023 09:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3533F607C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00EDE1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEF2D408F9
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEF2D408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTCohW24DZ4N for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:16:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3976401FC
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3976401FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC42E86E89; Sun, 12 Mar 2023 09:16:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:15:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: da3ef3e8b828cc99f49c95ad6bef39c55f87e512
X-Git-Newrev: 773535fbac1acd9bc08cde5b44db0d4c1e19de31
X-Patchwork-Hint: ignore
Message-Id: <20230312091620.AC42E86E89@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_lsof.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=773535fbac1acd9bc08cde5b44db0d4c1e19de31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_lsof.py | 41 ++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d052e59122..7733d5a04e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1719,6 +1719,7 @@ F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_libjxl.py
+F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
diff --git a/support/testing/tests/package/test_lsof.py b/support/testing/tests/package/test_lsof.py
new file mode 100644
index 0000000000..b0478dfbb7
--- /dev/null
+++ b/support/testing/tests/package/test_lsof.py
@@ -0,0 +1,41 @@
+import os
+
+import infra.basetest
+
+
+class TestLsof(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_LSOF=y
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
+        test_file = "/tmp/this-is-a-test-file"
+
+        # Check the program can execute
+        self.assertRunOk("lsof -v")
+
+        # Check a normal program invocation
+        self.assertRunOk("lsof")
+
+        # Check lsof fails if requested file is not opened
+        _, exit_code = self.emulator.run("lsof {}".format(test_file))
+        self.assertNotEqual(exit_code, 0)
+
+        # Open the test file from the shell on descriptor 10
+        self.assertRunOk("exec 10> {}".format(test_file))
+
+        # Check that lsof now show the file
+        output, exit_code = self.emulator.run("lsof {}".format(test_file))
+        self.assertEqual(exit_code, 0)
+        # output[0] is the lsof header line
+        self.assertIn(test_file, output[1])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
