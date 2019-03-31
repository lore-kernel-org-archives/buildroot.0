From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 18:01:37 +0200
Subject: [Buildroot] [PATCH] package/lua-gd: compile with -fPIC
Message-ID: <20190331160137.29326-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/756c20a09e3c1bd5295416894e4fbe0ca0db5328
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-gd/lua-gd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua-gd/lua-gd.mk b/package/lua-gd/lua-gd.mk
index 464f6e1e6..b32e0c9fe 100644
--- a/package/lua-gd/lua-gd.mk
+++ b/package/lua-gd/lua-gd.mk
@@ -36,7 +36,7 @@ define LUA_GD_BUILD_CMDS
 	$(MAKE) -C $(@D) gd.so \
 		GDFEATURES="$(LUA_GD_FEATURES)" \
 		CC=$(TARGET_CC) \
-		CFLAGS="$(TARGET_CFLAGS) -DVERSION=\\\"$(GD_VERSION)r3\\\"" \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC -DVERSION=\\\"$(GD_VERSION)r3\\\"" \
 		LFLAGS="-shared -lgd"
 endef
 
-- 
2.17.1
