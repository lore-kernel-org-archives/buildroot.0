From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:53:58 +0100
Subject: [Buildroot] [PATCH 06/17] i2c-tools: ensure binaries are installed
	in the right place
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-7-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/i2c-tools/i2c-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index d419524..2e60407 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -12,10 +12,10 @@ define I2C_TOOLS_BUILD_CMDS
 endef
 
 define I2C_TOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin
 	for i in i2cdump i2cget i2cset i2cdetect; \
 	do \
 		$(INSTALL) -m 755 $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$$i; \
 	done
 endef
 
-- 
1.7.2.3
