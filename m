From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:11 +0200
Subject: [Buildroot] [01/37] package/x11r7/xproto_printproto: new package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although printproto is no longer provided with X.org
since 7.4 release [1], some packages may need it.

Add a dependency on xutil_util-macros [2].

[1] http://www.x.org/wiki/Releases/ModuleVersions
[2] https://www.archlinux.org/packages/extra/any/printproto

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/x11r7/Config.in                                |  1 +
 package/x11r7/xproto_printproto/Config.in              |  7 +++++++
 package/x11r7/xproto_printproto/xproto_printproto.hash |  2 ++
 package/x11r7/xproto_printproto/xproto_printproto.mk   | 16 ++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/x11r7/xproto_printproto/Config.in
 create mode 100644 package/x11r7/xproto_printproto/xproto_printproto.hash
 create mode 100644 package/x11r7/xproto_printproto/xproto_printproto.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 859e895..ed2b797 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -244,6 +244,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xproto_inputproto/Config.in
 		source package/x11r7/xproto_kbproto/Config.in
 		source package/x11r7/xproto_presentproto/Config.in
+		source package/x11r7/xproto_printproto/Config.in
 		source package/x11r7/xproto_randrproto/Config.in
 		source package/x11r7/xproto_recordproto/Config.in
 		source package/x11r7/xproto_renderproto/Config.in
diff --git a/package/x11r7/xproto_printproto/Config.in b/package/x11r7/xproto_printproto/Config.in
new file mode 100644
index 0000000..6b113ff
--- /dev/null
+++ b/package/x11r7/xproto_printproto/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XPROTO_PRINTPROTO
+	bool "printproto"
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	help
+	  X.Org Print protocol headers
+	  The printproto package provides the protocol headers for the
+	  xlib_libXp package.
diff --git a/package/x11r7/xproto_printproto/xproto_printproto.hash b/package/x11r7/xproto_printproto/xproto_printproto.hash
new file mode 100644
index 0000000..dd15904
--- /dev/null
+++ b/package/x11r7/xproto_printproto/xproto_printproto.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/pipermail/xorg/2011-January/052032.html
+sha1	4ddb7781ebc2418d681a6f5e16d777aed56ea35e	printproto-1.0.5.tar.bz2
diff --git a/package/x11r7/xproto_printproto/xproto_printproto.mk b/package/x11r7/xproto_printproto/xproto_printproto.mk
new file mode 100644
index 0000000..cc10051
--- /dev/null
+++ b/package/x11r7/xproto_printproto/xproto_printproto.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xproto_printproto
+#
+################################################################################
+
+XPROTO_PRINTPROTO_VERSION = 1.0.5
+XPROTO_PRINTPROTO_SOURCE = printproto-$(XPROTO_PRINTPROTO_VERSION).tar.bz2
+XPROTO_PRINTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_PRINTPROTO_LICENSE = MIT
+XPROTO_PRINTPROTO_LICENSE_FILES = COPYING
+XPROTO_PRINTPROTO_INSTALL_STAGING = YES
+XPROTO_PRINTPROTO_INSTALL_TARGET = NO
+XPROTO_PRINTPROTO_DEPENDENCIES = xutil_util-macros
+
+$(eval $(autotools-package))
-- 
2.4.3
