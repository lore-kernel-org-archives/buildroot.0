From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 17 Nov 2018 18:52:44 +0100
Subject: [Buildroot] [RFC 4/4] support/testing: add lpeg test
In-Reply-To: <20181117175244.23594-1-francois.perrad@gadz.org>
References: <20181117175244.23594-1-francois.perrad@gadz.org>
Message-ID: <20181117175244.23594-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                 |  1 +
 support/testing/tests/package/test_lua_lpeg.py | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua_lpeg.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 660199e8c..625f486e9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -313,6 +313,7 @@ tests.package.test_dropbear.TestDropbear: *runtime_test
 tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_lua.TestLua: *runtime_test
+tests.package.test_lua_lpeg.TestLuaLpeg: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_time_hires.TestPerlTimeHiRes: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
diff --git a/support/testing/tests/package/test_lua_lpeg.py b/support/testing/tests/package/test_lua_lpeg.py
new file mode 100644
index 000000000..5e1d9efeb
--- /dev/null
+++ b/support/testing/tests/package/test_lua_lpeg.py
@@ -0,0 +1,13 @@
+from tests.package.test_lua import TestLua
+
+
+class TestLuaLpeg(TestLua):
+    config = TestLua.config + \
+        """
+        BR2_PACKAGE_LPEG=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lpeg")
+        self.module_test("lpeg", "print(require[[lpeg]].version())")
-- 
2.17.1
