From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 19:24:33 +0200
Subject: [Buildroot] [git commit] support/testing: remove
 TestPythonPy2Colorzero
Message-ID: <20210514165639.36A9F834B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5ea09e2a853392b5b379093a43221a6cda71edf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python2 support has been removed since the python-colorzero bump version to 2.0.

[1] 73bf3292e16b9419c5c88d10e9755d7208ca3623

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_python_colorzero.py | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/support/testing/tests/package/test_python_colorzero.py b/support/testing/tests/package/test_python_colorzero.py
index b7c228ac3c..d67f77bdd4 100644
--- a/support/testing/tests/package/test_python_colorzero.py
+++ b/support/testing/tests/package/test_python_colorzero.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Colorzero(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_COLORZERO=y
-        """
-    sample_scripts = ["tests/package/sample_python_colorzero.py"]
-    timeout = 30
-
-
 class TestPythonPy3Colorzero(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
