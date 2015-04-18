From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:40 +0200
Subject: [Buildroot] [PATCH 28/32] package/x11r7/xlib_libXpresent: new
	package
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-28-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xlib_libXpresent/Config.in           |   14 +++++++++++++
 .../x11r7/xlib_libXpresent/xlib_libXpresent.hash   |    2 ++
 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk |   22 ++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/x11r7/xlib_libXpresent/Config.in
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
 create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 572963c..106591f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -41,6 +41,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXinerama/Config.in
 		source package/x11r7/xlib_libXmu/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
+		source package/x11r7/xlib_libXpresent/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
 		source package/x11r7/xlib_libXres/Config.in
diff --git a/package/x11r7/xlib_libXpresent/Config.in b/package/x11r7/xlib_libXpresent/Config.in
new file mode 100644
index 0000000..f9cad60
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XLIB_LIBXPRESENT
+	bool "libXpresent"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X Present Extension C Library
+	  This package contains header files and documentation for the Present
+	  extension.  Library and server implementations are separate.
+
+	  http://xorg.freedesktop.org
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
new file mode 100644
index 0000000..66b30e1
--- /dev/null
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002584.html
+sha256	c11ae015141a9afbe10f4f2b8ee00b11adca6373dc1b9808d7c6c138b2da7b8a	libXpresent-1.0.0.tar.bz2
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
new file mode 100644
index 0000000..2adefdf
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
+XLIB_LIBXPRESENT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPRESENT_LICENSE = MIT
+XLIB_LIBXPRESENT_LICENSE_FILES = COPYING
+XLIB_LIBXPRESENT_INSTALL_STAGING = YES
+XLIB_LIBXPRESENT_DEPENDENCIES = \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXfixes \
+	xlib_libXrandr \
+	xproto_presentproto \
+	xproto_xproto
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
