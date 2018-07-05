From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Jul 2018 09:16:16 +0200
Subject: [Buildroot] [git commit] lm-sensors: fix static build
Message-ID: <20180705071245.A448987FE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b99dbdfac946751deb05e6e0c1f4c44659e15524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -static to the link command line to have libgcc resolve libc
symbols. This overrides the default -Wl,-rpath,/usr/lib, which is
useless for static build anyway.

Fixes:

  http://autobuild.buildroot.net/results/25d580bee6f609f6b28ebd6cc96d180179901b0e/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
