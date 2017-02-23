From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:39 +0100
Subject: [Buildroot] [PATCH 17/25] lua-bit32: remove custom extract commands
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-18-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the reworked luarocks extraction, they are no longer needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua-bit32/lua-bit32.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/lua-bit32/lua-bit32.mk b/package/lua-bit32/lua-bit32.mk
index 8304d6eaec..f4090c703a 100644
--- a/package/lua-bit32/lua-bit32.mk
+++ b/package/lua-bit32/lua-bit32.mk
@@ -11,10 +11,4 @@ LUA_BIT32_SOURCE = bit32-$(LUA_BIT32_VERSION).src.rock
 LUA_BIT32_LICENSE = MIT
 LUA_BIT32_LICENSE_FILES = $(LUA_BIT32_SUBDIR)/LICENSE
 
-define LUA_BIT32_EXTRACT_CMDS
-        cd $(LUA_BIT32_DIR) && \
-                $(LUAROCKS_RUN_ENV) $(LUAROCKS_RUN_CMD) unpack --force $(DL_DIR)/$(LUA_BIT32_SOURCE) && \
-		mv bit32-$(LUA_BIT32_VERSION)/* .
-endef
-
 $(eval $(luarocks-package))
-- 
2.11.0
