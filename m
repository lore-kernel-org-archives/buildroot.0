From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 29 Jan 2014 09:25:53 +0000
Subject: [Buildroot] [PATCH] vlc: add libass support
Message-ID: <1390987553-5131-1-git-send-email-spdawson@gmail.com>
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
index 458fe1c..73b378c 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -21,7 +21,6 @@ VLC_CONF_OPT += \
 	--disable-quicksync \
 	--disable-fluidsynth \
 	--disable-zvbi \
-	--disable-libass \
 	--disable-kate \
 	--disable-caca \
 	--disable-jack \
@@ -100,6 +99,13 @@ else
 VLC_CONF_OPT += --disable-opus
 endif
 
+ifeq ($(BR2_PACKAGE_LIBASS),y)
+VLC_CONF_OPT += --enable-libass
+VLC_DEPENDENCIES += libass
+else
+VLC_CONF_OPT += --disable-libass
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 VLC_CONF_OPT += --enable-libgcrypt
 VLC_DEPENDENCIES += libgcrypt
-- 
1.8.3.2
