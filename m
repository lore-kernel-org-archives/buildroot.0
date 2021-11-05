Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CB3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:15:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F364604DA
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F364604DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B9B406D3;
	Fri,  5 Nov 2021 16:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJyEpc1K9OI3; Fri,  5 Nov 2021 16:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7BF4023B;
	Fri,  5 Nov 2021 16:15:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB451BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D41040427
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:15:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S48C-cv12eBK for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E102640012
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 17FFD8A6B1; Fri,  5 Nov 2021 16:11:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:04:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79e3cd1c78ac5f5f886ad587dcbf1d1512fd55ec
X-Git-Newrev: 9d3428beca1cf5a900c330e2fcbb0e622fd1385a
X-Patchwork-Hint: ignore
Message-Id: <20211105161120.17FFD8A6B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-unitest-xml-reporting: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d3428beca1cf5a900c330e2fcbb0e622fd1385a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on initial work from Nicolas Carrier
<nicolas.carrier@orolia.com>, with the following additions:

- Updated to a newer version
- Added proper license file handling
- Added runtime test case
- Restricted to Python 3.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  6 ++++++
 package/Config.in                                  |  1 +
 package/python-unittest-xml-reporting/Config.in    |  9 +++++++++
 .../python-unittest-xml-reporting.hash             |  5 +++++
 .../python-unittest-xml-reporting.mk               | 23 ++++++++++++++++++++++
 .../sample_python_unittest_xml_reporting.py        |  9 +++++++++
 .../package/test_python_unittest_xml_reporting.py  | 23 ++++++++++++++++++++++
 7 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9d0e92b564..cae9e27a65 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2005,16 +2005,19 @@ F:	package/php-xdebug/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
 F:	package/python-git/
+F:	package/python-unittest-xml-reporting/
 F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/sample_bmap_tools.sh
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
+F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_bmap_tools.py
 F:	support/testing/tests/package/test_php_pecl_dbus.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_git.py
+F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
@@ -2718,6 +2721,7 @@ F:	package/python-flask-expects-json/
 F:	package/python-git/
 F:	package/python-mad/
 F:	package/python-serial/
+F:	package/python-unittest-xml-reporting/
 F:	package/qextserialport/
 F:	package/riscv64-elf-toolchain/
 F:	package/rpcbind/
@@ -2733,10 +2737,12 @@ F:	support/testing/tests/package/sample_python_augeas.py
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
index c23755a421..47b8f54115 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1257,6 +1257,7 @@ menu "External python modules"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
