From: Charlie Turner <cturner@igalia.com>
Date: Mon,  6 Apr 2020 18:42:04 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/cog: add wayland dependencies
In-Reply-To: <20200406174205.25939-1-cturner@igalia.com>
References: <20200406174205.25939-1-cturner@igalia.com>
Message-ID: <20200406174205.25939-2-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The always-built FDO backend relies on this.

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
 package/cog/Config.in | 2 ++
 package/cog/cog.mk    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index 6671405230..c20ee86827 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_COG
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBXKBCOMMON
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
 	  Single "window" launcher for the WebKit WPE port, and
 	  helper library for implementing WPE launcher. It does
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 26ce79f91d..c6fae34a65 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -8,7 +8,7 @@ COG_VERSION = 0.6.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo libxkbcommon
+COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo libxkbcommon wayland wayland-protocols
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
-- 
2.20.1
