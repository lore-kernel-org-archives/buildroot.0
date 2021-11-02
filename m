Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328DDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 22:21:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D4EB61050
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 22:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D4EB61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6085F80E30;
	Tue,  2 Nov 2021 22:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XljtXwjniNJb; Tue,  2 Nov 2021 22:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 831D180E57;
	Tue,  2 Nov 2021 22:21:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB09B1BF215
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 22:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA113608A2
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 22:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LCHKIwKFMs_C for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 22:21:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5744760805
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 22:21:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E0468200003;
 Tue,  2 Nov 2021 22:21:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue,  2 Nov 2021 23:21:26 +0100
Message-Id: <20211102222127.719703-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-unitest-xml-reporting: new
 package
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Jeremy Connat <Jeremy.Connat@orolia.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Based on initial work from Nicolas Carrier
<nicolas.carrier@orolia.com>, with the following additions:

- Updated to a newer version
- Added proper license file handling
- Added runtime test case
- Restricted to Python 3.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  6 +++++
 package/Config.in                             |  1 +
 .../python-unittest-xml-reporting/Config.in   |  9 ++++++++
 .../python-unittest-xml-reporting.hash        |  5 ++++
 .../python-unittest-xml-reporting.mk          | 23 +++++++++++++++++++
 .../sample_python_unittest_xml_reporting.py   |  9 ++++++++
 .../test_python_unittest_xml_reporting.py     | 23 +++++++++++++++++++
 7 files changed, 76 insertions(+)
 create mode 100644 package/python-unittest-xml-reporting/Config.in
 create mode 100644 package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
 create mode 100644 package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
 create mode 100644 support/testing/tests/package/sample_python_unittest_xml_reporting.py
 create mode 100644 support/testing/tests/package/test_python_unittest_xml_reporting.py

diff --git a/DEVELOPERS b/DEVELOPERS
index db7521b578..d6117a6b3e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1983,14 +1983,17 @@ F:	package/php-xdebug/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
 F:	package/python-git/
+F:	package/python-unittest-xml-reporting/
 F:	support/testing/tests/package/sample_bmap_tools.sh
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
+F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_bmap_tools.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
+F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
@@ -2691,6 +2694,7 @@ F:	package/python-flask-expects-json/
 F:	package/python-git/
 F:	package/python-mad/
 F:	package/python-serial/
+F:	package/python-unittest-xml-reporting/
 F:	package/qextserialport/
 F:	package/riscv64-elf-toolchain/
 F:	package/rpcbind/
@@ -2706,10 +2710,12 @@ F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
+F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
+F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/package/Config.in b/package/Config.in
index 785ba992e3..2c62a2316e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1251,6 +1251,7 @@ menu "External python modules"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-ujson/Config.in"
+	source "package/python-unittest-xml-reporting/Config.in"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-uvloop/Config.in"
diff --git a/package/python-unittest-xml-reporting/Config.in b/package/python-unittest-xml-reporting/Config.in
new file mode 100644
index 0000000000..b1a6244dd3
--- /dev/null
+++ b/package/python-unittest-xml-reporting/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_UNITTEST_XML_REPORTING
+	bool "python-unittest-xml-reporting"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	help
+	  unittest-based test runner with Ant/JUnit like XML
+	  reporting.
+
+	  http://github.com/xmlrunner/unittest-xml-reporting/
diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
new file mode 100644
index 0000000000..9db3a09d38
--- /dev/null
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/unittest-xml-reporting/json
+md5  474cd89f9609828ef6039a0f00afd9db  unittest-xml-reporting-3.0.4.tar.gz
+sha256  984cebba69e889401bfe3adb9088ca376b3a1f923f0590d005126c1bffd1a695  unittest-xml-reporting-3.0.4.tar.gz
+# Locally calculated
+sha256  0596648105bee470f9cafd62753b931efe52392096439d88e2564cf7d7cf0e68  LICENSE
diff --git a/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
new file mode 100644
index 0000000000..5744c50a7c
--- /dev/null
+++ b/package/python-unittest-xml-reporting/python-unittest-xml-reporting.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# python-unittest-xml-reporting
+#
+################################################################################
+
+PYTHON_UNITTEST_XML_REPORTING_VERSION = 3.0.4
+PYTHON_UNITTEST_XML_REPORTING_SOURCE = unittest-xml-reporting-$(PYTHON_UNITTEST_XML_REPORTING_VERSION).tar.gz
+PYTHON_UNITTEST_XML_REPORTING_SITE = https://files.pythonhosted.org/packages/bc/09/677086169c8e302b614de7d4a97c45c4446a382f31cc010fb31177258508
+# License file missing in Pypi tarball, download separately. Issue
+# reported at
+# https://github.com/xmlrunner/unittest-xml-reporting/issues/259
+PYTHON_UNITTEST_XML_REPORTING_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/xmlrunner/unittest-xml-reporting/$(PYTHON_UNITTEST_XML_REPORTING_VERSION)/LICENSE
+PYTHON_UNITTEST_XML_REPORTING_SETUP_TYPE = setuptools
+PYTHON_UNITTEST_XML_REPORTING_LICENSE = BSD-2-Clause
+PYTHON_UNITTEST_XML_REPORTING_LICENSE_FILES = LICENSE
+
+define PYTHON_UNITTEST_XML_REPORTING_ADD_LICENSE_FILE
+	$(INSTALL) -D -m 0644 $(PYTHON_UNITTEST_XML_REPORTING_DL_DIR)/LICENSE $(@D)/LICENSE
+endef
+PYTHON_UNITTEST_XML_REPORTING_POST_EXTRACT_HOOKS += PYTHON_UNITTEST_XML_REPORTING_ADD_LICENSE_FILE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_unittest_xml_reporting.py b/support/testing/tests/package/sample_python_unittest_xml_reporting.py
new file mode 100644
index 0000000000..8fa92aaccc
--- /dev/null
+++ b/support/testing/tests/package/sample_python_unittest_xml_reporting.py
@@ -0,0 +1,9 @@
+import unittest
+import xmlrunner
+
+class Test1(unittest.TestCase):
+    def test_something(self):
+        self.assertTrue(True)
+
+if __name__ == '__main__':
+    unittest.main(testRunner=xmlrunner.XMLTestRunner(output='test-reports'))
diff --git a/support/testing/tests/package/test_python_unittest_xml_reporting.py b/support/testing/tests/package/test_python_unittest_xml_reporting.py
new file mode 100644
index 0000000000..f08c88e3da
--- /dev/null
+++ b/support/testing/tests/package/test_python_unittest_xml_reporting.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+import os
+import time
+
+
+class TestPythonPy3UnitTestXmlReporting(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_UNITTEST_XML_REPORTING=y
+        """
+    sample_scripts = ["tests/package/sample_python_unittest_xml_reporting.py"]
+    timeout = 60
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
+        self.assertRunOk(cmd)
+        # check if some tests results in XML were generated
+        cmd = "ls -1 test-reports/TEST-Test1-*.xml"
+        self.assertRunOk(cmd)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
