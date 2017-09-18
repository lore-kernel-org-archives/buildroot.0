From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Sep 2017 20:35:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.8.2
Message-ID: <20170918183537.30917-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes applied upstream.

Renamed configure option -event-gui to -debug-gui after upstream commit
https://cgit.freedesktop.org/wayland/libinput/commit/configure.ac?h=1.8-branch&id=a69294251df92e818f695cd2456c8eb860e02522

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libinput/libinput.hash | 7 +++++--
 package/libinput/libinput.mk   | 6 +++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 490131c3aa..4e64568ca3 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-May/034037.html
-sha256 0b1e5a6c106ccc609ccececd9e33e6b27c8b01fc7457ddb4c1dd266e780d6bc2  libinput-1.7.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2017-September/034949.html
+md5  e94e9aa765da9533c23b80b440638de9  libinput-1.8.2.tar.xz
+sha1 1c55462eb598b91c9c360f31170a408fb8d38d22  libinput-1.8.2.tar.xz
+sha256 013518ee0adb2287e6e1f08412efba2137320738cadb5399b783738f04cbab38  libinput-1.8.2.tar.xz
+sha512 555a7680cc8aaf62c5370a865f3aff0a933d42d94a3d8861c072666b02c9e1be45ea39de9a749a9575cdfb613b6150e412e18559d94d4919f21ca4680a3c76a7  libinput-1.8.2.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 4ecc2d14ac..f904b796b7 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.7.2
+LIBINPUT_VERSION = 1.8.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
@@ -15,10 +15,10 @@ LIBINPUT_LICENSE_FILES = COPYING
 LIBINPUT_CONF_OPTS = --disable-tests --disable-libwacom
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
-LIBINPUT_CONF_OPTS += --enable-event-gui
+LIBINPUT_CONF_OPTS += --enable-debug-gui
 LIBINPUT_DEPENDENCIES += libgtk3
 else
-LIBINPUT_CONF_OPTS += --disable-event-gui
+LIBINPUT_CONF_OPTS += --disable-debug-gui
 endif
 
 $(eval $(autotools-package))
-- 
2.11.0
