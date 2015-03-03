From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:29 +0100
Subject: [Buildroot] [RFC v3 24/30] triggerhappy: add support for
	per-package staging directory
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-25-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use $(STAGINGNOPKG_DIR) instead of $(STAGING_DIR) because now the
STAGING_DIR point to the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/triggerhappy/triggerhappy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index d3dfc6a..ff1b379 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -11,7 +11,7 @@ TRIGGERHAPPY_LICENSE_FILES = COPYING
 
 define TRIGGERHAPPY_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		LINUX_INPUT_H=$(STAGING_DIR)/usr/include/linux/input.h \
+		LINUX_INPUT_H=$(STAGINGNOPKG_DIR)/usr/include/linux/input.h \
 		-C $(@D) thd th-cmd
 endef
 
-- 
2.3.1
