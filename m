From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 16 Aug 2018 09:30:49 +0200
Subject: [Buildroot] [V2] luarocks: bump to version 3.0.1
Message-ID: <20180816073049.5501-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The meaning of --sysconfdir has changed (see announcement http://lua-users.org/lists/lua-l/2018-08/msg00101.html),
So, LUAROCKS_CONFIG_DIR & LUAROCKS_CONFIG_FILE are adjusted.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/0001-allow-libluajit-detection.patch | 4 +++-
 package/luarocks/luarocks.hash                        | 2 +-
 package/luarocks/luarocks.mk                          | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/luarocks/0001-allow-libluajit-detection.patch b/package/luarocks/0001-allow-libluajit-detection.patch
index c5e52f428..05d025bba 100644
--- a/package/luarocks/0001-allow-libluajit-detection.patch
+++ b/package/luarocks/0001-allow-libluajit-detection.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] allow libluajit detection
 This detection was done only if luarocks is runned by luajit.
 But on Buildroot, luarocks is always runned by lua.
 
+See https://github.com/luarocks/luarocks/pull/883
+
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
  src/luarocks/deps.lua | 4 +---
@@ -15,7 +17,7 @@ diff --git a/src/luarocks/deps.lua b/src/luarocks/deps.lua
 index 8403f12..c1c0220 100644
 --- a/src/luarocks/deps.lua
 +++ b/src/luarocks/deps.lua
-@@ -511,10 +511,8 @@ function deps.check_lua(vars)
+@@ -513,10 +513,8 @@ function deps.check_lua(vars)
        "lua-" .. cfg.lua_version,
        "lua-" .. shortv,
        "lua",
diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 87ef6827c..4aa791cb4 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a43fffb997100f11cccb529a3db5456ce8dab18171a5cb3645f948147b6f64a1  luarocks-3.0.0.tar.gz
+sha256 b989c4b60d6c9edcd65169e5e42fcffbd39cdbebe6b138fa5aea45102f8d9ec0  luarocks-3.0.1.tar.gz
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index cd4be266c..25e3ad3e2 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.0.0
+LUAROCKS_VERSION = 3.0.1
 LUAROCKS_SITE = http://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
 HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
-LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc/luarocks
-LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
+LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc
+LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
 LUAROCKS_CFLAGS = $(TARGET_CFLAGS) -fPIC
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
-- 
2.17.1
