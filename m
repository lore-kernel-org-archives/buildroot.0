From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:13 +0200
Subject: [Buildroot] [03/37] package/x11r7/xlib_libXpresent: new package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

[Romain:
  - update the help text with the one from:
    https://ftp-master.debian.org/new/libxpresent_1.0.0-1.html
  - add host-pkgconf dependency]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xlib_libXpresent/Config.in           | 19 +++++++++++++++++++
 .../x11r7/xlib_libXpresent/xlib_libXpresent.hash   |  4 ++++
 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk | 22 ++++++++++++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 package/x11r7/xlib_libXpresent/Config.in
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 7922a5b..d25e5bc 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -42,6 +42,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXmu/Config.in
 		source package/x11r7/xlib_libXp/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
+		source package/x11r7/xlib_libXpresent/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
 		source package/x11r7/xlib_libXres/Config.in
diff --git a/package/x11r7/xlib_libXpresent/Config.in b/package/x11r7/xlib_libXpresent/Config.in
new file mode 100644
index 0000000..8da839e
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_XLIB_LIBXPRESENT
+	bool "libXpresent"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X11 Present extension library
+	  libXpresent provides an X Window System client interface to the
+	  Present extension to the X protocol. The Present extension
+	  provides a way for applications to update their window contents
+	  from a pixmap in a well defined fashion, synchronizing with the
+	  display refresh and potentially using a more efficient mechanism
+	  than copying the contents of the source pixmap.
+
+	  More information about X.Org can be found at:
+	  <URL:http://www.X.org>
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
new file mode 100644
index 0000000..9d057c0
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
@@ -0,0 +1,4 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002584.html
+md5	edd87ac15bb666081898dd7382fcbff5	libXpresent-1.0.0.tar.bz2
+sha1	8893cca785dc94f4a001b53f4308588ff6c3900a	libXpresent-1.0.0.tar.bz2
+sha256	c11ae015141a9afbe10f4f2b8ee00b11adca6373dc1b9808d7c6c138b2da7b8a	libXpresent-1.0.0.tar.bz2
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
new file mode 100644
index 0000000..5f8f546
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# xlib_libXpresent
+#
+################################################################################
+
+XLIB_LIBXPRESENT_VERSION = 1.0.0
+XLIB_LIBXPRESENT_SOURCE = libXpresent-$(XLIB_LIBXPRESENT_VERSION).tar.bz2
+XLIB_LIBXPRESENT_SITE = http://xorg.freedesktop.org/archive/individual/lib
+XLIB_LIBXPRESENT_LICENSE = MIT
+XLIB_LIBXPRESENT_LICENSE_FILES = COPYING
+XLIB_LIBXPRESENT_INSTALL_STAGING = YES
+XLIB_LIBXPRESENT_DEPENDENCIES = \
+	host-pkgconf \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXfixes \
+	xlib_libXrandr \
+	xproto_presentproto \
+	xproto_xproto
+
+$(eval $(autotools-package))
-- 
2.4.3
