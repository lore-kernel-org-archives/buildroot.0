From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 23:17:39 +0200
Subject: [Buildroot] [git commit] gvfs: drop dbus-glib dependency
Message-ID: <20110718211805.50D338A656@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5739c7fac6ec95fd6394e33a0f28ac663f2c8178
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the dbus-glib dependency as gvfs uses dbus directly.

Also change dependency on the XML parser for dbus to be more
in sync with the dbus package.

[Peter: drop expat|libxml2 deps as shared-mime-type already selects libxml2]
Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gvfs/Config.in |    2 --
 package/gvfs/gvfs.mk   |    2 +-
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 04fce93..87f9a03 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -3,9 +3,7 @@ config BR2_PACKAGE_GVFS
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_EXPAT # needed by dbus(-glib)
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_SHARED_MIME_INFO
 	help
 	  gvfs is a userspace virtual filesystem where mount runs as a
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index bd370b5..f208973 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -11,7 +11,7 @@ GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = NO
 GVFS_INSTALL_TARGET = YES
 GVFS_AUTORECONF = NO
-GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus-glib shared-mime-info
+GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus shared-mime-info
 
 GVFS_CONF_OPT = \
 	--disable-gconf			\
-- 
1.7.3.4
