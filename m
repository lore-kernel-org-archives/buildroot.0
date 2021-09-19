Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT,WEIRD_PORT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DD1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:45:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5518611C8
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5518611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9947160765;
	Sun, 19 Sep 2021 12:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wP9VN_QfiLxX; Sun, 19 Sep 2021 12:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 002A660729;
	Sun, 19 Sep 2021 12:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7A0A1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B62E983EA8
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwCgNlugD_f0 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:45:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75EA083E8F
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:45:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6A332C0006;
 Sun, 19 Sep 2021 12:45:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 19 Sep 2021 14:45:15 +0200
Message-Id: <20210919124517.524402-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210919124517.524402-1-thomas.petazzoni@bootlin.com>
References: <20210919124517.524402-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4]
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jeremy Connat <Jeremy.Connat@orolia.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This commit adds a test for python-flask package. As we are about to
add python-flask-expects-json together with a test, it made sense to
also add a test for python-flask itself.

As far as the DEVELOPERS file is concerned, the test files are added
both to the existing maintainer of package/python-flask, as well as to
myself.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  4 +++
 .../tests/package/sample_python_flask.py      |  7 +++++
 .../tests/package/test_python_flask.py        | 29 +++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_flask.py
 create mode 100644 support/testing/tests/package/test_python_flask.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 98628d3992..6ed62450a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1565,6 +1565,8 @@ F:	package/python-daemonize/
 F:	package/python-flask/
 F:	package/python-flask-babel/
 F:	package/python-gunicorn/
+F:	support/testing/tests/package/sample_python_flask.py
+F:	support/testing/tests/package/test_python_flask.py
 
 N:	Lionel Orry <lionel.orry@gmail.com>
 F:	package/mongrel2/
@@ -2693,7 +2695,9 @@ F:	package/wayland/
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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
