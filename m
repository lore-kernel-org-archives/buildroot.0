From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:44 +0200
Subject: [Buildroot] [PATCH 32/32] package/x11r7/xapp_xfindproxy: new package
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-32-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xapp_xfindproxy/Config.in            |    9 +++++++++
 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash |    2 ++
 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk   |   18 ++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/x11r7/xapp_xfindproxy/Config.in
 create mode 100644 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash
 create mode 100644 package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index f2f9e9c..d44b9a0 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -103,6 +103,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xapp_xeyes/Config.in
 		source package/x11r7/xapp_xf86dga/Config.in
 		source package/x11r7/xapp_xfd/Config.in
+		source package/x11r7/xapp_xfindproxy/Config.in
 		source package/x11r7/xapp_xfontsel/Config.in
 		source package/x11r7/xapp_xfs/Config.in
 		source package/x11r7/xapp_xfsinfo/Config.in
diff --git a/package/x11r7/xapp_xfindproxy/Config.in b/package/x11r7/xapp_xfindproxy/Config.in
new file mode 100644
index 0000000..1746fc0
--- /dev/null
+++ b/package/x11r7/xapp_xfindproxy/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XAPP_XFINDPROXY
+	bool "xfindproxy"
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
+	help
+	  xfindproxy utilizes the Proxy Management Protocol to communicate with
+	  a proxy manager to locate available X11 proxy services.
diff --git a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash
new file mode 100644
index 0000000..9263e46
--- /dev/null
+++ b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-April/002573.html
+sha256	5626bda27c7faa5cbe289a17f8552538fff08a96d542b85efdda1804ccf8a01f	xfindproxy-1.0.4.tar.bz2
diff --git a/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
new file mode 100644
index 0000000..7662a90
--- /dev/null
+++ b/package/x11r7/xapp_xfindproxy/xapp_xfindproxy.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# xapp_xfindproxy
+#
+################################################################################
+
+XAPP_XFINDPROXY_VERSION = 1.0.4
+XAPP_XFINDPROXY_SOURCE = xfindproxy-$(XAPP_XFINDPROXY_VERSION).tar.bz2
+XAPP_XFINDPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFINDPROXY_LICENSE = MIT
+XAPP_XFINDPROXY_LICENSE_FILES = COPYING
+XAPP_XFINDPROXY_DEPENDENCIES = \
+	xlib_libICE \
+	xlib_libXt \
+	xproto_xproto \
+	xproto_xproxymanagementprotocol
+
+$(eval $(autotools-package))
-- 
1.7.10.4
