From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Mar 2013 09:26:51 +0100
Subject: [Buildroot] [git commit] gpsd: nmea2000 requires aivdm support
Message-ID: <20130326082744.9268D9B2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3facdcf31c9b6a46aa470be65894fac5a55b165
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/853cac5becf9d071c6ec1181e1e951bc8e7d80d5/build-end.log
and tons of identical build failures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
