From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:01 -0000
Subject: [Buildroot] [git commit] package/vlc: sort VLC_CONF_OPTS
Message-ID: <20180907111509.91DE67FE4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b461fbbd123283785db67a4de60ebb936c094a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No code changes. The upcoming bump to vlc 3.0.3 will add another eleven
--disable-* options to CONF_OPTS. To stay on top of things we sort the
current entries before we begin the version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index af85377c94..5e5230edc9 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -34,33 +34,33 @@ endef
 VLC_POST_PATCH_HOOKS += VLC_OVERRIDE_PKG_M4
 
 VLC_CONF_OPTS += \
-	--disable-gles1 \
 	--disable-a52 \
-	--disable-shout \
-	--disable-twolame \
-	--disable-dca \
-	--disable-schroedinger \
-	--disable-fluidsynth \
-	--disable-zvbi \
-	--disable-kate \
+	--disable-addonmanagermodules \
 	--disable-caca \
-	--disable-jack \
-	--disable-samplerate \
 	--disable-chromaprint \
+	--disable-dca \
+	--disable-dvdnav \
+	--disable-fluidsynth \
+	--disable-gles1 \
 	--disable-goom \
-	--disable-projectm \
-	--disable-vsxu \
-	--disable-mtp \
+	--disable-jack \
+	--disable-jpeg \
+	--disable-kate \
+	--disable-mfx \
 	--disable-mmal-codec \
 	--disable-mmal-vout \
-	--disable-dvdnav \
+	--disable-mtp \
+	--disable-projectm \
+	--disable-samplerate \
+	--disable-schroedinger \
+	--disable-shout \
+	--disable-twolame \
+	--disable-vdpau \
 	--disable-vpx \
-	--disable-jpeg \
+	--disable-vsxu \
 	--disable-x262 \
 	--disable-x265 \
-	--disable-mfx \
-	--disable-vdpau \
-	--disable-addonmanagermodules \
+	--disable-zvbi \
 	--enable-run-as-root
 
 # Uses __atomic_fetch_add_4
