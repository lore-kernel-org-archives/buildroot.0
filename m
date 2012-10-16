From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Oct 2012 23:17:41 +0200
Subject: [Buildroot] [git commit] gpsd: fix nmea2000 build failure
Message-ID: <20121016212109.C746899884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=acec9cda475c2901c20bc6616d3b5048608ff9f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NMEA2000 seems to require NAVCOM for some odd reason.
Fixes
http://autobuild.buildroot.net/results/91ddc286f6a92498f96aba7d312f82d5c77a689a/build-end.log
Also do a correct sort of protocol config options.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
