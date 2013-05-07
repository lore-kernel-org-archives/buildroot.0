From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Tue,  7 May 2013 18:46:44 +0200
Subject: [Buildroot] [PATCH 2/2] pulseaudio : bump to version 3.0
In-Reply-To: <1367945204-11287-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1367945204-11287-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <1367945204-11287-2-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 package/multimedia/pulseaudio/pulseaudio.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 16df855..f171fb9 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -3,8 +3,7 @@
 # pulseaudio
 #
 ################################################################################
-
-PULSEAUDIO_VERSION = 2.1
+PULSEAUDIO_VERSION = 3.0
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_CONF_OPT = \
@@ -47,6 +46,7 @@ endef
 PULSEAUDIO_POST_PATCH_HOOKS += PULSEAUDIO_FORCE_CC
 endif
 
+PULSEAUDIO_CONF_OPT += $(if $(BR2_ARM_ENABLE_NEON),--enable-neon-opt=yes,--enable-neon-opt=no)
 # pulseaudio alsa backend needs pcm/mixer apis
 ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 PULSEAUDIO_CONF_OPT += --disable-alsa
-- 
1.7.10.4
