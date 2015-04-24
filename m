From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 24 Apr 2015 21:46:12 +0200
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xproto_printproto: new package
In-Reply-To: <1429904773-460-1-git-send-email-romain.naour@openwide.fr>
References: <1429904773-460-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1429904773-460-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although printproto is no longer provided with X.org
since 7.4 release [1], some packages may need it like
efl 1.13 package.

[1] http://www.x.org/wiki/Releases/ModuleVersions/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/x11r7/Config.in                                |  1 +
 package/x11r7/xproto_printproto/Config.in              |  6 ++++++
 package/x11r7/xproto_printproto/xproto_printproto.hash |  2 ++
 package/x11r7/xproto_printproto/xproto_printproto.mk   | 15 +++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/x11r7/xproto_printproto/Config.in
 create mode 100644 package/x11r7/xproto_printproto/xproto_printproto.hash
 create mode 100644 package/x11r7/xproto_printproto/xproto_printproto.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index ed212de..8c73b03 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -241,6 +241,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xproto_inputproto/Config.in
 		source package/x11r7/xproto_kbproto/Config.in
 		source package/x11r7/xproto_presentproto/Config.in
+		source package/x11r7/xproto_printproto/Config.in
 		source package/x11r7/xproto_randrproto/Config.in
 		source package/x11r7/xproto_recordproto/Config.in
 		source package/x11r7/xproto_renderproto/Config.in
diff --git a/package/x11r7/xproto_printproto/Config.in b/package/x11r7/xproto_printproto/Config.in
new file mode 100644
index 0000000..84a5a1a
--- /dev/null
+++ b/package/x11r7/xproto_printproto/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XPROTO_PRINTPROTO
+	bool "printproto"
+	help
+	  X.Org Print protocol headers
+	  Xprint extension to the X11 protocol - a portable,
+	  network-transparent printing system.
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
index 0000000..e616c0e
--- /dev/null
+++ b/package/x11r7/xproto_printproto/xproto_printproto.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# xproto_printproto -- X.Org Print protocol headers
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
+
+$(eval $(autotools-package))
-- 
1.9.3
