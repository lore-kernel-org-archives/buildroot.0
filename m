From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:24 +0200
Subject: [Buildroot] [PATCH/next v2 12/23] package/vlc: add optional
 dependency to libdvdnav
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.18.0
