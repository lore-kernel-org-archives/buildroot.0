From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 21:56:23 +0100
Subject: [Buildroot] [git commit] xapp_xmh: add dependency on xdata_xbitmap
Message-ID: <20121209210013.02E699A157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e099a6da82d59ce737e48f279495e84d77bd5d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/fa059a89a305914700f63d7f0b0d4a3f63beb039/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_xmh/Config.in   |    1 +
 package/x11r7/xapp_xmh/xapp_xmh.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xmh/Config.in b/package/x11r7/xapp_xmh/Config.in
index 3da965a..1ef65c7 100644
--- a/package/x11r7/xapp_xmh/Config.in
+++ b/package/x11r7/xapp_xmh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMH
 	bool "xmh"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XDATA_XBITMAPS
 	help
 	  send and read mail with an X interface to MH
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index 934f38d..920289e 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -7,6 +7,6 @@
 XAPP_XMH_VERSION = 1.0.2
 XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
 XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMH_DEPENDENCIES = xlib_libXaw
+XAPP_XMH_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
 $(eval $(autotools-package))
