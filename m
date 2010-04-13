From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] x11vnc: cleanup useless config
	options
Message-ID: <20100413195154.07A9F20F94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f2e9f7604affc9e55d244c84439821b424850047
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11vnc/x11vnc.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 4def7d4..f71350d 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -8,12 +8,9 @@ X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
 X11VNC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libvncserver
 X11VNC_INSTALL_STAGING = NO
 X11VNC_INSTALL_TARGET = YES
-#X11VNCINSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-X11VNC_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-        --build=$(GNU_HOST_NAME) --prefix=/usr \
-        --includedir=/usr/include \
-		--without-avahi
+X11VNC_CONF_OPT = \
+	--without-avahi
 
 X11VNC_DEPENDENCIES = xserver_xorg-server
 
-- 
1.6.3.3
