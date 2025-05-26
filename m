Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A394C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A466059B;
	Sat, 31 May 2025 16:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cl9xR4ftRruR; Sat, 31 May 2025 16:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD4360806
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BD4360806;
	Sat, 31 May 2025 16:55:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF34235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFDFA83BDF
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COzyPm9qbZad for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E706E83BEB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E706E83BEB
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E519C87578; Sat, 31 May 2025 16:55:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:46:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 92d93f321549aab40415d495f80450cf6484c897
X-Git-Newrev: 73dbdac4267ba0d0b5fbaff695e0eaf029c87927
X-Patchwork-Hint: ignore
Message-Id: <20250531165509.E519C87578@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: new
 dieharder runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=73dbdac4267ba0d0b5fbaff695e0eaf029c87927
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Note: this test was not working in Buildroot test infrastructure
before commit [1] was merged, because dieharder has the string "# "
in its output.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/0cad947b964be5612a182413da136fcf0dc5a1f2

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit e9498b4faa28c494c064728d564b43c07b1b0689)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_dieharder.py | 36 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0eff5f3308..6a6e4e14a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1867,6 +1867,7 @@ F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
+F:	support/testing/tests/package/test_dieharder.py
 F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_dosfstools.py
diff --git a/support/testing/tests/package/test_dieharder.py b/support/testing/tests/package/test_dieharder.py
new file mode 100644
index 0000000000..de09b383b4
--- /dev/null
+++ b/support/testing/tests/package/test_dieharder.py
@@ -0,0 +1,36 @@
+import os
+
+import infra.basetest
+
+
+class TestDieharder(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_DIEHARDER=y
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
+        # Check the program can run (by showing its version)
+        self.assertRunOk("dieharder -V")
+
+        # The birthdays randomness test on the mt19937 random number
+        # generator with 25 sample is expected to always succeed.
+        cmd = "dieharder -g mt19937 -d diehard_birthdays -t 25"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("PASSED", '\n'.join(output))
+
+        # The birthdays randomness test on file /dev/zero is expected
+        # to always fail.
+        cmd = "dieharder -g file_input_raw -f /dev/zero -d diehard_birthdays -t 25"
+        output, exit_code = self.emulator.run(cmd, timeout=40)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("FAILED", '\n'.join(output))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
