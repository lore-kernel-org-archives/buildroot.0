From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:23:22 +0200
Subject: [Buildroot] [git commit] package/luarocks: fix typo
Message-ID: <20200419080901.164778F14C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de29a00a631eca901202fe8d1cb29e89ae16184d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

many build are broken, that starts by this kind of message:
 Warning: could not load configuration file `.../host/etc/luarocks/config.lua` given in environment variable LUAROCKS_CONFIG

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/luarocks.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 2ea3c8d8d6..14f05b3498 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -35,7 +35,7 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
 	$(MAKE1) -C $(@D) install
 	cat $(LUAROCKS_CONFIG_FILE_DEFAULT) $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua \
-		> $(LUAROCKS_CONFIG_FILE)a
+		> $(LUAROCKS_CONFIG_FILE)
 	cat $(LUAROCKS_CONFIG_FILE_DEFAULT) $(HOST_LUAROCKS_PKGDIR)/luarocks-br-host-config.lua \
 		> $(HOST_LUAROCKS_CONFIG_FILE)
 	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
