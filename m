From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  4 May 2017 22:29:00 +0200
Subject: [Buildroot] [PATCH] luvi: fix build
Message-ID: <20170504202900.15617-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

broken by LuaJIT 2.0.4 --> 2.0.5
see http://autobuild.buildroot.net/results/3ee/3eef12dbe07fb375e87b2b2898dcc5ef0c11e7a5/build-end.log

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luvi/luvi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index ade63f5f..3b2094c4 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -33,7 +33,7 @@ LUVI_CONF_OPTS = \
 	-DBUILD_SHARED_LIBS=OFF \
 	-DWithSharedLibluv=ON \
 	-DTARGET_ARCH=$(LUVI_TARGET_ARCH) \
-	-DLUA_PATH=$(HOST_DIR)/usr/share/luajit-2.0.4/?.lua
+	-DLUA_PATH=$(HOST_DIR)/usr/share/luajit-$(LUAJIT_VERSION)/?.lua
 
 # Add "rex" module (PCRE via bundled lrexlib)
 ifeq ($(BR2_PACKAGE_PCRE),y)
-- 
2.11.0
