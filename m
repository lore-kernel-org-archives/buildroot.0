From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Apr 2010 14:38:45 +0200
Subject: [Buildroot] [git commit master] python: needs WCHAR support in
	toolchain
Message-ID: <20100419123929.2DB3A20CEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b3a6f0aab19c147ad28f74e3b410c4a8bb2f38f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And hence, portage needs it as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |   12 ++++++------
 package/portage/Config.in |    4 ++++
 package/python/Config.in  |    4 ++++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 315a1e6..3956ca9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,12 +16,12 @@
 	e2fsprogs, fbv, freetype, iperf, iptables, iw, less,
 	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, matchbox,
 	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, pciutils,
-	php, pixman, pppd, pthread-stubs, qt, radvd, setserial,
-	squashfs, usb_modeswith, wget, xdriver_xf86-video-intel,
-	xkeyboard-config, xlib_libX11, xlib_libXfont,
-	xlib_libXfontcache, xlib_libXxf86misc, xlib_libpciaccess,
-	xproto_dri2proto, xproto_eviext, xproto_fontcacheproto,
-	xproto_xf86miscproto
+	php, pixman, portage, pppd, pthread-stubs, python, qt, radvd,
+	setserial, squashfs, usb_modeswith, wget,
+	xdriver_xf86-video-intel, xkeyboard-config, xlib_libX11,
+	xlib_libXfont, xlib_libXfontcache, xlib_libXxf86misc,
+	xlib_libpciaccess, xproto_dri2proto, xproto_eviext,
+	xproto_fontcacheproto, xproto_xf86miscproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/portage/Config.in b/package/portage/Config.in
index 27661cd..83778ff 100644
--- a/package/portage/Config.in
+++ b/package/portage/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PORTAGE
 	bool "portage"
 	select BR2_PACKAGE_PYTHON
+	depends on BR2_USE_WCHAR
 	help
 	  Portage, the Gentoo package management tool.
 
 	  http://www.gentoo.org/
+
+comment "portage requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/python/Config.in b/package/python/Config.in
index 6931eb7..e77d7aa 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,10 +1,14 @@
 config BR2_PACKAGE_PYTHON
 	bool "python"
+	depends on BR2_USE_WCHAR
 	help
 	  The python language interpreter.
 
 	  http://www.python.org/
 
+comment "python requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_PYTHON_DEV
 	depends on BR2_PACKAGE_PYTHON
 	bool "development files on target"
-- 
1.6.3.3
