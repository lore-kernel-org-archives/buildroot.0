From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 09:19:35 +0100
Subject: [Buildroot] [git commit] vlc: add udev support
Message-ID: <20140116081945.00BFA9C4F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96b7f4e9a91fe67d4d02c08329b398d698d8da9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ce51f37..ec5727d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -30,7 +30,6 @@ VLC_CONF_OPT += \
 	--disable-goom \
 	--disable-projectm \
 	--disable-vsxu \
-	--disable-udev \
 	--disable-mtp
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
@@ -234,6 +233,13 @@ else
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
