From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:30:58 +0200
Subject: [Buildroot] [git commit] support/testing: add lzlib test
Message-ID: <20191026142648.308638859C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaa2c3a6f76760b8ed823b67b73916cfcf79ee48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                              |  1 +
 support/testing/tests/package/test_lzlib.py | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3f584dfb0b..151b43a3dc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -404,6 +404,7 @@ tests.package.test_luasocket.TestLuaLuaSocket: { extends: .runtime_test }
 tests.package.test_luasocket.TestLuajitLuaSocket: { extends: .runtime_test }
 tests.package.test_luasyslog.TestLuaLuasyslog: { extends: .runtime_test }
 tests.package.test_luasyslog.TestLuajitLuasyslog: { extends: .runtime_test }
+tests.package.test_lzlib.TestLuaLzlib: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lzlib.py b/support/testing/tests/package/test_lzlib.py
new file mode 100644
index 0000000000..84e767913f
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
