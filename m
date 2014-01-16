From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 16 Jan 2014 07:41:36 +0000
Subject: [Buildroot] [PATCH] vlc: add udev support
Message-ID: <1389858096-8566-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 516876b..4922809 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -31,7 +31,6 @@ VLC_CONF_OPT += \
 	--disable-goom \
 	--disable-projectm \
 	--disable-vsxu \
-	--disable-udev \
 	--disable-mtp
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
@@ -228,6 +227,13 @@ else
 VLC_CONF_OPT += --disable-tremor
 endif
 
+ifeq ($(BR2_PACKAGE_UDEV),y)
+VLC_CONF_OPT += --enable-udev
+VLC_DEPENDENCIES += udev
+else
+VLC_CONF_OPT += --disable-udev
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 VLC_CONF_OPT += --with-x
 VLC_DEPENDENCIES += xlib_libX11
-- 
1.8.3.2
