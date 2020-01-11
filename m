From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:46:31 +0100
Subject: [Buildroot] [git commit] package/vlc: add fluidsynth optional
 dependency
Message-ID: <20200111144129.042948A3FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdde7eca042b077813562fbf73ebc6e21128aeef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
