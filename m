From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Nov 2011 09:39:29 +0100
Subject: [Buildroot] [git commit] gpsd: garmintxt driver gets enabled by
	default, so disable if not selected
Message-ID: <20111109084558.223958F408@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b66156835ea8ef253dac8e96fed9dbb4cb30f204
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gpsd/gpsd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 10e66ba..be6daeb 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -58,8 +58,8 @@ endif
 ifneq ($(BR2_PACKAGE_GPSD_GARMIN),y)
 	GPSD_CONF_OPT += --disable-garmin
 endif
-ifeq ($(BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT),y)
-	GPSD_CONF_OPT += --enable-garmintxt
+ifneq ($(BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT),y)
+	GPSD_CONF_OPT += --disable-garmintxt
 endif
 ifneq ($(BR2_PACKAGE_GPSD_GPSCLOCK),y)
 	GPSD_CONF_OPT += --disable-gpsclock
