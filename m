From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 20:27:32 +0100
Subject: [Buildroot] [git commit] xapp_xinput: add missing dependencies
Message-ID: <20130325192703.22A619B2D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dcbde39f32304044434d546ac3527967c137953e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the big X.org bump, a few dependencies were missing in the
xapp_xinput package.

Fixes:
http://autobuild.buildroot.org/results/7e4ebd4dd47f49bcd4d225b17fbbc8b211e5201a/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xinput/Config.in      |    2 ++
 package/x11r7/xapp_xinput/xapp_xinput.mk |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xinput/Config.in b/package/x11r7/xapp_xinput/Config.in
index 2505dd3..e438a45 100644
--- a/package/x11r7/xapp_xinput/Config.in
+++ b/package/x11r7/xapp_xinput/Config.in
@@ -2,5 +2,7 @@ config BR2_PACKAGE_XAPP_XINPUT
 	bool "xinput"
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	help
 	  xinput
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 0eaa50c..fea939e 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -7,6 +7,6 @@
 XAPP_XINPUT_VERSION = 1.6.0
 XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
+XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi xlib_libXrandr xlib_libXinerama
 
 $(eval $(autotools-package))
