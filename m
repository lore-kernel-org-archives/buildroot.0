From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 00:09:49 +0200
Subject: [Buildroot] [PATCH 03/11] package/weston: requires host-pkgconf
In-Reply-To: <cover.1381269937.git.yann.morin.1998@free.fr>
References: <cover.1381269937.git.yann.morin.1998@free.fr>
Message-ID: <eca1220c9cf9f31fc7d2fda903af60725d8fa930.1381269937.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

weston's configure.ac uses PKG_CHECK_MODULES,
so it needs to depend on host-pkgconf.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
It worked so far since weston depends on packages
that themselves depend on host-pkgconf. But for
sanity, make weston depend on it, too.
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5d2c829..38647bd 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -10,7 +10,7 @@ WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
-WESTON_DEPENDENCIES = wayland libxkbcommon pixman libpng \
+WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
 	jpeg mtdev udev cairo
 WESTON_CONF_OPT = \
 	--disable-egl \
-- 
1.8.1.2
