Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A32FC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 10:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C6DE40611;
	Wed,  5 Feb 2025 10:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qlvxk_NsbYTl; Wed,  5 Feb 2025 10:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E744D40612
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E744D40612;
	Wed,  5 Feb 2025 10:15:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BEE912F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E85040612
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4GK3lM8jBD6 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 10:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ED9E40606
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ED9E40606
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 10:15:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16908811E8; Wed,  5 Feb 2025 10:15:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 11:14:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02c765af35f9e09ef5cd8ace07d555fd90fd176f
X-Git-Newrev: 1d4a61247d704c3bc9dda4ccbef80caa447fa6f3
X-Patchwork-Hint: ignore
Message-Id: <20250205101545.16908811E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-waitress: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d4a61247d704c3bc9dda4ccbef80caa447fa6f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test runs the flask sample app through the waitress wsgi server
instead of the flask development server.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 package/Config.in                                  |  1 +
 package/python-waitress/Config.in                  | 11 +++++++
 package/python-waitress/python-waitress.hash       |  5 ++++
 package/python-waitress/python-waitress.mk         | 14 +++++++++
 .../testing/tests/package/test_python_waitress.py  | 34 ++++++++++++++++++++++
 6 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6254f2e1db..f20bd5ce3f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2259,8 +2259,10 @@ F:	package/picotool/
 F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-ruamel-yaml-clib/
+F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
+F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
diff --git a/package/Config.in b/package/Config.in
index e501bca3aa..da88832d37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1466,6 +1466,7 @@ menu "External python modules"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
