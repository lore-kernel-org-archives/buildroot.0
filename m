From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 23:36:45 +0100
Subject: [Buildroot] [git commit] support/testing: add gitdb2 test
Message-ID: <20191216222805.073278B84E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ef16796352bb9b0506b378a1927465a8feba492
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test case that imports the module.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                      |  2 ++
 .../testing/tests/package/sample_python_gitdb2.py   |  1 +
 support/testing/tests/package/test_python_gitdb2.py | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2337eff472..3fbe2974d2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -450,6 +450,8 @@ tests.package.test_python_crossbar.TestPythonPy3Crossbar: { extends: .runtime_te
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: { extends: .runtime_test }
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: { extends: .runtime_test }
 tests.package.test_python_django.TestPythonPy3Django: { extends: .runtime_test }
+tests.package.test_python_gitdb2.TestPythonPy2Gitdb2: { extends: .runtime_test }
+tests.package.test_python_gitdb2.TestPythonPy3Gitdb2: { extends: .runtime_test }
 tests.package.test_python_gobject.TestPythonPy2Gobject: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy2Incremental: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy3Incremental: { extends: .runtime_test }
diff --git a/support/testing/tests/package/sample_python_gitdb2.py b/support/testing/tests/package/sample_python_gitdb2.py
new file mode 100644
index 0000000000..3742eed2d8
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gitdb2.py
@@ -0,0 +1 @@
+from gitdb import *
diff --git a/support/testing/tests/package/test_python_gitdb2.py b/support/testing/tests/package/test_python_gitdb2.py
new file mode 100644
index 0000000000..fc55f20821
--- /dev/null
+++ b/support/testing/tests/package/test_python_gitdb2.py
@@ -0,0 +1,21 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Gitdb2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_GITDB2=y
+        """
+    sample_scripts = ["tests/package/sample_python_gitdb2.py"]
+
+
+class TestPythonPy3Gitdb2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_GITDB2=y
+        """
+    sample_scripts = ["tests/package/sample_python_gitdb2.py"]
