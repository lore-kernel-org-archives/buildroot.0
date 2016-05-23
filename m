From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 23 May 2016 18:07:43 -0300
Subject: [Buildroot] [PATCH] libepoxy: cosmetic fixes
Message-ID: <1464037663-1310-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's --enable-glx rather than --enable-egl, both are automatic though.
Change the autoreconf comment to reflect that it's required for all
patches.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libepoxy/libepoxy.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index 8e717ce..7436e8f 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -7,9 +7,7 @@
 LIBEPOXY_VERSION = v1.3.1
 LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
 LIBEPOXY_INSTALL_STAGING = YES
-# For patches:
-# 0001-make-egl-and-glx-conditional.patch
-# 0002-Forward-egl-cflags-into-epoxy.pc.patch
+# For patches 0001-0006:
 LIBEPOXY_AUTORECONF = YES
 LIBEPOXY_DEPENDENCIES = xutil_util-macros
 LIBEPOXY_LICENSE = MIT
@@ -23,7 +21,7 @@ LIBEPOXY_CONF_OPTS += --disable-egl
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_XLIB_LIBX11),yy)
-LIBEPOXY_CONF_OPTS += --enable-egl
+LIBEPOXY_CONF_OPTS += --enable-glx
 LIBEPOXY_DEPENDENCIES += libgl xlib_libX11
 else
 LIBEPOXY_CONF_OPTS += --disable-glx
-- 
2.7.3
