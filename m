From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  7 Sep 2020 20:44:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/wayland-utils: needs
 wayland-protocols
Message-ID: <20200907184459.221038-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wayland-utils needs wayland-protocols:

Run-time dependency wayland-protocols found: NO (tried pkgconfig)

../output-1/build/wayland-utils-1.0.0/wayland-info/meson.build:4:0: ERROR: Dependency "wayland-protocols" not found, tried pkgconfig

Fixes:
 - http://autobuild.buildroot.org/results/ea4daeb94c25232e3b4a34c1da72bf9bbd5f3cce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wayland-utils/Config.in        | 1 +
 package/wayland-utils/wayland-utils.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/wayland-utils/Config.in b/package/wayland-utils/Config.in
index 3ff7f2efe9..d7842e6142 100644
--- a/package/wayland-utils/Config.in
+++ b/package/wayland-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WAYLAND_UTILS
 	bool "wayland-utils"
 	depends on BR2_PACKAGE_WAYLAND # wayland-client, wayland-server
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
 	  Wayland utils (wayland-info).
 
diff --git a/package/wayland-utils/wayland-utils.mk b/package/wayland-utils/wayland-utils.mk
index 9c4abe7b08..5269454b7e 100644
--- a/package/wayland-utils/wayland-utils.mk
+++ b/package/wayland-utils/wayland-utils.mk
@@ -9,6 +9,6 @@ WAYLAND_UTILS_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_UTILS_SOURCE = wayland-utils-$(WAYLAND_UTILS_VERSION).tar.xz
 WAYLAND_UTILS_LICENSE = MIT
 WAYLAND_UTILS_LICENSE_FILES = COPYING
-WAYLAND_UTILS_DEPENDENCIES = host-pkgconf wayland
+WAYLAND_UTILS_DEPENDENCIES = host-pkgconf wayland wayland-protocols
 
 $(eval $(meson-package))
-- 
2.28.0
