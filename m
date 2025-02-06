Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCB2C02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 16:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1851F427D6;
	Thu,  6 Feb 2025 16:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MXc5_1lCa9D; Thu,  6 Feb 2025 16:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94E99427CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E99427CF;
	Thu,  6 Feb 2025 16:18:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB17CF
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 16:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1B55415D3
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 16:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6Swv2AsVoFg for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 16:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FFEE415A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FFEE415A5
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FFEE415A5
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 16:18:10 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 6A3142C80169;
 Thu, 06 Feb 2025 17:18:07 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu,  6 Feb 2025 17:18:05 +0100
Message-ID: <20250206161806.312159-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1738858687; bh=C+a1Ecb+a6aTCnqUN+0vFp/gwtr/K/1B7ftuITVnVDE=;
 h=From:To:Cc:Subject:Date;
 b=AaOmJKc/5uds6nrHK20HWx697qNnVk1VmDPhNnRHfnnLjVbx/46FpKCRjtrzH/+Xr
 HUtKChUN88lKoLF5PfdrX9nYOB9VT7PPZ7tt/tOyGflajdHsFbaFEaPDWO265vJDIC
 N4H6nf18PO9/TLuqbNfHEQxpwyC4o0oLzSKh/H+c4eoTaAEDxWmwt2VxYHCqmXU/OB
 haJVFemQyra0gVPoSPyuMrqJkB3ZgacALjgJsfuNEdY9bJWbmBPfEfZ3VgwLEGilgk
 8Qb4NC3KnYWxGYcAyXPUKCei3En/AisNgmdvk3tDCzOuIAQlUmHi4LE6KwSTGxGTge
 7V9Q/0cOFgieA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=AaOmJKc/
Subject: [Buildroot] [PATCH 1/1] package/python-whitenoise: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Changes v1 -> v2:
  - update to latest version
  - drop change to unrelated test
  - fix lint errors in test

 package/Config.in                             |  1 +
 package/python-whitenoise/Config.in           |  7 ++++
 .../python-whitenoise/python-whitenoise.hash  |  5 +++
 .../python-whitenoise/python-whitenoise.mk    | 14 +++++++
 .../tests/package/test_python_whitenoise.py   | 41 +++++++++++++++++++
 5 files changed, 68 insertions(+)
 create mode 100644 package/python-whitenoise/Config.in
 create mode 100644 package/python-whitenoise/python-whitenoise.hash
 create mode 100644 package/python-whitenoise/python-whitenoise.mk
 create mode 100644 support/testing/tests/package/test_python_whitenoise.py

diff --git a/package/Config.in b/package/Config.in
index 3153fd6afa..10365b6b16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1476,6 +1476,7 @@ menu "External python modules"
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
index 0000000000..4c37a65cc8
--- /dev/null
+++ b/package/python-whitenoise/python-whitenoise.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/whitenoise/json
+md5  3dafb52a896b1826bbe23ebc18a83819  whitenoise-6.8.2.tar.gz
+sha256  486bd7267a375fa9650b136daaec156ac572971acc8bf99add90817a530dd1d4  whitenoise-6.8.2.tar.gz
+# Locally computed sha256 checksums
+sha256  ebfd469b4fb6b5adada547747e1e8da725ecf20595d54aced043275d4f4a3600  LICENSE
diff --git a/package/python-whitenoise/python-whitenoise.mk b/package/python-whitenoise/python-whitenoise.mk
new file mode 100644
index 0000000000..2d198e2921
--- /dev/null
+++ b/package/python-whitenoise/python-whitenoise.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-whitenoise
+#
+################################################################################
+
+PYTHON_WHITENOISE_VERSION = 6.8.2
+PYTHON_WHITENOISE_SOURCE = whitenoise-$(PYTHON_WHITENOISE_VERSION).tar.gz
+PYTHON_WHITENOISE_SITE = https://files.pythonhosted.org/packages/68/49/c21ebb5b911888c349a849ec7d1ead2dffbbcc4e2be0f6af2a7dbac03393
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
