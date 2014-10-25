From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Oct 2014 20:19:55 +0200
Subject: [Buildroot] [PATCH 3/3] package/xbmc: Add optional support for
	libcap
In-Reply-To: <1414261195-5009-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414261195-5009-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1414261195-5009-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 86a9721..03362c2 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -63,6 +63,13 @@ XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
 	LIBS="-lvcos -lvchostif"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+XBMC_CONF_OPTS += --enable-libcap
+XBMC_DEPENDENCIES += libcap
+else
+XBMC_CONF_OPTS += --disable-libcap
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 XBMC_CONF_OPTS += --enable-dbus
-- 
1.7.10.4
