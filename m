From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Oct 2012 09:33:19 -0300
Subject: [Buildroot] [PATCH] gpsd: fix nmea2000 build failure
Message-ID: <1350390799-9171-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NMEA2000 seems to require NAVCOM for some odd reason.
Fixes
http://autobuild.buildroot.net/results/91ddc286f6a92498f96aba7d312f82d5c77a689a/build-end.log
Also do a correct sort of protocol config options.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gpsd/Config.in |   31 ++++++++++++++++---------------
 1 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index a11c553..69f63f9 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -91,16 +91,16 @@ endmenu
 menu "Protocols"
 	depends on BR2_PACKAGE_GPSD
 
-config BR2_PACKAGE_GPSD_ASHTECH
-	bool "Ashtech"
-	help
-	  Ashtech support
-
 config BR2_PACKAGE_GPSD_AIVDM
 	bool "Aivdm"
 	help
 	  Aivdm support
 
+config BR2_PACKAGE_GPSD_ASHTECH
+	bool "Ashtech"
+	help
+	  Ashtech support
+
 config BR2_PACKAGE_GPSD_EARTHMATE
 	bool "Earthmate"
 	help
@@ -151,27 +151,28 @@ config BR2_PACKAGE_GPSD_MTK3301
 	help
 	  Mediatek MTK-3301 support
 
+config BR2_PACKAGE_GPSD_NAVCOM
+	bool "Navcom"
+	help
+	  Navcom binary support
+
 config BR2_PACKAGE_GPSD_NMEA
 	bool "NMEA"
 	default y
 	help
 	  Generic NMEA support
 
+config BR2_PACKAGE_GPSD_NMEA2000
+	bool "NMEA2000"
+	select BR2_PACKAGE_GPSD_NAVCOM
+	help
+	  NMEA2000/CAN support
+
 config BR2_PACKAGE_GPSD_NTRIP
 	bool "NTRIP"
 	help
 	  NTRIP support
 
-config BR2_PACKAGE_GPSD_NAVCOM
-	bool "Navcom"
-	help
-	  Navcom binary support
-
-config BR2_PACKAGE_GPSD_NMEA2000
-	bool "nmea2000"
-	help
-	  NMEA2000/CAN support
-
 config BR2_PACKAGE_GPSD_OCEANSERVER
 	bool "OceanServer"
 	help
-- 
1.7.8.6
