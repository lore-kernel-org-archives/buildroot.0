From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] lua: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161022132037.8C58B819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7089eba70a47f602c9ec70ad68447367c05180d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index a7c2ef7..131b88d 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -75,7 +75,7 @@ define LUA_BUILD_CMDS
 endef
 
 define HOST_LUA_BUILD_CMDS
-	$(MAKE) \
+	$(HOST_MAKE_ENV) $(MAKE) \
 	CFLAGS="$(HOST_LUA_CFLAGS)" \
 	MYLDFLAGS="$(HOST_LDFLAGS)" \
 	MYLIBS="$(HOST_LUA_MYLIBS)" \
@@ -94,7 +94,7 @@ define LUA_INSTALL_TARGET_CMDS
 endef
 
 define HOST_LUA_INSTALL_CMDS
-	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
 endef
