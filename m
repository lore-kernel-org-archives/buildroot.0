From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:32 +0200
Subject: [Buildroot] [PATCH 63/69] lua: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-64-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/lua/lua.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index b2dab3937c45..be3328434b3b 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -62,9 +62,6 @@ endef
 LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
 endif
 
-# We never want to have host-readline and host-ncurses as dependencies
-# of host-lua.
-HOST_LUA_DEPENDENCIES =
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
-- 
2.1.0
