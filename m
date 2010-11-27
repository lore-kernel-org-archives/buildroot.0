From: Matt Johnson <mj1856@hotmail.com>
Date: Sat, 27 Nov 2010 22:36:28 +0100
Subject: [Buildroot] [git commit master 1/1] xserver-xorg: fix CFLAGS
Message-ID: <20101127214028.714E68CA80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=936be892ddc956164c9d9e2bf5cd86165cc5d4d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure we just append to TARGET_CFLAGS, instead of overriding it.

Signed-off-by: Matt Johnson <mj1856@hotmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0228213..cb1daff 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	 Fixes all over the tree.
 
-	Updated/fixed packages: qt
+	Updated/fixed packages: qt, xserver-xorg
 
 2010.11-rc2, Released November 25th, 2010:
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 31b23f0..2cf5fb3 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -60,7 +60,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
 		--with-builder-addr=buildroot at uclibc.org \
-		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1" \
+		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
 		--with-fontdir=/usr/share/fonts/X11/
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
-- 
1.7.2.2
