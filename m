From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Jun 2020 21:20:32 +0200
Subject: [Buildroot] [PATCH v1 2/4] support/testing: add python-colorzero
 test
In-Reply-To: <20200613192034.10286-1-ps.report@gmx.net>
References: <20200613192034.10286-1-ps.report@gmx.net>
Message-ID: <20200613192034.10286-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../tests/package/sample_python_colorzero.py  |  8 +++++++
 .../tests/package/test_python_colorzero.py    | 23 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_colorzero.py
 create mode 100644 support/testing/tests/package/test_python_colorzero.py

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
-- 
2.27.0
