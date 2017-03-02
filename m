From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 23:24:17 +0100
Subject: [Buildroot] [git commit] lua-bit32: remove custom extract commands
Message-ID: <20170302222420.D8B3782284@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d4f519246505520d77fc1ddb827df2fe10c790c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the reworked luarocks extraction, they are no longer needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua-bit32/lua-bit32.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/lua-bit32/lua-bit32.mk b/package/lua-bit32/lua-bit32.mk
index 8304d6e..f4090c7 100644
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
