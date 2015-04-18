From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 14:40:43 +0200
Subject: [Buildroot] [PATCH 31/32]
	package/x11r7/xproto_xproxymanagementprotocol: new package
In-Reply-To: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429360844-12625-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429360844-12625-31-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/Config.in                                 |    1 +
 package/x11r7/xproto_xproxymanagementprotocol/Config.in |    5 +++++
 .../xproto_xproxymanagementprotocol.hash                |    2 ++
 .../xproto_xproxymanagementprotocol.mk                  |   15 +++++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/x11r7/xproto_xproxymanagementprotocol/Config.in
 create mode 100644 package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.hash
 create mode 100644 package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 85d73ef..f2f9e9c 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -256,6 +256,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xproto_xf86vidmodeproto/Config.in
 		source package/x11r7/xproto_xineramaproto/Config.in
 		source package/x11r7/xproto_xproto/Config.in
+		source package/x11r7/xproto_xproxymanagementprotocol/Config.in
 	endmenu
 	menu "X11R7 Utilities"
 		source package/x11r7/xutil_makedepend/Config.in
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/Config.in b/package/x11r7/xproto_xproxymanagementprotocol/Config.in
new file mode 100644
index 0000000..47ee876
--- /dev/null
+++ b/package/x11r7/xproto_xproxymanagementprotocol/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
+	bool "xproxymanagementprotocol"
+	help
+	  The Proxy Management Protocol is an ICE based protocol that provides a way
+	  for application servers to easily locate proxy services available to them.
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.hash b/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.hash
new file mode 100644
index 0000000..27a9dfa
--- /dev/null
+++ b/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2009-October/001150.html
+sha1	4abb036371670ecc25d32e48b3277fe203ae5203	xproxymanagementprotocol-1.0.3.tar.bz2
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk b/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
new file mode 100644
index 0000000..a48269a
--- /dev/null
+++ b/package/x11r7/xproto_xproxymanagementprotocol/xproto_xproxymanagementprotocol.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xproto_xproxymanagementprotocol
+#
+################################################################################
+
+XPROTO_XPROXYMANAGEMENTPROTOCOL_VERSION = 1.0.3
+XPROTO_XPROXYMANAGEMENTPROTOCOL_SOURCE = xproxymanagementprotocol-$(XPROTO_XPROXYMANAGEMENTPROTOCOL_VERSION).tar.bz2
+XPROTO_XPROXYMANAGEMENTPROTOCOL_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_XPROXYMANAGEMENTPROTOCOL_LICENSE = MIT
+XPROTO_XPROXYMANAGEMENTPROTOCOL_LICENSE_FILES = COPYING
+XPROTO_XPROXYMANAGEMENTPROTOCOL_INSTALL_STAGING = YES
+XPROTO_XPROXYMANAGEMENTPROTOCOL_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
-- 
1.7.10.4
