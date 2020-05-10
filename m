From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:31:50 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/domoticz: set
 WITH_LIBUSB
Message-ID: <20200510193313.EB3DF913A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8616ca9f17388dc0c25bd29703e2e5b53a8ccfd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Use WITH_LIBUSB which is available since version 4.9700 and
https://github.com/domoticz/domoticz/commit/f53817577a834ed0c3fc16458c374aea490be49e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a896be19de9e6e7845b24af497fead6f522ef67d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/domoticz/domoticz.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index ab560ba05f..aeac0c65ef 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -33,6 +33,9 @@ DOMOTICZ_CONF_OPTS += \
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 DOMOTICZ_DEPENDENCIES += libusb
+DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=ON
+else
+DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
