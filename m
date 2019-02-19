From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:04 +0100
Subject: [Buildroot] [next/testing Lua modules 04/11] support/testing: add
 lua-curl test
In-Reply-To: <20190219154311.22173-1-francois.perrad@gadz.org>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
Message-ID: <20190219154311.22173-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 ++
 .../testing/tests/package/test_lua_curl.py    | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua_curl.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b67b3cde1..e4e9dcb23 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -332,6 +332,8 @@ tests.package.test_lsqlite3.TestLuaLsqlite3: { extends: .runtime_test }
 tests.package.test_lsqlite3.TestLuajitLsqlite3: { extends: .runtime_test }
 tests.package.test_lua.TestLua: { extends: .runtime_test }
 tests.package.test_lua.TestLuajit: { extends: .runtime_test }
+tests.package.test_lua_curl.TestLuaLuacURL: { extends: .runtime_test }
+tests.package.test_lua_curl.TestLuajitLuacURL: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lua_curl.py b/support/testing/tests/package/test_lua_curl.py
new file mode 100644
index 000000000..5ee79313f
--- /dev/null
+++ b/support/testing/tests/package/test_lua_curl.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuacURL(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_CURL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("cURL")
+
+
+class TestLuajitLuacURL(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_CURL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("cURL")
-- 
2.17.1
