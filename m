From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:22:16 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
	new package
Message-ID: <20150315132247.1A5C0807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c5aca2961b50204c2d61a53919fb7f60723e713
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in                            |    1 +
 .../x11r7/xdriver_xf86-input-libinput/Config.in    |   13 +++++++++++++
 .../xdriver_xf86-input-libinput.hash               |    3 +++
 .../xdriver_xf86-input-libinput.mk                 |   14 ++++++++++++++
 4 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index f60c752..608837f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -146,6 +146,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-input-evdev/Config.in
 		source package/x11r7/xdriver_xf86-input-joystick/Config.in
 		source package/x11r7/xdriver_xf86-input-keyboard/Config.in
+		source package/x11r7/xdriver_xf86-input-libinput/Config.in
 		source package/x11r7/xdriver_xf86-input-mouse/Config.in
 		source package/x11r7/xdriver_xf86-input-synaptics/Config.in
 		source package/x11r7/xdriver_xf86-input-tslib/Config.in
diff --git a/package/x11r7/xdriver_xf86-input-libinput/Config.in b/package/x11r7/xdriver_xf86-input-libinput/Config.in
new file mode 100644
index 0000000..cc878b6
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-libinput/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_LIBINPUT
+	bool "xf86-input-libinput"
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_XPROTO_INPUTPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  This is an X driver based on libinput. It is a thin wrapper around
+	  libinput, so while it does provide all features that libinput supports
+	  it does little beyond.
+
+comment "xf86-input-libinput requires udev to be enabled"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
new file mode 100644
index 0000000..a07df47
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -0,0 +1,3 @@
+# From http://lists.x.org/archives/xorg-announce/2015-March/002540.html
+sha1	c2ec968847f85d7d503b12d63c2cc9697cbe0243				xf86-input-libinput-0.8.0.tar.bz2
+sha256	2152b0984feffe8151934ad9af29bde7fc621e0a54b0cdedbaf1abc367dea43a	xf86-input-libinput-0.8.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
new file mode 100644
index 0000000..ec788a2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# xdriver_xf86-input-libinput
+#
+################################################################################
+
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.8.0
+XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
+XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
+XDRIVER_XF86_INPUT_LIBINPUT_LICENSE_FILES = COPYING
+XDRIVER_XF86_INPUT_LIBINPUT_DEPENDENCIES = libinput xserver_xorg-server xproto_inputproto xproto_xproto
+
+$(eval $(autotools-package))
