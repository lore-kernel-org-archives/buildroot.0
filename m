From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 May 2014 20:17:56 +0200
Subject: [Buildroot] [PATCH 7/8] xbmc: Add -DMESA_EGL_NO_X11_HEADERS to
	cflags to fix compile without X.org
In-Reply-To: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1398968277-9044-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 72eb0e0..8955197 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -63,6 +63,9 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
+XBMC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)"
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
-- 
1.7.10.4
