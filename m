From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 11:20:35 +0100
Subject: [Buildroot] [git commit] libevas: X OpenGL backends needs modular
	X.org (for mesa)
Message-ID: <20120209102327.DFBBE90A47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0829989046404df89c9603014d0ae54d0d4904c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index f701886..ddac49e 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -98,7 +98,7 @@ config BR2_PACKAGE_LIBEVAS_X11
 
 config BR2_PACKAGE_LIBEVAS_X11_GLX
 	bool "libevas X11 GLX backend"
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XSERVER_xorg # mesa needs big X
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXEXT
@@ -120,7 +120,7 @@ config BR2_PACKAGE_LIBEVAS_XCB
 
 config BR2_PACKAGE_LIBEVAS_XCB_GLX
 	bool "libevas XCB GLX backend"
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XSERVER_xorg # mesa needs big X
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL
 	select BR2_PACKAGE_XCB_PROTO
