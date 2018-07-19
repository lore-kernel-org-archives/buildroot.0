From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 19:58:40 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] lm-sensors: fix static
 build
Message-ID: <20180719180713.8718E88F81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd7f2c59caf859ebe33c743b32066ca4ddb8c3fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Add -static to the link command line to have libgcc resolve libc
symbols. This overrides the default -Wl,-rpath,/usr/lib, which is
useless for static build anyway.

Fixes:

  http://autobuild.buildroot.net/results/25d580bee6f609f6b28ebd6cc96d180179901b0e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b99dbdfac946751deb05e6e0c1f4c44659e15524)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lm-sensors/lm-sensors.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index f581b5cd8f..6fc7ce4981 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -26,7 +26,7 @@ LM_SENSORS_MAKE_OPTS = \
 	PREFIX=/usr
 
 ifeq ($(BR2_STATIC_LIBS),y)
-LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=0
+LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=0 EXLDFLAGS=-static
 else
 LM_SENSORS_MAKE_OPTS += BUILD_SHARED_LIB=1
 endif
