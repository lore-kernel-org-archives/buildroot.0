From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 22 Sep 2015 00:59:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/lua: do not install man files
Message-ID: <1442876342-10841-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As written in the holy manual:
http://buildroot.org/downloads/manual/manual.html#faq-no-doc-on-target

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/lua/lua.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 1279b76..af5cef3 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -87,7 +87,7 @@ define HOST_LUA_BUILD_CMDS
 endef
 
 define LUA_INSTALL_STAGING_CMDS
-	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
+	$(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" INSTALL_MAN= -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
 endef
@@ -97,7 +97,7 @@ define LUA_INSTALL_TARGET_CMDS
 endef
 
 define HOST_LUA_INSTALL_CMDS
-	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
+	$(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" INSTALL_MAN= -C $(@D) install
 	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
 		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
 endef
-- 
2.5.3
