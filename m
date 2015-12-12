From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 13:52:22 +0100
Subject: [Buildroot] [git commit] driver_xf86-input-evdev: mtdev is
	mandatory now
Message-ID: <20151212125226.9372D807ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3e3dd67e79160504f4d220c05bcfc460873c9af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mtdev is no longer optional, so select it and depend upon it, otherwise
it leads to build failure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-input-evdev/Config.in                   | 1 +
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index f44e79f..70e950d 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	bool "xf86-input-evdev"
 	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
 	select BR2_PACKAGE_LIBEVDEV
+	select BR2_PACKAGE_MTDEV
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 1e90afa..6f692ab 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -12,11 +12,11 @@ XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = \
 	host-pkgconf \
 	libevdev \
+	mtdev \
 	xproto_inputproto \
 	xserver_xorg-server \
 	xproto_randrproto \
 	xproto_xproto \
-	udev \
-	$(if $(BR2_PACKAGE_MTDEV),mtdev)
+	udev
 
 $(eval $(autotools-package))
