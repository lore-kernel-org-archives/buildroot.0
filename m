From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 15 Jul 2014 21:19:11 +0200
Subject: [Buildroot] [PATCH v14 16/20] xbmc: Add lame support
In-Reply-To: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405451955-10204-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405451955-10204-17-git-send-email-bernd.kuhls@t-online.de>
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
index 0c45d7d..e7c9381 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -79,6 +79,13 @@ else
 XBMC_CONF_OPT += --disable-alsa
 endif
 
+ifeq ($(BR2_PACKAGE_LAME),y)
+XBMC_DEPENDENCIES += lame
+XBMC_CONF_OPT += --enable-libmp3lame
+else
+XBMC_CONF_OPT += --disable-libmp3lame
+endif
+
 XBMC_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
 	CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
-- 
1.7.10.4
