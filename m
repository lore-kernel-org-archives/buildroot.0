Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	WEIRD_PORT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FADDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFFB660F12
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFFB660F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF8184215;
	Thu, 23 Sep 2021 20:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zW5ptVdQUr8c; Thu, 23 Sep 2021 20:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F4038841D7;
	Thu, 23 Sep 2021 20:16:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 746271BF9C2
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63C0C4049B
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPvud6WFDRJd for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EF6A40019
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D486D8CAA4; Thu, 23 Sep 2021 20:13:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 21:48:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bc8f4c4161ddfd255615ce0962b570da20c4148
X-Git-Newrev: 57260dab0cfb5de82b8c04684ff1bf5f0858be23
X-Patchwork-Hint: ignore
Message-Id: <20210923201359.D486D8CAA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_flask: new test
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

commit: https://git.buildroot.net/buildroot/commit/?id=57260dab0cfb5de82b8c04684ff1bf5f0858be23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a test for python-flask package. As we are about to
add python-flask-expects-json together with a test, it made sense to
also add a test for python-flask itself.

As far as the DEVELOPERS file is concerned, the test files are added
both to the existing maintainer of package/python-flask, as well as to
myself.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  4 +++
 .../testing/tests/package/sample_python_flask.py   |  7 ++++++
 support/testing/tests/package/test_python_flask.py | 29 ++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 926c6a27d7..f22a1c4976 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1566,6 +1566,8 @@ F:	package/python-daemonize/
 F:	package/python-flask/
 F:	package/python-flask-babel/
 F:	package/python-gunicorn/
+F:	support/testing/tests/package/sample_python_flask.py
+F:	support/testing/tests/package/test_python_flask.py
 
 N:	Lionel Orry <lionel.orry@gmail.com>
 F:	package/mongrel2/
@@ -2694,7 +2696,9 @@ F:	package/wayland/
 F:	package/weston/
 F:	support/testing/tests/boot/test_syslinux.py
 F:	support/testing/tests/package/sample_python_augeas.py
+F:	support/testing/tests/package/sample_python_flask.py
 F:	support/testing/tests/package/test_python_augeas.py
+F:	support/testing/tests/package/test_python_flask.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/support/testing/tests/package/sample_python_flask.py b/support/testing/tests/package/sample_python_flask.py
new file mode 100644
index 0000000000..a7941a94a6
--- /dev/null
+++ b/support/testing/tests/package/sample_python_flask.py
@@ -0,0 +1,7 @@
+from flask import Flask
+app = Flask(__name__)
+
+
+@app.route('/')
+def hello_world():
+    return 'Hello, World!'
diff --git a/support/testing/tests/package/test_python_flask.py b/support/testing/tests/package/test_python_flask.py
new file mode 100644
index 0000000000..ef5d96bae9
--- /dev/null
+++ b/support/testing/tests/package/test_python_flask.py
@@ -0,0 +1,29 @@
+from tests.package.test_python import TestPythonPackageBase
+import os
+import time
+
+
+class TestPythonPy3Flask(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_FLASK=y
+        """
+    sample_scripts = ["tests/package/sample_python_flask.py"]
+    timeout = 60
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
+        cmd = "wget -q -O - http://127.0.0.1:5000/"
+        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Hello, World!")
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
