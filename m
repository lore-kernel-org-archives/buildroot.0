Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BB1C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4061140515;
	Thu, 28 Jul 2022 21:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4061140515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZZ3hRGTK9eR; Thu, 28 Jul 2022 21:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 520D9405C4;
	Thu, 28 Jul 2022 21:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 520D9405C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 130E81BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE398415BB
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE398415BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QqobKuAxr4qC for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 062AD415B5
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062AD415B5
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D095F86821; Thu, 28 Jul 2022 20:58:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 23:12:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64f1603bb805cd651d34a7cfe1a1c12c4242fed7
X-Git-Newrev: 8c074e73b00b082a69261101485e269823a539ea
X-Patchwork-Hint: ignore
Message-Id: <20220728205852.D095F86821@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for python-pyalsa
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c074e73b00b082a69261101485e269823a539ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a simple test importing pyalsa, showing alsa library version and
attempting to list cards.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                            |  2 ++
 support/testing/tests/package/sample_python_pyalsa.py | 12 ++++++++++++
 support/testing/tests/package/test_python_pyalsa.py   | 11 +++++++++++
 3 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cb98c3883d..3d33e83e5a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1660,9 +1660,11 @@ F:	package/riscv-isa-sim/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
+F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
+F:	support/testing/tests/package/test_python_pyalsa.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/support/testing/tests/package/sample_python_pyalsa.py b/support/testing/tests/package/sample_python_pyalsa.py
new file mode 100644
index 0000000000..e22226e871
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyalsa.py
@@ -0,0 +1,12 @@
+#! /usr/bin/env python3
+
+from pyalsa import alsacard
+
+print('asoundlibVersion:', alsacard.asoundlib_version())
+print('cardLoad:', alsacard.card_load(0))
+print('cardList:', alsacard.card_list())
+print('deviceNameHint for all cards:')
+print(alsacard.device_name_hint(-1, "pcm"))
+for card in alsacard.card_list():
+    print('deviceNameHint for card #%i:' % card)
+    print(alsacard.device_name_hint(card, "pcm"))
diff --git a/support/testing/tests/package/test_python_pyalsa.py b/support/testing/tests/package/test_python_pyalsa.py
new file mode 100644
index 0000000000..8046496526
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyalsa.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PyAlsa(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYALSA=y
+        """
+    sample_scripts = ["tests/package/sample_python_pyalsa.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
