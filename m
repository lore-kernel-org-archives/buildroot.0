From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  1 Aug 2019 22:44:51 +0200
Subject: [Buildroot] [PATCH] support/testing: improve test_luasyslog
Message-ID: <20190801204451.15116-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

first, check the native part

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/testing/tests/package/test_luasyslog.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/package/test_luasyslog.py b/support/testing/tests/package/test_luasyslog.py
index 4eb5402d0..158b95cb0 100644
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
-- 
2.20.1
