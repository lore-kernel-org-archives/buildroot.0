From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 10:15:40 +0200
Subject: [Buildroot] [git commit] package/domoticz: set WITH_LIBUSB
Message-ID: <20200508080012.A140B90FD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a896be19de9e6e7845b24af497fead6f522ef67d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use WITH_LIBUSB which is available since version 4.9700 and
https://github.com/domoticz/domoticz/commit/f53817577a834ed0c3fc16458c374aea490be49e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/domoticz/domoticz.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 5efe86a784..0ceaab87b4 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -38,6 +38,9 @@ DOMOTICZ_CONF_OPTS += \
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 DOMOTICZ_DEPENDENCIES += libusb
+DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=ON
+else
+DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
