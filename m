From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:30 -0000
Subject: [Buildroot] [git commit] package/vlc: add optional dependency to
 wayland
Message-ID: <20180907111516.330697FB4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07d3f1d99f8dd8d191dc5e5f40391d87dd5dfa3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 3dbaac1757..53a2b61633 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -84,7 +84,6 @@ VLC_CONF_OPTS += \
 	--disable-vdpau \
 	--disable-vsxu \
 	--disable-wasapi \
-	--disable-wayland \
 	--disable-x262 \
 	--disable-zvbi \
 	--enable-run-as-root
@@ -529,6 +528,13 @@ else
 VLC_CONF_OPTS += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+VLC_CONF_OPTS += --enable-wayland
+VLC_DEPENDENCIES += wayland
+else
+VLC_CONF_OPTS += --disable-wayland
+endif
+
 ifeq ($(BR2_PACKAGE_X264),y)
 VLC_CONF_OPTS += --enable-x264
 VLC_DEPENDENCIES += x264
