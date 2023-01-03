Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F376C3DA7D
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 20:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A75C440A0D;
	Tue,  3 Jan 2023 20:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A75C440A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jlGx0bp-KGz; Tue,  3 Jan 2023 20:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBB67400DD;
	Tue,  3 Jan 2023 20:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBB67400DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59D201BF834
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4316260D68
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 20:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4316260D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7rLyZGvEh3j for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 20:01:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5111660A8D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5111660A8D
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 20:01:01 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.231.8])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A3D6113F8D9;
 Tue,  3 Jan 2023 21:00:53 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 21:00:45 +0100
Message-Id: <20230103200046.96070-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672776058;
 bh=jnwdOYFt8jJ3JXECt3MSw6ega16tvckHscw2S7dfyNw=;
 h=From:To:Cc:Subject:Date:From;
 b=YPrXD1+WIkbRQct8fmAlLGOEW/SJrZBY+emThi5BZaK2IjddZ4n0PMi5O2ZmDqSFn
 utgWePwpjYcgKqMiS+99S9powDGkWK8qywwsPRSBntRhA+cb9qNGt5uiwJsOr0uJpu
 B5KCBfQ8FEodEgbRS+7eyYEDYRqwhZosqnaUp/XMqmTnj8LyUbuBJ6lpXonCL5xWa5
 QABbsR2vjUtLBfqya1msihoYwru2pj1Ibb4i9Mhx9ZSJdyO0bRvkHJTKwvlt6C59ie
 Ay+wnvPpQHC60a07punFSS+QUwR4PfWFaAVHOhiDkb3/gsoeABW1A6BXdRbHtAYDw6
 DM5lF7MuZqcSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YPrXD1+W
Subject: [Buildroot] [PATCH 1/2] package/python-midiutil: new package
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

A pure python library for creating multi-track MIDI files.

https://github.com/MarkCWirt/MIDIUtil

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit e593656 with commands:

    make check-package
    ...
    0 warnings generated

    python3 -m flake8 \
        support/testing/tests/package/sample_python_midiutil.py \
        support/testing/tests/package/test_python_midiutil.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_midiutil.TestPythonPy3MidiUtil
    ...
    OK
---
 DEVELOPERS                                    |  3 +++
 package/Config.in                             |  1 +
 package/python-midiutil/Config.in             |  6 +++++
 package/python-midiutil/python-midiutil.hash  |  5 ++++
 package/python-midiutil/python-midiutil.mk    | 14 +++++++++++
 .../tests/package/sample_python_midiutil.py   | 23 +++++++++++++++++++
 .../tests/package/test_python_midiutil.py     | 11 +++++++++
 7 files changed, 63 insertions(+)
 create mode 100644 package/python-midiutil/Config.in
 create mode 100644 package/python-midiutil/python-midiutil.hash
 create mode 100644 package/python-midiutil/python-midiutil.mk
 create mode 100644 support/testing/tests/package/sample_python_midiutil.py
 create mode 100644 support/testing/tests/package/test_python_midiutil.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 8399dcc7af..af497114dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1688,6 +1688,7 @@ F:	package/ola/
 F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
+F:	package/python-midiutil/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
 F:	package/tinycompress/
@@ -1695,6 +1696,7 @@ F:	package/z3/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
+F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_ncdu.py
@@ -1703,6 +1705,7 @@ F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
+F:	support/testing/tests/package/test_python_midiutil.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_z3.py
 
diff --git a/package/Config.in b/package/Config.in
index 995dae2c57..4157fe1214 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1123,6 +1123,7 @@ menu "External python modules"
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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
