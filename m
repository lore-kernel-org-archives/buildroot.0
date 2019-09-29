From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 29 Sep 2019 14:55:19 +0200
Subject: [Buildroot] [PATCH 3/4] support/testing: add lua-sdl2 test
In-Reply-To: <20190929125520.16957-1-francois.perrad@gadz.org>
References: <20190929125520.16957-1-francois.perrad@gadz.org>
Message-ID: <20190929125520.16957-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .gitlab-ci.yml                                |  2 +
 .../testing/tests/package/test_lua_sdl2.py    | 41 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 support/testing/tests/package/test_lua_sdl2.py

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a1e309b50..ecbcbcb78 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -385,6 +385,8 @@ tests.package.test_lua_gd.TestLuaLuaGD: { extends: .runtime_test }
 tests.package.test_lua_gd.TestLuajitLuaGD: { extends: .runtime_test }
 tests.package.test_lua_http.TestLuaHttp: { extends: .runtime_test }
 tests.package.test_lua_http.TestLuajitHttp: { extends: .runtime_test }
+tests.package.test_lua_sdl2.TestLuaLuaSDL2: { extends: .runtime_test }
+tests.package.test_lua_sdl2.TestLuajitLuaSDL2: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuaUtf8: { extends: .runtime_test }
 tests.package.test_lua_utf8.TestLuajitUtf8: { extends: .runtime_test }
 tests.package.test_luaexpat.TestLuaLuaExpat: { extends: .runtime_test }
diff --git a/support/testing/tests/package/test_lua_sdl2.py b/support/testing/tests/package/test_lua_sdl2.py
new file mode 100644
index 000000000..22c4087f5
--- /dev/null
+++ b/support/testing/tests/package/test_lua_sdl2.py
@@ -0,0 +1,41 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaSDL2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_SDL2=y
+        BR2_PACKAGE_SDL2_IMAGE=y
+        BR2_PACKAGE_SDL2_MIXER=y
+        BR2_PACKAGE_SDL2_NET=y
+        BR2_PACKAGE_SDL2_TTF=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("SDL")
+        self.module_test("SDL.image")
+        self.module_test("SDL.mixer")
+        self.module_test("SDL.net")
+        self.module_test("SDL.ttf")
+
+
+class TestLuajitLuaSDL2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_SDL2=y
+        BR2_PACKAGE_SDL2_IMAGE=y
+        BR2_PACKAGE_SDL2_MIXER=y
+        BR2_PACKAGE_SDL2_NET=y
+        BR2_PACKAGE_SDL2_TTF=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("SDL")
+        self.module_test("SDL.image")
+        self.module_test("SDL.mixer")
+        self.module_test("SDL.net")
+        self.module_test("SDL.ttf")
-- 
2.20.1
