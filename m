Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE0AC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 09:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6070240836;
	Tue, 13 Feb 2024 09:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjUzlkOiqrK8; Tue, 13 Feb 2024 09:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD284069D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD284069D;
	Tue, 13 Feb 2024 09:40:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 381481BF20B
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 09:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 257EE4069D
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 09:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-Z3TBhQmBFs for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 09:40:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99B7640422
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99B7640422
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99B7640422
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:40:19 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 807C22C80CDA;
 Tue, 13 Feb 2024 10:40:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 10:40:15 +0100
Message-Id: <20240213094015.2203982-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707817216; bh=fo9A/j6v482dmJmYeD+6/ktA9KhDhffbc7IEiY5d5O8=;
 h=From:To:Cc:Subject:Date;
 b=ZkYshTGvEbg8PjiANTI4gjX+UwQ7sTXI6N+RtgK3/9q6un9+BMoy8MqvrMDYcTfbS
 yi1PYmDOfCnC9duNpiEDnyp/Ib928s7QdTrlFwlLCBej7dO6whuKre6CzdrTWzoqjp
 IlaWhqufBsxyFVfGFsk/KvMHnxhawbtmyAYpvSKs8TJ/zYi7M7lr70wsTB3DYKky77
 MITrdxxZ5szKEp4UehpUiP9Q4IUNW5J7q1vZMweyecqajtYo+vGvSvHmUlNHV1ude3
 4JIwn8Rxag3/ikz5sgHf2vZCVnxqNFAIjjonFiOpoS3MWLJFN1YWvIJToepTiwXPXA
 X4jZ0TanBX0Zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ZkYshTGv
Subject: [Buildroot] [PATCH v2] package/python-jc: new package
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

All dependencies are optional, and thus only mentioned in the package help text.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
Changes v1 -> v2:
  - update to 1.25.1
  - xmltodict and python xml module are now optional dependencies
  - rename test class to conform to naming scheme
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
index 0000000000..b88150e069
--- /dev/null
+++ b/package/python-jc/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_JC
+	bool "python-jc"
+	help
+	  Converts the output of popular command-line tools and file-
+	  types to JSON.
+
+	  Optionally requires python-pygments for syntax highlighting,
+	  python-ruamel-yaml for yaml parsing and output and
+	  python-xmltodict for xml parsing. PYTHON3_PYEXPAT is required
+	  for xml and plist parsers.
+
+	  https://github.com/kellyjonbrazil/jc
diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
new file mode 100644
index 0000000000..f54e69eaeb
--- /dev/null
+++ b/package/python-jc/python-jc.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jc/json
+md5  80e4c7d46ec856255577c6b364e7f931  jc-1.25.1.tar.gz
+sha256  683352e903ece9a86eae0c3232188e40178139e710c740a466ef91ed87c4cc7e  jc-1.25.1.tar.gz
+# Locally computed sha256 checksums
+sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
new file mode 100644
index 0000000000..bb5bd426ec
--- /dev/null
+++ b/package/python-jc/python-jc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jc
+#
+################################################################################
+
+PYTHON_JC_VERSION = 1.25.1
+PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/53/a6/065f0796a0a21bc040bc88c8a33410c12729a2a6f4c269d0349f685796da
+PYTHON_JC_SETUP_TYPE = setuptools
+PYTHON_JC_LICENSE = MIT
+PYTHON_JC_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/test_python_jc.py b/support/testing/tests/package/test_python_jc.py
new file mode 100644
index 0000000000..974ce0c4b0
--- /dev/null
+++ b/support/testing/tests/package/test_python_jc.py
@@ -0,0 +1,22 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Jc(TestPythonPackageBase):
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
