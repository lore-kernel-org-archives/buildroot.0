From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:31:03 +0200
Subject: [Buildroot] [git commit] support/testing: add lua-gd test
Message-ID: <20191026142648.37E8B8859D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=308ef3166be954395f8489bc42f9b376ddbfd8fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                               |  2 ++
 support/testing/tests/package/test_lua_gd.py | 31 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 151b43a3dc..3c2525d339 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -386,6 +386,8 @@ tests.package.test_lua_cqueues.TestLuaLuaCqueues: { extends: .runtime_test }
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
index 0000000000..f79f2086a1
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
