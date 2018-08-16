From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 11:59:14 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: needs speexdsp
 for optional speex support
Message-ID: <20180816113141.0131A8079B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84d64e0f780d530a189de3b16f0a5c76b89e0049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes configure warning:

checking for SPEEX... yes
checking for SPEEXDSP... no
configure: WARNING: Package speexdsp was not found in the pkg-config search path.
Perhaps you should add the directory containing `speexdsp.pc'
to the PKG_CONFIG_PATH environment variable
Package 'speexdsp', required by 'world', not found.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
