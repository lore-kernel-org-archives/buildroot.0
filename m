Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3A7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA6240292;
	Wed,  9 Feb 2022 17:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TSjLO2C7C7P; Wed,  9 Feb 2022 17:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6560E4016E;
	Wed,  9 Feb 2022 17:09:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52CD81BF27C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F675404F1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvtCQl7D5p9W for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:59:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD974404DA
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:59:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id F229CCD967
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0BDAD1C0003;
 Wed,  9 Feb 2022 16:52:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCc-0001DD-85; Wed, 09 Feb 2022 17:52:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:27 +0100
Message-Id: <20220209165213.4498-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 001/107] support/testing: drop python2 tests
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python2 for the target is about to get removed, so drop the tests using it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tests/package/sample_python_subprocess32.py    |  6 ------
 support/testing/tests/package/test_bmap_tools.py   |  8 --------
 support/testing/tests/package/test_crudini.py      |  8 --------
 support/testing/tests/package/test_libftdi1.py     | 12 ------------
 support/testing/tests/package/test_python.py       | 14 --------------
 support/testing/tests/package/test_python_argh.py  |  9 ---------
 .../testing/tests/package/test_python_bitstring.py | 10 ----------
 support/testing/tests/package/test_python_can.py   | 11 -----------
 support/testing/tests/package/test_python_cbor.py  | 11 -----------
 support/testing/tests/package/test_python_click.py |  9 ---------
 .../tests/package/test_python_constantly.py        | 10 ----------
 support/testing/tests/package/test_python_gnupg.py | 10 ----------
 .../tests/package/test_python_incremental.py       | 11 -----------
 .../testing/tests/package/test_python_passlib.py   | 11 -----------
 .../testing/tests/package/test_python_pexpect.py   | 10 ----------
 .../testing/tests/package/test_python_pynacl.py    | 11 -----------
 .../testing/tests/package/test_python_pyyaml.py    | 11 -----------
 .../tests/package/test_python_subprocess32.py      | 11 -----------
 .../testing/tests/package/test_python_ubjson.py    | 11 -----------
 19 files changed, 194 deletions(-)
 delete mode 100644 support/testing/tests/package/sample_python_subprocess32.py
 delete mode 100644 support/testing/tests/package/test_python_subprocess32.py

diff --git a/support/testing/tests/package/sample_python_subprocess32.py b/support/testing/tests/package/sample_python_subprocess32.py
deleted file mode 100644
index 8579745cc8..0000000000
--- a/support/testing/tests/package/sample_python_subprocess32.py
+++ /dev/null
@@ -1,6 +0,0 @@
-import subprocess32
-
-output = subprocess32.check_output(["ls", "-l", "/dev/null"])
-print(output)
-assert("/dev/null" in output)
-assert("No such" not in output)
diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
index baa23154f8..a179027633 100644
--- a/support/testing/tests/package/test_bmap_tools.py
+++ b/support/testing/tests/package/test_bmap_tools.py
@@ -45,14 +45,6 @@ class TestBmapTools(BRTest):
         self.assertRunOk(cmd, timeout=20)
 
 
-class TestPy2BmapTools(TestBmapTools):
-    __test__ = True
-    config = TestBmapTools.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        """
-
-
 class TestPy3BmapTools(TestBmapTools):
     __test__ = True
     config = TestBmapTools.config + \
diff --git a/support/testing/tests/package/test_crudini.py b/support/testing/tests/package/test_crudini.py
index e320d3207e..470a714eb6 100644
--- a/support/testing/tests/package/test_crudini.py
+++ b/support/testing/tests/package/test_crudini.py
@@ -33,14 +33,6 @@ class TestCrudiniBase(TestPythonPackageBase):
         self.assertEqual(out, ['this-is-the-magic-value'])
 
 
-class TestCrudiniPy2(TestCrudiniBase):
-    __test__ = True
-    config = TestCrudiniBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        """
-
-
 class TestCrudiniPy3(TestCrudiniBase):
     __test__ = True
     config = TestCrudiniBase.config + \
diff --git a/support/testing/tests/package/test_libftdi1.py b/support/testing/tests/package/test_libftdi1.py
index 78c928484c..5c29dea04f 100644
--- a/support/testing/tests/package/test_libftdi1.py
+++ b/support/testing/tests/package/test_libftdi1.py
@@ -1,18 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Libftdi1(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_LIBFTDI1=y
-        BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS=y
-        """
-    sample_scripts = ["tests/package/sample_libftdi1.py"]
-    timeout = 40
-
-
 class TestPythonPy3Libftdi1(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
index 60da8765c4..f29aff6624 100644
--- a/support/testing/tests/package/test_python.py
+++ b/support/testing/tests/package/test_python.py
@@ -39,20 +39,6 @@ class TestPythonBase(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
-class TestPython2(TestPythonBase):
-    config = TestPythonBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        """
-
-    def test_run(self):
-        self.login()
-        self.version_test("Python 2")
-        self.math_floor_test()
-        self.libc_time_test()
-        self.zlib_test()
-
-
 class TestPython3(TestPythonBase):
     config = TestPythonBase.config + \
         """
diff --git a/support/testing/tests/package/test_python_argh.py b/support/testing/tests/package/test_python_argh.py
index de4b4cbe74..887d9acd46 100644
--- a/support/testing/tests/package/test_python_argh.py
+++ b/support/testing/tests/package/test_python_argh.py
@@ -27,15 +27,6 @@ class TestPythonArgh(TestPythonPackageBase):
         self.assertEqual(exit_code, 2)
 
 
-class TestPythonPy2Argh(TestPythonArgh):
-    __test__ = True
-    config = TestPythonArgh.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_ARGH=y
-        """
-
-
 class TestPythonPy3Argh(TestPythonArgh):
     __test__ = True
     config = TestPythonArgh.config + \
diff --git a/support/testing/tests/package/test_python_bitstring.py b/support/testing/tests/package/test_python_bitstring.py
index 63b3fdb69c..bd358a2fc5 100644
--- a/support/testing/tests/package/test_python_bitstring.py
+++ b/support/testing/tests/package/test_python_bitstring.py
@@ -1,16 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Bitstring(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_BITSTRING=y
-        """
-    sample_scripts = ["tests/package/sample_python_bitstring.py"]
-
-
 class TestPythonPy3Bitstring(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_can.py b/support/testing/tests/package/test_python_can.py
index d509d05dbb..dba5539c5d 100644
--- a/support/testing/tests/package/test_python_can.py
+++ b/support/testing/tests/package/test_python_can.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Can(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_CAN=y
-        """
-    sample_scripts = ["tests/package/sample_python_can.py"]
-    timeout = 40
-
-
 class TestPythonPy3Can(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_cbor.py b/support/testing/tests/package/test_python_cbor.py
index 9da3503763..23a1e3e701 100644
--- a/support/testing/tests/package/test_python_cbor.py
+++ b/support/testing/tests/package/test_python_cbor.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Cbor(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_CBOR=y
-        """
-    sample_scripts = ["tests/package/sample_python_cbor_enc.py",
-                      "tests/package/sample_python_cbor_dec.py"]
-
-
 class TestPythonPy3Cbor(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_click.py b/support/testing/tests/package/test_python_click.py
index db57d3aa9f..0ee9702cce 100644
--- a/support/testing/tests/package/test_python_click.py
+++ b/support/testing/tests/package/test_python_click.py
@@ -26,15 +26,6 @@ class TestPythonClick(TestPythonPackageBase):
         self.assertEqual(exit_code, 2)
 
 
-class TestPythonPy2Click(TestPythonClick):
-    __test__ = True
-    config = TestPythonClick.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_CLICK=y
-        """
-
-
 class TestPythonPy3Click(TestPythonClick):
     __test__ = True
     config = TestPythonClick.config + \
diff --git a/support/testing/tests/package/test_python_constantly.py b/support/testing/tests/package/test_python_constantly.py
index 5be01c4f8c..edcb9bfd69 100644
--- a/support/testing/tests/package/test_python_constantly.py
+++ b/support/testing/tests/package/test_python_constantly.py
@@ -1,16 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Constantly(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_CONSTANTLY=y
-        """
-    sample_scripts = ["tests/package/sample_python_constantly.py"]
-
-
 class TestPythonPy3Constantly(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_gnupg.py b/support/testing/tests/package/test_python_gnupg.py
index 0c71f6b6d0..8861115130 100644
--- a/support/testing/tests/package/test_python_gnupg.py
+++ b/support/testing/tests/package/test_python_gnupg.py
@@ -1,16 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2GnuPG(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_GNUPG=y
-        """
-    sample_scripts = ["tests/package/sample_python_gnupg.py"]
-
-
 class TestPythonPy3GnuPG(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_incremental.py b/support/testing/tests/package/test_python_incremental.py
index 49800d8937..4c53d61321 100644
--- a/support/testing/tests/package/test_python_incremental.py
+++ b/support/testing/tests/package/test_python_incremental.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Incremental(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_INCREMENTAL=y
-        """
-    sample_scripts = ["tests/package/sample_python_incremental.py"]
-    timeout = 30
-
-
 class TestPythonPy3Incremental(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_passlib.py b/support/testing/tests/package/test_python_passlib.py
index 7c85882bf8..e12e86d91b 100644
--- a/support/testing/tests/package/test_python_passlib.py
+++ b/support/testing/tests/package/test_python_passlib.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Passlib(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_PASSLIB=y
-        """
-    sample_scripts = ["tests/package/sample_python_passlib.py"]
-    timeout = 30
-
-
 class TestPythonPy3Passlib(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pexpect.py b/support/testing/tests/package/test_python_pexpect.py
index ba31cdbdbe..70037a7d3c 100644
--- a/support/testing/tests/package/test_python_pexpect.py
+++ b/support/testing/tests/package/test_python_pexpect.py
@@ -1,16 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Pexpect(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_PEXPECT=y
-        """
-    sample_scripts = ["tests/package/sample_python_pexpect.py"]
-
-
 class TestPythonPy3Pexpect(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pynacl.py b/support/testing/tests/package/test_python_pynacl.py
index f4dd54940a..cef8a7e780 100644
--- a/support/testing/tests/package/test_python_pynacl.py
+++ b/support/testing/tests/package/test_python_pynacl.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Pynacl(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_PYNACL=y
-        """
-    sample_scripts = ["tests/package/sample_python_pynacl.py"]
-    timeout = 10
-
-
 class TestPythonPy3Pynacl(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_pyyaml.py b/support/testing/tests/package/test_python_pyyaml.py
index cd45a57b86..9d0a351f72 100644
--- a/support/testing/tests/package/test_python_pyyaml.py
+++ b/support/testing/tests/package/test_python_pyyaml.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Pyyaml(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_PYYAML=y
-        """
-    sample_scripts = ["tests/package/sample_python_pyyaml_enc.py",
-                      "tests/package/sample_python_pyyaml_dec.py"]
-
-
 class TestPythonPy3Pyyaml(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_subprocess32.py b/support/testing/tests/package/test_python_subprocess32.py
deleted file mode 100644
index d2878046d1..0000000000
--- a/support/testing/tests/package/test_python_subprocess32.py
+++ /dev/null
@@ -1,11 +0,0 @@
-from tests.package.test_python import TestPythonPackageBase
-
-
-class TestPythonPy2Subprocess32(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_SUBPROCESS32=y
-        """
-    sample_scripts = ["tests/package/sample_python_subprocess32.py"]
diff --git a/support/testing/tests/package/test_python_ubjson.py b/support/testing/tests/package/test_python_ubjson.py
index 85c707e292..a15dbd54b8 100644
--- a/support/testing/tests/package/test_python_ubjson.py
+++ b/support/testing/tests/package/test_python_ubjson.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Ubjson(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_UBJSON=y
-        """
-    sample_scripts = ["tests/package/sample_python_ubjson_enc.py",
-                      "tests/package/sample_python_ubjson_dec.py"]
-
-
 class TestPythonPy3Ubjson(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
