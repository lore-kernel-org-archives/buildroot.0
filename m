From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] lua: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132037.83B70819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fccd0599cd8c3daf7958f918b8ee721362a659a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index be33284..a7c2ef7 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -66,7 +66,7 @@ HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
 define LUA_BUILD_CMDS
-	$(MAKE) \
+	$(TARGET_MAKE_ENV) $(MAKE) \
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
 	CFLAGS="$(TARGET_CFLAGS) $(LUA_CFLAGS)" \
 	MYLIBS="$(LUA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" \
@@ -84,13 +84,13 @@ define HOST_LUA_BUILD_CMDS
 endef
 
 define LUA_INSTALL_STAGING_CMDS
-	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
 endef
 
 define LUA_INSTALL_TARGET_CMDS
-	$(MAKE) INSTALL_TOP="$(TARGET_DIR)/usr" -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) INSTALL_TOP="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
 define HOST_LUA_INSTALL_CMDS
