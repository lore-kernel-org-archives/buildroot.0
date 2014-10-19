From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:45 +0200
Subject: [Buildroot] [PATCH 09/15] package/libubox: cleanup configure options
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make BUILD_LUA assignation symetrical.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libubox/libubox.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 572cfe9..5d9c01d 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -12,7 +12,8 @@ LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
 
 ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
 LIBUBOX_DEPENDENCIES += lua
-LIBUBOX_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+LIBUBOX_CONF_OPTS += -DBUILD_LUA=ON \
+	-DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 LIBUBOX_CONF_OPTS += -DBUILD_LUA=OFF
-- 
2.1.2
