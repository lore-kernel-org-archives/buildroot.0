From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 May 2016 09:44:42 +0200
Subject: [Buildroot] [PATCH] Revert "package/kodi: optimise for RPi2"
Message-ID: <1462693482-29650-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Optimised support for the RPi-2 was only inttroduced in Krypton, the
next release of Kodi. Jarvis, the current release, does not have this
support.

This reverts commit ef37472b20894c99cad758397f3cd6b90f933df1.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Beno?t Mauduit <bmauduit@beneth.fr>
---
 package/kodi/kodi.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e812b50..e163c24 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -47,14 +47,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_DEPENDENCIES += rpi-userland
-# Kodi has specific configuration flags for RPi/RPi2. Configure for a
-# RPi2 when we're sure, fallback to RPi otherwise.
-ifeq ($(BR2_cortex_a7),y)
-KODI_CONF_OPTS += --with-platform=raspberry-pi2
-else
-KODI_CONF_OPTS += --with-platform=raspberry-pi
-endif
-KODI_CONF_OPTS += --enable-player=omxplayer
+KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
 KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
 	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
 	LIBS="-lvcos -lvchostif"
-- 
2.7.4
