From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 16:12:48 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: fix fontrootdir
	configuration
Message-ID: <20140516141341.2C03E9CBC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d6199ca8988d2624159dc0868165b0cc09143bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The --with-fontdir switch has been substituted by the --with-fontrootdir
switch a few versions ago. The use of the old configuration switch was
causing error messages like the following:

_FontTransOpen: Unable to Parse address ${prefix}/share/fonts/X11/*/
[dix] Could not init font path element ${prefix}/share/fonts/X11/*/, removing from list!

Signed-off-by: Filippo Sironi <filippo.sironi@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
