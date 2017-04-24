From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Mon, 24 Apr 2017 14:22:21 +0200
Subject: [Buildroot] [PATCH] x11vnc: update to 0.9.14
Message-ID: <1493036541-26331-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This uses x11vnc's new upstream location, github, via https. Autoreconf is
added, because it's really only a code snapshot release.

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/x11vnc/x11vnc.hash | 2 +-
 package/x11vnc/x11vnc.mk   | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11vnc/x11vnc.hash b/package/x11vnc/x11vnc.hash
index 5828b12..0da7765 100644
--- a/package/x11vnc/x11vnc.hash
+++ b/package/x11vnc/x11vnc.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b  x11vnc-0.9.13.tar.gz
+sha256  45f87c5e4382988c73e8c7891ac2bfb45d8f9ce1196ae06651c84636684ea143  0.9.14.tar.gz
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 9f4af12..d988201 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-X11VNC_VERSION = 0.9.13
-X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11VNC_VERSION)
+X11VNC_VERSION = 0.9.14
+X11VNC_SOURCE = $(X11VNC_VERSION).tar.gz
+X11VNC_SITE = https://github.com/LibVNC/x11vnc/archive
 # sdl support is not used in x11vnc, but host include / library search paths
 # leak in if host has sdl-config
 X11VNC_CONF_OPTS = --without-sdl
@@ -13,6 +14,10 @@ X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
 
+# Upstream moved to github. It's archives don't include a configure script,
+# so we need to generate it.
+X11VNC_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 X11VNC_DEPENDENCIES += avahi dbus
 else
-- 
2.1.4
