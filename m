From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:06 +0100
Subject: [Buildroot] [next/testing Lua modules 06/11] support/testing: add
 luaexpat test
In-Reply-To: <20190219154311.22173-1-francois.perrad@gadz.org>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
Message-ID: <20190219154311.22173-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 ++
 .../testing/tests/package/test_luaexpat.py    | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_luaexpat.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ad7186a98..f96f7f130 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -336,6 +336,8 @@ tests.package.test_lua_curl.TestLuaLuacURL: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuajitLuacURL: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuajitUtf8: { extends: .runtime_test }
+tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
+tests.package.test_luaexpat.TestLuajitLuaExpat: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luaexpat.py b/support/testing/tests/package/test_luaexpat.py
new file mode 100644
index 000000000..c71c3fadb
--- /dev/null
+++ b/support/testing/tests/package/test_luaexpat.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaExpat(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUAEXPAT=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lxp")
+
+
+class TestLuajitLuaExpat(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUAEXPAT=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lxp")
-- 
2.17.1
