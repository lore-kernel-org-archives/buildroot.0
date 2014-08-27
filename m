From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Aug 2014 22:41:30 +0200
Subject: [Buildroot] [PATCH] package/xbmc: Fix broken variable name
Message-ID: <1409172090-20497-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_XBMC_DBUS is provided by package/xbmc/Config.in

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index bdd634e..0bb6724 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -64,7 +64,7 @@ XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
 	LIBS="-lvcos -lvchostif"
 endif
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
+ifeq ($(BR2_PACKAGE_XBMC_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
-- 
1.7.10.4
