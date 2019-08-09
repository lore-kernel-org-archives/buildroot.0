From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:05:03 +0200
Subject: [Buildroot] [git commit] package/mpv: wayland support needs
 wayland-protocols
Message-ID: <20190809200159.C0A8D8E5FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e74468ad834527fc0704f632cf0a91a8c1176fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dependency for wayland-protocols was added with version 0.28.0:
https://github.com/mpv-player/mpv/commit/68f9ee7e0b3fdddfa42fa11a15d9ae84460d5e19#diff-dc6134e3d3c869a052520d86f46371dc

Fixes:
http://autobuild.buildroot.net/results/d5c/d5c5a31bc422defdd64ff0b0ca975bcd605f22be/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpv/Config.in | 1 +
 package/mpv/mpv.mk    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 69810038f1..32910f2245 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_MPV
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	# Select xkbcommon for wayland to avoid being mysterious
 	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
 	# Select all necessary X11 dependencies if X.org is enabled
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index dfc33ea986..f92b604c28 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -197,7 +197,7 @@ endif
 # wayland support
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MPV_CONF_OPTS += --enable-wayland
-MPV_DEPENDENCIES += libxkbcommon wayland
+MPV_DEPENDENCIES += libxkbcommon wayland wayland-protocols
 else
 MPV_CONF_OPTS += --disable-wayland
 endif
