From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 10 Jan 2020 23:02:36 +0100
Subject: [Buildroot] [PATCH 2/5] package/vlc: add fluidsynth optional
 dependency
In-Reply-To: <20200110220239.196975-1-fontaine.fabrice@gmail.com>
References: <20200110220239.196975-1-fontaine.fabrice@gmail.com>
Message-ID: <20200110220239.196975-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ae12e89b8a..4b1cd68d8b 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -55,7 +55,6 @@ VLC_CONF_OPTS += \
 	--disable-dsm \
 	--disable-dv1394 \
 	--disable-fluidlite \
-	--disable-fluidsynth \
 	--disable-gme \
 	--disable-goom \
 	--disable-jack \
@@ -164,6 +163,13 @@ else
 VLC_CONF_OPTS += --disable-flac
 endif
 
+ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
+VLC_CONF_OPTS += --enable-fluidsynth
+VLC_DEPENDENCIES += fluidsynth
+else
+VLC_CONF_OPTS += --disable-fluidsynth
+endif
+
 ifeq ($(BR2_PACKAGE_FREERDP),y)
 VLC_CONF_OPTS += --enable-freerdp
 VLC_DEPENDENCIES += freerdp
-- 
2.24.1
