Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500DEC3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6D734176D;
	Tue,  3 Jan 2023 20:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D734176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NERLqXDph5Ee; Tue,  3 Jan 2023 20:01:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627004176E;
	Tue,  3 Jan 2023 20:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 627004176E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A75C91BF834
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F13C4176E
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F13C4176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzy1QYLsHzXZ for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 20:01:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 548914176D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 548914176D
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 20:01:06 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.231.8])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B171913F8AC;
 Tue,  3 Jan 2023 21:00:58 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 21:00:46 +0100
Message-Id: <20230103200046.96070-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103200046.96070-1-ju.o@free.fr>
References: <20230103200046.96070-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672776064;
 bh=nl+X2WJUqLrXuaVWUdk/rQ7KAGa3JxS0Q3/sTRhAxEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IW5dyE/DyYGia0zeOqYrFesu1uILy0HSmDO270jJIepNSjWgtTIDUnRdkArN5R/yb
 dA/HLPSQ+yhKC4bm9mVZIPgCr77diYkMkTv+hqtokPHDtT/FHyOhxYJy1dNmQn4SL/
 yrFlM4hexNNzBqIXWh/a4FefzV0ZZDyg2LXZdGr87sml/1Sg4uWpQrFWtGuW6bo7Bv
 LpuHkzIncW5xxlJxHp0LHvKn/k+8hT52mu4USIJgJCyhSJUPxlsLG1XfWxmmZyRXMs
 BVRe7Q1EttBqVP+MbQakirCG4WIsu+vxIK4pYg085YH4g9I7DH/7ZuG1wiJhb+yJTc
 AG5049zEkESVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IW5dyE/D
Subject: [Buildroot] [PATCH 2/2]
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit e593656 with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8 \
        support/testing/tests/package/test_fluidsynth.py \
        support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/check_notes.py \
        support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/gen_midi_file.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_fluidsynth.TestFluidsynth
    ...
    OK
---
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_fluidsynth.py  | 61 +++++++++++++++++++
 .../rootfs-overlay/root/check_notes.py        | 24 ++++++++
 .../rootfs-overlay/root/gen_midi_file.py      | 23 +++++++
 4 files changed, 110 insertions(+)
 create mode 100644 support/testing/tests/package/test_fluidsynth.py
 create mode 100755 support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/check_notes.py
 create mode 100755 support/testing/tests/package/test_fluidsynth/rootfs-overlay/root/gen_midi_file.py

diff --git a/DEVELOPERS b/DEVELOPERS
index af497114dc..a701485c31 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1698,6 +1698,8 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/test_fluidsynth.py
+F:	support/testing/tests/package/test_fluidsynth/
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_fluidsynth.py b/support/testing/tests/package/test_fluidsynth.py
new file mode 100644
index 0000000000..6b45959179
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
+    # RAM.  The test needs 1GB of RAM (larger initrd and soundfond is
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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
