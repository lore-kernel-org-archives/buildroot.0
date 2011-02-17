From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Feb 2011 14:05:47 +0100
Subject: [Buildroot] [git commit master 1/1] package/x11r7: apply libtool
	patch where possible
Message-ID: <20110217130821.EB1148F5C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=68f166074bba01ea4abb9575a5578d662103904f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have libtool-2.2.x patch support, we can get rid of a bunch
of _LIBTOOL_PATH = NO, fixing (potential) cross link issues.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/libxcb.mk                     |    1 -
 package/x11r7/pthread-stubs/pthread-stubs.mk       |    1 -
 package/x11r7/xcb-util/xcb-util.mk                 |    1 -
 .../xdriver_xf86-input-acecad.mk                   |    1 -
 .../xdriver_xf86-input-aiptek.mk                   |    1 -
 .../xdriver_xf86-input-evdev.mk                    |    1 -
 .../xdriver_xf86-input-joystick.mk                 |    1 -
 .../xdriver_xf86-input-keyboard.mk                 |    1 -
 .../xdriver_xf86-input-mouse.mk                    |    1 -
 .../xdriver_xf86-input-synaptics.mk                |    1 -
 .../xdriver_xf86-input-void.mk                     |    1 -
 .../xdriver_xf86-video-chips.mk                    |    1 -
 .../xdriver_xf86-video-dummy.mk                    |    1 -
 .../xdriver_xf86-video-geode.mk                    |    1 -
 .../xdriver_xf86-video-glide.mk                    |    1 -
 .../xdriver_xf86-video-intel.mk                    |    1 -
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    1 -
 .../xdriver_xf86-video-wsfb.mk                     |    1 -
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    1 -
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    1 -
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    1 -
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    1 -
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    1 -
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    1 -
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    1 -
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    1 -
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    1 -
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    1 -
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    1 -
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    1 -
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    1 -
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    1 -
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    1 -
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    1 -
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 -
 35 files changed, 0 insertions(+), 35 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 5b6a7ca..a3c87d1 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -10,7 +10,6 @@ LIBXCB_SITE = http://xcb.freedesktop.org/dist/
 LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_AUTORECONF = NO
-LIBXCB_LIBTOOL_PATCH = NO
 LIBXCB_DEPENDENCIES = \
 	host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python
diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
index 3ee7ec1..75980c8 100644
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ b/package/x11r7/pthread-stubs/pthread-stubs.mk
@@ -7,7 +7,6 @@ PTHREAD_STUBS_VERSION = 0.3
 PTHREAD_STUBS_SOURCE = libpthread-stubs-$(PTHREAD_STUBS_VERSION).tar.bz2
 PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
 
-PTHREAD_STUBS_LIBTOOL_PATCH = NO
 PTHREAD_STUBS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package/x11r7,pthread-stubs))
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index b0dabd8..2983280 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -6,7 +6,6 @@
 XCB_UTIL_VERSION = 0.3.6
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
-XCB_UTIL_LIBTOOL_PATCH = NO
 XCB_UTIL_DEPENDENCIES = host-gperf
 
 $(eval $(call AUTOTARGETS,package/x11r7,xcb-util))
diff --git a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
index 0d615ca..d6f958c 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
+++ b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_INPUT_ACECAD_VERSION = 1.4.0
 XDRIVER_XF86_INPUT_ACECAD_SOURCE = xf86-input-acecad-$(XDRIVER_XF86_INPUT_ACECAD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_ACECAD_AUTORECONF = NO
-XDRIVER_XF86_INPUT_ACECAD_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-acecad))
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
index 0f03bb0..aa93fdc 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_INPUT_AIPTEK_VERSION = 1.3.0
 XDRIVER_XF86_INPUT_AIPTEK_SOURCE = xf86-input-aiptek-$(XDRIVER_XF86_INPUT_AIPTEK_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_AIPTEK_AUTORECONF = NO
-XDRIVER_XF86_INPUT_AIPTEK_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-aiptek))
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 49c5db2..bb5a1d7 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.3.0
 XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = NO
-XDRIVER_XF86_INPUT_EVDEV_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-evdev))
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index 9c0e230..f6d5619 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_INPUT_JOYSTICK_VERSION = 1.4.99.2
 XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JOYSTICK_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_JOYSTICK_AUTORECONF = NO
-XDRIVER_XF86_INPUT_JOYSTICK_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-joystick))
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index 2e68e5c..15b0715 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_INPUT_KEYBOARD_VERSION = 1.4.0
 XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KEYBOARD_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_KEYBOARD_AUTORECONF = NO
-XDRIVER_XF86_INPUT_KEYBOARD_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-keyboard))
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 4302db4..6be28c7 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.5.0
 XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = NO
-XDRIVER_XF86_INPUT_MOUSE_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-mouse))
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 9948d73..4cb16ea 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_INPUT_SYNAPTICS_VERSION = 1.2.0
 XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_SYNAPTICS_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_AUTORECONF = NO
-XDRIVER_XF86_INPUT_SYNAPTICS_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-synaptics))
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index 17f2a80..fb16bb7 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_INPUT_VOID_VERSION = 1.3.0
 XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VOID_AUTORECONF = NO
-XDRIVER_XF86_INPUT_VOID_LIBTOOL_PATCH = NO
 XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-void))
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
index a79b2dd..0dc5dd1 100644
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_VIDEO_CHIPS_VERSION = 1.2.2
 XDRIVER_XF86_VIDEO_CHIPS_SOURCE = xf86-video-chips-$(XDRIVER_XF86_VIDEO_CHIPS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CHIPS_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_CHIPS_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-chips))
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 8d3d8bf..2121748 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.2
 XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_DUMMY_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_DUMMY_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-dummy))
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index 03fd6d4..cd94246 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.6
 XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_GEODE_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-geode))
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index d626572..0115cec 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_VIDEO_GLIDE_VERSION = 1.0.3
 XDRIVER_XF86_VIDEO_GLIDE_SOURCE = xf86-video-glide-$(XDRIVER_XF86_VIDEO_GLIDE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLIDE_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_GLIDE_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-glide))
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 0fe2553..83d0a44 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.10.0
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_INTEL_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
 
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 39c53fa..9f969e5 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.15
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_NV_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-nv))
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index 389f9b6..e71715a 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -8,7 +8,6 @@ XDRIVER_XF86_VIDEO_WSFB_VERSION = 0.3.0
 XDRIVER_XF86_VIDEO_WSFB_SOURCE = xf86-video-wsfb-$(XDRIVER_XF86_VIDEO_WSFB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_WSFB_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_WSFB_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-wsfb))
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 0d2a480..99cb11b 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -8,7 +8,6 @@ XLIB_LIBICE_VERSION = 1.0.6
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.bz2
 XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_AUTORECONF = NO
-XLIB_LIBICE_LIBTOOL_PATCH = NO
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
 XLIB_LIBICE_CONF_OPT = --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 9c11c88..5aeb42d 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -8,7 +8,6 @@ XLIB_LIBSM_VERSION = 1.1.1
 XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
 XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBSM_AUTORECONF = NO
-XLIB_LIBSM_LIBTOOL_PATCH = NO
 XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPT = --enable-shared --disable-static --without-libuuid
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 9a88b03..ee45948 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -8,7 +8,6 @@ XLIB_LIBXSCRNSAVER_VERSION = 1.2.0
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.bz2
 XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSCRNSAVER_AUTORECONF = NO
-XLIB_LIBXSCRNSAVER_LIBTOOL_PATCH = NO
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
 XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index ad6a0e5..af4dde8 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -8,7 +8,6 @@ XLIB_LIBXAU_VERSION = 1.0.5
 XLIB_LIBXAU_SOURCE = libXau-$(XLIB_LIBXAU_VERSION).tar.bz2
 XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_AUTORECONF = NO
-XLIB_LIBXAU_LIBTOOL_PATCH = NO
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 XLIB_LIBXAU_CONF_OPT = --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index f8da364..abe823b 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -8,7 +8,6 @@ XLIB_LIBXCURSOR_VERSION = 1.1.10
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
 XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_AUTORECONF = NO
-XLIB_LIBXCURSOR_LIBTOOL_PATCH = NO
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 XLIB_LIBXCURSOR_CONF_OPT = --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index eef3a5e..1a11ea6 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -8,7 +8,6 @@ XLIB_LIBXDMCP_VERSION = 1.0.3
 XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.bz2
 XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_AUTORECONF = NO
-XLIB_LIBXDMCP_LIBTOOL_PATCH = NO
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 XLIB_LIBXDMCP_CONF_OPT = --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index a711247..c1da9c6 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -8,7 +8,6 @@ XLIB_LIBXI_VERSION = 1.3
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.bz2
 XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_AUTORECONF = NO
-XLIB_LIBXI_LIBTOOL_PATCH = NO
 XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index 37553a7..4c43e79 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -8,7 +8,6 @@ XLIB_LIBXINERAMA_VERSION = 1.1
 XLIB_LIBXINERAMA_SOURCE = libXinerama-$(XLIB_LIBXINERAMA_VERSION).tar.bz2
 XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXINERAMA_AUTORECONF = NO
-XLIB_LIBXINERAMA_LIBTOOL_PATCH = NO
 XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
 XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 4556c81..08fbaa4 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -8,7 +8,6 @@ XLIB_LIBXRANDR_VERSION = 1.3.0
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.bz2
 XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRANDR_AUTORECONF = NO
-XLIB_LIBXRANDR_LIBTOOL_PATCH = NO
 XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
 XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 38ebe1c..c1cdb15 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -8,7 +8,6 @@ XLIB_LIBXT_VERSION = 1.0.7
 XLIB_LIBXT_SOURCE = libXt-$(XLIB_LIBXT_VERSION).tar.bz2
 XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_AUTORECONF = YES
-XLIB_LIBXT_LIBTOOL_PATCH = NO
 XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static --disable-install-makestrs
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index e89cf11..935d034 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -7,7 +7,6 @@
 XLIB_LIBXTST_VERSION = 1.1.0
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
 XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXTST_LIBTOOL_PATCH = NO
 XLIB_LIBXTST_INSTALL_STAGING = YES
 
 XLIB_LIBXTST_DEPENDENCIES = \
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 72fb034..e2e3d15 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -8,7 +8,6 @@ XLIB_LIBXXF86DGA_VERSION = 1.1.1
 XLIB_LIBXXF86DGA_SOURCE = libXxf86dga-$(XLIB_LIBXXF86DGA_VERSION).tar.bz2
 XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_AUTORECONF = NO
-XLIB_LIBXXF86DGA_LIBTOOL_PATCH = NO
 XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
 XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index 90b88e1..b35c492 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -8,7 +8,6 @@ XLIB_LIBXXF86VM_VERSION = 1.1.0
 XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.bz2
 XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86VM_AUTORECONF = NO
-XLIB_LIBXXF86VM_LIBTOOL_PATCH = NO
 XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
 XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index 93da5b0..e7c7837 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -8,7 +8,6 @@ XLIB_LIBDMX_VERSION = 1.1.0
 XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
 XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBDMX_AUTORECONF = NO
-XLIB_LIBDMX_LIBTOOL_PATCH = NO
 XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
 XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index cc5cdf4..a2ba2d7 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -8,7 +8,6 @@ XLIB_LIBFONTENC_VERSION = 1.0.5
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
 XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_AUTORECONF = NO
-XLIB_LIBFONTENC_LIBTOOL_PATCH = NO
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 XLIB_LIBFONTENC_CONF_OPT = --enable-shared --disable-static
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 9bb1576..c42f35d 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -7,7 +7,6 @@
 XLIB_LIBPCIACCESS_VERSION = 0.11.0
 XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBPCIACCESS_LIBTOOL_PATCH = NO
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
 XLIB_LIBPCIACCESS_CONF_OPT = --enable-shared --disable-static
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 2cf5fb3..6dc1705 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -9,7 +9,6 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
 XSERVER_XORG_SERVER_AUTORECONF = NO
-XSERVER_XORG_SERVER_LIBTOOL_PATCH = NO
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 
-- 
1.7.3.4
