From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 21:35:07 +0200
Subject: [Buildroot] [git commit] package/cog: add missing libxkbcommon
 dependency
Message-ID: <20200406192543.ED3738CA27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a9c25e96f296d378c776aa9665ebd5e9c9a4f19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The always-built FDO backend relies on this.

Signed-off-by: Charlie Turner <cturner@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
