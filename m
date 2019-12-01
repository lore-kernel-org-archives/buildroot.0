From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  1 Dec 2019 10:39:09 -0800
Subject: [Buildroot] [PATCH v2 2/2] support/testing: add python-gobject test
In-Reply-To: <20191201183909.3756147-1-aduskett@gmail.com>
References: <20191201183909.3756147-1-aduskett@gmail.com>
Message-ID: <20191201183909.3756147-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Add a simple test case that imports the module.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 DEVELOPERS                                            |  1 +
 .../testing/tests/package/sample_python_gobject.py    |  1 +
 support/testing/tests/package/test_python_gobject.py  | 11 +++++++++++
 3 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_gobject.py
 create mode 100644 support/testing/tests/package/test_python_gobject.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 4adaac0c3d..c9fd98636e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -74,6 +74,7 @@ F:	package/semodule-utils/
 F:	package/setools/
 F:	package/sngrep/
 F:	package/systemd/
+F:	support/testing/tests/package/test_python_gobject.py
 
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
diff --git a/support/testing/tests/package/sample_python_gobject.py b/support/testing/tests/package/sample_python_gobject.py
new file mode 100644
index 0000000000..84ebee7362
--- /dev/null
+++ b/support/testing/tests/package/sample_python_gobject.py
@@ -0,0 +1 @@
+import gobject  # noqa
diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
new file mode 100644
index 0000000000..0a59447adb
--- /dev/null
+++ b/support/testing/tests/package/test_python_gobject.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy2Gobject(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        BR2_PACKAGE_PYTHON_GOBJECT=y
+        """
+    sample_scripts = ["tests/package/sample_python_gobject.py"]
-- 
2.23.0
