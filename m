From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:12 +0200
Subject: [Buildroot] [02/37] package/x11r7/xlib_libXp: new package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although xlib_libXp is no longer provided with X.org
since 7.4 release [1], some packages may need it.

[1] http://www.x.org/wiki/Releases/ModuleVersions

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/x11r7/Config.in                |  1 +
 package/x11r7/xlib_libXp/Config.in     | 11 +++++++++++
 package/x11r7/xlib_libXp/xlib_libXp.mk | 20 ++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/x11r7/xlib_libXp/Config.in
 create mode 100644 package/x11r7/xlib_libXp/xlib_libXp.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index ed2b797..7922a5b 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -40,6 +40,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXi/Config.in
 		source package/x11r7/xlib_libXinerama/Config.in
 		source package/x11r7/xlib_libXmu/Config.in
+		source package/x11r7/xlib_libXp/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
diff --git a/package/x11r7/xlib_libXp/Config.in b/package/x11r7/xlib_libXp/Config.in
new file mode 100644
index 0000000..e1060da
--- /dev/null
+++ b/package/x11r7/xlib_libXp/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XLIB_LIBXP
+	bool "libXp"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAU
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_PRINTPROTO
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	help
+	  X.Org Print Client Library
+	  libXp provides public APIs to allow client applications to render
+	  to non-display devices.
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
new file mode 100644
index 0000000..1fcb0f4
--- /dev/null
+++ b/package/x11r7/xlib_libXp/xlib_libXp.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# xlib_libXp
+#
+################################################################################
+
+XLIB_LIBXP_VERSION = 1.0.3
+XLIB_LIBXP_SOURCE = libXp-$(XLIB_LIBXP_VERSION).tar.bz2
+XLIB_LIBXP_SITE = http://xorg.freedesktop.org/releases/individual/lib/
+XLIB_LIBXP_LICENSE = MIT
+XLIB_LIBXP_LICENSE_FILES = COPYING
+XLIB_LIBXP_INSTALL_STAGING = YES
+XLIB_LIBXP_DEPENDENCIES = host-pkgconf \
+	xlib_libX11 \
+	xlib_libXau \
+	xlib_libXext \
+	xproto_printproto \
+	xutil_util-macros
+
+$(eval $(autotools-package))
-- 
2.4.3
