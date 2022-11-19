Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A286C4332F
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 22:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACB48404EF;
	Sat, 19 Nov 2022 22:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACB48404EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZH4aNTkfZLa; Sat, 19 Nov 2022 22:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6B354013C;
	Sat, 19 Nov 2022 22:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6B354013C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 610211BF4E7
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CD3E82020
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 22:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD3E82020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Zc2doYFzgkP for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 22:43:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3096882018
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3096882018
 for <buildroot@buildroot.org>; Sat, 19 Nov 2022 22:43:02 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.43.158])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7E9D77802D6;
 Sat, 19 Nov 2022 23:42:52 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Nov 2022 23:42:20 +0100
Message-Id: <20221119224225.589941-2-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119224225.589941-1-ju.o@free.fr>
References: <20221119224225.589941-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668897780;
 bh=ZrBH9htFLHTXLAm/339z3FFGcIhRGRHZ4IKLPO55Cp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MBQtNTfeuwoKF0wX4DFnrVPYqgiUyWbO+bB3SNrF/9EHLUmIoikzZ+5eUVFToe8Ad
 rZIVXrP/cy9gzTNxNCO0/8C20uNdGOX4WO7QR0P7WcaAZj7LkSo4QUe76zXmnFTD2j
 90g3JMGChey7T66CqjlqXxx2vVbOmsse1c+8vQ6t1aEotO5fY1gyVWgmAb6dArB4Ui
 euDejiHvg1I2f31DS+Whl6LVnASqHixhczBY9BqCirmHGa55sQ40endyM8/7X/9dMp
 ZyfHGZZEAIjfQ5ORvh9+BJChZ3hU7JcFaVIVaiOHjfqsymNHP0dzdBj8BZOBCgfnyN
 UOMwsDgrKSIbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MBQtNTfe
Subject: [Buildroot] [PATCH next 2/7] package/python-hkdf: new package
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

HMAC-based Extract-and-Expand Key Derivation Function (HKDF).

https://github.com/casebeer/python-hkdf

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  3 +++
 package/Config.in                             |  1 +
 package/python-hkdf/Config.in                 |  7 ++++++
 package/python-hkdf/python-hkdf.hash          |  3 +++
 package/python-hkdf/python-hkdf.mk            | 13 +++++++++++
 .../tests/package/sample_python_hkdf.py       | 22 +++++++++++++++++++
 .../testing/tests/package/test_python_hkdf.py | 11 ++++++++++
 7 files changed, 60 insertions(+)
 create mode 100644 package/python-hkdf/Config.in
 create mode 100644 package/python-hkdf/python-hkdf.hash
 create mode 100644 package/python-hkdf/python-hkdf.mk
 create mode 100644 support/testing/tests/package/sample_python_hkdf.py
 create mode 100644 support/testing/tests/package/test_python_hkdf.py

diff --git a/DEVELOPERS b/DEVELOPERS
index bc026da4aa..1c08dbda48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1694,11 +1694,13 @@ F:	package/ola/
 F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
+F:	package/python-hkdf/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
 F:	package/tinycompress/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
+F:	support/testing/tests/package/sample_python_hkdf.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/test_hwloc.py
@@ -1706,6 +1708,7 @@ F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
+F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 
diff --git a/package/Config.in b/package/Config.in
index 52004de075..ec7587a072 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1061,6 +1061,7 @@ menu "External python modules"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hiredis/Config.in"
+	source "package/python-hkdf/Config.in"
 	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
 	source "package/python-httplib2/Config.in"
diff --git a/package/python-hkdf/Config.in b/package/python-hkdf/Config.in
new file mode 100644
index 0000000000..2add348ca2
--- /dev/null
+++ b/package/python-hkdf/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_HKDF
+	bool "python-hkdf"
+	help
+	  HMAC-based Extract-and-Expand Key Derivation Function
+	  (HKDF).
+
+	  https://github.com/casebeer/python-hkdf
diff --git a/package/python-hkdf/python-hkdf.hash b/package/python-hkdf/python-hkdf.hash
new file mode 100644
index 0000000000..87702b4582
--- /dev/null
+++ b/package/python-hkdf/python-hkdf.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/hkdf/json
+md5  d10471ad0ec891cdbe165d78282c943e  hkdf-0.0.3.tar.gz
+sha256  622a31c634bc185581530a4b44ffb731ed208acf4614f9c795bdd70e77991dca  hkdf-0.0.3.tar.gz
diff --git a/package/python-hkdf/python-hkdf.mk b/package/python-hkdf/python-hkdf.mk
new file mode 100644
index 0000000000..f495de7d0b
--- /dev/null
+++ b/package/python-hkdf/python-hkdf.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-hkdf
+#
+################################################################################
+
+PYTHON_HKDF_VERSION = 0.0.3
+PYTHON_HKDF_SOURCE = hkdf-$(PYTHON_HKDF_VERSION).tar.gz
+PYTHON_HKDF_SITE = https://files.pythonhosted.org/packages/c3/be/327e072850db181ce56afd51e26ec7aa5659b18466c709fa5ea2548c935f
+PYTHON_HKDF_SETUP_TYPE = setuptools
+PYTHON_HKDF_LICENSE = BSD-2-Clause
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_hkdf.py b/support/testing/tests/package/sample_python_hkdf.py
new file mode 100644
index 0000000000..a730c633e1
--- /dev/null
+++ b/support/testing/tests/package/sample_python_hkdf.py
@@ -0,0 +1,22 @@
+import hashlib
+from binascii import hexlify, unhexlify
+
+from hkdf import Hkdf, hkdf_expand, hkdf_extract
+
+salt = b"ThisIsTheSalt."
+key_in = b"ThisIsTheSecretKey"
+key_info = b"KeyInfo1"
+key_len = 16
+expected_key = unhexlify(b"b49d6cc9065b72f3a0859377d8bb7299")
+
+prk = hkdf_extract(salt, input_key_material=key_in, hash=hashlib.sha512)
+key1 = hkdf_expand(prk, info=key_info, length=key_len)
+
+print("key1:", hexlify(key1))
+assert key1 == expected_key
+
+kdf = Hkdf(salt, input_key_material=key_in, hash=hashlib.sha512)
+key2 = kdf.expand(info=key_info, length=key_len)
+
+print("key2:", hexlify(key2))
+assert key2 == expected_key
diff --git a/support/testing/tests/package/test_python_hkdf.py b/support/testing/tests/package/test_python_hkdf.py
new file mode 100644
index 0000000000..e93c24ff60
--- /dev/null
+++ b/support/testing/tests/package/test_python_hkdf.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Hkdf(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_HKDF=y
+        """
+    sample_scripts = ["tests/package/sample_python_hkdf.py"]
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
