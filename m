From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Jan 2014 09:42:50 +0100
Subject: [Buildroot] [PATCH] luarocks: fix compilation on 64bits
Message-ID: <1389775370-29415-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 85b6866..6cfd92e 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -31,7 +31,7 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	echo "   LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]],"      >> $(LUAROCKS_CONFIG_FILE)
 	echo "   CC = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LD = [[$(TARGET_CC)]],"                        >> $(LUAROCKS_CONFIG_FILE)
-	echo "   CFLAGS = [[$(TARGET_CFLAGS)]],"                >> $(LUAROCKS_CONFIG_FILE)
+	echo "   CFLAGS = [[$(TARGET_CFLAGS) -fPIC]],"          >> $(LUAROCKS_CONFIG_FILE)
 	echo "   LIBFLAG = [[-shared $(TARGET_LDFLAGS)]],"      >> $(LUAROCKS_CONFIG_FILE)
 	echo "}"                                                >> $(LUAROCKS_CONFIG_FILE)
 	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
-- 
1.7.9.5
