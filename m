From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 23 Sep 2019 11:03:57 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: add lua-cqueues test
In-Reply-To: <20190923090357.13545-1-francois.perrad@gadz.org>
References: <20190923090357.13545-1-francois.perrad@gadz.org>
Message-ID: <20190923090357.13545-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 +
 .../testing/tests/package/test_lua_cqueues.py | 59 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua_cqueues.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2abb1a3b9..c44d8ee92 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -377,6 +377,8 @@ tests.package.test_lsqlite3.TestLuaLsqlite3: { extends: .runtime_test }
 tests.package.test_lsqlite3.TestLuajitLsqlite3: { extends: .runtime_test }
 tests.package.test_lua.TestLua: { extends: .runtime_test }
 tests.package.test_lua.TestLuajit: { extends: .runtime_test }
+tests.package.test_lua_cqueues.TestLuaLuaCqueues: { extends: .runtime_test }
+tests.package.test_lua_cqueues.TestLuajitLuaCqueues: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuaLuacURL: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuajitLuacURL: { extends: .runtime_test }
 tests.package.test_lua_http.TestLuaHttp: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lua_cqueues.py b/support/testing/tests/package/test_lua_cqueues.py
new file mode 100644
index 000000000..e823651c3
--- /dev/null
+++ b/support/testing/tests/package/test_lua_cqueues.py
@@ -0,0 +1,59 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaCqueues(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_CQUEUES=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("_cqueues")
+        self.module_test("cqueues")
+        self.module_test("cqueues.auxlib")
+        self.module_test("cqueues.condition")
+        self.module_test("cqueues.dns")
+        self.module_test("cqueues.dns.config")
+        self.module_test("cqueues.dns.hints")
+        self.module_test("cqueues.dns.hosts")
+        self.module_test("cqueues.dns.packet")
+        self.module_test("cqueues.dns.record")
+        self.module_test("cqueues.dns.resolver")
+        self.module_test("cqueues.dns.resolvers")
+        self.module_test("cqueues.errno")
+        self.module_test("cqueues.notify")
+        self.module_test("cqueues.promise")
+        self.module_test("cqueues.signal")
+        self.module_test("cqueues.socket")
+        self.module_test("cqueues.thread")
+
+
+class TestLuajitLuaCqueues(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_CQUEUES=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("_cqueues")
+        self.module_test("cqueues")
+        self.module_test("cqueues.auxlib")
+        self.module_test("cqueues.condition")
+        self.module_test("cqueues.dns")
+        self.module_test("cqueues.dns.config")
+        self.module_test("cqueues.dns.hints")
+        self.module_test("cqueues.dns.hosts")
+        self.module_test("cqueues.dns.packet")
+        self.module_test("cqueues.dns.record")
+        self.module_test("cqueues.dns.resolver")
+        self.module_test("cqueues.dns.resolvers")
+        self.module_test("cqueues.errno")
+        self.module_test("cqueues.notify")
+        self.module_test("cqueues.promise")
+        self.module_test("cqueues.signal")
+        self.module_test("cqueues.socket")
+        self.module_test("cqueues.thread")
-- 
2.20.1
