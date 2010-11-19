From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 16:44:17 +0100
Subject: [Buildroot] [git commit master 1/1] package/: shared config cache
	is gone
Message-ID: <20101119154518.6B2338D407@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3ece089ede71e8c352985f8faf06b3a9fdf9d202
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So remove the last references to it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/gpsd.mk           |    1 -
 package/rng-tools/rng-tools.mk |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 71fe89e..ab7e921 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -9,7 +9,6 @@ GPSD_SITE = http://download.berlios.de/gpsd
 GPSD_INSTALL_STAGING = YES
 GPSD_CONF_OPT = --disable-static
 GPSD_LIBTOOL_PATCH = NO
-GPSD_USE_CONFIG_CACHE = NO
 GPSD_TARGET_BINS = cgps gpsctl gpsdecode gpsmon gpspipe gpxlogger lcdgps
 
 # Build libgpsmm if we've got C++
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 755f4f8..9ae5616 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -7,7 +7,6 @@
 RNG_TOOLS_VERSION = 3
 RNG_TOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel
 RNG_TOOLS_CONF_ENV = LIBS="-largp"
-RNG_TOOLS_USE_CONFIG_CACHE = NO
 RNG_TOOLS_DEPENDENCIES = argp-standalone
 
 $(eval $(call AUTOTARGETS,package,rng-tools))
-- 
1.7.2.2
