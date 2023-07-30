Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB47DC001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80D7D60761;
	Sun, 30 Jul 2023 10:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80D7D60761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mpI6XTU1s52n; Sun, 30 Jul 2023 10:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 956C9607E3;
	Sun, 30 Jul 2023 10:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 956C9607E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 142BF1BF2AF
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0A5E4137D
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0A5E4137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOC816oYggzu for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:59:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA007410E0
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA007410E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95AFA83C3B; Sun, 30 Jul 2023 10:59:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:59:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7f915fc4a1be0f44a2cb0509162ea946f8d2bb5
X-Git-Newrev: 6404185f728fb1feacfbb5eaf59b1243b00a14a7
X-Patchwork-Hint: ignore
Message-Id: <20230730105924.95AFA83C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_fluidsynth.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=6404185f728fb1feacfbb5eaf59b1243b00a14a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_fluidsynth.py   | 61 ++++++++++++++++++++++
 .../rootfs-overlay/root/check_notes.py             | 24 +++++++++
 .../rootfs-overlay/root/gen_midi_file.py           | 23 ++++++++
 4 files changed, 110 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9f115d9f2f..42d08f7fc7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1747,6 +1747,8 @@ F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
+F:	support/testing/tests/package/test_fluidsynth.py
+F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_gawk.py
 F:	support/testing/tests/package/test_glslsandbox_player.py
 F:	support/testing/tests/package/test_glslsandbox_player/
diff --git a/support/testing/tests/package/test_fluidsynth.py b/support/testing/tests/package/test_fluidsynth.py
new file mode 100644
index 0000000000..20d4da0c50
--- /dev/null
+++ b/support/testing/tests/package/test_fluidsynth.py
@@ -0,0 +1,61 @@
+import os
+
+import infra.basetest
+
+
+class TestFluidsynth(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it is
+    # armv5 and based on qemu versatilepb which is limited to 256MB of
+    # RAM.  The test needs 1GB of RAM (larger initrd and soundfont is
+    # loaded in memory).
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.86"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_AUBIO=y
+        BR2_PACKAGE_FLUIDSYNTH=y
+        BR2_PACKAGE_FLUIDSYNTH_LIBSNDFILE=y
+        BR2_PACKAGE_FLUID_SOUNDFONT=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MIDIUTIL=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           # overlay to add helper test scripts
+           infra.filepath("tests/package/test_fluidsynth/rootfs-overlay"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "1G", "-initrd", img])
+        self.emulator.login()
+
+        # Test the binary executes
+        self.assertRunOk("fluidsynth --version")
+
+        # Create a simple MIDI file programmatically
+        self.assertRunOk("/root/gen_midi_file.py /tmp/output.mid")
+
+        # Convert the MIDI file to a WAV file
+        cmd = "fluidsynth"
+        cmd += " -F /tmp/output.wav"
+        cmd += " /usr/share/soundfonts/FluidR3_GM.sf2"
+        cmd += " /tmp/output.mid"
+        self.assertRunOk(cmd)
+
+        # Extract notes in the WAV file with Aubio
+        self.assertRunOk("aubionotes /tmp/output.wav > /tmp/notes.txt")
+
+        # Check the extracted notes are the expected ones
+        self.assertRunOk("/root/check_notes.py < /tmp/notes.txt")
diff --git a/support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/check_notes.py b/support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/check_notes.py
new file mode 100755
index 0000000000..7301e14a9f
--- /dev/null
+++ b/support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/check_notes.py
@@ -0,0 +1,24 @@
+#! /usr/bin/env python3
+#
+# This script reads the output of the "aubionotes" command and
+# validates it contains three expected notes (A2, E3, A3) in the
+# correct order. Silences or other notes are allowed in between those
+# notes, to allow some flexibility.
+
+import sys
+
+found = 0
+notes = [57, 64, 69]
+
+for line in sys.stdin:
+    fields = line.split()
+    if len(fields) >= 1:
+        value = round(float(fields[0]))
+        if value == notes[found]:
+            found += 1
+        if found == len(notes):
+            print("Found all notes")
+            sys.exit(0)
+
+print("Error: all notes not found")
+sys.exit(1)
diff --git a/support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/gen_midi_file.py b/support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/gen_midi_file.py
new file mode 100755
index 0000000000..aa53a25af3
--- /dev/null
+++ b/support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/gen_midi_file.py
@@ -0,0 +1,23 @@
+#! /usr/bin/env python3
+#
+# This script generates a MIDI file with only 3 notes: A2, E3, A3
+# usage: gen_midi_file.py [output-filename]
+
+import sys
+
+from midiutil import MIDIFile
+
+output_filename = "output.mid"
+if len(sys.argv) >= 2:
+    output_filename = sys.argv[1]
+
+notes = [57, 64, 69]  # A2, E3, A3
+
+midi = MIDIFile()
+midi.addTempo(track=0, time=0, tempo=60)
+
+for i, p in enumerate(notes):
+    midi.addNote(track=0, channel=0, pitch=p, time=i, duration=1, volume=100)
+
+with open(output_filename, "wb") as output_file:
+    midi.writeFile(output_file)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
