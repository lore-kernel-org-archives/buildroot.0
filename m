From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:32:23 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcompmgr: new package
Message-ID: <20150418163311.EDC627FCDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=194d7c531b613e4f04981a6319fc81664b257a61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                        |    1 +
 package/x11r7/xapp_xcompmgr/Config.in          |   10 ++++++++++
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash |    2 ++
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk   |   19 +++++++++++++++++++
 4 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 572963c..62cfd56 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -89,6 +89,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xclipboard/Config.in
 		source package/x11r7/xapp_xclock/Config.in
 		source package/x11r7/xapp_xcmsdb/Config.in
+		source package/x11r7/xapp_xcompmgr/Config.in
 		source package/x11r7/xapp_xconsole/Config.in
 		source package/x11r7/xapp_xcursorgen/Config.in
 		source package/x11r7/xapp_xdbedizzy/Config.in
diff --git a/package/x11r7/xapp_xcompmgr/Config.in b/package/x11r7/xapp_xcompmgr/Config.in
new file mode 100644
index 0000000..a2e1db5
--- /dev/null
+++ b/package/x11r7/xapp_xcompmgr/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_XAPP_XCOMPMGR
+	bool "xcompmgr"
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
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
