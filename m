From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Sep 2019 09:15:08 +0200
Subject: [Buildroot] [git commit] support/testing: add lua-cqueues test
Message-ID: <20190929070953.203A082A98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=101ae29c07fd2407cf98b203bd9394e4818b5bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                    |  2 +
 support/testing/tests/package/test_lua_cqueues.py | 59 +++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4fe114cd85..2b18a13d69 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -381,6 +381,8 @@ tests.package.test_lsqlite3.TestLuaLsqlite3: { extends: .runtime_test }
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
index 0000000000..e823651c32
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
