From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Dec 2012 07:25:11 -0300
Subject: [Buildroot] [PATCH] gpsd: needs threads
Message-ID: <1355480711-12089-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/05925389ac2531307f23bf5f5f3a83a5a97301bf/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gpsd/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 69f63f9..35e535b 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GPSD
 	bool "gpsd"
 	# Uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  gpsd is a service daemon that monitors one or more GPSes or AIS
 	  receivers attached to a host computer through serial or USB ports,
@@ -12,6 +13,10 @@ config BR2_PACKAGE_GPSD
 
 	  http://gpsd.berlios.de/
 
+
+comment "gpsd needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_GPSD_DEVICES
 	string "Where to look for GPSes"
 	default "/dev/ttyS1"
-- 
1.7.8.6
