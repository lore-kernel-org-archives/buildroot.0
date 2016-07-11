From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Jul 2016 20:08:59 +0200
Subject: [Buildroot] [PATCH v5 5/8] package/kodi: add support for libudev
In-Reply-To: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468260542-7194-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most of the times this is not needed because libdrm & mesa3d already
pull in the dependency to udev. Let's add it anyway to make sure that
udev is really used and to document that Kodi makes use of udev.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v5: initial version in this patch series, fixed typo (Thomas)

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
-- 
2.8.1
