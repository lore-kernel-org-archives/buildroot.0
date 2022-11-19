Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7A2C433FE
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 22:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B8E940200;
	Sat, 19 Nov 2022 22:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B8E940200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CNMfQPSUPlln; Sat, 19 Nov 2022 22:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C929A4029A;
	Sat, 19 Nov 2022 22:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C929A4029A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E979F1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C526D82020
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C526D82020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnmcewcF5ImN for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 22:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA9E82018
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAA9E82018
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 22:43:09 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.43.158])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0707F780340;
 Sat, 19 Nov 2022 23:43:00 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Nov 2022 23:42:21 +0100
Message-Id: <20221119224225.589941-3-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119224225.589941-1-ju.o@free.fr>
References: <20221119224225.589941-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668897787;
 bh=L85gl+MYMp/gReK1NA3JmgGVjlPeZPVIwfy3MHucmus=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oy1v0fn6SFpi8o6lJz8+95TxWJkTORdzVe6nJ6RFkdXH9nHiLgKxnHneiSRB7lHbU
 DPtt44CbyxBvriW1XMQ9T4077KBLoyLS4OI0kNXFEXqLpD8RqAXHbTvqWb4DLh4Fuk
 lABRv8FI4JT2uMPJG1yNnHserkv4kq0J8qjRFX+5/qfnp/vRK1ZUjo1qyxp263BMAY
 oZpV5RDBH7fwBy9NQ+tAItwBwY9y5vKUtFPBjp6VpNL5SMXRV0A5V45SCvnlNbpHyv
 qjsNKnASoUwnECJG6Re66Uaodr+SowBtkPij+Weai8jnVbr75qcZ1IpYL+onVbxlo9
 AEgFMQvDjTbfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Oy1v0fn6
Subject: [Buildroot] [PATCH next 3/7] package/python-spake2: new package
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SPAKE2 password-authenticated key exchange (in pure python).

This library implements the SPAKE2 password-authenticated key
exchange ("PAKE") algorithm. This allows two parties, who share a
weak password, to safely derive a strong shared secret (and
therefore build an encrypted+authenticated channel).

https://github.com/warner/python-spake2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  3 +++
 package/Config.in                             |  1 +
 package/python-spake2/Config.in               | 13 +++++++++++
 package/python-spake2/python-spake2.hash      |  5 +++++
 package/python-spake2/python-spake2.mk        | 14 ++++++++++++
 .../tests/package/sample_python_spake2.py     | 22 +++++++++++++++++++
 .../tests/package/test_python_spake2.py       | 11 ++++++++++
 7 files changed, 69 insertions(+)
 create mode 100644 package/python-spake2/Config.in
 create mode 100644 package/python-spake2/python-spake2.hash
 create mode 100644 package/python-spake2/python-spake2.mk
 create mode 100644 support/testing/tests/package/sample_python_spake2.py
 create mode 100644 support/testing/tests/package/test_python_spake2.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c08dbda48..ebbd0459b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1696,6 +1696,7 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-hkdf/
 F:	package/python-pyalsa/
+F:	package/python-spake2/
 F:	package/riscv-isa-sim/
 F:	package/tinycompress/
 F:	package/zynaddsubfx/
@@ -1703,6 +1704,7 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_hkdf.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
@@ -1711,6 +1713,7 @@ F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_python_spake2.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
 F:	package/dieharder/
diff --git a/package/Config.in b/package/Config.in
index ec7587a072..a1df1542c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1272,6 +1272,7 @@ menu "External python modules"
 	source "package/python-sockjs/Config.in"
 	source "package/python-sortedcontainers/Config.in"
 	source "package/python-soupsieve/Config.in"
+	source "package/python-spake2/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-sqlalchemy/Config.in"
 	source "package/python-sqliteschema/Config.in"
diff --git a/package/python-spake2/Config.in b/package/python-spake2/Config.in
new file mode 100644
index 0000000000..1c2e3a49af
--- /dev/null
+++ b/package/python-spake2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_SPAKE2
+	bool "python-spake2"
+	select BR2_PACKAGE_PYTHON_HKDF # runtime
+	help
+	  SPAKE2 password-authenticated key exchange (in pure python).
+
+	  This library implements the SPAKE2 password-authenticated
+	  key exchange ("PAKE") algorithm. This allows two parties,
+	  who share a weak password, to safely derive a strong shared
+	  secret (and therefore build an encrypted+authenticated
+	  channel).
+
+	  https://github.com/warner/python-spake2
diff --git a/package/python-spake2/python-spake2.hash b/package/python-spake2/python-spake2.hash
new file mode 100644
index 0000000000..30052b1b36
--- /dev/null
+++ b/package/python-spake2/python-spake2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/spake2/json
+md5  0155bad518bb49c39994fe0b7d9fb32c  spake2-0.8.tar.gz
+sha256  c17a614b29ee4126206e22181f70a406c618d3c6c62ca6d6779bce95e9c926f4  spake2-0.8.tar.gz
+# Locally computed sha256 checksums
+sha256  2a8a1200c3a2769d1815727f3b4439bd800f3bc88163118a36ff30b007d30031  LICENSE
diff --git a/package/python-spake2/python-spake2.mk b/package/python-spake2/python-spake2.mk
new file mode 100644
index 0000000000..99ce7dae13
--- /dev/null
+++ b/package/python-spake2/python-spake2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-spake2
+#
+################################################################################
+
+PYTHON_SPAKE2_VERSION = 0.8
+PYTHON_SPAKE2_SOURCE = spake2-$(PYTHON_SPAKE2_VERSION).tar.gz
+PYTHON_SPAKE2_SITE = https://files.pythonhosted.org/packages/60/0b/bb5eca8e18c38a10b1c207bbe6103df091e5cf7b3e5fdc0efbcad7b85b60
+PYTHON_SPAKE2_SETUP_TYPE = setuptools
+PYTHON_SPAKE2_LICENSE = MIT
+PYTHON_SPAKE2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_spake2.py b/support/testing/tests/package/sample_python_spake2.py
new file mode 100644
index 0000000000..49dd914ca8
--- /dev/null
+++ b/support/testing/tests/package/sample_python_spake2.py
@@ -0,0 +1,22 @@
+from binascii import hexlify
+
+from spake2 import SPAKE2_A, SPAKE2_B
+
+
+shared_password = b"This Is The Password!"
+
+alice = SPAKE2_A(shared_password)
+alice_msg = alice.start()
+
+bob = SPAKE2_B(shared_password)
+bob_msg = bob.start()
+
+# Alice and Bob exchange their messages...
+
+alice_key = alice.finish(bob_msg)
+bob_key = bob.finish(alice_msg)
+
+print("alice_key:", hexlify(alice_key))
+print("  bob_key:", hexlify(bob_key))
+
+assert alice_key == bob_key
diff --git a/support/testing/tests/package/test_python_spake2.py b/support/testing/tests/package/test_python_spake2.py
new file mode 100644
index 0000000000..fb47a0802c
--- /dev/null
+++ b/support/testing/tests/package/test_python_spake2.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Spake2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SPAKE2=y
+        """
+    sample_scripts = ["tests/package/sample_python_spake2.py"]
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
