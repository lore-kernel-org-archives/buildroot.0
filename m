From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:33 -0000
Subject: [Buildroot] [git commit] package/vlc: wayland support needs
 wayland-protocols
Message-ID: <20180907111541.5EEE480DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c052b089460bb98230c1957b0f66f42084e0639
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/3db/3dbb17bc548aa7d5fecd857a9bbd761729d20d4f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index d4be8b0bf1..c77c945a34 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -519,9 +519,9 @@ else
 VLC_CONF_OPTS += --disable-udev
 endif
 
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
+ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_WAYLAND_PROTOCOLS),yy)
 VLC_CONF_OPTS += --enable-wayland
-VLC_DEPENDENCIES += wayland
+VLC_DEPENDENCIES += wayland wayland-protocols
 else
 VLC_CONF_OPTS += --disable-wayland
 endif
