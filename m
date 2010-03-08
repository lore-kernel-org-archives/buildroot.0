From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-input-synaptics to 1.2.0
Message-ID: <20100308133624.5B958776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f54ca4a4ca9c676aaf349563a04397ef58803c3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 .../x11r7/xdriver_xf86-input-synaptics/Config.in   |    2 +-
 ...ver_xf86-input-synaptics-0.15.0-configure.patch |    8 --------
 .../xdriver_xf86-input-synaptics.mk                |    3 ++-
 3 files changed, 3 insertions(+), 10 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics-0.15.0-configure.patch

diff --git a/package/x11r7/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
index 66af793..9b5da84 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/Config.in
+++ b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-input-synaptics 0.14.7
+	  xf86-input-synaptics 1.2.0
 	  X.Org driver for synaptics input devices
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics-0.15.0-configure.patch b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics-0.15.0-configure.patch
deleted file mode 100644
index 524af1d..0000000
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics-0.15.0-configure.patch
+++ /dev/null
@@ -1,8 +0,0 @@
-diff -Nwrup xfree86-driver-synaptics_0.15.0.orig/configure xdriver_xf86-input-synaptics-0.15.0/configure
---- a/.stamp_configured	1969-12-31 19:00:00.000000000 -0500
-+++ b/.stamp_configured	2008-06-23 11:01:16.000000000 -0400
-@@ -0,0 +1,4 @@
-+#!/bin/sh
-+
-+echo "Dummy configure"
-+ 
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 9146ba6..387d6b4 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 0.15.0
+XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.2.0
 XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_AUTORECONF = NO
+XDRIVER_XF86_INPUT_SYNAPTICS_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 XDRIVER_XF86_INPUT_SYNAPTICS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
