From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  1 Aug 2020 00:13:47 +0200
Subject: [Buildroot] [PATCH v2] package/wayland-utils: new package
Message-ID: <20200731221347.32389-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From [1] (for details see [2]):

This is first release of wayland-utils which only contains (for now)
wayland-info, a utility for displaying information about the Wayland
protocols supported by a Wayland compositor.

wayland-info is basically a standalone version of weston-info as found
in weston repository.

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-July/041565.html
[2] https://lists.freedesktop.org/archives/wayland-devel/2020-July/041520.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
 - remove explict wayland dependencies (dynamic, threads)
 - update project url
 - add DEVELOPERS entry
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/wayland-utils/Config.in          |  7 +++++++
 package/wayland-utils/wayland-utils.hash |  6 ++++++
 package/wayland-utils/wayland-utils.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/wayland-utils/Config.in
 create mode 100644 package/wayland-utils/wayland-utils.hash
 create mode 100644 package/wayland-utils/wayland-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9105626083..5cb143e70b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2061,6 +2061,7 @@ F:	package/python-gpiozero/
 F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
+F:	package/wayland-utils/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
diff --git a/package/Config.in b/package/Config.in
index 178b4da98a..ed045e0664 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1468,6 +1468,7 @@ menu "Graphics"
 	source "package/waffle/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
+	source "package/wayland-utils/Config.in"
 	source "package/waylandpp/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
diff --git a/package/wayland-utils/Config.in b/package/wayland-utils/Config.in
new file mode 100644
index 0000000000..3ff7f2efe9
--- /dev/null
+++ b/package/wayland-utils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_WAYLAND_UTILS
+	bool "wayland-utils"
+	depends on BR2_PACKAGE_WAYLAND # wayland-client, wayland-server
+	help
+	  Wayland utils (wayland-info).
+
+	  https://gitlab.freedesktop.org/ofourdan/wayland-utils
diff --git a/package/wayland-utils/wayland-utils.hash b/package/wayland-utils/wayland-utils.hash
new file mode 100644
index 0000000000..00b6da4033
--- /dev/null
+++ b/package/wayland-utils/wayland-utils.hash
@@ -0,0 +1,6 @@
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-July/041565.html
+md5  714875aefb10e7f683cde24e58d033ad  wayland-utils-1.0.0.tar.xz
+sha1  b5b8d498a892866d56ffbe862039d7c97acbe7bc  wayland-utils-1.0.0.tar.xz
+sha256  64fecc4c58e87ae9b302901abe10c2e8af69c7503c221a96ecd0700e0aa268c0  wayland-utils-1.0.0.tar.xz
+sha512  4c6f1822435b36b3acd361c0c54e56150e8a2697a9c4b2c20a149fcfaafe237e45807df3471884ddf594d89558001099e2d938e3f48988ba6950a0f1e3538db2  wayland-utils-1.0.0.tar.xz
+sha256  1eba39c11640014a5841dd3017e5245fc31f47e1cf43a3287a286dd6a8de8a1a  COPYING
diff --git a/package/wayland-utils/wayland-utils.mk b/package/wayland-utils/wayland-utils.mk
new file mode 100644
index 0000000000..9c4abe7b08
--- /dev/null
+++ b/package/wayland-utils/wayland-utils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# wayland-utils
+#
+################################################################################
+
+WAYLAND_UTILS_VERSION = 1.0.0
+WAYLAND_UTILS_SITE = http://wayland.freedesktop.org/releases
+WAYLAND_UTILS_SOURCE = wayland-utils-$(WAYLAND_UTILS_VERSION).tar.xz
+WAYLAND_UTILS_LICENSE = MIT
+WAYLAND_UTILS_LICENSE_FILES = COPYING
+WAYLAND_UTILS_DEPENDENCIES = host-pkgconf wayland
+
+$(eval $(meson-package))
-- 
2.27.0
