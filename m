Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F414DC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C09EC606E2;
	Sun, 28 Apr 2024 19:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYy_IDC-QfBL; Sun, 28 Apr 2024 19:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EF0606B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0EF0606B3;
	Sun, 28 Apr 2024 19:46:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E03D1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A5A481F94
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oie7qvsBrFZx for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A1181F71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1A1181F71
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9822886238; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 21:38:14 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9b689f8f5ccb7c6d3c7437d9ae94de9b911346a3
X-Git-Newrev: 3c2463c9cf50dd32930f0d577a5863da99eb2921
X-Patchwork-Hint: ignore
Message-Id: <20240428194630.9822886238@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add ed
 runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c2463c9cf50dd32930f0d577a5863da99eb2921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dc101babfd5fd36062b8c7551e41cace84192a70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                               |  1 +
 support/testing/tests/package/test_ed.py | 98 ++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bb1dfb023a..a38b681a8a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1771,6 +1771,7 @@ F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
+F:	support/testing/tests/package/test_ed.py
 F:	support/testing/tests/package/test_file.py
 F:	support/testing/tests/package/test_file/
 F:	support/testing/tests/package/test_fluidsynth.py
diff --git a/support/testing/tests/package/test_ed.py b/support/testing/tests/package/test_ed.py
new file mode 100644
index 0000000000..eee5f8c4fc
--- /dev/null
+++ b/support/testing/tests/package/test_ed.py
@@ -0,0 +1,98 @@
+import os
+
+import infra.basetest
+
+
+class TestEd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ED=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def run_ed_cmds(self, ed_cmds):
+        cmd = "ed <<EOF\n"
+        cmd += "\n".join(ed_cmds)
+        cmd += "\nEOF"
+        self.assertRunOk(cmd)
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the program can run. This also check we have the
+        # actual GNU ed, rather than the Busybox ed, which does not
+        # recognize the --version option.
+        self.assertRunOk("ed --version")
+
+        test_fname = "test.txt"
+        input_text_lines = [
+            "Hello World",
+            "Embedded Linux is Hard."
+        ]
+        output_expected_text = [
+            "Hello Buildroot",
+            "---------------",
+            "Making Embedded Linux Easy."
+        ]
+
+        # We define few "ed" command sequences, creating and editing a
+        # text file. The final output of this sequence is expected to
+        # match the expected text previously defined.
+        create_file = ["a"]
+        create_file += input_text_lines
+        create_file += [
+            ".",
+            f"w {test_fname}",
+            "q"
+        ]
+
+        edit_file = [
+            f"r {test_fname}",
+            "1",
+            "s/World/Buildroot/",
+            "2",
+            "s/is Hard/Easy/",
+            "s/^/Making /",
+            "w",
+            "q"
+        ]
+
+        insert_txt = [
+            f"r {test_fname}",
+            "2",
+            "i",
+            "This is a new line",
+            ".",
+            "w",
+            "q"
+        ]
+
+        change_txt = [
+            f"r {test_fname}",
+            "2",
+            "c",
+            "---------------",
+            ".",
+            "w"
+            "q"
+        ]
+
+        # We execute all "ed" command batches.
+        ed_cmd_batches = [
+            create_file,
+            edit_file,
+            insert_txt,
+            change_txt
+        ]
+        for ed_cmd_batch in ed_cmd_batches:
+            self.run_ed_cmds(ed_cmd_batch)
+
+        # The final test file should contain the expected text.
+        out, ret = self.emulator.run(f"cat {test_fname}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out, output_expected_text)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
