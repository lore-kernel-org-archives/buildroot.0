From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 29 Sep 2019 14:55:17 +0200
Subject: [Buildroot] [PATCH 1/4] support/testing: add lzlib test
Message-ID: <20190929125520.16957-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                              |  1 +
 support/testing/tests/package/test_lzlib.py | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 support/testing/tests/package/test_lzlib.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 33db89331..fc6628455 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -399,6 +399,7 @@ tests.package.test_luasocket.TestLuaLuaSocket: { extends: .runtime_test }
 tests.package.test_luasocket.TestLuajitLuaSocket: { extends: .runtime_test }
 tests.package.test_luasyslog.TestLuaLuasyslog: { extends: .runtime_test }
 tests.package.test_luasyslog.TestLuajitLuasyslog: { extends: .runtime_test }
+tests.package.test_lzlib.TestLuaLzlib: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lzlib.py b/support/testing/tests/package/test_lzlib.py
new file mode 100644
index 000000000..84e767913
--- /dev/null
+++ b/support/testing/tests/package/test_lzlib.py
@@ -0,0 +1,14 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLzlib(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LZLIB=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("zlib")
+        self.module_test("gzip")
-- 
2.20.1
