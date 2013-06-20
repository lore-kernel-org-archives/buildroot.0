From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jun 2013 12:02:42 +0200
Subject: [Buildroot] [git commit] lua: Added missing HOST_LDFLAGS
Message-ID: <20130620125535.6D1EA9AF97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a869bf8c84cda6d7b21950a6653ad9a80b90be4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/lua.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 2098de2..ac75fe6 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -44,6 +44,7 @@ endef
 define HOST_LUA_BUILD_CMDS
 	$(MAKE) \
 	CFLAGS="$(HOST_LUA_CFLAGS)" \
+	MYLDFLAGS="$(HOST_LDFLAGS)" \
 	MYLIBS="$(HOST_LUA_MYLIBS)" \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
 endef
