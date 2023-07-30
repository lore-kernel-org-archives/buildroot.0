Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEDFC001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2795B607E3;
	Sun, 30 Jul 2023 10:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2795B607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nACbb_hpkSvJ; Sun, 30 Jul 2023 10:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13C8960A82;
	Sun, 30 Jul 2023 10:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C8960A82
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 387FE1BF2AF
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DEEA410E0
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DEEA410E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s792_r8sA64e for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:59:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DDA1409A7
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DDA1409A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88B9483C3A; Sun, 30 Jul 2023 10:59:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:58:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 893d642a77c8e92bbc2349998950e2a784b5e5bf
X-Git-Newrev: f7f915fc4a1be0f44a2cb0509162ea946f8d2bb5
X-Patchwork-Hint: ignore
Message-Id: <20230730105924.88B9483C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-midiutil: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7f915fc4a1be0f44a2cb0509162ea946f8d2bb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A pure python library for creating multi-track MIDI files.

https://github.com/MarkCWirt/MIDIUtil

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/python-midiutil/Config.in                  |  6 ++++++
 package/python-midiutil/python-midiutil.hash       |  5 +++++
 package/python-midiutil/python-midiutil.mk         | 14 +++++++++++++
 .../tests/package/sample_python_midiutil.py        | 23 ++++++++++++++++++++++
 .../testing/tests/package/test_python_midiutil.py  | 11 +++++++++++
 7 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b829a364b..9f115d9f2f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1725,6 +1725,7 @@ F:	package/python-hwdata/
 F:	package/python-magic-wormhole/
 F:	package/python-magic-wormhole-mailbox-server/
 F:	package/python-magic-wormhole-transit-relay/
+F:	package/python-midiutil/
 F:	package/python-pyalsa/
 F:	package/python-spake2/
 F:	package/rdma-core/
@@ -1735,6 +1736,7 @@ F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
+F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_acpica.py
@@ -1776,6 +1778,7 @@ F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_hwdata.py
 F:	support/testing/tests/package/test_python_magic_wormhole.py
+F:	support/testing/tests/package/test_python_midiutil.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
diff --git a/package/Config.in b/package/Config.in
index 998074960d..bc1f403ff0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1144,6 +1144,7 @@ menu "External python modules"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-memory-profiler/Config.in"
+	source "package/python-midiutil/Config.in"
 	source "package/python-mimeparse/Config.in"
 	source "package/python-minimalmodbus/Config.in"
 	source "package/python-mistune/Config.in"
diff --git a/package/python-midiutil/Config.in b/package/python-midiutil/Config.in
new file mode 100644
index 0000000000..c496e60421
--- /dev/null
+++ b/package/python-midiutil/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_MIDIUTIL
+	bool "python-midiutil"
+	help
+	  A pure python library for creating multi-track MIDI files.
+
+	  https://github.com/MarkCWirt/MIDIUtil
diff --git a/package/python-midiutil/python-midiutil.hash b/package/python-midiutil/python-midiutil.hash
new file mode 100644
index 0000000000..88340a23b8
--- /dev/null
+++ b/package/python-midiutil/python-midiutil.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/midiutil/json
+md5  948c16c74e7355268158f227b710edce  MIDIUtil-1.2.1.tar.gz
+sha256  79fa983bd1efc60785f68a8fe78fa8f45b8d7ec5898bf7cb7f3f7f3336d6a90a  MIDIUtil-1.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  8d5bdaebe8445a4c2dc812c205eb5455ba123aa1af8503cc88712115ab7c97ef  License.txt
diff --git a/package/python-midiutil/python-midiutil.mk b/package/python-midiutil/python-midiutil.mk
new file mode 100644
index 0000000000..cb7e8f6ccb
--- /dev/null
+++ b/package/python-midiutil/python-midiutil.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-midiutil
+#
+################################################################################
+
+PYTHON_MIDIUTIL_VERSION = 1.2.1
+PYTHON_MIDIUTIL_SOURCE = MIDIUtil-$(PYTHON_MIDIUTIL_VERSION).tar.gz
+PYTHON_MIDIUTIL_SITE = https://files.pythonhosted.org/packages/f5/44/fde6772d8bfaea64fcf5eb948124d0a5fdf5f848b14ac22a23ced53e562d
+PYTHON_MIDIUTIL_SETUP_TYPE = setuptools
+PYTHON_MIDIUTIL_LICENSE = MIT
+PYTHON_MIDIUTIL_LICENSE_FILES = License.txt
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_midiutil.py b/support/testing/tests/package/sample_python_midiutil.py
new file mode 100644
index 0000000000..58bf1fbccb
--- /dev/null
+++ b/support/testing/tests/package/sample_python_midiutil.py
@@ -0,0 +1,23 @@
+#! /usr/bin/env python3
+
+# Taken from:
+# https://github.com/MarkCWirt/MIDIUtil/blob/1.2.1/examples/c-major-scale.py
+
+from midiutil import MIDIFile
+
+degrees = [60, 62, 64, 65, 67, 69, 71, 72]  # MIDI note number
+track = 0
+channel = 0
+time = 0        # In beats
+duration = 1    # In beats
+tempo = 60      # In BPM
+volume = 100    # 0-127, as per the MIDI standard
+
+MyMIDI = MIDIFile(1)  # One track
+MyMIDI.addTempo(track, time, tempo)
+
+for i, pitch in enumerate(degrees):
+    MyMIDI.addNote(track, channel, pitch, time + i, duration, volume)
+
+with open("major-scale.mid", "wb") as output_file:
+    MyMIDI.writeFile(output_file)
diff --git a/support/testing/tests/package/test_python_midiutil.py b/support/testing/tests/package/test_python_midiutil.py
new file mode 100644
index 0000000000..302fbfb1ed
--- /dev/null
+++ b/support/testing/tests/package/test_python_midiutil.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3MidiUtil(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MIDIUTIL=y
+        """
+    sample_scripts = ["tests/package/sample_python_midiutil.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
