From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:01:56 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] lua: use target LDFLAGS
Message-ID: <20170515125327.96AF980649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=893da5eb467192f1d95141461be1bf9fc6404f1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This adds '-static' to the link command when BR2_STATIC_LIBS=y, making the lua
binary really static.

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 7e48c824309641c9eec41ee3dd7292a579888965)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
