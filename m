From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:50:12 +0100
Subject: [Buildroot] [git commit] rubix: fix X.org dependency
Message-ID: <20130112215438.B1AE0996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5eb126902974a03bfd4a2fe2da984529465ffaf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rubix/Config.in |    1 +
 package/rubix/rubix.mk  |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/rubix/Config.in b/package/rubix/Config.in
index 9cf5b46..7afc0ae 100644
--- a/package/rubix/Config.in
+++ b/package/rubix/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RUBIX
 	bool "rubix"
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  A 3D rubiks cube game for X
 
diff --git a/package/rubix/rubix.mk b/package/rubix/rubix.mk
index d39d353..9270367 100644
--- a/package/rubix/rubix.mk
+++ b/package/rubix/rubix.mk
@@ -10,7 +10,7 @@ RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
 
 RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
 
-RUBIX_DEPENDENCIES = xserver_xorg-server
+RUBIX_DEPENDENCIES = xlib_libX11
 
 $(eval $(autotools-package))
 
