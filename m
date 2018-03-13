From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:28:05 +0100
Subject: [Buildroot] [git commit] test_python_cryptography: fix code style
Message-ID: <20180313213834.89D908013D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d44816f611a552716c878642f397a58cb034088b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix these warnings:
E122 continuation line missing indentation or outdented
E301 expected 1 blank line, found 0
E302 expected 2 blank lines, found 1
F401 'os' imported but unused

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../tests/package/test_python_cryptography.py      | 23 ++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index b60152de1c..78c3ef55b3 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -1,7 +1,6 @@
-import os
-
 from tests.package.test_python import TestPythonBase
 
+
 class TestPythonCryptography(TestPythonBase):
     def fernet_test(self, timeout=-1):
         cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
@@ -10,22 +9,26 @@ class TestPythonCryptography(TestPythonBase):
         _, exit_code = self.emulator.run(cmd, timeout)
         self.assertEqual(exit_code, 0)
 
+
 class TestPythonPy2Cryptography(TestPythonCryptography):
     config = TestPythonBase.config + \
-"""
-BR2_PACKAGE_PYTHON=y
-BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
-"""
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        """
+
     def test_run(self):
         self.login()
         self.fernet_test(40)
 
+
 class TestPythonPy3Cryptography(TestPythonCryptography):
     config = TestPythonBase.config + \
-"""
-BR2_PACKAGE_PYTHON3=y
-BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
-"""
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        """
+
     def test_run(self):
         self.login()
         self.fernet_test(40)
