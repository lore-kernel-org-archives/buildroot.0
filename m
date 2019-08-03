From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 14:53:05 +0200
Subject: [Buildroot] [git commit] support/testing: drop haveged for python
 tests
Message-ID: <20190803125127.7A6EB812B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=650e9903a9cbfda660fea24239d5f8cbf4607ac8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new builtin armv5 kernel 4.19 uses VirtIORNG to provide entropy, so we
no longer need haveged.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/264508536
https://gitlab.com/buildroot.org/buildroot/-/jobs/264508537
https://gitlab.com/buildroot.org/buildroot/-/jobs/264508542
https://gitlab.com/buildroot.org/buildroot/-/jobs/264508543

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: reword]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_python_crossbar.py | 2 --
 support/testing/tests/package/test_python_pynacl.py   | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/support/testing/tests/package/test_python_crossbar.py b/support/testing/tests/package/test_python_crossbar.py
index 2d7b739b5c..d7843ddd8b 100644
--- a/support/testing/tests/package/test_python_crossbar.py
+++ b/support/testing/tests/package/test_python_crossbar.py
@@ -3,12 +3,10 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Crossbar(TestPythonPackageBase):
     __test__ = True
-    # use haveged to generate enough entropy so crossbar -> pynacl -> libsodium don't hang waiting for /dev/random
     config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_CROSSBAR=y
-        BR2_PACKAGE_HAVEGED=y
         """
     sample_scripts = ["tests/package/sample_python_crossbar.py"]
     timeout = 60
diff --git a/support/testing/tests/package/test_python_pynacl.py b/support/testing/tests/package/test_python_pynacl.py
index 729a887552..f4dd54940a 100644
--- a/support/testing/tests/package/test_python_pynacl.py
+++ b/support/testing/tests/package/test_python_pynacl.py
@@ -3,12 +3,10 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy2Pynacl(TestPythonPackageBase):
     __test__ = True
-    # use haveged to generate enough entropy so pynacl -> libsodium don't hang waiting for /dev/random
     config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON=y
         BR2_PACKAGE_PYTHON_PYNACL=y
-        BR2_PACKAGE_HAVEGED=y
         """
     sample_scripts = ["tests/package/sample_python_pynacl.py"]
     timeout = 10
@@ -16,12 +14,10 @@ class TestPythonPy2Pynacl(TestPythonPackageBase):
 
 class TestPythonPy3Pynacl(TestPythonPackageBase):
     __test__ = True
-    # use haveged to generate enough entropy so pynacl -> libsodium don't hang waiting for /dev/random
     config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_PYNACL=y
-        BR2_PACKAGE_HAVEGED=y
         """
     sample_scripts = ["tests/package/sample_python_pynacl.py"]
     timeout = 10
