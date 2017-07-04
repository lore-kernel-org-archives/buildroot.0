From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 11:40:39 +0200
Subject: [Buildroot] [PATCH 2/3] kodi: s/BR2_DL_DIR/DL_DIR/
In-Reply-To: <20170704094040.19767-1-maxime.hadjinlian@gmail.com>
References: <20170704094040.19767-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170704094040.19767-2-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_DL_DIR is not to be used by the package's Makefile.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi/kodi.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 2636a0b96..7a031b748 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -66,9 +66,9 @@ KODI_CONF_OPTS += \
 	-DNATIVEPREFIX=$(HOST_DIR)/usr \
 	-DDEPENDS_PATH=$(@D) \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/usr/bin/TexturePacker \
-	-DLIBDVDCSS_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
-	-DLIBDVDNAV_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
-	-DLIBDVDREAD_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
+	-DLIBDVDCSS_URL=$(DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
+	-DLIBDVDNAV_URL=$(DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
+	-DLIBDVDREAD_URL=$(DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
 
 ifeq ($(BR2_arm),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
-- 
2.11.0
