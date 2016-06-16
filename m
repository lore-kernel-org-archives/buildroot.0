From: Julien Floret <julien.floret@6wind.com>
Date: Thu, 16 Jun 2016 16:41:13 +0200
Subject: [Buildroot] [PATCH 1/3] sstrip: get rid of host variant
In-Reply-To: <1466088075-7635-1-git-send-email-julien.floret@6wind.com>
References: <1466088075-7635-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1466088075-7635-2-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host sstrip is not used anymore.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/sstrip/sstrip.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index fe57b3c19b21..685ea09fbd77 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -6,7 +6,6 @@
 
 SSTRIP_SITE = svn://svn.openwrt.org/openwrt/trunk/tools/sstrip
 SSTRIP_VERSION = 20154
-HOST_SSTRIP_BINARY = $(GNU_TARGET_NAME)-sstrip
 
 define SSTRIP_BUILD_CMDS
 	cd $(@D) ; \
@@ -18,15 +17,4 @@ define SSTRIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/sstrip $(TARGET_DIR)/usr/bin/sstrip
 endef
 
-define HOST_SSTRIP_BUILD_CMDS
-	cd $(@D) ; \
-	$(HOSTCC) $(HOST_CFLAGS) -include endian.h -include byteswap.h \
-		-o sstrip src/sstrip.c
-endef
-
-define HOST_SSTRIP_INSTALL_CMDS
-	$(INSTALL) -D $(@D)/sstrip $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
-endef
-
 $(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.1.0
