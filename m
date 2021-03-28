From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 10:18:32 +0200
Subject: [Buildroot] [git commit] package/kodi: honour the libusb option
 even when disabled
Message-ID: <20210328075524.47250888A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e1acc6e36b087c1008981e7bccf4113bfa1751d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure libusb support is properly disabled even if the libusb
package is enabled, and in case it gets built before Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
