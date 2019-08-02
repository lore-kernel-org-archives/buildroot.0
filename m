From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 2 Aug 2019 17:35:44 +0200
Subject: [Buildroot] [git commit] support/testing: improve test_luasyslog
Message-ID: <20190802153308.C0AB08C9E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a49dcb5287111cb0cb4d3d38eea95dc85d0893f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lua has a builtin lsyslog module, so let's test this one as well.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_luasyslog.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/package/test_luasyslog.py b/support/testing/tests/package/test_luasyslog.py
index 4eb5402d0e..158b95cb06 100644
--- a/support/testing/tests/package/test_luasyslog.py
+++ b/support/testing/tests/package/test_luasyslog.py
@@ -10,6 +10,7 @@ class TestLuaLuasyslog(TestLuaBase):
 
     def test_run(self):
         self.login()
+        self.module_test("lsyslog")
         self.module_test("logging.syslog")
 
 
@@ -22,4 +23,5 @@ class TestLuajitLuasyslog(TestLuaBase):
 
     def test_run(self):
         self.login()
+        self.module_test("lsyslog")
         self.module_test("logging.syslog")
