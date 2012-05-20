From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 May 2012 13:50:38 +0200
Subject: [Buildroot] [git commit branch/next] pulseaudio: add optional
	systemd support
Message-ID: <20120520115106.63F0496D2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c27a0b9d7fdefd9e183abf3a8d3e31cdb3b0ec37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/pulseaudio.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index a5534da..175adfa 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -29,7 +29,8 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw) \
 	$(if $(BR2_PACKAGE_ORC),orc) \
-	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing)
+	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
+	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
 # pulseaudio alsa backend needs pcm/mixer apis
 ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
