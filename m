Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AABEC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 20:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF9FB6115F;
	Tue, 22 Nov 2022 20:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF9FB6115F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LjmL4QUtOvD8; Tue, 22 Nov 2022 20:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3D6861160;
	Tue, 22 Nov 2022 20:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3D6861160
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B10FB1BF285
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C011418F8
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 20:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C011418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmQrYAbS_jpY for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 20:32:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12B43418FD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12B43418FD
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 20:32:00 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.84.171])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DF84DB00533;
 Tue, 22 Nov 2022 21:31:52 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 21:31:25 +0100
Message-Id: <20221122203130.184496-2-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122203130.184496-1-ju.o@free.fr>
References: <20221122203130.184496-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669149119;
 bh=uUI+4sjsGAPyRzGryH3uB0hTHk0X9WXNvt9vVssfCZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQndz1bM0t4005Aj6bLc+u149C7utQkxp6/rqz8qmCWJweTxTjDNkUJbIej+Ibs9l
 T9uKhDPKQE3hXHS1JeYAQT2C9+vw9BA9DmrmuW1ItHZklDQOkUjkx8gUZXmIE+P2VO
 tIAwsfv6P1rYRnG15pAqcLTr8gnxx1UvCZzZUdgmC58bI725rT9mjml3vMUABngUgs
 Xs9LOFOXe49MhZaNQcA63AMlLKAsBqb8Jn3971s+DV3zFkckAgl8VvQaPcTjlsl0cR
 S2MoW6y/O/mWWb1LvHkAn0gWhJ1IuwIsGH2AWChprF0zN2umxm5qsivIJFeKePTB6Q
 I+FktDJVrqTAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qQndz1bM
Subject: [Buildroot] [PATCH next v2 2/7] package/python-hkdf: new package
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
index fb6b329087..3c636a0d55 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1694,12 +1694,14 @@ F:	package/ola/
 F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
+F:	package/python-hkdf/
 F:	package/python-pyalsa/
 F:	package/riscv-isa-sim/
 F:	package/tinycompress/
 F:	package/z3/
 F:	package/zynaddsubfx/
 F:	support/testing/tests/package/sample_python_distro.py
+F:	support/testing/tests/package/sample_python_hkdf.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/test_hwloc.py
@@ -1707,6 +1709,7 @@ F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_python_distro.py
+F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_z3.py
diff --git a/package/Config.in b/package/Config.in
index 7b18859d02..afb42efe49 100644
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
