From: Filippo Sironi <filippo.sironi@gmail.com>
Date: Tue, 13 May 2014 15:59:49 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: fix fontrootdir
	configuration
Message-ID: <1399989589-3731-1-git-send-email-filippo.sironi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --with-fontdir switch has been substituted by the --with-fontrootdir
switch a few versions ago. The use of the old configuration switch was
causing error messages like the following:

_FontTransOpen: Unable to Parse address ${prefix}/share/fonts/X11/*/
[dix] Could not init font path element ${prefix}/share/fonts/X11/*/, removing from list!

Signed-off-by: Filippo Sironi <filippo.sironi@gmail.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 4f2eff2..284d602 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -59,7 +59,7 @@ XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-dmx \
 		--with-builder-addr=buildroot at buildroot.org \
 		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
-		--with-fontdir=/usr/share/fonts/X11/ --localstatedir=/var \
+		--with-fontrootdir=/usr/share/fonts/X11/ --localstatedir=/var \
 		--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
-- 
1.9.1
