Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAE4C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 11:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAC0C82A6C;
	Wed, 26 Feb 2025 11:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUoLoAW5si-Q; Wed, 26 Feb 2025 11:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B499582A4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B499582A4F;
	Wed, 26 Feb 2025 11:07:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B802794F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 11:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F5A060FEA
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 11:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvEDgna4uxTd for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 11:07:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F59060FB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F59060FB4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F59060FB4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 11:07:01 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 69F642C88FBB;
 Wed, 26 Feb 2025 12:06:58 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 26 Feb 2025 12:06:56 +0100
Message-ID: <20250226110657.2305399-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1740568018; bh=ZuSkuWZgmjH3axDW48I3IlrnWV5nr2O4W/Ul6leoMaM=;
 h=From:To:Cc:Subject:Date;
 b=aXniSJpxOMFR99rwLaS1ee8Ipkzh01DQujRhhqH0oHRkMasb9mxoY11pvdTmB+uqD
 /XYWRYZ4LN5rjFz+P0gs+y/vCkWn8q7BvN3sAOS4TNbzTUxxA2n1fqVhbL5pF3sEJy
 s8pi5cfIYojcgVCNh2HS2rpyvWojGtqfjpE+Rk1tV54K0UQt8ZG6YhGh9NRAYN+OOk
 5OLfx/0E58qPH6/udXPcfXYiMqshUQS8t3pdIbj5VCSvqXHvnwOm/xHI1Z5fokaeuq
 J5asHZo1fR0Jf0vjs+uGhgHS1ufuxPQza66sybosNLpv44z7aDgylX4hhOsP71lN+a
 JQ0NbXLPs1suw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=aXniSJpx
Subject: [Buildroot] [PATCH v3] package/python-whitenoise: new package
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

Changes v1 -> v2:
  - update to latest version
  - drop change to unrelated test
  - fix lint errors in test

Changes v2 -> v3:
  - update to whitenoise 6.9
  - add DEVELOPERS entry

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
index 837fa93f4d..24f1821ee5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2265,9 +2265,11 @@ F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-ruamel-yaml-clib/
 F:	package/python-waitress/
+F:	package/python-whitenoise/
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_waitress.py
+F:	support/testing/tests/package/test_python_whitenoise.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
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
index 0000000000..e5ad875c99
--- /dev/null
+++ b/package/python-whitenoise/python-whitenoise.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/whitenoise/json
+md5  0341c669420de0975fce0278dc1471fe  whitenoise-6.9.0.tar.gz
+sha256  8c4a7c9d384694990c26f3047e118c691557481d624f069b7f7752a2f735d609  whitenoise-6.9.0.tar.gz
+# Locally computed sha256 checksums
+sha256  ebfd469b4fb6b5adada547747e1e8da725ecf20595d54aced043275d4f4a3600  LICENSE
diff --git a/package/python-whitenoise/python-whitenoise.mk b/package/python-whitenoise/python-whitenoise.mk
new file mode 100644
index 0000000000..21b36906fa
--- /dev/null
+++ b/package/python-whitenoise/python-whitenoise.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-whitenoise
+#
+################################################################################
+
+PYTHON_WHITENOISE_VERSION = 6.9.0
+PYTHON_WHITENOISE_SOURCE = whitenoise-$(PYTHON_WHITENOISE_VERSION).tar.gz
+PYTHON_WHITENOISE_SITE = https://files.pythonhosted.org/packages/b9/cf/c15c2f21aee6b22a9f6fc9be3f7e477e2442ec22848273db7f4eb73d6162
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
