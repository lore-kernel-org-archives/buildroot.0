From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 18:01:35 +0200
Subject: [Buildroot] [git commit] pulseaudio: alsa backend needs pcm+mixer
	apis
Message-ID: <20111025160200.3A2FC8F229@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e1e0191d67d989eef5bcbf1919e5e46e42a513c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/pulseaudio.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 0686d39..b73c103 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -29,6 +29,11 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_FFTW),fftw) \
 	$(if $(BR2_PACKAGE_ORC),orc)
 
+# pulseaudio alsa backend needs pcm/mixer apis
+ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
+PULSEAUDIO_CONF_OPT += --disable-alsa
+endif
+
 ifneq ($(BR2_PACKAGE_VALA),y)
 define PULSEAUDIO_REMOVE_VALA
 	rm -rf $(TARGET_DIR)/usr/share/vala
