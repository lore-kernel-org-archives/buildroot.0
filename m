From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:46 +0200
Subject: [Buildroot] [PATCH 10/15] package/libuci: cleanup configure options
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-11-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove unneeded type in configure option's definition.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libuci/libuci.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 9d5c172..12e07fc 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -15,7 +15,7 @@ LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
-LIBUCI_CONF_OPTS += -DBUILD_LUA:BOOL=OFF
+LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.1.2
