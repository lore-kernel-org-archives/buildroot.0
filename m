From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:03 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 samba4
Message-ID: <20180907111510.D92C4802F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5488b00dac91a1ffe323a02c6c9eea6dc07ec1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ecc5c6cafe..14fe3b7861 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -387,6 +387,13 @@ else
 VLC_CONF_OPTS += --disable-sdl-image
 endif
 
+ifeq ($(BR2_PACKAGE_SAMBA4),y)
+VLC_CONF_OPTS += --enable-smbclient
+VLC_DEPENDENCIES += samba4
+else
+VLC_CONF_OPTS += --disable-smbclient
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 VLC_CONF_OPTS += --enable-speex
 VLC_DEPENDENCIES += speex speexdsp
