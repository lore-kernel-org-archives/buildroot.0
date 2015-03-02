From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:17 -0000
Subject: [Buildroot] [git commit] package/x11r7/libepoxy: New package
Message-ID: <20150302222716.78FAB807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ac0250cc6f1522f7b8de65b538e3882b11c0a6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xdriver_xf86-video-ati needs glamor support from xserver_xorg-server,
which in turn depends on libepoxy.

[Thomas: add license information.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/Config.in            |    1 +
 package/x11r7/libepoxy/Config.in   |    7 +++++++
 package/x11r7/libepoxy/libepoxy.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 2fd1ff0..f60c752 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -15,6 +15,7 @@ if BR2_PACKAGE_XORG7
 	endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
+		source package/x11r7/libepoxy/Config.in
 		source package/x11r7/xcb-util/Config.in
 		source package/x11r7/xcb-util-image/Config.in
 		source package/x11r7/xcb-util-keysyms/Config.in
diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
new file mode 100644
index 0000000..c4f5794
--- /dev/null
+++ b/package/x11r7/libepoxy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBEPOXY
+	bool "epoxy"
+	depends on BR2_PACKAGE_MESA3D
+	help
+	  Epoxy is a library for handling OpenGL function pointer management for you.
+
+	  https://github.com/anholt/libepoxy
diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
new file mode 100644
index 0000000..9858cfe
--- /dev/null
+++ b/package/x11r7/libepoxy/libepoxy.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libepoxy
+#
+#################################################################################
+
+LIBEPOXY_VERSION = v1.2
+LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
+LIBEPOXY_INSTALL_STAGING = YES
+LIBEPOXY_AUTORECONF = YES
+LIBEPOXY_DEPENDENCIES = mesa3d
+LIBEPOXY_LICENSE = MIT
+LIBEPOXY_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
