From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 29 Sep 2019 14:55:18 +0200
Subject: [Buildroot] [PATCH 2/4] support/testing: add lua-gd test
In-Reply-To: <20190929125520.16957-1-francois.perrad@gadz.org>
References: <20190929125520.16957-1-francois.perrad@gadz.org>
Message-ID: <20190929125520.16957-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                               |  2 ++
 support/testing/tests/package/test_lua_gd.py | 31 ++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua_gd.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fc6628455..a1e309b50 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -381,6 +381,8 @@ tests.package.test_lua_cqueues.TestLuaLuaCqueues: { extends: .runtime_test }
 tests.package.test_lua_cqueues.TestLuajitLuaCqueues: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuaLuacURL: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuajitLuacURL: { extends: .runtime_test }
+tests.package.test_lua_gd.TestLuaLuaGD: { extends: .runtime_test }
+tests.package.test_lua_gd.TestLuajitLuaGD: { extends: .runtime_test }
 tests.package.test_lua_http.TestLuaHttp: { extends: .runtime_test }
 tests.package.test_lua_http.TestLuajitHttp: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lua_gd.py b/support/testing/tests/package/test_lua_gd.py
new file mode 100644
index 000000000..f79f2086a
--- /dev/null
+++ b/support/testing/tests/package/test_lua_gd.py
@@ -0,0 +1,31 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaGD(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_GD=y
+        BR2_PACKAGE_FONTCONFIG=y
+        BR2_PACKAGE_JPEG=y
+        BR2_PACKAGE_LIBPNG=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("gd")
+
+
+class TestLuajitLuaGD(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_GD=y
+        BR2_PACKAGE_FONTCONFIG=y
+        BR2_PACKAGE_JPEG=y
+        BR2_PACKAGE_LIBPNG=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("gd")
-- 
2.20.1
