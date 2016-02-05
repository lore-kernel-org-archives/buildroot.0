From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  5 Feb 2016 22:27:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: location support needs
	host-pkgconf
Message-ID: <1454707655-27951-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch suggested by Arnout: http://patchwork.ozlabs.org/patch/576212/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sconeserver/sconeserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index ed1133e..592de22 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -79,7 +79,7 @@ SCONESERVER_CONF_OPTS += --without-rss
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
-SCONESERVER_DEPENDENCIES += gpsd
+SCONESERVER_DEPENDENCIES += host-pkgconf gpsd
 SCONESERVER_CONF_OPTS += --with-location
 else
 SCONESERVER_CONF_OPTS += --without-location
-- 
2.7.0
