From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] lua: fix pkgconfig installation
Message-ID: <20100502220948.A74B38A6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8471827f32e92c12e90ba2a534d00873845617c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

install -D needs the destination filename, not just it's directory,
otherwise we end up with a pkgconfig file instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/lua.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 9b23021..d66be9f 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -39,7 +39,7 @@ endif
 
 define LUA_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig
+		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
 	$(INSTALL) $(@D)/src/liblua.a $(STAGING_DIR)/usr/lib
 	$(INSTALL) $(@D)/src/lua $(STAGING_DIR)/usr/bin
 	$(INSTALL) $(@D)/src/luac $(STAGING_DIR)/usr/bin
-- 
1.6.3.3
