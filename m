From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:51:24 +0200
Subject: [Buildroot] [git commit] lua: use target LDFLAGS
Message-ID: <20170511195349.4F56B8212D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e48c824309641c9eec41ee3dd7292a579888965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds '-static' to the link command when BR2_STATIC_LIBS=y, making the lua
binary really static.

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 5ef61e0..bc0a9d4 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -70,6 +70,7 @@ define LUA_BUILD_CMDS
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
 	CFLAGS="$(TARGET_CFLAGS) $(LUA_CFLAGS)" \
 	MYLIBS="$(LUA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" \
+	MYLDFLAGS="$(TARGET_LDFLAGS)" \
 	BUILDMODE=$(LUA_BUILDMODE) \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
