Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4835FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B9760BE7;
	Wed,  9 Feb 2022 21:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s38dNDGnS2l8; Wed,  9 Feb 2022 21:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B196360E45;
	Wed,  9 Feb 2022 21:37:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 448C41BF9C1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64B7860E5F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_iVGjfnJvpO for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B7E26009C
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3C7CE81335; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:07:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e9ecaa0c9d9aea41212566a58ffab5e25e52bda
X-Git-Newrev: f697096a770ff4704ac6917d7841dfaa02a945a0
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.3C7CE81335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: drop python2 tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=f697096a770ff4704ac6917d7841dfaa02a945a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python2 for the target is about to get removed, so drop the tests using it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../testing/tests/package/sample_python_subprocess32.py    |  6 ------
 support/testing/tests/package/test_bmap_tools.py           |  8 --------
 support/testing/tests/package/test_crudini.py              |  8 --------
 support/testing/tests/package/test_libftdi1.py             | 12 ------------
 support/testing/tests/package/test_python.py               | 14 --------------
 support/testing/tests/package/test_python_argh.py          |  9 ---------
 support/testing/tests/package/test_python_bitstring.py     | 10 ----------
 support/testing/tests/package/test_python_can.py           | 11 -----------
 support/testing/tests/package/test_python_cbor.py          | 11 -----------
 support/testing/tests/package/test_python_click.py         |  9 ---------
 support/testing/tests/package/test_python_constantly.py    | 10 ----------
 support/testing/tests/package/test_python_gnupg.py         | 10 ----------
 support/testing/tests/package/test_python_incremental.py   | 11 -----------
 support/testing/tests/package/test_python_passlib.py       | 11 -----------
 support/testing/tests/package/test_python_pexpect.py       | 10 ----------
 support/testing/tests/package/test_python_pynacl.py        | 11 -----------
 support/testing/tests/package/test_python_pyyaml.py        | 11 -----------
 support/testing/tests/package/test_python_subprocess32.py  | 11 -----------
 support/testing/tests/package/test_python_ubjson.py        | 11 -----------
 19 files changed, 194 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
