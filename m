Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B25C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 08:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC6A74074B;
	Sun, 25 Feb 2024 08:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bcIqO1QlG3f3; Sun, 25 Feb 2024 08:02:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E675740734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E675740734;
	Sun, 25 Feb 2024 08:02:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54F2D1BF232
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 08:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B5C340717
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 08:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYxfp-_SN9Wk for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7279740719
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7279740719
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 591B387A8C; Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 08:44:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4350d485a441b31ebb1ccb5124f081fda9104132
X-Git-Newrev: 9047058cd8addca8aedf274f2836f1f639c27eef
X-Patchwork-Hint: ignore
Message-Id: <20240225080241.591B387A8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add sox runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=9047058cd8addca8aedf274f2836f1f639c27eef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_sox.py | 74 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f065bfafb..0bfe91f064 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1849,6 +1849,7 @@ F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
+F:	support/testing/tests/package/test_sox.py
 F:	support/testing/tests/package/test_sqlite.py
 F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
diff --git a/support/testing/tests/package/test_sox.py b/support/testing/tests/package/test_sox.py
new file mode 100644
index 0000000000..74f784a36f
--- /dev/null
+++ b/support/testing/tests/package/test_sox.py
@@ -0,0 +1,74 @@
+import math
+import os
+
+import infra.basetest
+
+
+class TestSox(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_AUBIO=y
+        BR2_PACKAGE_SOX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def note_from_freq(self, freq):
+        """Return a note number from the input frequency in Hertz."""
+        return round((12 * math.log(freq / 440) / math.log(2)) + 69)
+
+    def check_audio_note(self, input_file, expected_note):
+        """Check the input_file include the expected_note."""
+        out, ret = self.emulator.run(f"aubionotes {input_file}", timeout=20)
+        self.assertEqual(ret, 0)
+        note_found = False
+        for line in out:
+            values = line.split()
+            if len(values) == 3:
+                note = round(float(values[0]))
+                if note == expected_note:
+                    note_found = True
+        self.assertTrue(note_found, "The expected note was not found")
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("sox --version")
+
+        freq = 440  # General Midi note A3
+        expected_note = self.note_from_freq(freq)
+        wav_file = "ref.wav"
+        tmpwav_file = "tmp.wav"
+
+        # Generate a sinusoidal tone.
+        cmd = "sox -V -r 48000 -n -b 16 -c 1"
+        cmd += f" {wav_file} synth 3 sin {freq} vol -10dB"
+        self.assertRunOk(cmd)
+
+        # Compute statistics on the generated file.
+        self.assertRunOk(f"sox {wav_file} -n stat")
+
+        # We check the generated wave file includes the expected note.
+        self.check_audio_note(wav_file, expected_note)
+
+        # We resample the reference file.
+        cmd = f"sox -V {wav_file} -r 22050 {tmpwav_file}"
+        self.assertRunOk(cmd)
+
+        # We should still detect our expected note.
+        self.check_audio_note(tmpwav_file, expected_note)
+
+        # We convert the file by changing the speed by a factor.
+        speed_factor = 2
+        cmd = f"sox -V {wav_file} {tmpwav_file} speed {speed_factor}"
+        self.assertRunOk(cmd)
+
+        # We compute the new expected note from this test controller
+        # side, and check we detect this new note in the audio file.
+        new_expected_note = self.note_from_freq(freq * speed_factor)
+        self.check_audio_note(tmpwav_file, new_expected_note)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
