From: Neha Bairathi <Neha.Bairathi@imgtec.com>
Date: Tue, 9 Feb 2016 18:47:37 +0530
Subject: [Buildroot] [PATCH 1/1] libuci: correct lua path
Message-ID: <1455023857-27794-1-git-send-email-Neha.Bairathi@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LUAPATH is used as the path for installing lua binding.
As buildroot specifies the install prefix, STAGING_DIR gets
appended to TARGET_DIR which is incorrect path for installation,
so use relative path.

Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Neha Bairathi <Neha.Bairathi@imgtec.com>
---
 package/libuci/libuci.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index a78048d..8c060d5 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -13,7 +13,7 @@ LIBUCI_DEPENDENCIES = libubox
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
-	-DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+	-DLUAPATH=/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
-- 
2.6.2
