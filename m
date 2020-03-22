From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 22 Mar 2020 09:07:02 +0100
Subject: [Buildroot] [pkg-luarocks v2 1/5] package/luarocks: now luajit is
 dynamically detected by luarocks
Message-ID: <20200322080706.19806-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 123f8c073..d48c95ced 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -33,17 +33,10 @@ define HOST_LUAROCKS_CONFIGURE_CMDS
 	cd $(@D) && ./configure $(HOST_LUAROCKS_CONF_OPTS)
 endef
 
-ifeq ($(BR2_PACKAGE_LUAJIT),y)
-define LUAROCKS_CONFIGURE_INTERPRETER_LUAJIT
-	echo "lua_interpreter = [[luajit]]" >> $(LUAROCKS_CONFIG_FILE)
-endef
-endif
-
 define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE)
 	$(MAKE1) -C $(@D) install
 	cat $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua >> $(LUAROCKS_CONFIG_FILE)
-	$(LUAROCKS_CONFIGURE_INTERPRETER_LUAJIT)
 endef
 
 $(eval $(host-generic-package))
-- 
2.20.1
