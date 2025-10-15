Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F137CCD18E
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 13:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D6A88421B;
	Wed, 15 Oct 2025 13:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnCPimlLy2Gd; Wed, 15 Oct 2025 13:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B26CF8420F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B26CF8420F;
	Wed, 15 Oct 2025 13:31:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B8531C9
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 13:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31C8840B93
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 13:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzPnMRxkXl7D for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 13:31:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9959A40B1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9959A40B1E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9959A40B1E
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 13:31:18 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id EBBD52C80CF9;
 Wed, 15 Oct 2025 15:31:15 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 15:31:15 +0200
Message-ID: <20251015133116.2924842-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760535076; bh=8BQTbKund2S22RZSD0W4ooFipR09u00DR/pHYzCNxm4=;
 h=From:To:Cc:Subject:Date;
 b=PxxAUSyHLRC9rr21bqXNUGEUY7D302OER3aa22Of+M4jJePnn00lLqq4eFRYCwLGU
 gLZ6CC29sQTrjZLdTMGz0Znop3xWPMOzu3uZr/RXmWChrjNUblYxuIyfwQavw3VYxD
 05vDW2fBiUs6/z8x0izK3W90PSPIAiFMpIQku4Q4gZZkS7tH8LfGLdJMUHBYsBvTmZ
 KqyfecgKL/H1mQb6VyhNc9g16oLfYGI/DVMDGg4EFkNJOi5EfdyLA9uEeROSHudLwB
 ABFhfuiU8nFpOsu6NEbXa2gpcQNzqnOejgd73qvnFPZoeoHiE8Itc/K2veaa3qWdY8
 YMS06NGOqrDLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=PxxAUSyH
Subject: [Buildroot] [PATCH v4] package/python-whitenoise: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The test is using the django integration of whitenoise as it's the most
common setup and allows to model the test case after the django one as
well.

The setup we need to do is a bit more complicated though and follows
the whitenoise getting started documentation [1].

We then request a .css file from the django admin app that is enabled
by default in template project. Due to running django's development
server with --nostatic we ensure that static file handling is taken over
by whitenoise.

[1] https://whitenoise.readthedocs.io/en/stable/django.html

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
Changes v3 -> v4:
  - update to whitenoise 6.11

Changes v2 -> v3:
  - update to whitenoise 6.9
  - add DEVELOPERS entry

Changes v1 -> v2:
  - update to latest version
  - drop change to unrelated test
  - fix lint errors in test
---
 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 package/python-whitenoise/Config.in           |  7 ++++
 .../python-whitenoise/python-whitenoise.hash  |  5 +++
 .../python-whitenoise/python-whitenoise.mk    | 14 +++++++
 .../tests/package/test_python_whitenoise.py   | 41 +++++++++++++++++++
 6 files changed, 70 insertions(+)
 create mode 100644 package/python-whitenoise/Config.in
 create mode 100644 package/python-whitenoise/python-whitenoise.hash
 create mode 100644 package/python-whitenoise/python-whitenoise.mk
 create mode 100644 support/testing/tests/package/test_python_whitenoise.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 84ca8c76dc..2ba6096464 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2280,6 +2280,7 @@ F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
 F:	package/python-waitress/
+F:	package/python-whitenoise/
 F:	support/testing/tests/package/test_python_apscheduler.py
 F:	support/testing/tests/package/test_python_crc.py
 F:	support/testing/tests/package/test_python_django.py
@@ -2290,6 +2291,7 @@ F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
+F:	support/testing/tests/package/test_python_whitenoise.py
 F:	support/testing/tests/package/sample_python_apscheduler.py
 F:	support/testing/tests/package/sample_python_crc.py
 F:	support/testing/tests/package/sample_python_django.py
diff --git a/package/Config.in b/package/Config.in
index e9906b066e..3a70803272 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1491,6 +1491,7 @@ menu "External python modules"
 	source "package/python-websocket-client/Config.in"
 	source "package/python-websockets/Config.in"
 	source "package/python-werkzeug/Config.in"
+	source "package/python-whitenoise/Config.in"
 	source "package/python-whoosh/Config.in"
 	source "package/python-wrapt/Config.in"
 	source "package/python-ws4py/Config.in"
diff --git a/package/python-whitenoise/Config.in b/package/python-whitenoise/Config.in
new file mode 100644
index 0000000000..47df3ad5bf
--- /dev/null
+++ b/package/python-whitenoise/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_WHITENOISE
+	bool "python-whitenoise"
+	help
+	  Radically simplified static file serving for WSGI
+	  applications.
+
+	  https://github.com/evansd/whitenoise
diff --git a/package/python-whitenoise/python-whitenoise.hash b/package/python-whitenoise/python-whitenoise.hash
new file mode 100644
index 0000000000..1659961825
--- /dev/null
+++ b/package/python-whitenoise/python-whitenoise.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/whitenoise/json
+md5  212cafd7f8d972a5d6740bfc88b3f17b  whitenoise-6.11.0.tar.gz
+sha256  0f5bfce6061ae6611cd9396a8231e088722e4fc67bc13a111be74c738d99375f  whitenoise-6.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  ebfd469b4fb6b5adada547747e1e8da725ecf20595d54aced043275d4f4a3600  LICENSE
diff --git a/package/python-whitenoise/python-whitenoise.mk b/package/python-whitenoise/python-whitenoise.mk
new file mode 100644
index 0000000000..91f3b6d2d7
--- /dev/null
+++ b/package/python-whitenoise/python-whitenoise.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-whitenoise
+#
+################################################################################
+
+PYTHON_WHITENOISE_VERSION = 6.11.0
+PYTHON_WHITENOISE_SOURCE = whitenoise-$(PYTHON_WHITENOISE_VERSION).tar.gz
+PYTHON_WHITENOISE_SITE = https://files.pythonhosted.org/packages/15/95/8c81ec6b6ebcbf8aca2de7603070ccf37dbb873b03f20708e0f7c1664bc6
+PYTHON_WHITENOISE_SETUP_TYPE = setuptools
+PYTHON_WHITENOISE_LICENSE = MIT
+PYTHON_WHITENOISE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/test_python_whitenoise.py b/support/testing/tests/package/test_python_whitenoise.py
new file mode 100644
index 0000000000..5a76b6d5be
--- /dev/null
+++ b/support/testing/tests/package/test_python_whitenoise.py
@@ -0,0 +1,41 @@
+import time
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Whitenoise(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DJANGO=y
+        BR2_PACKAGE_PYTHON_WHITENOISE=y
+        BR2_PACKAGE_PYTHON3_SQLITE=y
+        """
+
+    def test_run(self):
+        self.login()
+        timeout = 35
+
+        cmd = "cd /opt && /usr/bin/django-admin startproject testsite"
+        self.assertRunOk(cmd, timeout=timeout)
+        # STATIC_ROOT needs to be set for 'collectstatic' to work.
+        self.emulator.run("echo 'STATIC_ROOT = BASE_DIR / \"staticfiles\"' >> /opt/testsite/testsite/settings.py")
+        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py collectstatic"
+        self.assertRunOk(cmd, timeout=timeout)
+        # whitenoise docs say it needs to be added directly after SecurityMiddleware, so we do this here with sed.
+        cmd = """sed -i -e /django.middleware.security.SecurityMiddleware/a\\ \\"whitenoise.middleware.WhiteNoiseMiddleware\\",\
+        /opt/testsite/testsite/settings.py"""
+        self.assertRunOk(cmd, timeout=timeout)
+        # --nostatic ensures the builtin django server doesn't serve the static files,
+        # so we can test that whitenoise serves them
+        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver --nostatic 0.0.0.0:1234 > /dev/null 2>&1 & "
+        self.assertRunOk(cmd, timeout=timeout)
+        # give some time to setup the server
+        for attempt in range(30 * self.emulator.timeout_multiplier):
+            time.sleep(1)
+            cmd = "wget http://127.0.0.1:1234/static/admin/css/base.css"
+            _, exit_code = self.emulator.run(cmd)
+            if exit_code == 0:
+                break
+        self.assertEqual(exit_code, 0, "Timeout while waiting for django server")
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
