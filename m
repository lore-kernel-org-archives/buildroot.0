Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B29C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8054A416FC;
	Wed,  7 Feb 2024 17:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xgenqaRmUSe; Wed,  7 Feb 2024 17:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EB0C416CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EB0C416CA;
	Wed,  7 Feb 2024 17:18:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BE591BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76BAA83C8B
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7BdjKnqLDdm for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:18:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68CDE83C82
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68CDE83C82
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68CDE83C82
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:18:43 +0000 (UTC)
Received: from bubutux.localdomain (ip-185-104-138-44.ptr.icomera.net
 [185.104.138.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CED2F2C83776;
 Wed,  7 Feb 2024 18:18:40 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 18:18:27 +0100
Message-ID: <20240207171829.2676569-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707326321; bh=tLqlspzh+MZrSRPVpwOqu221vnOQXEkQ+JLhoYkkL80=;
 h=From:To:Cc:Subject:Date;
 b=hC/qyvx4gQcSNt84rx+sWlbEoryqUj+aHk/0SKxyfoXzVALUFuUG4P2g5xGFYZfeX
 ktyoMRGFlrRxyY9kRWEdrpzQFoZmTIn1aoEgJgqXsqqF6uxQn3QP5Sje02PPAoBhZ+
 EajB0rmYlkaRLP+aI5HZJ8USh/SEIZjDFDZxNjz9x6zR10CBBIjsaGhglFZZ+AeuKb
 2EDGsLxcqTLyI75TFNoVGMDk3vJ69ZcYBa2BWMFacpT31EukmhfFcAQGKQB8uWBadm
 ArBKMEer/uP54uz2d/rD/7CxbpUddKxDTv60yv7wwgw+2cy3BEftA8yfIfMwe/OSCJ
 GWFVODaKaZkog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=hC/qyvx4
Subject: [Buildroot] [PATCH] package/python-waitress: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The test runs the flask sample app through the waitress wsgi server
instead of the flask development server.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/Config.in                             |  1 +
 package/python-waitress/Config.in             | 11 ++++++
 package/python-waitress/python-waitress.hash  |  5 +++
 package/python-waitress/python-waitress.mk    | 14 ++++++++
 .../tests/package/test_python_waitress.py     | 34 +++++++++++++++++++
 5 files changed, 65 insertions(+)
 create mode 100644 package/python-waitress/Config.in
 create mode 100644 package/python-waitress/python-waitress.hash
 create mode 100644 package/python-waitress/python-waitress.mk
 create mode 100644 support/testing/tests/package/test_python_waitress.py

diff --git a/package/Config.in b/package/Config.in
index 97f590e2b7..bf8c325e99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1406,6 +1406,7 @@ menu "External python modules"
 	source "package/python-validators/Config.in"
 	source "package/python-versiontools/Config.in"
 	source "package/python-visitor/Config.in"
+	source "package/python-waitress/Config.in"
 	source "package/python-watchdog/Config.in"
 	source "package/python-wcwidth/Config.in"
 	source "package/python-weasyprint/Config.in"
diff --git a/package/python-waitress/Config.in b/package/python-waitress/Config.in
new file mode 100644
index 0000000000..7d8c73a650
--- /dev/null
+++ b/package/python-waitress/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_WAITRESS
+	bool "python-waitress"
+	help
+	  Waitress WSGI server.
+
+	  Waitress is a production-quality pure-Python WSGI server
+	  with very acceptable performance. It has no dependencies
+	  except ones which live in the Python standard library.
+	  It supports HTTP/1.0 and HTTP/1.1.
+
+	  https://github.com/Pylons/waitress
diff --git a/package/python-waitress/python-waitress.hash b/package/python-waitress/python-waitress.hash
new file mode 100644
index 0000000000..c1663a351a
--- /dev/null
+++ b/package/python-waitress/python-waitress.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/waitress/json
+md5  b8c671ed131b84a0099493f445c98014  waitress-3.0.0.tar.gz
+sha256  005da479b04134cdd9dd602d1ee7c49d79de0537610d653674cc6cbde222b8a1  waitress-3.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-waitress/python-waitress.mk b/package/python-waitress/python-waitress.mk
new file mode 100644
index 0000000000..c1618817dc
--- /dev/null
+++ b/package/python-waitress/python-waitress.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-waitress
+#
+################################################################################
+
+PYTHON_WAITRESS_VERSION = 3.0.0
+PYTHON_WAITRESS_SOURCE = waitress-$(PYTHON_WAITRESS_VERSION).tar.gz
+PYTHON_WAITRESS_SITE = https://files.pythonhosted.org/packages/70/34/cb77e5249c433eb177a11ab7425056b32d3b57855377fa1e38b397412859
+PYTHON_WAITRESS_SETUP_TYPE = setuptools
+PYTHON_WAITRESS_LICENSE = ZPL-2.1
+PYTHON_WAITRESS_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/test_python_waitress.py b/support/testing/tests/package/test_python_waitress.py
new file mode 100644
index 0000000000..46f04109c0
--- /dev/null
+++ b/support/testing/tests/package/test_python_waitress.py
@@ -0,0 +1,34 @@
+import time
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonWaitress(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_FLASK=y
+        BR2_PACKAGE_PYTHON_WAITRESS=y
+        """
+
+    sample_scripts = ["tests/package/sample_python_flask.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        cmd = self.interpreter + " -m waitress sample_python_flask:app > /dev/null 2>&1 &"
+        # give some time to setup the server
+        _, exit = self.emulator.run(cmd, timeout=self.timeout)
+
+        # Give enough time for the uvicorn server to start up
+        for attempt in range(30):
+            time.sleep(1)
+
+            cmd = "wget -q -O - http://127.0.0.1:8080/"
+            output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+            if exit_code == 0:
+                self.assertEqual(output[0], 'Hello, World!')
+                break
+        else:
+            self.assertTrue(False, "Timeout while waiting for waitress server")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
