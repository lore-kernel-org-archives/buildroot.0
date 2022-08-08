Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8BDC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3629D40167;
	Mon,  8 Aug 2022 20:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3629D40167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5hSzKtePdyb; Mon,  8 Aug 2022 20:28:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 204C24014A;
	Mon,  8 Aug 2022 20:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 204C24014A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63C191BF365
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DE6840909
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DE6840909
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T-QUlFoVrR0F for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:27:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58D01408FE
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58D01408FE
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1F10A87011; Mon,  8 Aug 2022 20:13:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 22:24:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcc080cb260c4516dfb5402f89eac80d7e31e2be
X-Git-Newrev: 37f05c2497a05c9d007ed03c224f4a4d18a21b21
X-Patchwork-Hint: ignore
Message-Id: <20220808201330.1F10A87011@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-qrcode: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=37f05c2497a05c9d007ed03c224f4a4d18a21b21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by python-autobahn encryption subpackage.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                            |  1 +
 package/Config.in                                     |  1 +
 package/python-qrcode/Config.in                       | 18 ++++++++++++++++++
 package/python-qrcode/python-qrcode.hash              |  5 +++++
 package/python-qrcode/python-qrcode.mk                | 14 ++++++++++++++
 support/testing/tests/package/sample_python_qrcode.py |  3 +++
 support/testing/tests/package/test_python_qrcode.py   | 12 ++++++++++++
 7 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 23ed6c8487..d2bd0d809a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2912,6 +2912,7 @@ F:	package/python3/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
 F:	package/python-git/
+F:	package/python-qrcode/
 F:	package/python-serial/
 F:	package/python-unittest-xml-reporting/
 F:	package/qextserialport/
diff --git a/package/Config.in b/package/Config.in
index a09ad342d9..d1c098c48f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1214,6 +1214,7 @@ menu "External python modules"
 	source "package/python-pyxb/Config.in"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
+	source "package/python-qrcode/Config.in"
 	source "package/python-raven/Config.in"
 	source "package/python-redis/Config.in"
 	source "package/python-reentry/Config.in"
diff --git a/package/python-qrcode/Config.in b/package/python-qrcode/Config.in
new file mode 100644
index 0000000000..9a17cc1f08
--- /dev/null
+++ b/package/python-qrcode/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_PYTHON_QRCODE
+	bool "python-qrcode"
+	help
+	  Pure python QR Code generator
+
+	  https://github.com/lincolnloop/python-qrcode
+
+if BR2_PACKAGE_PYTHON_QRCODE
+
+config BR2_PACKAGE_PYTHON_QRCODE_SVG
+	bool "SVG support"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
+
+config BR2_PACKAGE_PYTHON_QRCODE_PIL
+	bool "PIL support"
+	select BR2_PACKAGE_PYTHON_PILLOW
+
+endif
diff --git a/package/python-qrcode/python-qrcode.hash b/package/python-qrcode/python-qrcode.hash
new file mode 100644
index 0000000000..1ab84dd355
--- /dev/null
+++ b/package/python-qrcode/python-qrcode.hash
@@ -0,0 +1,5 @@
+# md5 from https://pypi.python.org/pypi/qrcode/json
+md5  124103c685e96ba3b7a1616760f31c11  qrcode-7.3.1.tar.gz
+sha256  375a6ff240ca9bd41adc070428b5dfc1dcfbb0f2507f1ac848f6cded38956578  qrcode-7.3.1.tar.gz
+# Locally computed
+sha256  40dfb903c94ee3f789500131311186548ecba5cefd3557623d7700e2522ab994  LICENSE
diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
new file mode 100644
index 0000000000..23e7dd3b88
--- /dev/null
+++ b/package/python-qrcode/python-qrcode.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-qrcode
+#
+################################################################################
+
+PYTHON_QRCODE_VERSION = 7.3.1
+PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
+PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/94/9f/31f33cdf3cf8f98e64c42582fb82f39ca718264df61957f28b0bbb09b134
+PYTHON_QRCODE_SETUP_TYPE = setuptools
+PYTHON_QRCODE_LICENSE = BSD-3-Clause
+PYTHON_QRCODE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_qrcode.py b/support/testing/tests/package/sample_python_qrcode.py
new file mode 100644
index 0000000000..3dcca329da
--- /dev/null
+++ b/support/testing/tests/package/sample_python_qrcode.py
@@ -0,0 +1,3 @@
+import qrcode
+import qrcode.image.svg
+img = qrcode.make('Some data here', image_factory=qrcode.image.svg.SvgImage)
diff --git a/support/testing/tests/package/test_python_qrcode.py b/support/testing/tests/package/test_python_qrcode.py
new file mode 100644
index 0000000000..ca8a2b01f9
--- /dev/null
+++ b/support/testing/tests/package/test_python_qrcode.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Qrcode(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_QRCODE=y
+        BR2_PACKAGE_PYTHON_QRCODE_SVG=y
+        """
+    sample_scripts = ["tests/package/sample_python_qrcode.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
