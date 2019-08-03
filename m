From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:50:02 +0200
Subject: [Buildroot] [git commit] package/gsettings-desktop-schemas: bump to
 version 3.33.1
Message-ID: <20190803084851.755AB8D4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bd4695ca72ee493465841094b74c3c6f443b633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- Disable introspection (enabled by default)
- Drop host-intltool (not needed anymore with meson)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash | 7 +++++--
 package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk   | 9 +++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
index 05ec7a418f..c37b7377de 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.hash
@@ -1,2 +1,5 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/3.22/gsettings-desktop-schemas-3.22.0.sha256sum
-sha256	0f06c7ba34c3a99e4d58b10889496133c9aaad6698ea2d8405d481c7f1a7eae1	gsettings-desktop-schemas-3.22.0.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/gsettings-desktop-schemas/3.33/gsettings-desktop-schemas-3.33.1.sha256sum
+sha256	bd337f13955856140fdbd3073c56d4adca20333f8bdac41e429c3dca4730cdff	gsettings-desktop-schemas-3.33.1.tar.xz
+
+# Hash for license file
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
index 420ceda819..98d16745b2 100644
--- a/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
+++ b/package/gsettings-desktop-schemas/gsettings-desktop-schemas.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.22
-GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).0
+GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR = 3.33
+GSETTINGS_DESKTOP_SCHEMAS_VERSION = $(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR).1
 GSETTINGS_DESKTOP_SCHEMAS_SOURCE = gsettings-desktop-schemas-$(GSETTINGS_DESKTOP_SCHEMAS_VERSION).tar.xz
 GSETTINGS_DESKTOP_SCHEMAS_SITE = http://ftp.gnome.org/pub/gnome/sources/gsettings-desktop-schemas/$(GSETTINGS_DESKTOP_SCHEMAS_VERSION_MAJOR)
 GSETTINGS_DESKTOP_SCHEMAS_INSTALL_STAGING = YES
-GSETTINGS_DESKTOP_SCHEMAS_DEPENDENCIES = host-intltool host-pkgconf libglib2
+GSETTINGS_DESKTOP_SCHEMAS_DEPENDENCIES = host-pkgconf libglib2
 GSETTINGS_DESKTOP_SCHEMAS_LICENSE = LGPL-2.1+
 GSETTINGS_DESKTOP_SCHEMAS_LICENSE_FILES = COPYING
+GSETTINGS_DESKTOP_SCHEMAS_CONF_OPTS = -Dintrospection=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
