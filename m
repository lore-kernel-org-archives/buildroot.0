From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:10 +0100
Subject: [Buildroot] [next/testing Lua modules 10/11] support/testing: add
 luasocket test
In-Reply-To: <20190219154311.22173-1-francois.perrad@gadz.org>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
Message-ID: <20190219154311.22173-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 ++
 .../testing/tests/package/test_luasocket.py   | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_luasocket.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 12ac3a43e..65f9d5a1f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -344,6 +344,8 @@ tests.package.test_luaossl.TestLuaLuaossl: { extends: .runtime_test }
 tests.package.test_luaosll.TestLuajitLuaossl: { extends: .runtime_test }
 tests.package.test_luasec.TestLuaLuaSec: { extends: .runtime_test }
 tests.package.test_luasec.TestLuajitLuaSec: { extends: .runtime_test }
+tests.package.test_luasocket.TestLuaLuaSocket: { extends: .runtime_test }
+tests.package.test_luasocket.TestLuajitLuaSocket: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_luasocket.py b/support/testing/tests/package/test_luasocket.py
new file mode 100644
index 000000000..c2d19d78c
--- /dev/null
+++ b/support/testing/tests/package/test_luasocket.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaSocket(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUASOCKET=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("socket")
+
+
+class TestLuajitLuaSocket(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUASOCKET=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("socket")
-- 
2.17.1
