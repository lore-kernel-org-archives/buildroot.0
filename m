From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  2 Sep 2014 18:32:58 +0200
Subject: [Buildroot] [PATCH 2/2] host-lua: compat mode not longer needed by
	the newest luarocks
In-Reply-To: <1409675578-29114-1-git-send-email-francois.perrad@gadz.org>
References: <1409675578-29114-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1409675578-29114-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/lua.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 524f6a2..9afec6c 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -51,10 +51,6 @@ HOST_LUA_DEPENDENCIES =
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
-ifeq ($(BR2_PACKAGE_LUA_5_2),y)
-HOST_LUA_CFLAGS += -DLUA_COMPAT_ALL
-endif
-
 define LUA_BUILD_CMDS
 	$(MAKE) \
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
-- 
1.9.1
