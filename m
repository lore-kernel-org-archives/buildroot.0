Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F06C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 20:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C11D41902;
	Tue, 22 Nov 2022 20:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C11D41902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_Ji2832iXT8; Tue, 22 Nov 2022 20:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A21641903;
	Tue, 22 Nov 2022 20:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A21641903
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D56D31BF285
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE38F61163
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE38F61163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuWkirSzneBN for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 20:32:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38BD561035
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38BD561035
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 20:32:07 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.84.171])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4CCE4B00572;
 Tue, 22 Nov 2022 21:31:59 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 21:31:26 +0100
Message-Id: <20221122203130.184496-3-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122203130.184496-1-ju.o@free.fr>
References: <20221122203130.184496-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669149125;
 bh=PDG6L1uuOJpaph1mx044yV60q/3j55tveybHM8Tgl2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sEf9suJ8bqAKEiYDp76yyTmTq6/my48DFK4ZnN/ron/C3K/08rHH5LDfucgVMt+ZF
 BSEu02bVBQNWFeAeO9fnazKUIOUmH7tQhuOrDHef5W8YwzObf1KQxbA0LalXx3spMw
 U9j1xZIBMWUzXWmWG/ugUwi0Zo1N7hul2Qt4LI+TJhzWPHa4vu1rHHMS6+9+edMI6q
 7415p62ASxHD8BoFezOfFJExMM/xe1Lh+BN6Ii6+qUyYPLOFbQy33RinMH3TqKyH2/
 krLFYHhXCjEC+Yz21dh3PYy72puC3NO/Zt9KRsW0wQnae+vOdxENr75fHy+SI8Rj0T
 g1OvGMKBGI0HA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sEf9suJ8
Subject: [Buildroot] [PATCH next v2 3/7] package/python-spake2: new package
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
index 3c636a0d55..8807f13aae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1696,6 +1696,7 @@ F:	package/python-distro/
 F:	package/python-gnupg/
 F:	package/python-hkdf/
 F:	package/python-pyalsa/
+F:	package/python-spake2/
 F:	package/riscv-isa-sim/
 F:	package/tinycompress/
 F:	package/z3/
@@ -1704,6 +1705,7 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_hkdf.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
+F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
@@ -1712,6 +1714,7 @@ F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
+F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_z3.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/package/Config.in b/package/Config.in
index afb42efe49..9c476d9407 100644
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
