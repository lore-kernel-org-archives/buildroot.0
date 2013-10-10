From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 23:05:19 +0200
Subject: [Buildroot] [PATCH 2/8] package/weston: bump version
In-Reply-To: <cover.1381438785.git.yann.morin.1998@free.fr>
References: <cover.1381438785.git.yann.morin.1998@free.fr>
Message-ID: <74cddc7be2ca038c85065f2b7fcaf8eb9ee55ef0.1381438785.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Even with EGL disabled, weston-1.2.2 still tries to build the
simple EGL clients, so they need to be explicitly disabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
1.8.1.2
