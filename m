From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 21:50:49 +0100
Subject: [Buildroot] [git commit branch/next] xdriver_xf86-input-evdev:
	needs host-pkgconf
Message-ID: <20150212205752.AEDDA81790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69cf5f5ff70873d700ad7332c37e0a5c8e0ed509
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The configure script uses PKG_CHECK_MODULES, so explictly add it to
dependencies instead of relying on the fact that the xserver pulls it in.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-input-evdev.mk                    |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index a8a9adf..5140301 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -9,6 +9,12 @@ XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VE
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
 XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto udev
+XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = \
+	host-pkgconf \
+	xproto_inputproto \
+	xserver_xorg-server \
+	xproto_randrproto \
+	xproto_xproto \
+	udev
 
 $(eval $(autotools-package))
