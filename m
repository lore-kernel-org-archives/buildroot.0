From: Sergio Prado <sergiosiena@gmail.com>
Date: Sat, 24 Dec 2011 14:51:04 -0200
Subject: [Buildroot] [PATCH] Adding xf86-input-tslib driver
Message-ID: <1324745464-10155-1-git-send-email-sergiosiena@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding xf86-input-tslib driver so X11 can talk directly to 
touchscreen devices.

Signed-off-by: Sergio Prado <sergiosiena@gmail.com>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xdriver_xf86-input-tslib/Config.in   |    8 ++++++++
 .../xdriver_xf86-input-tslib.mk                    |   12 ++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-input-tslib/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 50816f2..664226f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -174,6 +174,7 @@ endmenu
 		source package/x11r7/xdriver_xf86-input-keyboard/Config.in
 		source package/x11r7/xdriver_xf86-input-mouse/Config.in
 		source package/x11r7/xdriver_xf86-input-synaptics/Config.in
+		source package/x11r7/xdriver_xf86-input-tslib/Config.in
 		source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
 		source package/x11r7/xdriver_xf86-input-void/Config.in
 		source package/x11r7/xdriver_xf86-video-apm/Config.in
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
new file mode 100644
index 0000000..4c3f719
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
+	bool "xf86-input-tslib"
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  Touch screen library input driver
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
new file mode 100644
index 0000000..eb550c2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xdriver_xf86-input-tslib -- Touch screen library input driver
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
+XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_TSLIB_SITE = http://www.ptxdist.org/software/xf86-input-tslib/download
+XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.1
