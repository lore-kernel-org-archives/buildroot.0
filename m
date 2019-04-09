From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Apr 2019 22:04:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/xserver_xorg-server: disable unit
 tests
Message-ID: <20190409200448.25660-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/95a5004c9245f1f90758631b02e17d3df12812ec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 14f8104767..a33cb25076 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -47,6 +47,7 @@ XSERVER_XORG_SERVER_CONF_OPTS = \
 	--disable-xnest \
 	--disable-xephyr \
 	--disable-dmx \
+	--disable-unit-tests \
 	--with-builder-addr=buildroot at buildroot.org \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1 -O2" \
 	--with-fontrootdir=/usr/share/fonts/X11/ \
-- 
2.20.1
