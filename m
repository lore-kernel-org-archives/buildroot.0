From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:11 +0100
Subject: [Buildroot] [next/testing Lua modules 11/11] support/testing: add
 rings test
In-Reply-To: <20190219154311.22173-1-francois.perrad@gadz.org>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
Message-ID: <20190219154311.22173-11-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                              |  2 ++
 support/testing/tests/package/test_rings.py | 25 +++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_rings.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 65f9d5a1f..86067757c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -403,6 +403,8 @@ tests.package.test_python_txtorcon.TestPythonPy2Txtorcon: { extends: .runtime_te
 tests.package.test_python_txtorcon.TestPythonPy3Txtorcon: { extends: .runtime_test }
 tests.package.test_python_ubjson.TestPythonPy2Ubjson: { extends: .runtime_test }
 tests.package.test_python_ubjson.TestPythonPy3Ubjson: { extends: .runtime_test }
+tests.package.test_rings.TestLuaRings: { extends: .runtime_test }
+tests.package.test_rings.TestLuajitRings: { extends: .runtime_test }
 tests.package.test_rust.TestRust: { extends: .runtime_test }
 tests.package.test_rust.TestRustBin: { extends: .runtime_test }
 tests.package.test_syslog_ng.TestSyslogNg: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_rings.py b/support/testing/tests/package/test_rings.py
new file mode 100644
index 000000000..be9765f18
--- /dev/null
+++ b/support/testing/tests/package/test_rings.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaRings(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_RINGS=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("rings")
+
+
+class TestLuajitRings(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_RINGS=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("rings")
-- 
2.17.1
