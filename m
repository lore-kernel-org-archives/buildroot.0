From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:33:39 +0200
Subject: [Buildroot] [git commit] Revert "package/kodi: optimise for RPi2"
Message-ID: <20160508133357.7DFF7805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdeb02534a36c1181442bf20235b7bc4c4b9740f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Optimised support for the RPi-2 was only introduced in Krypton, the next
release of Kodi. Jarvis, the current release, does not have this
support.

This reverts commit ef37472b20894c99cad758397f3cd6b90f933df1.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Beno??t Mauduit <bmauduit@beneth.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
