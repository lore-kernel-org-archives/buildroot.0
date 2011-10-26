From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Oct 2011 07:46:40 +0200
Subject: [Buildroot] [git commit] pulseaudio: gtk supports needs x backend
Message-ID: <20111026055459.C70488F30B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fe0b202a21d5d0899e691df3feab0686b6cfab9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Uses X11 specific apis.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/pulseaudio.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index b73c103..5e68dfb 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -34,6 +34,11 @@ ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 PULSEAUDIO_CONF_OPT += --disable-alsa
 endif
 
+# gtk support needs x backend
+ifneq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG),yy)
+PULSEAUDIO_CONF_OPT += --disable-gtk2
+endif
+
 ifneq ($(BR2_PACKAGE_VALA),y)
 define PULSEAUDIO_REMOVE_VALA
 	rm -rf $(TARGET_DIR)/usr/share/vala
