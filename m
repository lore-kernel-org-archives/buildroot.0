From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 22:08:14 +0200
Subject: [Buildroot] [git commit] motion: fix config file location
Message-ID: <20180401200823.BABA783665@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b773c33bf18d82e4cf7d0712dfe88a0bae61c865
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install the motion.config file were the program expects it to be. From
the motion source code:

snprintf(filename, PATH_MAX, "%s/motion/motion.conf", sysconfdir);

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
