From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Oct 2013 23:15:18 +0200
Subject: [Buildroot] [git commit] package/weston: bump version
Message-ID: <20131011082158.A5A059B9C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cd6def998b530e39ac99c640ef46e4a9c6a5d44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even with EGL disabled, weston-1.2.2 still tries to build the
simple EGL clients, so they need to be explicitly disabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 38647bd..4b99dce 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.1.0
+WESTON_VERSION = 1.2.2
 WESTON_SITE = http://wayland.freedesktop.org/releases/
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
@@ -14,6 +14,7 @@ WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
 	jpeg mtdev udev cairo
 WESTON_CONF_OPT = \
 	--disable-egl \
+	--disable-simple-egl-clients \
 	--disable-xwayland \
 	--disable-x11-compositor \
 	--disable-drm-compositor \
