From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 27 Apr 2020 18:57:59 +0200
Subject: [Buildroot] [PATCH] support/testing: test_lua_utf8: fix test after
 bump to lua-utf8 0.1.2
Message-ID: <20200427165759.18091-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit 0f0649140f73645f4cd00c9c0d27c50e9fa1caf9 introduced a change
in the module name: utf8 -> lua-utf8.

The packages-file-list.txt show the change in the files intalled on the rootfs:

[lua-utf8 0.1.2-2 latest version]
lua-utf8,./usr/lib/luarocks/rocks-5.1/luautf8/0.1.2-2/doc/LICENSE
lua-utf8,./usr/lib/luarocks/rocks-5.1/luautf8/0.1.2-2/doc/README.md
lua-utf8,./usr/lib/luarocks/rocks-5.1/luautf8/0.1.2-2/luautf8-0.1.2-2.rockspec
lua-utf8,./usr/lib/luarocks/rocks-5.1/luautf8/0.1.2-2/rock_manifest
lua-utf8,./usr/lib/lua/5.1/lua-utf8.so

[lua-utf8 1.2-0 previous version]
lua-utf8,./usr/lib/luarocks/rocks-5.1/utf8/1.2-0/doc/README.md
lua-utf8,./usr/lib/luarocks/rocks-5.1/utf8/1.2-0/utf8-1.2-0.rockspec
lua-utf8,./usr/lib/luarocks/rocks-5.1/utf8/1.2-0/rock_manifest
lua-utf8,./usr/lib/lua/5.1/utf8.so

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/526036036

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/testing/tests/package/test_lua_utf8.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_lua_utf8.py b/support/testing/tests/package/test_lua_utf8.py
index 3eab19dd4..5946a439c 100644
--- a/support/testing/tests/package/test_lua_utf8.py
+++ b/support/testing/tests/package/test_lua_utf8.py
@@ -10,7 +10,7 @@ class TestLuaUtf8(TestLuaBase):
 
     def test_run(self):
         self.login()
-        self.module_test("utf8")
+        self.module_test("lua-utf8")
 
 
 class TestLuajitUtf8(TestLuaBase):
@@ -22,4 +22,4 @@ class TestLuajitUtf8(TestLuaBase):
 
     def test_run(self):
         self.login()
-        self.module_test("utf8")
+        self.module_test("lua-utf8")
-- 
2.20.1
