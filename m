From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:03 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 libvpx
Message-ID: <20180907111511.C8F1181292@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02644282d0bb7667aa4d9f1bda1bc2d1342fd4ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b90fd602d3..b8c47582dc 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -56,7 +56,6 @@ VLC_CONF_OPTS += \
 	--disable-shout \
 	--disable-twolame \
 	--disable-vdpau \
-	--disable-vpx \
 	--disable-vsxu \
 	--disable-x262 \
 	--disable-zvbi \
@@ -308,6 +307,13 @@ else
 VLC_CONF_OPTS += --disable-v4l2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+VLC_CONF_OPTS += --enable-vpx
+VLC_DEPENDENCIES += libvpx
+else
+VLC_CONF_OPTS += --disable-vpx
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
 VLC_CONF_OPTS += --enable-xcb
 VLC_DEPENDENCIES += libxcb
