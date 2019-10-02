From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed,  2 Oct 2019 13:35:12 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: add turbolua test
Message-ID: <20191002113513.3290960-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 .gitlab-ci.yml                                 |  1 +
 support/testing/tests/package/test_turbolua.py | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 support/testing/tests/package/test_turbolua.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2b18a13d69..7d21752365 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -466,6 +466,7 @@ tests.package.test_rings.TestLuajitRings: { extends: .runtime_test }
 tests.package.test_rust.TestRust: { extends: .runtime_test }
 tests.package.test_rust.TestRustBin: { extends: .runtime_test }
 tests.package.test_syslog_ng.TestSyslogNg: { extends: .runtime_test }
+tests.package.test_turbolua.TestLuajitTurbolua: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: { extends: .runtime_test }
 tests.toolchain.test_external.TestExternalToolchainCCache: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_turbolua.py b/support/testing/tests/package/test_turbolua.py
new file mode 100644
index 0000000000..b8253c1bf4
--- /dev/null
+++ b/support/testing/tests/package/test_turbolua.py
@@ -0,0 +1,13 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuajitTurbolua(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_TURBOLUA=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("turbo")
-- 
2.23.0
