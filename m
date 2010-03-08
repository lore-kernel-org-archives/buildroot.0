From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Add dri2proto 2.1
Message-ID: <20100308133619.D54A7776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e99c060399c34112d9fcda363ab0851d04b239b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xproto_dri2proto/Config.in           |    5 +++++
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |   14 ++++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/xproto_dri2proto/Config.in
 create mode 100644 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 9a5a564..a457b9f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -290,6 +290,7 @@ endmenu
 		source package/x11r7/xproto_compositeproto/Config.in
 		source package/x11r7/xproto_damageproto/Config.in
 		source package/x11r7/xproto_dmxproto/Config.in
+		source package/x11r7/xproto_dri2proto/Config.in
 		source package/x11r7/xproto_evieext/Config.in
 		source package/x11r7/xproto_fixesproto/Config.in
 		source package/x11r7/xproto_fontcacheproto/Config.in
diff --git a/package/x11r7/xproto_dri2proto/Config.in b/package/x11r7/xproto_dri2proto/Config.in
new file mode 100644
index 0000000..4ab5ccd
--- /dev/null
+++ b/package/x11r7/xproto_dri2proto/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XPROTO_DRI2PROTO
+	bool "dri2proto"
+	help
+	  dri2proto 2.1
+	  X.Org DRI2 protocol headers
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
new file mode 100644
index 0000000..2d7de30
--- /dev/null
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xproto_dri2proto -- X.Org DRI2 protocol headers
+#
+################################################################################
+
+XPROTO_DRI2PROTO_VERSION = 2.1
+XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
+XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_DRI2PROTO_AUTORECONF = NO
+XPROTO_DRI2PROTO_INSTALL_STAGING = YES
+XPROTO_DRI2PROTO_INSTALL_TARGET = NO
+
+$(eval $(call AUTOTARGETS,package/x11r7,xproto_dri2proto))
-- 
1.6.3.3
