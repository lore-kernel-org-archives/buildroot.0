From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 15:03:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Extended comment about
	RPi-only options
Message-ID: <20170429130339.14991-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2017-April/190767.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 12dc3117f8..80c7c1b074 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -147,7 +147,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
 KODI_DEPENDENCIES += rpi-userland
 else
-# these options only exist on non-rpi systems
+# The following options are defined only in
+# project/cmake/scripts/linux/ArchSetup.cmake,
+# rbpi uses its own ArchSetup.cmake, located in
+# project/cmake/scripts/rbpi/
 KODI_CONF_OPTS += -DENABLE_LDGOLD=OFF
 ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
 KODI_CONF_OPTS += -DENABLE_AML=ON
-- 
2.11.0
