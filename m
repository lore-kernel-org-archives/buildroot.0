From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 10:53:18 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/librsvg: fix
 build with NLS
Message-ID: <20191031101633.86A578E1A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35dafbdfaf0044ff17476fb54f7ea1bc43a984a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/9fb04aa7761845a58df14d460b4a7bbf426e19ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5d6f29dd3a9463c031bc37c10fa87f5a498d65a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librsvg/librsvg.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 4f563ce6db..470910d94c 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -9,10 +9,12 @@ LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).20
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
+LIBRSVG_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 LIBRSVG_CONF_OPTS = --disable-pixbuf-loader --disable-tools --enable-introspection=no
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
-	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3)
+	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3) \
+	$(TARGET_NLS_DEPENDENCIES)
 HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libglib2 host-libxml2 host-pango
 LIBRSVG_LICENSE = LGPL-2.0+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
