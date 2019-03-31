From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 08:48:45 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing/tests/package/test_lua*:
 regeneration
In-Reply-To: <20190331064845.16243-1-francois.perrad@gadz.org>
References: <20190331064845.16243-1-francois.perrad@gadz.org>
Message-ID: <20190331064845.16243-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/testing/tests/package/test_lpeg.py      | 6 ++++--
 support/testing/tests/package/test_lua_curl.py  | 2 ++
 support/testing/tests/package/test_luaossl.py   | 2 ++
 support/testing/tests/package/test_luasocket.py | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_lpeg.py b/support/testing/tests/package/test_lpeg.py
index e57415735..4e1ee343b 100644
--- a/support/testing/tests/package/test_lpeg.py
+++ b/support/testing/tests/package/test_lpeg.py
@@ -10,7 +10,8 @@ class TestLuaLPeg(TestLuaBase):
 
     def test_run(self):
         self.login()
-        self.module_test("lpeg", script="print(require[[lpeg]].version())")
+        self.module_test("lpeg")
+        self.module_test("re")
 
 
 class TestLuajitLPeg(TestLuaBase):
@@ -22,4 +23,5 @@ class TestLuajitLPeg(TestLuaBase):
 
     def test_run(self):
         self.login()
-        self.module_test("lpeg", script="print(require[[lpeg]].version())")
+        self.module_test("lpeg")
+        self.module_test("re")
diff --git a/support/testing/tests/package/test_lua_curl.py b/support/testing/tests/package/test_lua_curl.py
index 5ee79313f..081303948 100644
--- a/support/testing/tests/package/test_lua_curl.py
+++ b/support/testing/tests/package/test_lua_curl.py
@@ -11,6 +11,7 @@ class TestLuaLuacURL(TestLuaBase):
     def test_run(self):
         self.login()
         self.module_test("cURL")
+        self.module_test("lcurl")
 
 
 class TestLuajitLuacURL(TestLuaBase):
@@ -23,3 +24,4 @@ class TestLuajitLuacURL(TestLuaBase):
     def test_run(self):
         self.login()
         self.module_test("cURL")
+        self.module_test("lcurl")
diff --git a/support/testing/tests/package/test_luaossl.py b/support/testing/tests/package/test_luaossl.py
index f6914e054..f9f9ab4ee 100644
--- a/support/testing/tests/package/test_luaossl.py
+++ b/support/testing/tests/package/test_luaossl.py
@@ -11,6 +11,7 @@ class TestLuaLuaossl(TestLuaBase):
     def test_run(self):
         self.login()
         self.module_test("openssl")
+        self.module_test("_openssl")
 
 
 class TestLuajitLuaossl(TestLuaBase):
@@ -23,3 +24,4 @@ class TestLuajitLuaossl(TestLuaBase):
     def test_run(self):
         self.login()
         self.module_test("openssl")
+        self.module_test("_openssl")
diff --git a/support/testing/tests/package/test_luasocket.py b/support/testing/tests/package/test_luasocket.py
index c2d19d78c..3d21df1de 100644
--- a/support/testing/tests/package/test_luasocket.py
+++ b/support/testing/tests/package/test_luasocket.py
@@ -10,6 +10,8 @@ class TestLuaLuaSocket(TestLuaBase):
 
     def test_run(self):
         self.login()
+        self.module_test("ltn12")
+        self.module_test("mime")
         self.module_test("socket")
 
 
@@ -22,4 +24,6 @@ class TestLuajitLuaSocket(TestLuaBase):
 
     def test_run(self):
         self.login()
+        self.module_test("ltn12")
+        self.module_test("mime")
         self.module_test("socket")
-- 
2.17.1
