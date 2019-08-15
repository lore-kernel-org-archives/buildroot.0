From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Aug 2019 23:11:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/stellarium: fix build without
 qt5serialport
Message-ID: <20190815211139.18420-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set USE_PLUGIN_TELESCOPECONTROL depending on qt5serialport availability

Fixes:
 - http://autobuild.buildroot.org/results/01452113e984de0ddf177a513d20287c96ebe0a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stellarium/stellarium.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 779355520c..33fb65c18d 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -30,9 +30,13 @@ STELLARIUM_DEPENDENCIES += qt5serialport
 ifeq ($(BR2_PACKAGE_GPSD),y)
 STELLARIUM_DEPENDENCIES += gpsd
 endif
-STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
+STELLARIUM_CONF_OPTS += \
+	-DENABLE_GPS=ON \
+	-DUSE_PLUGIN_TELESCOPECONTROL=ON
 else
-STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
+STELLARIUM_CONF_OPTS += \
+	-DENABLE_GPS=OFF \
+	-DUSE_PLUGIN_TELESCOPECONTROL=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.20.1
