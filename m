From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 23:02:03 +0200
Subject: [Buildroot] [git commit] package/x11vnc: add dependency on
	libvncserver
Message-ID: <20170430210214.B4DBB7FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61d0a65557d7c269d563962ca03b04c4d7c62a92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

x11vnc needs libvncserver, so select it explicitely.

Fixes:

  http://autobuild.buildroot.net/results/34f8045e772b96293cc7d25bd61ac0aa5842824f/

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11vnc/Config.in | 2 ++
 package/x11vnc/x11vnc.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 0909b9a..9e91a11 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_nios2 # libvncserver
+	select BR2_PACKAGE_LIBVNCSERVER
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXTST
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 9233b70..f1f4da2 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -9,7 +9,7 @@ X11VNC_SITE = $(call github,LibVNC,x11vnc,$(X11VNC_VERSION))
 # sdl support is not used in x11vnc, but host include / library search paths
 # leak in if host has sdl-config
 X11VNC_CONF_OPTS = --without-sdl
-X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
+X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
 
