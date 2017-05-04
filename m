From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:39:18 +0200
Subject: [Buildroot] [git commit] luvi: fix build with LuaJIT 2.0.5
Message-ID: <20170504204138.089A8821E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63e1e113f27f54d417aca037fd0c7737288ccf83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Luvi got broken by the bump of LuaJIT from 2.0.4 to 2.0.5 due to a
hardcoded path.

Fixes:

 http://autobuild.buildroot.net/results/3eef12dbe07fb375e87b2b2898dcc5ef0c11e7a5/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luvi/luvi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index ade63f5..3b2094c 100644
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
