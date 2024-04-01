Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A4ECD128D
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 14:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 134EC608C5;
	Mon,  1 Apr 2024 14:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FOmxjN8Jl2xh; Mon,  1 Apr 2024 14:30:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BD76608CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BD76608CD;
	Mon,  1 Apr 2024 14:30:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4901BF33E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41C7F40162
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 14:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uq713YoxUC4 for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 14:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66FAA40126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66FAA40126
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 14:30:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F12C84554; Mon,  1 Apr 2024 14:30:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 16:28:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6748b4d35f37d2466c6b571b813f542d291c08ef
X-Git-Newrev: dc101babfd5fd36062b8c7551e41cace84192a70
X-Patchwork-Hint: ignore
Message-Id: <20240401143015.4F12C84554@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add ed runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc101babfd5fd36062b8c7551e41cace84192a70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                               |  1 +
 support/testing/tests/package/test_ed.py | 98 ++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 313fc16b9d..288a3ce0e6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1780,6 +1780,7 @@ F:	support/testing/tests/package/test_cryptsetup/
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
