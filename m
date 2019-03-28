From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 17:20:00 +0100
Subject: [Buildroot] [git commit] support/testing: add lsqlite3 test
Message-ID: <20190328161637.3BAF487F7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7e6b2478d40562121786c51b747a4c2cfd56056
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                 |  2 ++
 support/testing/tests/package/test_lsqlite3.py | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8bb05f9c7e..46c86f277b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -328,6 +328,8 @@ tests.package.test_ipython.TestIPythonPy2: { extends: .runtime_test }
 tests.package.test_ipython.TestIPythonPy3: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuaLPeg: { extends: .runtime_test }
 tests.package.test_lpeg.TestLuajitLPeg: { extends: .runtime_test }
+tests.package.test_lsqlite3.TestLuaLsqlite3: { extends: .runtime_test }
+tests.package.test_lsqlite3.TestLuajitLsqlite3: { extends: .runtime_test }
 tests.package.test_lua.TestLua: { extends: .runtime_test }
 tests.package.test_lua.TestLuajit: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lsqlite3.py b/support/testing/tests/package/test_lsqlite3.py
new file mode 100644
index 0000000000..d874774647
--- /dev/null
+++ b/support/testing/tests/package/test_lsqlite3.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLsqlite3(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LSQLITE3=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lsqlite3")
+
+
+class TestLuajitLsqlite3(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LSQLITE3=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("lsqlite3")
