From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Jan 2010 08:36:28 +0100
Subject: [Buildroot] [git commit master] busybox: bump version
Message-ID: <20100126085441.BF5487772D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=99f74cbec5d5485776e36fc503faec17b737e4a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index df9cb2e..9428607 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_BUSYBOX
 choice
 	prompt "BusyBox Version"
 	depends on BR2_PACKAGE_BUSYBOX
-	default BR2_BUSYBOX_VERSION_1_15_X
+	default BR2_BUSYBOX_VERSION_1_16_X
 	help
 	  Select the version of BusyBox you wish to use.
 
@@ -26,10 +26,14 @@ choice
 
 	config BR2_BUSYBOX_VERSION_1_14_X
 		bool "BusyBox 1.14.x"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_15_X
 		bool "BusyBox 1.15.x"
+		depends on BR2_DEPRECATED || BR2_RECENT
+
+	config BR2_BUSYBOX_VERSION_1_16_X
+		bool "BusyBox 1.16.x"
 
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
@@ -42,6 +46,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.13.4"	if BR2_BUSYBOX_VERSION_1_13_X
 	default "1.14.4"	if BR2_BUSYBOX_VERSION_1_14_X
 	default "1.15.3"	if BR2_BUSYBOX_VERSION_1_15_X
+	default "1.16.0"	if BR2_BUSYBOX_VERSION_1_16_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"
@@ -64,6 +69,7 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
 	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_13_X
 	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_14_X
 	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_15_X
+	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_16_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
-- 
1.6.3.3
