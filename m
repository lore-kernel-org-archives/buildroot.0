From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Dec 2016 07:34:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
	Explicitly disable glamor support when dependencies are not met
Message-ID: <20161217063448.964-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/b48/b48074089da770463f7ffcc27e385ac59456edc5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 48cd2a7..30fb05b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -224,6 +224,8 @@ XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
 ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yy)
 XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
+else
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-glamor
 endif
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri3 --disable-glamor
-- 
2.10.2
