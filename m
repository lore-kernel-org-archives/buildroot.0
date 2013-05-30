From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 15:33:01 +0200
Subject: [Buildroot] [git commit] Revert "pulseaudio : bump to version 3.0"
Message-ID: <20130530133547.707299A4CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7183fc0f3fefc9722bcd1f1be6ca02cdbfe0eb57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit d3bde0a64edb5a3392314d2cdd2c4e4057d15831.

This wasn't supposed to be applied to master.
---
 package/multimedia/pulseaudio/pulseaudio.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 529f5dd..b39d99e 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -3,7 +3,8 @@
 # pulseaudio
 #
 ################################################################################
-PULSEAUDIO_VERSION = 3.0
+
+PULSEAUDIO_VERSION = 2.1
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_CONF_OPT = \
@@ -59,7 +60,6 @@ endef
 PULSEAUDIO_POST_PATCH_HOOKS += PULSEAUDIO_FORCE_CC
 endif
 
-PULSEAUDIO_CONF_OPT += $(if $(BR2_ARM_ENABLE_NEON),--enable-neon-opt=yes,--enable-neon-opt=no)
 # pulseaudio alsa backend needs pcm/mixer apis
 ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 PULSEAUDIO_CONF_OPT += --disable-alsa
