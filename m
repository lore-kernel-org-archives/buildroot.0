Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A7EC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3D056FC25;
	Tue, 21 Feb 2023 01:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D056FC25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GiX2vftarqpa; Tue, 21 Feb 2023 01:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6FCB6FFF9;
	Tue, 21 Feb 2023 01:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6FCB6FFF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 279C01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DA926FFE8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA926FFE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n71YRpOLHOWE for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 357586FE5D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 357586FE5D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3387B81979; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 12:50:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 12d85e9646ed89552c732775de000ad0b436a139
X-Git-Newrev: 433ce2966f787248d5b8a62c46634e2f86250f8e
X-Patchwork-Hint: ignore
Message-Id: <20230220205252.3387B81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-hkdf: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=433ce2966f787248d5b8a62c46634e2f86250f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

HMAC-based Extract-and-Expand Key Derivation Function (HKDF).

https://github.com/casebeer/python-hkdf

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Thomas: justify the license.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 package/Config.in                                  |  1 +
 package/python-hkdf/Config.in                      |  7 +++++++
 package/python-hkdf/python-hkdf.hash               |  3 +++
 package/python-hkdf/python-hkdf.mk                 | 17 +++++++++++++++++
 .../testing/tests/package/sample_python_hkdf.py    | 22 ++++++++++++++++++++++
 support/testing/tests/package/test_python_hkdf.py  | 11 +++++++++++
 7 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f10036f7f2..69e73636be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1693,6 +1693,7 @@ F:	package/perftest/
 F:	package/ptm2human/
 F:	package/python-distro/
 F:	package/python-gnupg/
+F:	package/python-hkdf/
 F:	package/python-pyalsa/
 F:	package/rdma-core/
 F:	package/riscv-isa-sim/
@@ -1709,6 +1710,7 @@ F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_python_distro.py
+F:	support/testing/tests/package/test_python_hkdf.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_rdma_core.py
diff --git a/package/Config.in b/package/Config.in
index aa87f1305d..b28949500e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1073,6 +1073,7 @@ menu "External python modules"
 	source "package/python-h11/Config.in"
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
index 0000000000..8b68c5cc9f
--- /dev/null
+++ b/package/python-hkdf/python-hkdf.mk
@@ -0,0 +1,17 @@
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
+# No license file in the tree, but
+# https://github.com/casebeer/python-hkdf/blob/master/LICENSE shows
+# it's BSD-2-Clause. Issue already reported upstream:
+# https://github.com/casebeer/python-hkdf/issues/6
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
