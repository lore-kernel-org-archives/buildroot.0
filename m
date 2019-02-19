From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:05 +0100
Subject: [Buildroot] [next/testing Lua modules 05/11] support/testing: add
 lua-utf8 test
In-Reply-To: <20190219154311.22173-1-francois.perrad@gadz.org>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
Message-ID: <20190219154311.22173-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 ++
 .../testing/tests/package/test_lua_utf8.py    | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua_utf8.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e4e9dcb23..ad7186a98 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -334,6 +334,8 @@ tests.package.test_lua.TestLua: { extends: .runtime_test }
 tests.package.test_lua.TestLuajit: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuaLuacURL: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuajitLuacURL: { extends: .runtime_test }
+tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
+tests.package.test_lua_utf8.TestLuajitUtf8: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lua_utf8.py b/support/testing/tests/package/test_lua_utf8.py
new file mode 100644
index 000000000..3eab19dd4
--- /dev/null
+++ b/support/testing/tests/package/test_lua_utf8.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaUtf8(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_UTF8=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("utf8")
+
+
+class TestLuajitUtf8(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_UTF8=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("utf8")
-- 
2.17.1
