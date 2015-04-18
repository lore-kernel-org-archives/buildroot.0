From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:41 +0200
Subject: [Buildroot] [PATCH 29/32] package/x11r7/xapp_xcompmgr: new package
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-29-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/Config.in                        |    1 +
 package/x11r7/xapp_xcompmgr/Config.in          |   10 ++++++++++
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash |    2 ++
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk   |   19 +++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/x11r7/xapp_xcompmgr/Config.in
 create mode 100644 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
 create mode 100644 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 106591f..85d73ef 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -90,6 +90,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xclipboard/Config.in
 		source package/x11r7/xapp_xclock/Config.in
 		source package/x11r7/xapp_xcmsdb/Config.in
+		source package/x11r7/xapp_xcompmgr/Config.in
 		source package/x11r7/xapp_xconsole/Config.in
 		source package/x11r7/xapp_xcursorgen/Config.in
 		source package/x11r7/xapp_xdbedizzy/Config.in
diff --git a/package/x11r7/xapp_xcompmgr/Config.in b/package/x11r7/xapp_xcompmgr/Config.in
new file mode 100644
index 0000000..f8c8c46
--- /dev/null
+++ b/package/x11r7/xapp_xcompmgr/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XAPP_XCOMPMGR
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	bool "xcompmgr"
+	help
+	  xcompmgr is a sample compositing manager that enables basic
+	  eye-candy effects.
diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
new file mode 100644
index 0000000..34c13c1
--- /dev/null
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002568.html
+sha256	c8049b1a2531313be7469ba9b198d334f0b91cc01efc2b20b9afcb117e4d6892	xcompmgr-1.1.7.tar.bz2
diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
new file mode 100644
index 0000000..918c1e5
--- /dev/null
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# xapp_xcompmgr
+#
+################################################################################
+
+XAPP_XCOMPMGR_VERSION = 1.1.7
+XAPP_XCOMPMGR_SOURCE = xcompmgr-$(XAPP_XCOMPMGR_VERSION).tar.bz2
+XAPP_XCOMPMGR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCOMPMGR_LICENSE = MIT
+XAPP_XCOMPMGR_LICENSE_FILES = COPYING
+XAPP_XCOMPMGR_DEPENDENCIES = \
+	xlib_libXcomposite \
+	xlib_libXdamage \
+	xlib_libXext \
+	xlib_libXfixes \
+	xlib_libXrender
+
+$(eval $(autotools-package))
-- 
1.7.10.4
