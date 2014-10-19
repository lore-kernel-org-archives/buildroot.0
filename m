From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:47 +0200
Subject: [Buildroot] [PATCH 11/15] package/libuci: cleanup configure options
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-12-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make BUILD_LUA assignation symetrical.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libuci/libuci.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 12e07fc..a78048d 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -12,7 +12,8 @@ LIBUCI_DEPENDENCIES = libubox
 
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
-LIBUCI_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
+	-DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
-- 
2.1.2
