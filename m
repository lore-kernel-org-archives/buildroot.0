From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:29:23 +0200
Subject: [Buildroot] [git commit] package/kodi: add support for libudev
Message-ID: <20160717123353.9CE0D81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10979bb2c6b5f827b356427a556b9500010a3eca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most of the times this is not needed because libdrm & mesa3d already
pull in the dependency to udev. Let's add it anyway to make sure that
udev is really used and to document that Kodi makes use of udev.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/kodi.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index da5d1fa..e291947 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -102,6 +102,13 @@ KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
 	LIBS="-lvcos -lvchostif"
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+KODI_DEPENDENCIES += udev
+KODI_CONF_OPTS += --enable-udev
+else
+KODI_CONF_OPTS += --disable-udev
+endif
+
 ifeq ($(BR2_PACKAGE_IMX_VPUWRAP),y)
 KODI_DEPENDENCIES += imx-vpuwrap
 KODI_CONF_OPTS += --enable-codec=imxvpu
