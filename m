From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jun 2018 13:08:39 +0200
Subject: [Buildroot] [PATCH v3 08/22] package/x11r7/xdriver_xf86-input-*:
 mass switch to xorgproto
In-Reply-To: <20180630110853.29339-1-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
Message-ID: <20180630110853.29339-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new package xorgproto will combine and replace all current xproto_*
packages. For details read
https://lists.x.org/archives/xorg-announce/2018-February/002835.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-input-evdev/Config.in             | 4 +---
 .../xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk     | 4 +---
 package/x11r7/xdriver_xf86-input-joystick/Config.in          | 4 +---
 .../xdriver_xf86-input-joystick.mk                           | 2 +-
 package/x11r7/xdriver_xf86-input-keyboard/Config.in          | 5 +----
 .../xdriver_xf86-input-keyboard.mk                           | 2 +-
 package/x11r7/xdriver_xf86-input-libinput/Config.in          | 3 +--
 .../xdriver_xf86-input-libinput.mk                           | 2 +-
 package/x11r7/xdriver_xf86-input-mouse/Config.in             | 4 +---
 .../xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk     | 2 +-
 package/x11r7/xdriver_xf86-input-synaptics/Config.in         | 4 +---
 .../xdriver_xf86-input-synaptics.mk                          | 2 +-
 package/x11r7/xdriver_xf86-input-tslib/Config.in             | 4 +---
 .../xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk     | 4 +---
 package/x11r7/xdriver_xf86-input-vmmouse/Config.in           | 4 +---
 .../xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk | 2 +-
 16 files changed, 16 insertions(+), 36 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index 70e950dc74..fe4e451ed7 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -3,9 +3,7 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_MTDEV
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Generic Linux input driver
 
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 4933c42fda..ded7fa77f1 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -15,10 +15,8 @@ XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = \
 	host-pkgconf \
 	libevdev \
 	mtdev \
-	xproto_inputproto \
+	xorgproto \
 	xserver_xorg-server \
-	xproto_randrproto \
-	xproto_xproto \
 	udev
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-joystick/Config.in b/package/x11r7/xdriver_xf86-input-joystick/Config.in
index ff9f25f549..892d1a161b 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/Config.in
+++ b/package/x11r7/xdriver_xf86-input-joystick/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK
 	bool "xf86-input-joystick"
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org driver for joystick input devices
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index 5bc2a5cafb..0ec4be5e53 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -9,7 +9,7 @@ XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JO
 XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE = MIT
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xorgproto
 XDRIVER_XF86_INPUT_JOYSTICK_AUTORECONF = YES
 
 define XDRIVER_XF86_INPUT_JOYSTICK_CONF
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/Config.in b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
index 0a0352424e..ee23033b97 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/Config.in
+++ b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
@@ -1,8 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
 	bool "xf86-input-keyboard"
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_KBPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  Keyboard input driver
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index 01a6859cd4..fb1e289643 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -9,7 +9,7 @@ XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KE
 XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_KEYBOARD_LICENSE = MIT
 XDRIVER_XF86_INPUT_KEYBOARD_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
+XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xorgproto
 XDRIVER_XF86_INPUT_KEYBOARD_CONF_OPTS = --disable-selective-werror
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-libinput/Config.in b/package/x11r7/xdriver_xf86-input-libinput/Config.in
index 0f2db1bd1a..0cfbfc664a 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/Config.in
+++ b/package/x11r7/xdriver_xf86-input-libinput/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_LIBINPUT
 	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_LIBINPUT
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  This is an X driver based on libinput. It is a thin wrapper
 	  around libinput, so while it does provide all features that
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 1723b3fcf8..8642806c8b 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -9,7 +9,7 @@ XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LI
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_LIBINPUT_DEPENDENCIES = libinput xserver_xorg-server xproto_inputproto xproto_xproto
+XDRIVER_XF86_INPUT_LIBINPUT_DEPENDENCIES = libinput xserver_xorg-server xorgproto
 XDRIVER_XF86_INPUT_LIBINPUT_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-mouse/Config.in b/package/x11r7/xdriver_xf86-input-mouse/Config.in
index 20e1803a99..efa181e556 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-mouse/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
 	bool "xf86-input-mouse"
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org driver for mouse input devices
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 5bcbeb70fd..88af9d2361 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -9,7 +9,7 @@ XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VE
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_MOUSE_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xorgproto
 XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
index ffe1a2a448..b974265b31 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/Config.in
+++ b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
 	bool "xf86-input-synaptics"
 	select BR2_PACKAGE_LIBEVDEV
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_MTDEV
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  X.Org driver for synaptics input devices
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 6bd9cc49c5..0708110e91 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -9,7 +9,7 @@ XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE = MIT
 XDRIVER_XF86_INPUT_SYNAPTICS_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = libevdev xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto mtdev
+XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = libevdev xserver_xorg-server xorgproto mtdev
 XDRIVER_XF86_INPUT_SYNAPTICS_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index 4e77abcb10..9205cba6bd 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_TSLIB
 	help
 	  Touch screen library input driver
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index bf0ee4860d..f8944f3521 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -10,10 +10,8 @@ XDRIVER_XF86_INPUT_TSLIB_SITE = https://github.com/merge/xf86-input-tslib/releas
 XDRIVER_XF86_INPUT_TSLIB_LICENSE = MIT
 XDRIVER_XF86_INPUT_TSLIB_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = \
-	xproto_inputproto \
 	xserver_xorg-server \
-	xproto_randrproto \
-	xproto_xproto \
+	xorgproto \
 	tslib
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
index de989eb34a..d77def028d 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
 	bool "xf86-input-vmmouse"
 	depends on BR2_i386 || BR2_x86_64
-	select BR2_PACKAGE_XPROTO_INPUTPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
+	select BR2_PACKAGE_XORGPROTO
 	help
 	  VMWare mouse input driver
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index 6e9cf8b785..b8c77de5f6 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -9,7 +9,7 @@ XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMO
 XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE = MIT
 XDRIVER_XF86_INPUT_VMMOUSE_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
+XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xorgproto
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XDRIVER_XF86_INPUT_VMMOUSE_CONF_OPTS += --with-libudev
-- 
2.17.1
