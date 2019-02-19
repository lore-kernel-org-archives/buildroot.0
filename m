From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:08 +0100
Subject: [Buildroot] [next/testing Lua modules 08/11] support/testing: add
 luaossl test
In-Reply-To: <20190219154311.22173-1-francois.perrad@gadz.org>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
Message-ID: <20190219154311.22173-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 ++
 support/testing/tests/package/test_luaossl.py | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_luaossl.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a73d6b7d0..92a54bd1f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -340,6 +340,8 @@ tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
 tests.package.test_luaexpat.TestLuajitLuaExpat: { extends: .runtime_test }
 tests.package.test_luafilesystem.TestLuaLuaFileSystem: { extends: .runtime_test }
 tests.package.test_luafilesystem.TestLuajitLuaFileSystem: { extends: .runtime_test }
+tests.package.test_luaossl.TestLuaLuaossl: { extends: .runtime_test }
+tests.package.test_luaosll.TestLuajitLuaossl: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luaossl.py b/support/testing/tests/package/test_luaossl.py
new file mode 100644
index 000000000..f6914e054
--- /dev/null
+++ b/support/testing/tests/package/test_luaossl.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaossl(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUAOSSL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("openssl")
+
+
+class TestLuajitLuaossl(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUAOSSL=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("openssl")
-- 
2.17.1
