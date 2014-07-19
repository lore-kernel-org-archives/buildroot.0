From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:26 +0200
Subject: [Buildroot] [PATCH 19/20 v3] package/xdriver_xf86-input-evdev:
	needs libudev, not a udev daemon
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <d1ad17451b73acdffb79bf48889346b290559347.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do as the comment says: it's only libudev that is required.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/x11r7/xdriver_xf86-input-evdev/Config.in                   | 5 +----
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk | 3 ++-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index 6ec14bf..92f0324 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -1,11 +1,8 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	bool "xf86-input-evdev"
-	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  Generic Linux input driver
-
-comment "xf86-input-evdev requires udev to be enabled"
-	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 46e62c7..f2d5aad 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -9,6 +9,7 @@ XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VE
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
 XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto udev
+XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server \
+					xproto_randrproto xproto_xproto libudev
 
 $(eval $(autotools-package))
-- 
1.9.1
