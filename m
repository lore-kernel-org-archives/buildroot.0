From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  8 Feb 2015 17:55:32 +0100
Subject: [Buildroot] [PATCH] lmbench: use pkg-config to find libtirpc
Message-ID: <1423414532-31769-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/lmbench/lmbench.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 63a83fd..59e750c 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -14,9 +14,9 @@ LMBENCH_CFLAGS = $(TARGET_CFLAGS)
 LMBENCH_LDLIBS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-LMBENCH_DEPENDENCIES += libtirpc
-LMBENCH_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
-LMBENCH_LDFLAGS += -ltirpc
+LMBENCH_DEPENDENCIES += host-pkgconf libtirpc
+LMBENCH_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags libtirpc)
+LMBENCH_LDFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --libs libtirpc)
 endif
 
 define LMBENCH_CONFIGURE_CMDS
-- 
2.1.0
