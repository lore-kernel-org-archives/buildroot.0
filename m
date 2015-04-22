From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:56:44 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xeyes: Add dependency
	to xlib_libXrender
Message-ID: <20150422210724.B8E0481D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c552029cb877786c67ff77447c5ffe1d370ae50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xeyes depends on Xrender since version 1.1.0
http://lists.freedesktop.org/archives/xorg/2009-December/048305.html

Fixes
http://autobuild.buildroot.net/results/bae/baeded072fbec4a398738e00dbf851d756af660f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xeyes/Config.in     |    1 +
 package/x11r7/xapp_xeyes/xapp_xeyes.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
index a7b7737..5cf7f6c 100644
--- a/package/x11r7/xapp_xeyes/Config.in
+++ b/package/x11r7/xapp_xeyes/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_XAPP_XEYES
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXMU
+	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
 	  X.Org xeyes application
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 89cac51..07c1200 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -9,6 +9,6 @@ XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEYES_LICENSE = MIT
 XAPP_XEYES_LICENSE_FILES = COPYING
-XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
+XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXrender xlib_libXt
 
 $(eval $(autotools-package))
