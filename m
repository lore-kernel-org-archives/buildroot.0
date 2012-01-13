From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 Jan 2012 11:42:54 +0100
Subject: [Buildroot] [git commit] Adding xf86-input-tslib driver
Message-ID: <20120113104927.57EF49031E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a9d3bc0c320614c8d831d77d9c28a7b90ad21da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding xf86-input-tslib driver so X11 can talk directly to
touchscreen devices.

[Peter: Add tslib deps and upstream URL]
Signed-off-by: Sergio Prado <sergiosiena@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xdriver_xf86-input-tslib/Config.in   |   11 +++++++++++
 .../xdriver_xf86-input-tslib.mk                    |   17 +++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

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
index 0000000..5185273
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
+	bool "xf86-input-tslib"
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_TSLIB
+	help
+	  Touch screen library input driver
+
+	  http://www.ptxdist.org/software/xf86-input-tslib/index_en.html
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
new file mode 100644
index 0000000..eaf8f2a
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# xdriver_xf86-input-tslib -- Touch screen library input driver
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
+XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_TSLIB_SITE = http://www.ptxdist.org/software/xf86-input-tslib/download
+XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = \
+	xproto_inputproto \
+	xserver_xorg-server \
+	xproto_randrproto \
+	xproto_xproto \
+	tslib
+
+$(eval $(call AUTOTARGETS))
