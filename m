From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 13:29:10 -0800
Subject: [Buildroot] [PATCH/next 4/4] support/testing: add gitpython test
In-Reply-To: <20191129212910.2537303-1-aduskett@gmail.com>
References: <20191129212910.2537303-1-aduskett@gmail.com>
Message-ID: <20191129212910.2537303-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add a simple test case that imports the module.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .gitlab-ci.yml                                        |  1 +
 .../testing/tests/package/sample_python_gitpython.py  |  2 ++
 .../testing/tests/package/test_python_gitpython.py    | 11 +++++++++++
 3 files changed, 14 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_gitpython.py
 create mode 100644 support/testing/tests/package/test_python_gitpython.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index af41a94427..3b57af0aba 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -450,6 +450,7 @@ tests.package.test_python_cryptography.TestPythonPy2Cryptography: { extends: .ru
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: { extends: .runtime_test }
 tests.package.test_python_gitdb2.TestPythonPy2Gitdb2: { extends: .runtime_test }
 tests.package.test_python_gitdb2.TestPythonPy3Gitdb2: { extends: .runtime_test }
+tests.package.test_python_gitpython.TestPythonPy3GitPython: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy2Incremental: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy3Incremental: { extends: .runtime_test }
 tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test }
diff --git a/support/testing/tests/package/sample_python_gitpython.py b/support/testing/tests/package/sample_python_gitpython.py
new file mode 100644
index 0000000000..3ffd6843f3
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gitpython.py
@@ -0,0 +1,2 @@
+from git import *
+
diff --git a/support/testing/tests/package/test_python_gitpython.py b/support/testing/tests/package/test_python_gitpython.py
new file mode 100644
index 0000000000..651453c577
--- /dev/null
+++ b/support/testing/tests/package/test_python_gitpython.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3GitPython(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_GITPYTHON=y
+        """
+    sample_scripts = ["tests/package/sample_python_gitpython.py"]
-- 
2.23.0
