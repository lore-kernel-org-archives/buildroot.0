From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 00:02:34 +0200
Subject: [Buildroot] [git commit branch/next] xproto_dri3proto: New package
Message-ID: <20140525220301.68DEB9CDAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=211312b8ec05641292cfb96166c81dbfec0cb9da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package does not install any binary files, only headers.

[Peter: drop invalid license file]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xproto_dri3proto/Config.in           |    4 ++++
 package/x11r7/xproto_dri3proto/xproto_dri3proto.mk |   15 +++++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)

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
index 0000000..bdbff74
--- /dev/null
+++ b/package/x11r7/xproto_dri3proto/xproto_dri3proto.mk
@@ -0,0 +1,15 @@
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
+XPROTO_DRI3PROTO_INSTALL_STAGING = YES
+# this package does not contain any binary files
+XPROTO_DRI3PROTO_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
