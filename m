From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Mar 2021 21:43:41 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/kodi: honour the
 libusb option even when disabled
Message-ID: <20210329192852.0821C8A335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=519fd80585d7cdc92cb15f565ac1d013244dd377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Make sure libusb support is properly disabled even if the libusb
package is enabled, and in case it gets built before Kodi.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0e1acc6e36b087c1008981e7bccf4113bfa1751d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/kodi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 2f2a92a889..a7a68639ba 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -211,6 +211,8 @@ KODI_CONF_OPTS += -DENABLE_UDEV=OFF
 ifeq ($(BR2_PACKAGE_KODI_LIBUSB),y)
 KODI_CONF_OPTS += -DENABLE_LIBUSB=ON
 KODI_DEPENDENCIES += libusb-compat
+else
+KODI_CONF_OPTS += -DENABLE_LIBUSB=OFF
 endif
 endif
 
