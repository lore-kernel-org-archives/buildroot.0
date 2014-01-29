From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2014 10:50:54 +0100
Subject: [Buildroot] [git commit] vlc: add libass support
Message-ID: <20140129095112.207D39C6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7d309cba02df66ebfe0b9ddd46e26458465125d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

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
