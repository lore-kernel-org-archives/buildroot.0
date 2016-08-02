From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue,  2 Aug 2016 12:27:35 +0200
Subject: [Buildroot] [PATCH 1/2] i2c-tools: add busybox to dependencies
Message-ID: <1470133656-13954-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before changing the install directory of i2c-tools to /usr/sbin/ make
sure busybox is built first (if selected) in order to ensure that the
symlinks to the busybox-provided versions are overwritten by the
i2c-tools' install commands.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/i2c-tools/i2c-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 9625acf..38f84a3 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -17,6 +17,10 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 I2C_TOOLS_DEPENDENCIES += python3
 endif
 
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+I2C_TOOLS_DEPENDENCIES += busybox
+endif
+
 # Build/install steps mirror the distutil python package type in the python package
 # infrastructure
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
-- 
2.7.4
