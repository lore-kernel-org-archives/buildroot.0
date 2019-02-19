From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:03 +0100
Subject: [Buildroot] [next/testing Lua modules 03/11] support/testing: add
 lsqlite3 test
In-Reply-To: <20190219154311.22173-1-francois.perrad@gadz.org>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
Message-ID: <20190219154311.22173-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 ++
 .../testing/tests/package/test_lsqlite3.py    | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_lsqlite3.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1730f3906..b67b3cde1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -328,6 +328,8 @@ tests.package.test_ipython.TestIPythonPy2: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuaLPeg: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuajitLPeg: { extends: .runtime_test }
+tests.package.test_lsqlite3.TestLuaLsqlite3: { extends: .runtime_test }
+tests.package.test_lsqlite3.TestLuajitLsqlite3: { extends: .runtime_test }
 tests.package.test_lua.TestLua: { extends: .runtime_test }
 tests.package.test_lua.TestLuajit: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lsqlite3.py b/support/testing/tests/package/test_lsqlite3.py
new file mode 100644
index 000000000..d87477464
--- /dev/null
+++ b/support/testing/tests/package/test_lsqlite3.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLsqlite3(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LSQLITE3=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lsqlite3")
+
+
+class TestLuajitLsqlite3(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LSQLITE3=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lsqlite3")
-- 
2.17.1
