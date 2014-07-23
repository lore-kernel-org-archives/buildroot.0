From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 22:07:42 +0200
Subject: [Buildroot] [git commit] xbmc: Add alsa support
Message-ID: <20140723200905.340769D2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42f38063a80139ff033bed37d5f22f3e071f099b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/xbmc.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 2a38114..32507fb 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -39,7 +39,6 @@ XBMC_CONF_ENV = \
 
 XBMC_CONF_OPT +=  \
 	--with-arch=$(BR2_ARCH) \
-	--disable-alsa \
 	--disable-crystalhd \
 	--disable-debug \
 	--disable-dvdcss \
@@ -73,6 +72,13 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
 XBMC_DEPENDENCIES += dbus
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+XBMC_DEPENDENCIES += alsa-lib
+XBMC_CONF_OPT += --enable-alsa
+else
+XBMC_CONF_OPT += --disable-alsa
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
