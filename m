From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:19:10 +0100
Subject: [Buildroot] [git commit] luasocket: bump to version 3.0-rc1
Message-ID: <20140113222142.26E0B9C4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91d8aa63060a3769a1f31e0b7fadfd5439ff5dff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

and refactor with luarocks infra

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luasocket/luasocket.mk |   21 ++++-----------------
 1 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index a55fe17..ca72277 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -4,22 +4,9 @@
 #
 ################################################################################
 
-LUASOCKET_VERSION = 2.0.2
-LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
-LUASOCKET_DEPENDENCIES = luainterpreter
+LUASOCKET_VERSION = 3.0rc1-1
+LUASOCKET_SUBDIR  = luasocket-3.0-rc1
 LUASOCKET_LICENSE = MIT
-LUASOCKET_LICENSE_FILES = LICENSE
+LUASOCKET_LICENSE_FILES = $(LUASOCKET_SUBDIR)/LICENSE
 
-define LUASOCKET_BUILD_CMDS
-	$(MAKE) -C $(@D) -f makefile \
-		CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS) -fPIC"
-endef
-
-define LUASOCKET_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) -f makefile \
-		INSTALL_TOP_SHARE="$(TARGET_DIR)/usr/share/lua/5.1" \
-		INSTALL_TOP_LIB="$(TARGET_DIR)/usr/lib/lua/5.1" install
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
