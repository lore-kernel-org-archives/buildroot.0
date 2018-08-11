From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Aug 2018 10:48:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: needs speexdsp for optional
 speex support
Message-ID: <20180811084855.16065-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes configure warning:

checking for SPEEX... yes
checking for SPEEXDSP... no
configure: WARNING: Package speexdsp was not found in the pkg-config search path.
Perhaps you should add the directory containing `speexdsp.pc'
to the PKG_CONFIG_PATH environment variable
Package 'speexdsp', required by 'world', not found.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 56bfdced53..af85377c94 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -381,9 +381,9 @@ else
 VLC_CONF_OPTS += --disable-sdl-image
 endif
 
-ifeq ($(BR2_PACKAGE_SPEEX),y)
+ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 VLC_CONF_OPTS += --enable-speex
-VLC_DEPENDENCIES += speex
+VLC_DEPENDENCIES += speex speexdsp
 else
 VLC_CONF_OPTS += --disable-speex
 endif
-- 
2.18.0
