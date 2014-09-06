From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Sep 2014 22:40:36 +0200
Subject: [Buildroot] [git commit] host-lua: compat mode not longer needed by
	the newest luarocks
Message-ID: <20140906204324.7FD1F9D3C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4dc5af41b169ec2c897f7480c4f24766bf88c5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/lua.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 524f6a2..9afec6c 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -51,10 +51,6 @@ HOST_LUA_DEPENDENCIES =
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
-ifeq ($(BR2_PACKAGE_LUA_5_2),y)
-HOST_LUA_CFLAGS += -DLUA_COMPAT_ALL
-endif
-
 define LUA_BUILD_CMDS
 	$(MAKE) \
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
