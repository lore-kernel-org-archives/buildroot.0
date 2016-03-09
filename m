From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 06:58:45 -0300
Subject: [Buildroot] [PATCH v3 7/7] weston: bump to version 1.10.0
In-Reply-To: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457517525-7716-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1457517525-7716-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/Config.in   | 1 +
 package/weston/weston.hash | 4 ++--
 package/weston/weston.mk   | 9 ++++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 4c820e9..aaf1706 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -6,6 +6,7 @@ comment "weston needs udev and a toolchain w/ locale, threads, dynamic library,
 config BR2_PACKAGE_WESTON
 	bool "weston"
 	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_LIBXKBCOMMON
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index e7bc2bb..ed174e6 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/wayland-devel/2015-June/022416.html
-sha256  8963e69f328e815cec42c58046c4af721476c7541bb7d9edc71740fada5ad312  weston-1.8.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-February/027039.html
+sha256  e0b2004d00d8293ddf7903ca283c1746afa9ccb5919ab50fd04397ff472aa5c1  weston-1.10.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 4ad89ce..d818071 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.8.0
+WESTON_VERSION = 1.10.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
 
-WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
-	jpeg mtdev udev cairo libinput
+WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
+	libxkbcommon pixman libpng jpeg mtdev udev cairo libinput
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
@@ -25,6 +25,9 @@ WESTON_CONF_OPTS = \
 	--disable-weston-launch \
 	--disable-colord
 
+WESTON_MAKE_OPTS = \
+	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
-- 
2.4.10
