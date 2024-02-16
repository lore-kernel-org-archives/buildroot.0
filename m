Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7D2C48BC4
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 13:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F172583EDE;
	Fri, 16 Feb 2024 13:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4TukbDgaxJp; Fri, 16 Feb 2024 13:18:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D201E83EE9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D201E83EE9;
	Fri, 16 Feb 2024 13:18:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AA791BF395
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 13:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 588D783ED9
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 13:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3VnuXMahy3jG for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 13:18:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DAFD833CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DAFD833CB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DAFD833CB
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:18:20 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7265F2C83954;
 Fri, 16 Feb 2024 14:18:17 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 14:18:14 +0100
Message-Id: <20240216131815.318315-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216131815.318315-1-buildroot@bubu1.eu>
References: <20240216131815.318315-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708089497; bh=33Lp89PfwYcJe9dXZ4U6Uef1TbtvftcYc/EOf9LLx0I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Rzpj/GdGD+LnU5789I9R1MEuMPRIkWdXR32rSnScsEyCJAU9BycJPgSf2fQQIjYzP
 Q/TZJAI/pJSheDVVV2uB9kOekd/I2NUjwF4SMjperX8xAkSbMUgRV6VFNmIdxNOUO+
 AuEh8zy82iXSXosqy3ekJJQRI1qU4Xe8rykCaWPmLgl/o2jNNxoRK1NVg8Dux4mX/k
 Bd3vijf04V0f0Le0+nSIZjK3v8xlXwHM/MYiUMJ6mEpTjsmmJm+F5tcu6cokMuiBJ/
 ZowBv6fswjVRk55rMcB+e0mzv4e6bAu1EANWGd0Mg/dexccgChUPY14lUBCwedPQZI
 AydW7PkLyupSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Rzpj/GdG
Subject: [Buildroot] [PATCH 2/2] package/python-whitenoise: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
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
 package/Config.in                             |  1 +
 package/python-whitenoise/Config.in           |  7 ++++
 .../python-whitenoise/python-whitenoise.hash  |  5 +++
 .../python-whitenoise/python-whitenoise.mk    | 14 +++++++
 .../tests/package/test_python_django.py       |  1 +
 .../tests/package/test_python_whitenoise.py   | 41 +++++++++++++++++++
 6 files changed, 69 insertions(+)
 create mode 100644 package/python-whitenoise/Config.in
 create mode 100644 package/python-whitenoise/python-whitenoise.hash
 create mode 100644 package/python-whitenoise/python-whitenoise.mk
 create mode 100644 support/testing/tests/package/test_python_whitenoise.py

diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..7180aaea63 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1417,6 +1417,7 @@ menu "External python modules"
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
index 0000000000..4e239f4ab1
--- /dev/null
+++ b/package/python-whitenoise/python-whitenoise.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/whitenoise/json
+md5  4926cee7317ac12533549c08043ee322  whitenoise-6.6.0.tar.gz
+sha256  8998f7370973447fac1e8ef6e8ded2c5209a7b1f67c1012866dbcd09681c3251  whitenoise-6.6.0.tar.gz
+# Locally computed sha256 checksums
+sha256  ebfd469b4fb6b5adada547747e1e8da725ecf20595d54aced043275d4f4a3600  LICENSE
diff --git a/package/python-whitenoise/python-whitenoise.mk b/package/python-whitenoise/python-whitenoise.mk
new file mode 100644
index 0000000000..a601157491
--- /dev/null
+++ b/package/python-whitenoise/python-whitenoise.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-whitenoise
+#
+################################################################################
+
+PYTHON_WHITENOISE_VERSION = 6.6.0
+PYTHON_WHITENOISE_SOURCE = whitenoise-$(PYTHON_WHITENOISE_VERSION).tar.gz
+PYTHON_WHITENOISE_SITE = https://files.pythonhosted.org/packages/16/e3/adddb43cf8eb924e18eca677d4e40d47348566224b724cb8d1eaf6a48d1b
+PYTHON_WHITENOISE_SETUP_TYPE = setuptools
+PYTHON_WHITENOISE_LICENSE = MIT
+PYTHON_WHITENOISE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
index 0973467a2a..ac1dc81359 100644
--- a/support/testing/tests/package/test_python_django.py
+++ b/support/testing/tests/package/test_python_django.py
@@ -36,6 +36,7 @@ class TestPythonPy3Django(TestPythonDjango):
     config = TestPythonDjango.config + \
         """
         BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON3_PY_PYC=y
         BR2_PACKAGE_PYTHON_DJANGO=y
         BR2_PACKAGE_PYTHON3_SQLITE=y
         """
diff --git a/support/testing/tests/package/test_python_whitenoise.py b/support/testing/tests/package/test_python_whitenoise.py
new file mode 100644
index 0000000000..ff9bcf5ee7
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
+        cmd = """sed -i -e /django.middleware.security.SecurityMiddleware/a\ \\"whitenoise.middleware.WhiteNoiseMiddleware\\", /opt/testsite/testsite/settings.py"""
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
+        else:
+            self.assertTrue(False, "Timeout while waiting for django server")
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
