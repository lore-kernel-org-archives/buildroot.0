From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 22:43:24 +0100
Subject: [Buildroot] [git commit master 1/1] gpsd: fixup various problems
	with Config.in
Message-ID: <20101124214437.D33068E147@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7537caaac3354272bd4c83ee97cc3ec55ce7d60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix wrong configure symbol name for MTK.
remove default values from most of options and leave only
default y for NMEA protocol (90% of users will need this one)
and features for gpsd to reconfigure device.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/Config.in |   31 ++-----------------------------
 1 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 543f205..5e60bb0 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GPSD
 	bool "gpsd"
 	help
-	 gpsd is a service daemon that monitors one or more GPSes or AIS
+	  gpsd is a service daemon that monitors one or more GPSes or AIS
 	  receivers attached to a host computer through serial or USB ports,
 	  making all data on the location/course/velocity of the sensors
 	  available to be queried on TCP port 2947 of the host computer.
@@ -18,26 +18,21 @@ menu "Features"
 
 config BR2_PACKAGE_GPSD_TIMING
 	bool "latency timing support"
-	default y
 
 config BR2_PACKAGE_GPSD_CLIENT_DEBUG
 	bool "client debugging support"
-	default y
 
 config BR2_PACKAGE_GPSD_OLDSTYLE
 	bool "oldstyle (pre-JSON) protocol support"
-	default y
 
 config BR2_PACKAGE_GPSD_PROFILING
 	bool "profiling support"
 
 config BR2_PACKAGE_GPSD_NTP_SHM
 	bool "NTP time hinting support"
-	default y
 
 config BR2_PACKAGE_GPSD_PPS
 	bool "PPS time syncing support"
-	default y
 
 config BR2_PACKAGE_GPSD_PPS_ON_CTS
 	bool "PPS pulse on CTS rather than DCD"
@@ -99,61 +94,51 @@ menu "Protocols"
 
 config BR2_PACKAGE_GPSD_ASHTECH
 	bool "Ashtech"
-	default y
 	help
 	  Ashtech support
 
 config BR2_PACKAGE_GPSD_AIVDM
 	bool "Aivdm"
-	default y
 	help
 	  Aivdm support
 
 config BR2_PACKAGE_GPSD_EARTHMATE
 	bool "Earthmate"
-	default y
 	help
 	  DeLorme EarthMate Zodiac support
 
 config BR2_PACKAGE_GPSD_EVERMORE
 	bool "EverMore"
-	default y
 	help
 	  EverMore binary support
 
 config BR2_PACKAGE_GPSD_FV18
 	bool "FV-18"
-	default y
 	help
 	  San Jose Navigation FV-18 support
 
 config BR2_PACKAGE_GPSD_GARMIN
 	bool "Garmin (kernel)"
-	default y
 	help
 	  Garmin kernel driver support
 
 config BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT
 	bool "Garmin (simple text)"
-	default n
 	help
 	  Garmin Simple Text support
 
 config BR2_PACKAGE_GPSD_GPSCLOCK
 	bool "GPSClock"
-	default y
 	help
 	  GPSClock support
 
 config BR2_PACKAGE_GPSD_ITRAX
 	bool "iTrax"
-	default y
 	help
 	  iTrax support
 
-config BR2_PACKAGE_MTK3301
+config BR2_PACKAGE_GPSD_MTK3301
 	bool "MTK-3301"
-	default y
 	help
 	  Mediatek MTK-3301 support
 
@@ -165,73 +150,61 @@ config BR2_PACKAGE_GPSD_NMEA
 
 config BR2_PACKAGE_GPSD_NTRIP
 	bool "NTRIP"
-	default y
 	help
 	  NTRIP support
 
 config BR2_PACKAGE_GPSD_NAVCOM
 	bool "Navcom"
-	default y
 	help
 	  Navcom binary support
 
 config BR2_PACKAGE_GPSD_OCEANSERVER
 	bool "OceanServer"
-	default y
 	help
 	  OceanServer Digital Compass support
 
 config BR2_PACKAGE_GPSD_ONCORE
 	bool "OnCore"
-	default y
 	help
 	  OnCore support
 
 config BR2_PACKAGE_GPSD_RTCM104V2
 	bool "RTCM104 v2"
-	default y
 	help
 	  RTCM104 v2 support
 
 config BR2_PACKAGE_GPSD_RTCM104V3
 	bool "RTCM104 v3"
-	default y
 	help
 	  RTCM104 v3 support
 
 config BR2_PACKAGE_GPSD_SIRF
 	bool "SiRF"
-	default y
 	help
 	  SiRF binary support
 
 config BR2_PACKAGE_GPSD_SUPERSTAR2
 	bool "SuperStarII"
-	default y
 	help
 	  Novatel SuperStarII binary support
 
 config BR2_PACKAGE_GPSD_TRIMBLE_TSIP
 	bool "Trimble TSIP"
-	default y
 	help
 	  Trimble TSIP support
 
 config BR2_PACKAGE_GPSD_TRIPMATE
 	bool "TripMate"
-	default y
 	help
 	  Delorme TripMate support
 
 config BR2_PACKAGE_GPSD_TRUE_NORTH
 	bool "True North Technologies"
-	default n
 	help
 	  True North Technologies support
 
 config BR2_PACKAGE_GPSD_UBX
 	bool "UBX"
-	default y
 	help
 	  uBlox UBX binary support
 
-- 
1.7.2.2
