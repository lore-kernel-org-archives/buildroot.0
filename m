From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 22 Jul 2011 16:49:31 +0100
Subject: [Buildroot] [PATCH v2] dropbear: Create destination directories
	before use in install stage.
In-Reply-To: <1311332746-8143-1-git-send-email-quotientvremainder@gmail.com>
References: <1311332746-8143-1-git-send-email-quotientvremainder@gmail.com>
Message-ID: <1311349771-13158-1-git-send-email-quotientvremainder@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>
---
 package/dropbear/dropbear.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 6ef5dec..ba148b6 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -47,7 +47,8 @@ DROPBEAR_DEPENDENCIES += zlib
 endif
 
 define DROPBEAR_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
+	$(INSTALL) -D -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear
+	mkdir -p $(TARGET_DIR)/usr/bin
 	for f in $(DROPBEAR_TARGET_BINS); do \
 		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
 	done
-- 
1.7.6
