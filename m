Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B9AC4828F
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 10:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA0042CF9;
	Fri,  9 Feb 2024 10:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOpntNIasBJA; Fri,  9 Feb 2024 10:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 563F642D21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 563F642D21;
	Fri,  9 Feb 2024 10:26:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 378DF1BF31E
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 10:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2546261AF9
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 10:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FF6F2zgZcWx for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 10:26:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3082761791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3082761791
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3082761791
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 10:25:59 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 83DAA2C832C5;
 Fri,  9 Feb 2024 11:25:57 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  9 Feb 2024 11:25:55 +0100
Message-Id: <20240209102556.2020962-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707474357; bh=8ynsZPCPQCL2FDqKwjICaBMkSSr0zQnai+OuMxJ7qJQ=;
 h=From:To:Cc:Subject:Date;
 b=Rj+CtBQz499T2jNosfWrC4L0xn9cUNApaZwb4xLebupOpBtoTiwQggKM2wYzQRpMs
 MBUZ0rnwVQ644jnS3kjipDj7/FKtqPlqhNdlGgIigMWu6+QL9wTofxrUcoxKEEgpha
 x2KbzU6p3qvpu0TtRnbCyL4f6blTeXbS5/VNX4Qf3WF1NU3dCpRcBFqcP0WyvRO/99
 BK0Js3v/QbGkE2QsM5prfCN1aXzshNakmdZpPug0qISdyHSLpotG6vZV0MxWVtvd7L
 TEwdbTDcm6ll+CoFnXThlKSaK1JXgffuvH4RW4IlU/xLQlb4r3JLzpVoJ8LWyOfMlm
 SyRiAxAy2TO1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Rj+CtBQz
Subject: [Buildroot] [PATCH] package/python-jc: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version still requires xmltodict and pyexpat for the cli tool to
work correctly but this should become optional in a future release. [1]

The other dependencies are already optional and this only mentioned in
the package's help text. [2]

[1] https://github.com/kellyjonbrazil/jc/issues/537
[2] https://github.com/kellyjonbrazil/jc/issues/108

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/Config.in                             |  1 +
 package/python-jc/Config.in                   | 12 ++++++++++
 package/python-jc/python-jc.hash              |  5 +++++
 package/python-jc/python-jc.mk                | 14 ++++++++++++
 .../testing/tests/package/test_python_jc.py   | 22 +++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/python-jc/Config.in
 create mode 100644 package/python-jc/python-jc.hash
 create mode 100644 package/python-jc/python-jc.mk
 create mode 100644 support/testing/tests/package/test_python_jc.py

diff --git a/package/Config.in b/package/Config.in
index 91a6f1de00..7f4d0740ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1151,6 +1151,7 @@ menu "External python modules"
 	source "package/python-janus/Config.in"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-functools/Config.in"
+	source "package/python-jc/Config.in"
 	source "package/python-jedi/Config.in"
 	source "package/python-jeepney/Config.in"
 	source "package/python-jinja2/Config.in"
diff --git a/package/python-jc/Config.in b/package/python-jc/Config.in
new file mode 100644
index 0000000000..ec1f855b8c
--- /dev/null
+++ b/package/python-jc/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_JC
+	bool "python-jc"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_PYTHON_XMLTODICT
+	help
+	  Converts the output of popular command-line tools and file-
+	  types to JSON.
+
+	  Optionally requires python-pygments for syntax highlighting,
+	  python-ruamel-yaml for yaml parsing and output.
+
+	  https://github.com/kellyjonbrazil/jc
diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
new file mode 100644
index 0000000000..b06c660a51
--- /dev/null
+++ b/package/python-jc/python-jc.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jc/json
+md5  dffc3f8e92e4c535f5653641abfa5397  jc-1.25.0.tar.gz
+sha256  eba4aaaf5128f18a16121c0bcfc1b794fc80b665ee97f6a25da9c156559da54e  jc-1.25.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
new file mode 100644
index 0000000000..872c1aa377
--- /dev/null
+++ b/package/python-jc/python-jc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jc
+#
+################################################################################
+
+PYTHON_JC_VERSION = 1.25.0
+PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/b7/42/be8a1d0410bfddc1a30c06d77d06a1856c49fb18ec5545474a6f17dc3399
+PYTHON_JC_SETUP_TYPE = setuptools
+PYTHON_JC_LICENSE = MIT
+PYTHON_JC_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/test_python_jc.py b/support/testing/tests/package/test_python_jc.py
new file mode 100644
index 0000000000..6c7fb34cac
--- /dev/null
+++ b/support/testing/tests/package/test_python_jc.py
@@ -0,0 +1,22 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonJc(TestPythonPackageBase):
+    __test__ = True
+    # We deliberately run the test without the optional dependencies,
+    # as this configuration is less tested upstream.
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_JC=y
+        """
+    timeout = 60
+
+    def test_run(self):
+        self.login()
+        cmd = "jc -h > /dev/null 2>&1"
+        self.assertRunOk(cmd, timeout=self.timeout)
+        cmd = "jc id | grep -q root"
+        self.assertRunOk(cmd, timeout=self.timeout)
+        cmd = "jc env | grep -q PATH"
+        self.assertRunOk(cmd, self.timeout)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
