From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:20:00 +0100
Subject: [Buildroot] [git commit] support/testing: add luaexpat test
Message-ID: <20190328161637.4F33D889A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=596465e61a049e21cc879a833db0258f7c970d65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                 |  2 ++
 support/testing/tests/package/test_luaexpat.py | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 303b3ea21e..83e2049139 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -336,6 +336,8 @@ tests.package.test_lua_curl.TestLuaLuacURL: { extends: .runtime_test }
 tests.package.test_lua_curl.TestLuajitLuacURL: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuajitUtf8: { extends: .runtime_test }
+tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
+tests.package.test_luaexpat.TestLuajitLuaExpat: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luaexpat.py b/support/testing/tests/package/test_luaexpat.py
new file mode 100644
index 0000000000..c71c3fadb3
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
