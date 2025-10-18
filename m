Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76347CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 10:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A25960D7D;
	Sat, 18 Oct 2025 10:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oU7zMk9e2_Td; Sat, 18 Oct 2025 10:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D4560BBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28D4560BBD;
	Sat, 18 Oct 2025 10:52:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D76E1CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FA5240691
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6HMlyQlLipU for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7279840F33
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7279840F33
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FF2D87301; Sat, 18 Oct 2025 10:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 12:48:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c53d6ad99ce80ff381c6234ef58b638c53221cef
X-Git-Newrev: cc114f737614d801408ecf93bc5ae51bfb164fbe
X-Patchwork-Hint: ignore
Message-Id: <20251018105242.6FF2D87301@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-whitenoise: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc114f737614d801408ecf93bc5ae51bfb164fbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 ++
 package/Config.in                                  |  1 +
 package/python-whitenoise/Config.in                |  7 ++++
 package/python-whitenoise/python-whitenoise.hash   |  5 +++
 package/python-whitenoise/python-whitenoise.mk     | 14 ++++++++
 .../tests/package/test_python_whitenoise.py        | 41 ++++++++++++++++++++++
 6 files changed, 70 insertions(+)

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
index b06288941e..43e7b36446 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1492,6 +1492,7 @@ menu "External python modules"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
