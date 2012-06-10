From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 10 Jun 2012 13:46:45 +0200
Subject: [Buildroot] [PATCH 1/1] omap-u-boot-utils: fix visibility in
	menuconfig
Message-ID: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These tools only are useful for ARM (OMAP) targets.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/omap-u-boot-utils/Config.in.host b/package/omap-u-boot-utils/Config.in.host
index 63fbdf5..87dcc06 100644
--- a/package/omap-u-boot-utils/Config.in.host
+++ b/package/omap-u-boot-utils/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
 	bool "host omap-u-boot-utils"
+	depends on BR2_arm || BR2_armeb
 	help
 	  U-Boot Utilities for Texas Instrument's OMAP platforms.
 	  This is a set of tools to control U-Boot from scripts, generate
-- 
1.7.10.4
