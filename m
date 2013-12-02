From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  2 Dec 2013 10:21:53 +0000
Subject: [Buildroot] [PATCH] gpsd: update ubx option for version 3.10
Message-ID: <1385979713-8512-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

For gpsd 3.10, the ubx scons option has been renamed to ublox. Update our
makefile accordingly.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gpsd/gpsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 92db00e..be300a7 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -147,7 +147,7 @@ ifneq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
 	GPSD_SCONS_OPTS += tnt=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_UBX),y)
-	GPSD_SCONS_OPTS += ubx=no
+	GPSD_SCONS_OPTS += ublox=no
 endif
 
 # Features
-- 
1.8.3.2
