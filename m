From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 19:24:24 +0200
Subject: [Buildroot] [git commit] support/testing: remove
 TestPythonPy2Gpiozero
Message-ID: <20210514165639.28802817A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92177081223ec229fd50de50e8d76448ee80e5db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python2 support has been removed since the python-colorzero bump version to 2.0.

Remove the gpiozero test with python2

[1] 73bf3292e16b9419c5c88d10e9755d7208ca3623

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_python_gpiozero.py | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/support/testing/tests/package/test_python_gpiozero.py b/support/testing/tests/package/test_python_gpiozero.py
index 2498a55514..4fe155e6ce 100644
--- a/support/testing/tests/package/test_python_gpiozero.py
+++ b/support/testing/tests/package/test_python_gpiozero.py
@@ -14,15 +14,6 @@ class TestPythonGpiozero(TestPythonPackageBase):
         self.assertRunOk(cmd)
 
 
-class TestPythonPy2Gpiozero(TestPythonGpiozero):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_GPIOZERO=y
-        """
-
-
 class TestPythonPy3Gpiozero(TestPythonGpiozero):
     __test__ = True
     config = TestPythonGpiozero.config + \
