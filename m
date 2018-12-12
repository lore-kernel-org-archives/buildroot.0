From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Wed, 12 Dec 2018 13:35:21 +0800
Subject: [Buildroot] [PATCH 1/1] package/libinput: bump to version 1.12.3
Message-ID: <1544592921-10002-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 4e64568..3ead0f0 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-September/034949.html
-md5  e94e9aa765da9533c23b80b440638de9  libinput-1.8.2.tar.xz
-sha1 1c55462eb598b91c9c360f31170a408fb8d38d22  libinput-1.8.2.tar.xz
-sha256 013518ee0adb2287e6e1f08412efba2137320738cadb5399b783738f04cbab38  libinput-1.8.2.tar.xz
-sha512 555a7680cc8aaf62c5370a865f3aff0a933d42d94a3d8861c072666b02c9e1be45ea39de9a749a9575cdfb613b6150e412e18559d94d4919f21ca4680a3c76a7  libinput-1.8.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2018-November/039620.html
+md5  083d6bf311d5e1e3a62440dc634bb8f0  libinput-1.12.3.tar.xz
+sha1 0b0b1285589bbe9924af81959ae1e6204e1c8a00  libinput-1.12.3.tar.xz
+sha256 f266ff861a2e7a97e1402c4345e3547b900efde68adbd40e56403e2617fee255  libinput-1.12.3.tar.xz
+sha512 cdc512cb53442ae85d5a23e10db9dd3548bcca0de24d7fcc48954a60773563d84d9b10278b6a693ade95d0789bb5d42bbb8b7cf1c178fe85401cb09a5402ff02  libinput-1.12.3.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index f904b79..28eda28 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.8.2
+LIBINPUT_VERSION = 1.12.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
@@ -12,13 +12,13 @@ LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
 # Tests need fork, so just disable them everywhere.
-LIBINPUT_CONF_OPTS = --disable-tests --disable-libwacom
+LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
-LIBINPUT_CONF_OPTS += --enable-debug-gui
+LIBINPUT_CONF_OPTS += -Ddebug-gui=true
 LIBINPUT_DEPENDENCIES += libgtk3
 else
-LIBINPUT_CONF_OPTS += --disable-debug-gui
+LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.7.4
