From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue,  4 Jul 2017 11:58:07 -0700
Subject: [Buildroot] [PATCH 3/3] testing/tests/package: add basic unit test
	for IPython
In-Reply-To: <20170704185807.27189-1-andrew.smirnov@gmail.com>
References: <20170704185807.27189-1-andrew.smirnov@gmail.com>
Message-ID: <20170704185807.27189-3-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 support/testing/tests/package/test_ipython.py | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 support/testing/tests/package/test_ipython.py

diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
new file mode 100644
index 0000000..164a768
--- /dev/null
+++ b/support/testing/tests/package/test_ipython.py
@@ -0,0 +1,32 @@
+import os
+
+import infra.basetest
+from tests.package.test_python import TestPythonBase
+
+class TestIPythonPy2(TestPythonBase):
+    config = TestPythonBase.config + \
+"""
+BR2_PACKAGE_PYTHON=y
+BR2_PACKAGE_PYTHON_IPYTHON=y
+"""
+    interpreter = "ipython"
+
+    def test_run(self):
+        self.login(40)  # It takes IPython a while to start on QEMU
+        self.math_floor_test()
+        self.libc_time_test()
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
+        self.login(40)  # It takes IPython a while to start on QEMU
+        self.math_floor_test()
+        self.libc_time_test()
+
+
-- 
2.9.4
