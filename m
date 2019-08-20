From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:42:29 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libgtk3: fix
 build with NLS
Message-ID: <20190820143939.6666283A84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=155161e1f0d4c5975efbeb45cdb073b147e08322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 360cf8f0fd35db8f1a9e87d9e9d494b5aa059ef1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index bdf820de37..b9adc673f5 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -24,9 +24,11 @@ LIBGTK3_CONF_OPTS = \
 
 # Override pkg-config pkgdatadir variable, it needs the prefix
 LIBGTK3_MAKE_OPTS = \
-	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
+	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols \
+	LIBS=$(TARGET_NLS_LIBS)
 
-LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango gdk-pixbuf libepoxy
+LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango \
+	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender xlib_libXi
