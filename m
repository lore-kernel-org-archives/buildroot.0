From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 13 Dec 2013 09:13:32 +0100
Subject: [Buildroot] [PATCH] xconsole: add new package
Message-ID: <1386922412-6662-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/Config.in                      |    1 +
 package/x11r7/xapp_xconsole/Config.in        |    9 +++++++++
 package/x11r7/xapp_xconsole/xapp_xconsole.mk |   15 +++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/xapp_xconsole/Config.in
 create mode 100644 package/x11r7/xapp_xconsole/xapp_xconsole.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 15e2f8b..fe0674c 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -88,6 +88,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xclipboard/Config.in
 		source package/x11r7/xapp_xclock/Config.in
 		source package/x11r7/xapp_xcmsdb/Config.in
+		source package/x11r7/xapp_xconsole/Config.in
 		source package/x11r7/xapp_xcursorgen/Config.in
 		source package/x11r7/xapp_xdbedizzy/Config.in
 		source package/x11r7/xapp_xditview/Config.in
diff --git a/package/x11r7/xapp_xconsole/Config.in b/package/x11r7/xapp_xconsole/Config.in
new file mode 100644
index 0000000..7863afd
--- /dev/null
+++ b/package/x11r7/xapp_xconsole/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XAPP_XCONSOLE
+	bool "xconsole"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XLIB_LIBXMU
+	help
+	  xconsole - monitor system console messages with X
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
new file mode 100644
index 0000000..b04b737
--- /dev/null
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xapp_xconsole
+#
+################################################################################
+
+XAPP_XCONSOLE_VERSION = 1.0.6
+XAPP_XCONSOLE_SOURCE = xconsole-$(XAPP_XCONSOLE_VERSION).tar.bz2
+XAPP_XCONSOLE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCONSOLE_LICENSE = MIT
+XAPP_XCONSOLE_LICENSE_FILES = COPYING
+XAPP_XCONSOLE_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXt xproto_xproto \
+			     xlib_libXmu
+
+$(eval $(autotools-package))
-- 
1.7.7
