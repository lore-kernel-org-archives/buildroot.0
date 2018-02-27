From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 21:01:56 +0100
Subject: [Buildroot] [git commit] mpv: disable mali-fbdev support
Message-ID: <20180227200714.CEBDD81342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52cec04a6cf7a9bc1e5d9d0479580cd4b086ce31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/2ce/2ce2d9be9e0699114e3bc3c0434ba05f64741f89/

A compile error occurs when attempting to compile mpv with mali support
(eg. when odroid-mali package is selected).

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Signed-off-by: Mahyar Koshkouei &lt;mahyar.koshkouei at gmail.com&gt;<br/>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/mpv.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 8d10aa7c47..d577674bd9 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -31,7 +31,8 @@ MPV_CONF_OPTS = \
 	--disable-uchardet \
 	--disable-vapoursynth \
 	--disable-vapoursynth-lazy \
-	--disable-vdpau
+	--disable-vdpau \
+	--disable-mali-fbdev
 
 # ALSA support requires pcm+mixer
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
