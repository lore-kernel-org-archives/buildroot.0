From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 13:29:08 -0800
Subject: [Buildroot] [PATCH/next 2/4] support/testing: add gitdb2 test
In-Reply-To: <20191129212910.2537303-1-aduskett@gmail.com>
References: <20191129212910.2537303-1-aduskett@gmail.com>
Message-ID: <20191129212910.2537303-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add a simple test case that imports the module.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .gitlab-ci.yml                                |  2 ++
 .../tests/package/sample_python_gitdb2.py     |  4 ++++
 .../tests/package/test_python_gitdb2.py       | 21 +++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_gitdb2.py
 create mode 100644 support/testing/tests/package/test_python_gitdb2.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 22befa0427..af41a94427 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -448,6 +448,8 @@ tests.package.test_python_constantly.TestPythonPy3Constantly: { extends: .runtim
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: { extends: .runtime_test }
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: { extends: .runtime_test }
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: { extends: .runtime_test }
+tests.package.test_python_gitdb2.TestPythonPy2Gitdb2: { extends: .runtime_test }
+tests.package.test_python_gitdb2.TestPythonPy3Gitdb2: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy2Incremental: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy3Incremental: { extends: .runtime_test }
 tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test }
diff --git a/support/testing/tests/package/sample_python_gitdb2.py b/support/testing/tests/package/sample_python_gitdb2.py
new file mode 100644
index 0000000000..b5c43cd858
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gitdb2.py
@@ -0,0 +1,4 @@
+# Taken from smmap/test/test_tutorial.py
+
+from gitdb import *
+
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
-- 
2.23.0
