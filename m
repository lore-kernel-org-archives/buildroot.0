From: Martin Kepplinger <martink@posteo.de>
Date: Sat, 29 Apr 2017 15:00:34 +0200
Subject: [Buildroot] [PATCH v3] x11vnc: update to 0.9.14
In-Reply-To: <65322dd8-3b6b-e421-5e5b-9c69d88355a3@mind.be>
References: <65322dd8-3b6b-e421-5e5b-9c69d88355a3@mind.be>
Message-ID: <20170429130034.30200-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This switches to x11vnc's new upstream location at github. Autoreconf is
added because it's only a code snapshot release. Subsequent releases
will most probably look the same, see
https://github.com/LibVNC/x11vnc/issues/35#issuecomment-297474900

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Martin Kepplinger <martink@posteo.de>
---

redone the patch. As mentioned earlier, I at least did a test-run with
this version. And 0.9.15 is indeed in the works, see
https://github.com/LibVNC/x11vnc/milestone/2 :)


revision history
----------------
v3: add a comment, why AUTORECONF is added; thanks Arnout Vandecappelle
v2: use the github helper instead of a URL
v1: initial proposal to update 0.9.13 to 0.9.14


 package/x11vnc/x11vnc.hash | 2 +-
 package/x11vnc/x11vnc.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/x11vnc/x11vnc.hash b/package/x11vnc/x11vnc.hash
index 5828b12cd..3cdbfa1b0 100644
--- a/package/x11vnc/x11vnc.hash
+++ b/package/x11vnc/x11vnc.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b  x11vnc-0.9.13.tar.gz
+sha256  45f87c5e4382988c73e8c7891ac2bfb45d8f9ce1196ae06651c84636684ea143  x11vnc-0.9.14.tar.gz
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 9f4af1258..9233b7047 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-X11VNC_VERSION = 0.9.13
-X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11VNC_VERSION)
+X11VNC_VERSION = 0.9.14
+X11VNC_SITE = $(call github,LibVNC,x11vnc,$(X11VNC_VERSION))
 # sdl support is not used in x11vnc, but host include / library search paths
 # leak in if host has sdl-config
 X11VNC_CONF_OPTS = --without-sdl
@@ -13,6 +13,9 @@ X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
 
+# Source coming from github, no configure included
+X11VNC_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 X11VNC_DEPENDENCIES += avahi dbus
 else
-- 
2.11.0
