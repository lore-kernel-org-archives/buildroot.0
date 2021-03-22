From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 Mar 2021 20:10:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: add configure option to
 disable libusb support
Message-ID: <20210322191034.3428-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure libusb support is properly disabled even if the libusb
package is enabled.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index bf5822eb61..6edb0b7fca 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -206,6 +206,8 @@ KODI_CONF_OPTS += -DENABLE_UDEV=OFF
 ifeq ($(BR2_PACKAGE_KODI_LIBUSB),y)
 KODI_CONF_OPTS += -DENABLE_LIBUSB=ON
 KODI_DEPENDENCIES += libusb-compat
+else
+KODI_CONF_OPTS += -DENABLE_LIBUSB=OFF
 endif
 endif
 
-- 
2.29.2
