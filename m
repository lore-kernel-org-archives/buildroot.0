Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032E8C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 21:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9907F6086C;
	Tue,  6 Aug 2024 21:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYdcjH-ena70; Tue,  6 Aug 2024 21:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB09460874
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB09460874;
	Tue,  6 Aug 2024 21:23:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF0D1BF969
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0C73404F6
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a145i2AEbdt5 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 21:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E9D404A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5E9D404A3
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 21:23:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAB8F842F5; Tue,  6 Aug 2024 21:23:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 23:21:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e3bf1fe76db187fbdf4fee5eb5e894ec4cc3e54
X-Git-Newrev: 4a285b160fc0c106ccf9c42a7ebfd8cd5ed54744
X-Patchwork-Hint: ignore
Message-Id: <20240806212307.AAB8F842F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_audio_codec_base.py:
 new helper class
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a285b160fc0c106ccf9c42a7ebfd8cd5ed54744
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a helper class providing a template for testing audio codec
programs such as lame mp3 encoder, flac tools, ogg vorbis-tools, ...

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 .../testing/tests/package/test_audio_codec_base.py | 86 ++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 90c34e51f5..44462dfdfd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1842,6 +1842,7 @@ F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
 F:	support/testing/tests/package/test_attr.py
+F:	support/testing/tests/package/test_audio_codec_base.py
 F:	support/testing/tests/package/test_bc.py
 F:	support/testing/tests/package/test_bcc.py
 F:	support/testing/tests/package/test_bcc/
diff --git a/support/testing/tests/package/test_audio_codec_base.py b/support/testing/tests/package/test_audio_codec_base.py
new file mode 100644
index 0000000000..59c7efcad3
--- /dev/null
+++ b/support/testing/tests/package/test_audio_codec_base.py
@@ -0,0 +1,86 @@
+import math
+import os
+
+import infra.basetest
+
+
+class TestAudioCodecBase(infra.basetest.BRTest):
+    """Common class to test an audio codec package.
+
+    This base class builds a Buildroot system image containing the
+    package enabled in its config, start the emulator, login to it. It
+    prepares an input test WAV file containing a tone. This WAV file
+    is encoded into a new output file in the native encoder format. It
+    is then decoded to a new output WAV file. This final output WAV
+    file is checked to contain the expected tone generated in the
+    initial input WAV file. There is no specific check about file
+    size, nor audio quality. The acceptance criteria is the
+    recognition of the tone. Note: the tone generation is made with
+    the Sox package, and the tone recognition is made with the Aubio
+    package.
+
+    Each test case that inherits from this class must have:
+    __test__ = True  - to let nose2 know that it is a test case
+    config           - defconfig fragment with the packages to run the test
+    encode_test()    - the function that runs the encoder and produces an
+                       encoded file.
+    decode_test()    - the function that runs the decoder and produces a
+                       decode file.
+    """
+    __test__ = False
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_AUBIO=y
+        BR2_PACKAGE_SOX=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    input_file = "reference.wav"
+    decoded_file = "decoded.wav"
+    tone_freq = 440  # General Midi note A3
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        self.prepare_data()
+        self.encode_test(self.input_file)
+        self.decode_test(self.decoded_file)
+        self.check_test()
+
+    def prepare_data(self):
+        # Generate a sinusoidal tone.
+        cmd = "sox -V -r 48000 -n -b 16 -c 1 "
+        cmd += self.input_file
+        cmd += f" synth 3 sin {self.tone_freq} vol -10dB"
+        self.assertRunOk(cmd)
+
+    def encode_test(self, input_filename):
+        msg = "method must be implemented in derived class"
+        raise NotImplementedError(msg)
+
+    def decode_test(self, output_filename):
+        msg = "method must be implemented in derived class"
+        raise NotImplementedError(msg)
+
+    def note_from_freq(self, freq):
+        """Return a note number from the input frequency in Hertz."""
+        return round((12 * math.log(freq / 440) / math.log(2)) + 69)
+
+    def check_test(self):
+        expected_note = self.note_from_freq(self.tone_freq)
+        out, ret = self.emulator.run(f"aubionotes {self.decoded_file}", timeout=20)
+        self.assertEqual(ret, 0)
+        note_found = False
+        for line in out:
+            values = line.split()
+            if len(values) == 3:
+                note = round(float(values[0]))
+                if note == expected_note:
+                    note_found = True
+        self.assertTrue(note_found, "The expected note was not found")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
