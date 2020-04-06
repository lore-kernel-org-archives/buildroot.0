From: Charlie Turner <cturner@igalia.com>
Date: Mon,  6 Apr 2020 18:42:03 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/cog: depend on libxkbcommon
Message-ID: <20200406174205.25939-1-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The always-built FDO backend relies on this.

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
 package/cog/Config.in | 1 +
 package/cog/cog.mk    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index b25991d4ae..6671405230 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_COG
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_LIBXKBCOMMON
 	help
 	  Single "window" launcher for the WebKit WPE port, and
 	  helper library for implementing WPE launcher. It does
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 64e2277e3d..26ce79f91d 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -8,7 +8,7 @@ COG_VERSION = 0.6.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
-COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
+COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo libxkbcommon
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
-- 
2.20.1
