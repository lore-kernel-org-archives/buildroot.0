From: Jouko Nikula <jouko.nikula@espotel.com>
Date: Tue, 24 Sep 2013 13:18:43 +0300
Subject: [Buildroot] [PATCH] i2c-tools: Add i2c-dev.h to staging directory
	for userspace i2c drivers.
Message-ID: <1380017924-20072-1-git-send-email-jouko.nikula@espotel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jouko Nikula <jouko.nikula@espotel.com>
---
 package/i2c-tools/i2c-tools.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 1589d04..3281dbe 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -7,6 +7,7 @@
 I2C_TOOLS_VERSION = 3.1.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
+I2C_TOOLS_INSTALL_STAGING = YES
 
 define I2C_TOOLS_BUILD_CMDS
  $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
@@ -19,4 +20,8 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
+define I2C_TOOLS_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m644 $(@D)/include/linux/i2c-dev.h $(STAGING_DIR)/usr/include/linux/
+endef
+
 $(eval $(generic-package))
-- 
1.7.9.5
