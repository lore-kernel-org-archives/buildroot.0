From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:34:41 +0100
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-input-evdev: bump version to 2.9.1
Message-ID: <20150214143823.8F27A80172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bc6c3aabe9d3c9592754e0c49a2d476473b5754
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Package now needs libevdev:
http://cgit.freedesktop.org/xorg/driver/xf86-input-evdev/commit/?id=164c62a97591d4c9b649460e7442977ea82ac02b

[Thomas: adapt to current master, update hash file.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    1 +
 .../xdriver_xf86-input-evdev.hash                  |    4 ++--
 .../xdriver_xf86-input-evdev.mk                    |    3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index 6ec14bf..f44e79f 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	bool "xf86-input-evdev"
 	depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
+	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_XPROTO_INPUTPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
index fb46aca..ea5233e 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/xorg/2014-May/056599.html
-sha256 85fade9f5e9cf70f02c877165e95b3df4cdb9e08282416122ca80218e254100c  xf86-input-evdev-2.8.4.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2014-November/002499.html
+sha256 0ce30328adfeac90a6f4b508d992fb834d8e50b484b29d3d58cf6683fa8502f9  xf86-input-evdev-2.9.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index edf2d48..5f029a2 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.8.4
+XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.9.1
 XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
 XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = \
 	host-pkgconf \
+	libevdev \
 	xproto_inputproto \
 	xserver_xorg-server \
 	xproto_randrproto \
