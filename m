From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 17:19:17 +0200
Subject: [Buildroot] [git commit] kodi: s/BR2_DL_DIR/DL_DIR/
Message-ID: <20170704151621.A69857F9CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f49dc27956aaf3a583be5f88faa069ea97731a91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_DL_DIR is not to be used by the package's Makefile.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/kodi.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 2636a0b..7a031b7 100644
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
