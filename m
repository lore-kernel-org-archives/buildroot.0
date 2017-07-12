From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 11 Jul 2017 19:40:09 -0700
Subject: [Buildroot] [PATCH v2 6/6] testing/tests/package: add basic unit
	test for IPython
In-Reply-To: <20170712024009.2366-1-andrew.smirnov@gmail.com>
References: <20170712024009.2366-1-andrew.smirnov@gmail.com>
Message-ID: <20170712024009.2366-7-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 support/testing/tests/package/test_ipython.py | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 support/testing/tests/package/test_ipython.py

diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
new file mode 100644
index 0000000..dd8bf50
--- /dev/null
+++ b/support/testing/tests/package/test_ipython.py
@@ -0,0 +1,38 @@
+import os
+
+from tests.package.test_python import TestPythonBase
+#
+# The following pythong tests are not being used here:
+#
+# - version_test: IPython does not support --version option
+#
+# - zlib_test: IPython does not return a non-zero code the way CPython
+#              does, so this test ends up being a false-negative
+#
+class TestIPythonPy2(TestPythonBase):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON=y
+BR2_PACKAGE_PYTHON_IPYTHON=y
+"""
+    interpreter = "ipython"
+
+    def test_run(self):
+        self.login()
+        self.math_floor_test(40)
+        self.libc_time_test(40)
+
+class TestIPythonPy3(TestPythonBase):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON3=y
+BR2_PACKAGE_PYTHON_IPYTHON=y
+"""
+    interpreter = "ipython"
+
+    def test_run(self):
+        self.login()
+        self.math_floor_test(40)
+        self.libc_time_test(40)
+
+
-- 
2.9.4
