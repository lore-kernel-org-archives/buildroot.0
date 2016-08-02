From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue,  2 Aug 2016 12:27:36 +0200
Subject: [Buildroot] [PATCH 2/2] i2c-tools: install binaries to /usr/sbin
In-Reply-To: <1470133656-13954-1-git-send-email-bgolaszewski@baylibre.com>
References: <1470133656-13954-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1470133656-13954-2-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream i2c-tools executables are installed to /usr/sbin by default.
Make buildroot match this behavior.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/i2c-tools/i2c-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 38f84a3..e16b940 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -53,7 +53,7 @@ endef
 define I2C_TOOLS_INSTALL_TARGET_CMDS
 	for i in i2cdump i2cget i2cset i2cdetect; \
 	do \
-		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
+		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/sbin/$$i; \
 	done
 	$(I2C_TOOLS_INSTALL_PYSMBUS)
 endef
-- 
2.7.4
