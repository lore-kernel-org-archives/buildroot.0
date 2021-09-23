Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,WEIRD_PORT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBC8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF7AB60FDC
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF7AB60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD5B484264;
	Thu, 23 Sep 2021 20:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etKDMicb66kg; Thu, 23 Sep 2021 20:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A019384265;
	Thu, 23 Sep 2021 20:16:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0551BF9C8
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B9D160AC5
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCkEAyGQS3jj for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A54E606B3
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E27E78CAA5; Thu, 23 Sep 2021 20:13:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 21:53:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57260dab0cfb5de82b8c04684ff1bf5f0858be23
X-Git-Newrev: e6ee07f41a2b11b8dedbd3fc19ceef2870ecc93a
X-Patchwork-Hint: ignore
Message-Id: <20210923201359.E27E78CAA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-expects-json: new
 package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e6ee07f41a2b11b8dedbd3fc19ceef2870ecc93a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new package called python-flask-expects-json, which
also to validate the JSON blurbs submitted to a Flask web
application. A runtime test is added as well, making sure that the
package minimally works with an example Flask application.

The files added by this commit are associated both to Nicolas Carrier
and myself in the DEVELOPERS file, as Nicolas is also interested in
this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  6 ++++
 package/Config.in                                  |  1 +
 package/python-flask-expects-json/Config.in        |  9 +++++
 .../python-flask-expects-json.hash                 |  5 +++
 .../python-flask-expects-json.mk                   | 14 ++++++++
 .../package/sample_python_flask_expects_json.py    | 18 ++++++++++
 .../package/test_python_flask_expects_json.py      | 38 ++++++++++++++++++++++
 7 files changed, 91 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f22a1c4976..6ffe20426b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1982,10 +1982,13 @@ N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/bmap-tools/
 F:	package/php-xdebug/
 F:	package/python-augeas/
+F:	package/python-flask-expects-json/
 F:	support/testing/tests/package/sample_bmap_tools.sh
 F:	support/testing/tests/package/sample_python_augeas.py
+F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/test_bmap_tools.py
 F:	support/testing/tests/package/test_python_augeas.py
+F:	support/testing/tests/package/test_python_flask_expects_json.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
@@ -2682,6 +2685,7 @@ F:	package/pkg-generic.mk
 F:	package/python/
 F:	package/python3/
 F:	package/python-augeas/
+F:	package/python-flask-expects-json/
 F:	package/python-mad/
 F:	package/python-serial/
 F:	package/qextserialport/
@@ -2697,8 +2701,10 @@ F:	package/weston/
 F:	support/testing/tests/boot/test_syslinux.py
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask.py
+F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask.py
+F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/package/Config.in b/package/Config.in
index f2f80da3ff..c334fa5b67 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -999,6 +999,7 @@ menu "External python modules"
 	source "package/python-flask/Config.in"
 	source "package/python-flask-babel/Config.in"
 	source "package/python-flask-cors/Config.in"
+	source "package/python-flask-expects-json/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
 	source "package/python-flask-sqlalchemy/Config.in"
diff --git a/package/python-flask-expects-json/Config.in b/package/python-flask-expects-json/Config.in
new file mode 100644
index 0000000000..901234762e
--- /dev/null
+++ b/package/python-flask-expects-json/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_FLASK_EXPECTS_JSON
+	bool "python-flask-expects-json"
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
+	help
+	  Decorator for REST endpoints in flask. Validate JSON request
+	  data.
+
+	  https://github.com/fischerfredl/flask-expects-json
diff --git a/package/python-flask-expects-json/python-flask-expects-json.hash b/package/python-flask-expects-json/python-flask-expects-json.hash
new file mode 100644
index 0000000000..c023222fd7
--- /dev/null
+++ b/package/python-flask-expects-json/python-flask-expects-json.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/flask-expects-json/json
+md5  c1fb8ede58db312d7923212dc97b8ab4  flask-expects-json-1.5.0.tar.gz
+sha256  0087dc3d089f1ac75a1fc0f259f4dbd02bbb9c356e92e1a080f2309e2f75d053  flask-expects-json-1.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  06154a99fdc664107294a0a5e7e68f776078d075408dd32bbeaa7340fdd39e73  LICENSE.txt
diff --git a/package/python-flask-expects-json/python-flask-expects-json.mk b/package/python-flask-expects-json/python-flask-expects-json.mk
new file mode 100644
index 0000000000..487f15d4e5
--- /dev/null
+++ b/package/python-flask-expects-json/python-flask-expects-json.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-expects-json
+#
+################################################################################
+
+PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.5.0
+PYTHON_FLASK_EXPECTS_JSON_SOURCE = flask-expects-json-$(PYTHON_FLASK_EXPECTS_JSON_VERSION).tar.gz
+PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/4c/4a/9d9d050af700fb3feebd1f8466e73d65ce8b4709f27773e07100b0993451
+PYTHON_FLASK_EXPECTS_JSON_SETUP_TYPE = setuptools
+PYTHON_FLASK_EXPECTS_JSON_LICENSE = MIT
+PYTHON_FLASK_EXPECTS_JSON_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_flask_expects_json.py b/support/testing/tests/package/sample_python_flask_expects_json.py
new file mode 100644
index 0000000000..d45026dd49
--- /dev/null
+++ b/support/testing/tests/package/sample_python_flask_expects_json.py
@@ -0,0 +1,18 @@
+from flask import Flask
+from flask_expects_json import expects_json
+app = Flask(__name__)
+
+schema = {
+    'type': 'object',
+    'properties': {
+        'name': {'type': 'string'},
+        'email': {'type': 'string'},
+    },
+    'required': ['name', 'email']
+}
+
+
+@app.route('/', methods=['POST'])
+@expects_json(schema)
+def hello_world():
+    return 'Hello, World!'
diff --git a/support/testing/tests/package/test_python_flask_expects_json.py b/support/testing/tests/package/test_python_flask_expects_json.py
new file mode 100644
index 0000000000..b7326f5d9e
--- /dev/null
+++ b/support/testing/tests/package/test_python_flask_expects_json.py
@@ -0,0 +1,38 @@
+from tests.package.test_python import TestPythonPackageBase
+import os
+import time
+
+
+class TestPythonPy3FlaskExpectsJson(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_LIBCURL=y
+        BR2_PACKAGE_LIBCURL_CURL=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_FLASK=y
+        BR2_PACKAGE_PYTHON_FLASK_EXPECTS_JSON=y
+        """
+    sample_scripts = ["tests/package/sample_python_flask_expects_json.py"]
+    timeout = 60
+
+    def try_json(self, payload, expects):
+        cmd = """curl -s -o /dev/null -w "%%{http_code}\\n" -X POST """
+        cmd += """-H "Content-Type: application/json" -d '%s' http://127.0.0.1:5000""" % payload
+        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[-1], str(expects))
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        cmd = "FLASK_APP=%s %s -m flask run > /dev/null 2>&1 &" % (os.path.basename(self.sample_scripts[0]),
+                                                                   self.interpreter)
+        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+
+        # Give enough time for the flask server to start up
+        time.sleep(15)
+
+        self.try_json("""{"email": "test", "name": "test"}""", 200)
+        self.try_json("""{"email": "test", "name": 2}""", 400)
+        self.try_json("""{"email": "test"}""", 400)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
