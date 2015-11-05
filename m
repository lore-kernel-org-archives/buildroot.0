From: James Knight <james.knight@rockwellcollins.com>
Date: Thu,  5 Nov 2015 11:34:33 -0500
Subject: [Buildroot] [PATCH 1/1] gpsd: correct explicit nmea 0183 support
	flag
Message-ID: <1446741273-8460-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following handles the GPSd SCons change for the explicit
configuration of the NMEA 0183 protocol. The protocol configuration
change was introduced in 3.12. Developer's who transitioned to
Buildroot's GPSd 3.15 had NMEA 0183 implicitly enabled by default. This
change allows NMEA 0183 to be explicitly disabled again.

See:
 http://git.savannah.gnu.org/cgit/gpsd.git/commit/SConstruct?id=8f20d7b2d1ece8f3205ca038726c77daa5234c0c

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/gpsd/gpsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 2199e31..577b43c 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -102,7 +102,7 @@ ifneq ($(BR2_PACKAGE_GPSD_MTK3301),y)
 GPSD_SCONS_OPTS += mtk3301=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_NMEA),y)
-GPSD_SCONS_OPTS += nmea=no
+GPSD_SCONS_OPTS += nmea0183=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_NTRIP),y)
 GPSD_SCONS_OPTS += ntrip=no
-- 
1.9.5.msysgit.1
