From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 18 Sep 2019 08:19:15 +0200
Subject: [Buildroot] [pkg-luarocks 6/6] package/lua: allows host-lua to find
 installed modules
In-Reply-To: <20190918061915.31250-1-francois.perrad@gadz.org>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
Message-ID: <20190918061915.31250-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/lua.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 2ff2fdf75..30dbf0d68 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -54,6 +54,12 @@ endef
 LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
 endif
 
+define HOST_LUA_LUACONF
+	$(SED) 's|#define LUA_ROOT.*|#define LUA_ROOT "$(HOST_DIR)/usr/"|' $(@D)/src/luaconf.h
+endef
+
+HOST_LUA_POST_PATCH_HOOKS += HOST_LUA_LUACONF
+
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 HOST_LUA_CFLAGS += -DLUA_COMPAT_5_2
-- 
2.20.1
