From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 12:01:19 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: add optional
 dependency to libdvdnav
Message-ID: <20180816113141.83B978D3DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a449dc1b82fab3337f4174613749106d4384f25f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 928b3fabb8..9a8ee56256 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -39,7 +39,6 @@ VLC_CONF_OPTS += \
 	--disable-caca \
 	--disable-chromaprint \
 	--disable-dca \
-	--disable-dvdnav \
 	--disable-fluidsynth \
 	--disable-gles1 \
 	--disable-goom \
@@ -206,6 +205,13 @@ else
 VLC_CONF_OPTS += --disable-dvbpsi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
+VLC_CONF_OPTS += --enable-dvdnav
+VLC_DEPENDENCIES += libdvdnav
+else
+VLC_CONF_OPTS += --disable-dvdnav
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
 VLC_CONF_OPTS += --enable-dvdread
 VLC_DEPENDENCIES += libdvdread
