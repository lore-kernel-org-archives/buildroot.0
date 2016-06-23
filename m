From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 23 Jun 2016 11:09:56 +0100
Subject: [Buildroot] [PATCH 1/2] pulseaudio: fix udev configure option
Message-ID: <1466676597-7758-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

enable-libudev doesn't exist as a configure option. The right one is
enable-udev.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pulseaudio/pulseaudio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 06b0b84..4a7d013 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -79,10 +79,10 @@ PULSEAUDIO_CONF_OPTS += --without-soxr
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-PULSEAUDIO_CONF_OPTS += --enable-libudev
+PULSEAUDIO_CONF_OPTS += --enable-udev
 PULSEAUDIO_DEPENDENCIES += udev
 else
-PULSEAUDIO_CONF_OPTS += --disable-libudev
+PULSEAUDIO_CONF_OPTS += --disable-udev
 endif
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-- 
2.7.3
