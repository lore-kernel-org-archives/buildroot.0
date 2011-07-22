From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 22 Jul 2011 12:05:46 +0100
Subject: [Buildroot] [PATCH] dropbear: Create destination directories before
	use in install stage.
Message-ID: <1311332746-8143-1-git-send-email-quotientvremainder@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>
---
 package/dropbear/dropbear.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 6ef5dec..2127096 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -47,6 +47,7 @@ DROPBEAR_DEPENDENCIES += zlib
 endif
 
 define DROPBEAR_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/bin $(TARGET_DIR)/usr/sbin
 	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
 	for f in $(DROPBEAR_TARGET_BINS); do \
 		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
-- 
1.7.6
