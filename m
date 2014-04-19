From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Sat, 19 Apr 2014 02:47:01 +0200
Subject: [Buildroot] [PATCH 1/1] libuci: remove MMU dependency with Lua
	binding
Message-ID: <1397868421-8899-1-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Lua binding option of libuci doesn't need the MMU.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
---
 package/libuci/libuci.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index ff50874..31623a2 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -10,7 +10,7 @@ LIBUCI_LICENSE = LGPLv2.1
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
-ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
