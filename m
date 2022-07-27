Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0FFC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 20:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC3D960E96;
	Wed, 27 Jul 2022 20:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC3D960E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YiLau0Y_6bY; Wed, 27 Jul 2022 20:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82E5760ABB;
	Wed, 27 Jul 2022 20:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82E5760ABB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC0901BF39A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9411E60ABB
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9411E60ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7JB4zLZIX1m for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 20:23:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A1D60A90
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30A1D60A90
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 20:23:22 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.18.88])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4B654B00718;
 Wed, 27 Jul 2022 22:23:16 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 22:23:07 +0200
Message-Id: <20220727202307.101999-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658953398;
 bh=a2E8aofqEF/pMh1ociUWjXatbTJ527WwJu4C/tPmpus=;
 h=From:To:Cc:Subject:Date:From;
 b=R/LLNesNbZ9zQTBkH5kQBRTX3LZd7amy37pRzKCvbDCi9ZLS8+tdCjiVgE92pN0wp
 Xk6O7YV1Kc1PL+TgRMcCR7lI0O8m8oq0aPAFOTkMXgOkc6eTy5yhfXLu426UlzrX5Y
 3P2Gs3L8KOxa0zg6Mop+5QSsTByU4wKQvfKwgGbojkEfZt7D2btLN9Yc8b+mW7JPwM
 AR9h97aev77Ao5Dvinq317H0dWzzq0+x5xgckv5rTcTs0tsA1mSZO1XBQ4inhvh5lR
 9j3EitueBJVTaqaQ1aDjgJatnIQhLZA2XcEPYuWThvS1WBfJ4RqKWb7dlBMk5FOIeP
 0w4nj9njUXmNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R/LLNesN
Subject: [Buildroot] [PATCH 1/1] support/testing: add test for python-pyalsa
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a simple test importing pyalsa, showing alsa library version and
attempting to list cards.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                           |  2 ++
 .../testing/tests/package/sample_python_pyalsa.py    | 12 ++++++++++++
 support/testing/tests/package/test_python_pyalsa.py  | 11 +++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_pyalsa.py
 create mode 100644 support/testing/tests/package/test_python_pyalsa.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 50a295a743..cc0abef064 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1659,9 +1659,11 @@ F:	package/riscv-isa-sim/
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
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
