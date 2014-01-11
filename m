From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Jan 2014 16:42:12 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 10/15] luasocket: bump to
	version 3.0-rc1
In-Reply-To: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389454937-13494-11-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

and refactor with luarocks infra

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luasocket/luasocket.mk |   21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

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
-- 
1.7.9.5
