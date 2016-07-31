From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Sun, 31 Jul 2016 15:56:09 +0200
Subject: [Buildroot] [PATCH] i2c-tools: depend on BUSYBOX_SHOW_OTHERS
Message-ID: <1469973369-5445-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of version 1.25.0 busybox by default includes a nearly complete
implementation of i2c-tools. Hide the upstream version unless the
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS option is selected.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/i2c-tools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index e83dbd6..b82c7dc 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_I2C_TOOLS
 	bool "i2c-tools"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Heterogeneous set of I2C tools for Linux
 
-- 
2.7.4
