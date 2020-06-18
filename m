From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:45:00 +0200
Subject: [Buildroot] [git commit] support/testing: add python-colorzero test
Message-ID: <20200618194318.A33F882B7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc5761beb0fdd27d5f89a5f618c3ec02e5d0e800
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  2 ++
 .../tests/package/sample_python_colorzero.py       |  8 ++++++++
 .../testing/tests/package/test_python_colorzero.py | 23 ++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 951f843cf2..3bad5d5ae9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -481,6 +481,8 @@ tests.package.test_python_cbor.TestPythonPy2Cbor: { extends: .runtime_test }
 tests.package.test_python_cbor.TestPythonPy3Cbor: { extends: .runtime_test }
 tests.package.test_python_click.TestPythonPy2Click: { extends: .runtime_test }
 tests.package.test_python_click.TestPythonPy3Click: { extends: .runtime_test }
+tests.package.test_python_colorzero.TestPythonPy2Colorzero: { extends: .runtime_test }
+tests.package.test_python_colorzero.TestPythonPy3Colorzero: { extends: .runtime_test }
 tests.package.test_python_constantly.TestPythonPy2Constantly: { extends: .runtime_test }
 tests.package.test_python_constantly.TestPythonPy3Constantly: { extends: .runtime_test }
 tests.package.test_python_crossbar.TestPythonPy3Crossbar: { extends: .runtime_test }
diff --git a/support/testing/tests/package/sample_python_colorzero.py b/support/testing/tests/package/sample_python_colorzero.py
new file mode 100644
index 0000000000..23862a816d
--- /dev/null
+++ b/support/testing/tests/package/sample_python_colorzero.py
@@ -0,0 +1,8 @@
+from colorzero import Color
+
+red = Color('red')
+green = Color('lime')
+blue = Color('blue')
+assert(red.rgb == (1.0, 0.0, 0.0))
+assert(green.rgb == (0.0, 1.0, 0.0))
+assert(blue.rgb == (0.0, 0.0, 1.0))
diff --git a/support/testing/tests/package/test_python_colorzero.py b/support/testing/tests/package/test_python_colorzero.py
new file mode 100644
index 0000000000..b7c228ac3c
--- /dev/null
+++ b/support/testing/tests/package/test_python_colorzero.py
@@ -0,0 +1,23 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Colorzero(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_COLORZERO=y
+        """
+    sample_scripts = ["tests/package/sample_python_colorzero.py"]
+    timeout = 30
+
+
+class TestPythonPy3Colorzero(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_COLORZERO=y
+        """
+    sample_scripts = ["tests/package/sample_python_colorzero.py"]
+    timeout = 30
