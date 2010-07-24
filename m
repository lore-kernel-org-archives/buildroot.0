From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 24 Jul 2010 20:34:03 +0200
Subject: [Buildroot] [git commit master 1/1] xserver-xorg: disable SDL
	kdrive server
Message-ID: <20100724183541.B50758262E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c03cab1430326beea676ce25b1abd20b45b42568
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the build breaks if the SDL package is enabled, as xserver's
configure script detects SDL support, but doesn't find our sdl-config
script, so linking fails.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f3ffea9..7c12d24 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -70,7 +70,8 @@ XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_tinyx),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive --enable-xfbdev --disable-glx --disable-dri
+XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive --enable-xfbdev \
+		--disable-glx --disable-dri --disable-xsdl
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
-- 
1.7.1
