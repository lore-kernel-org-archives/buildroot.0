From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 23:23:57 +0100
Subject: [Buildroot] [git commit] New package: xinput-calibrator
Message-ID: <20111211222423.02A188F8CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6ec7ae656aaf629f1fc96c6ae27bbb8376e63b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xapp_xinput_calibrator/Config.in     |    9 +++++++++
 .../xapp_xinput-calibrator.mk                      |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index c0c0043..50816f2 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -129,6 +129,7 @@ endmenu
 		source package/x11r7/xapp_xhost/Config.in
 		source package/x11r7/xapp_xinit/Config.in
 		source package/x11r7/xapp_xinput/Config.in
+		source package/x11r7/xapp_xinput_calibrator/Config.in
 		source package/x11r7/xapp_xkbcomp/Config.in
 		source package/x11r7/xapp_xkbevd/Config.in
 		source package/x11r7/xapp_xkbprint/Config.in
diff --git a/package/x11r7/xapp_xinput_calibrator/Config.in b/package/x11r7/xapp_xinput_calibrator/Config.in
new file mode 100644
index 0000000..47c607c
--- /dev/null
+++ b/package/x11r7/xapp_xinput_calibrator/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR
+	bool "xinput-calibrator"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXI
+	help
+	  A generic touchscreen calibration program for X.Org.
+
+	  http://www.freedesktop.org/wiki/Software/xinput_calibrator
+
diff --git a/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
new file mode 100644
index 0000000..f84d1c2
--- /dev/null
+++ b/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# xapp_xinput-calibrator
+#
+################################################################################
+
+XAPP_XINPUT_CALIBRATOR_VERSION = 0.7.5
+XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSION).tar.gz
+XAPP_XINPUT_CALIBRATOR_SITE = http://github.com/downloads/tias/xinput_calibrator
+XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
+
+$(eval $(call AUTOTARGETS))
