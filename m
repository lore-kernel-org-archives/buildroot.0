From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Apr 2010 12:40:32 +0200
Subject: [Buildroot] [git commit master] busybox: indent sub options
Message-ID: <20100402104211.1F47F8A500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b5e844815ffcaa3a89cf295c55969b016f9cbd48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in |   21 +++++++++++----------
 1 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 514e022..7110f0f 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -9,9 +9,10 @@ config BR2_PACKAGE_BUSYBOX
 
 	  Most people will answer Y.
 
+if BR2_PACKAGE_BUSYBOX
+
 choice
 	prompt "BusyBox Version"
-	depends on BR2_PACKAGE_BUSYBOX
 	default BR2_BUSYBOX_VERSION_1_16_X
 	help
 	  Select the version of BusyBox you wish to use.
@@ -50,7 +51,6 @@ config BR2_BUSYBOX_VERSION
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
-	depends on BR2_PACKAGE_BUSYBOX
 	default y
 	help
 	  If you want to run BusyBox's own full install for the
@@ -63,7 +63,6 @@ config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
-	depends on BR2_PACKAGE_BUSYBOX
 	default "package/busybox/busybox-1.16.x.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
 	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_12_X
 	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_13_X
@@ -78,20 +77,22 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
 
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	bool "Show packages that are also provided by busybox" if BR2_PACKAGE_BUSYBOX
-	default y if !BR2_PACKAGE_BUSYBOX
 	help
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
 
 config BR2_PACKAGE_BUSYBOX_SKELETON
 	bool "use minimal target skeleton"
-	depends on BR2_PACKAGE_BUSYBOX
 	help
 	  Use a minimal target skeleton. Make sure to select mdev
 	  which is used to populate /dev/.
 
-#config BR2_PACKAGE_BUSYBOX_INITRAMFS
-#	bool "initramfs perusing busybox"
-#	depends on BR2_PACKAGE_BUSYBOX
-#	help
-#	  Build small initramfs perusing busybox.
+endif
+
+if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
+
+# add dummy config so the stuff with busybox alternatives are shown
+# when busybox is disabled
+config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+       default y
+endif
-- 
1.6.3.3
