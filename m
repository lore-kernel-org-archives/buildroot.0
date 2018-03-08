From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu,  8 Mar 2018 06:15:36 -0800
Subject: [Buildroot] [PATCH 1/1] motion: config file location
Message-ID: <20180308141536.7030-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install the motion.config file were the program expects it to be.

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/motion/motion.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 2ba16fc837..0f4898674b 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -59,7 +59,7 @@ endif
 # directories: docs, examples and init scripts
 define MOTION_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/motion-dist.conf \
-		$(TARGET_DIR)/etc/motion.conf
+		$(TARGET_DIR)/etc/motion/motion.conf
 	$(INSTALL) -D -m 0755 $(@D)/motion $(TARGET_DIR)/usr/bin/motion
 endef
 
-- 
2.14.3
