From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Mar 2013 08:49:51 +0100
Subject: [Buildroot] [PATCH] gpsd: nmea2000 requires aivdm support
Message-ID: <1364284191-4431-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/853cac5becf9d071c6ec1181e1e951bc8e7d80d5/build-end.log
and tons of identical build failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index b26cf07..337f8e7 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -169,6 +169,7 @@ config BR2_PACKAGE_GPSD_NMEA
 config BR2_PACKAGE_GPSD_NMEA2000
 	bool "NMEA2000"
 	select BR2_PACKAGE_GPSD_NAVCOM
+	select BR2_PACKAGE_GPSD_AIVDM
 	help
 	  NMEA2000/CAN support
 
-- 
1.7.9.5
