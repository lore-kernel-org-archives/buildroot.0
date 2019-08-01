From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 10:11:18 +0200
Subject: [Buildroot] [git commit] support/testing: add luaposix test
Message-ID: <20190801080944.6ECAC8147E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0b0976c93337b521ec7935bf536a00ff3896e0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_luaposix.py | 81 ++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/support/testing/tests/package/test_luaposix.py b/support/testing/tests/package/test_luaposix.py
new file mode 100644
index 0000000000..0182faf2f8
--- /dev/null
+++ b/support/testing/tests/package/test_luaposix.py
@@ -0,0 +1,81 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaPosix(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUAPOSIX=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("posix.version", "print(require[[posix.version]])")
+        self.module_test("posix.ctype")
+        self.module_test("posix.dirent")
+        self.module_test("posix.errno")
+        self.module_test("posix.fcntl")
+        self.module_test("posix.fnmatch")
+        self.module_test("posix.glob")
+        self.module_test("posix.grp")
+        self.module_test("posix.libgen")
+        self.module_test("posix.poll")
+        self.module_test("posix.pwd")
+        self.module_test("posix.sched")
+        self.module_test("posix.signal")
+        self.module_test("posix.stdio")
+        self.module_test("posix.stdlib")
+        self.module_test("posix.sys.msg")
+        self.module_test("posix.sys.resource")
+        self.module_test("posix.sys.socket")
+        self.module_test("posix.sys.stat")
+        self.module_test("posix.sys.statvfs")
+        self.module_test("posix.sys.time")
+        self.module_test("posix.sys.times")
+        self.module_test("posix.sys.utsname")
+        self.module_test("posix.sys.wait")
+        self.module_test("posix.syslog")
+        self.module_test("posix.termio")
+        self.module_test("posix.time")
+        self.module_test("posix.unistd")
+        self.module_test("posix.utime")
+
+
+class TestLuajitLuaPosix(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUAPOSIX=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("posix.version", "print(require[[posix.version]])")
+        self.module_test("posix.ctype")
+        self.module_test("posix.dirent")
+        self.module_test("posix.errno")
+        self.module_test("posix.fcntl")
+        self.module_test("posix.fnmatch")
+        self.module_test("posix.glob")
+        self.module_test("posix.grp")
+        self.module_test("posix.libgen")
+        self.module_test("posix.poll")
+        self.module_test("posix.pwd")
+        self.module_test("posix.sched")
+        self.module_test("posix.signal")
+        self.module_test("posix.stdio")
+        self.module_test("posix.stdlib")
+        self.module_test("posix.sys.msg")
+        self.module_test("posix.sys.resource")
+        self.module_test("posix.sys.socket")
+        self.module_test("posix.sys.stat")
+        self.module_test("posix.sys.statvfs")
+        self.module_test("posix.sys.time")
+        self.module_test("posix.sys.times")
+        self.module_test("posix.sys.utsname")
+        self.module_test("posix.sys.wait")
+        self.module_test("posix.syslog")
+        self.module_test("posix.termio")
+        self.module_test("posix.time")
+        self.module_test("posix.unistd")
+        self.module_test("posix.utime")
