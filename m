From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:33 +0200
Subject: [Buildroot] [PATCH 10/30] xproto_dri3proto: New package
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <27fe132768eb949d2bc98228cdc85f44546dba9d.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

This package does not install any binary files, only headers.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xproto_dri3proto/Config.in           |  4 ++++
 package/x11r7/xproto_dri3proto/xproto_dri3proto.mk | 16 ++++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/x11r7/xproto_dri3proto/Config.in
 create mode 100644 package/x11r7/xproto_dri3proto/xproto_dri3proto.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 8685ca1..087b816 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -227,6 +227,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xproto_damageproto/Config.in
 		source package/x11r7/xproto_dmxproto/Config.in
 		source package/x11r7/xproto_dri2proto/Config.in
+		source package/x11r7/xproto_dri3proto/Config.in
 		source package/x11r7/xproto_fixesproto/Config.in
 		source package/x11r7/xproto_fontcacheproto/Config.in
 		source package/x11r7/xproto_fontsproto/Config.in
diff --git a/package/x11r7/xproto_dri3proto/Config.in b/package/x11r7/xproto_dri3proto/Config.in
new file mode 100644
index 0000000..eead7d4
--- /dev/null
+++ b/package/x11r7/xproto_dri3proto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_DRI3PROTO
+	bool "dri3proto"
+	help
+	  X.Org DRI3 protocol headers
diff --git a/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk b/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
new file mode 100644
index 0000000..9aea458
--- /dev/null
+++ b/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xproto_dri3proto
+#
+################################################################################
+
+XPROTO_DRI3PROTO_VERSION = 1.0
+XPROTO_DRI3PROTO_SOURCE = dri3proto-$(XPROTO_DRI3PROTO_VERSION).tar.bz2
+XPROTO_DRI3PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_DRI3PROTO_LICENSE = MIT
+XPROTO_DRI3PROTO_LICENSE_FILES = COPYING
+XPROTO_DRI3PROTO_INSTALL_STAGING = YES
+# this package does not contain any binary files
+XPROTO_DRI3PROTO_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
-- 
1.8.3.2
