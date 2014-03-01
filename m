From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Mar 2014 23:30:55 +0100
Subject: [Buildroot] [PATCH] luarocks: remove luainterpreter dependency
Message-ID: <1393713055-15107-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

a package using luarocks infrastructure needs a dependency with luainterpreter.
this is already done in pkg-luarocks.mk.

here, in luarocks.mk, this dependency causes an issue with 'make legal-info' :
luainterpreter and an toolchain are built.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 86e57d2..926fd04 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -9,7 +9,7 @@ LUAROCKS_SITE = http://luarocks.org/releases/
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
-HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
+HOST_LUAROCKS_DEPENDENCIES = host-lua
 
 LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
-- 
1.7.9.5
