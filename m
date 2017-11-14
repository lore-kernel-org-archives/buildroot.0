From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 14 Nov 2017 11:51:43 +0100
Subject: [Buildroot] [PATCH 1/2] package/i2c-tools: bump to version 4.0
Message-ID: <1510656704-11153-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps i2c-tools to version 4.0 and adds a new command
named i2ctransfer.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/i2c-tools/i2c-tools.hash | 2 +-
 package/i2c-tools/i2c-tools.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index 464219d..3475d20 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 6d6079153cd49a62d4addacef4c092db1a46ba60b2807070a3fbe050262aef87  i2c-tools-3.1.2.tar.xz
+sha256 d900ca1c11c51ea20caa50b096f948008b8a7ad832311b23353e21baa7af28d6  i2c-tools-4.0.tar.xz
 
 # License file
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 3bbaf38..2bbb12f 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 3.1.2
+I2C_TOOLS_VERSION = 4.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus)
@@ -52,7 +52,7 @@ define I2C_TOOLS_BUILD_CMDS
 endef
 
 define I2C_TOOLS_INSTALL_TARGET_CMDS
-	for i in i2cdump i2cget i2cset i2cdetect; \
+	for i in i2cdump i2cget i2cset i2cdetect i2ctransfer; \
 	do \
 		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/sbin/$$i; \
 	done
-- 
2.7.4
