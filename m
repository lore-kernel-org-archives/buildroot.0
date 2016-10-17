From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:18 -0300
Subject: [Buildroot] [PATCH 31/93] lua: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-32-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
