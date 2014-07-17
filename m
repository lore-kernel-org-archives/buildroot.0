From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Jul 2014 07:42:53 +0200
Subject: [Buildroot] [PATCH 1/8] xlib_libxshmfence: New package
In-Reply-To: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405575780-26496-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for DRI3 support in mesa3d:

configure: error: Package requirements (x11 xext xdamage xfixes x11-xcb xcb-glx >= 1.8.1
 xcb-dri2 >= 1.8 xcb-dri3 xcb-present xcb-sync xshmfence >= 1.1) were not met:

Package xshmfence was not found in the pkg-config search path.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/Config.in                              |    1 +
 package/x11r7/xlib_libxshmfence/Config.in            |    5 +++++
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk |   15 +++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/x11r7/xlib_libxshmfence/Config.in
 create mode 100644 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 087b816..1979a13 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -50,6 +50,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libdmx/Config.in
 		source package/x11r7/xlib_libfontenc/Config.in
 		source package/x11r7/xlib_libxkbfile/Config.in
+		source package/x11r7/xlib_libxshmfence/Config.in
 		source package/x11r7/xlib_xtrans/Config.in
 		source package/x11r7/xlib_libpciaccess/Config.in
 	endmenu
diff --git a/package/x11r7/xlib_libxshmfence/Config.in b/package/x11r7/xlib_libxshmfence/Config.in
new file mode 100644
index 0000000..d0595f6
--- /dev/null
+++ b/package/x11r7/xlib_libxshmfence/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XLIB_LIBXSHMFENCE
+	bool "libxshmfence"
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org shmfence library
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
new file mode 100644
index 0000000..f0fb90f
--- /dev/null
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xlib_libxshmfence
+#
+################################################################################
+
+XLIB_LIBXSHMFENCE_VERSION = 1.1
+XLIB_LIBXSHMFENCE_SOURCE = libxshmfence-$(XLIB_LIBXSHMFENCE_VERSION).tar.bz2
+XLIB_LIBXSHMFENCE_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXSHMFENCE_LICENSE = MIT
+XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
+XLIB_LIBXSHMFENCE_INSTALL_STAGING = YES
+XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xproto_xproto
+
+$(eval $(autotools-package))
-- 
1.7.10.4
