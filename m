From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 18:35:02 +0200
Subject: [Buildroot] [git commit]
	package/x11r7/xproto_xproxymanagementprotocol: new package
Message-ID: <20150418163741.EC59E7F8E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da7bd6ffbf1ebc2957a71d0782467fb64b5ed602
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - rewrap Config.in help text]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                            |    1 +
 .../xproto_xproxymanagementprotocol/Config.in      |    6 ++++++
 .../xproto_xproxymanagementprotocol.hash           |    2 ++
 .../xproto_xproxymanagementprotocol.mk             |   15 +++++++++++++++
 4 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 62cfd56..3cd63d5 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -255,6 +255,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xproto_xf86vidmodeproto/Config.in
 		source package/x11r7/xproto_xineramaproto/Config.in
 		source package/x11r7/xproto_xproto/Config.in
+		source package/x11r7/xproto_xproxymanagementprotocol/Config.in
 	endmenu
 	menu "X11R7 Utilities"
 		source package/x11r7/xutil_makedepend/Config.in
diff --git a/package/x11r7/xproto_xproxymanagementprotocol/Config.in b/package/x11r7/xproto_xproxymanagementprotocol/Config.in
new file mode 100644
index 0000000..bb31f03
--- /dev/null
+++ b/package/x11r7/xproto_xproxymanagementprotocol/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XPROTO_XPROXYMANAGEMENTPROTOCOL
+	bool "xproxymanagementprotocol"
+	help
+	  The Proxy Management Protocol is an ICE based protocol that
+	  provides a way for application servers to easily locate
+	  proxy services available to them.
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
