From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:12:47 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/connman-gtk: fix
 build with NLS
Message-ID: <20190804201459.D5E128E430@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=234d635114a14e100c31ba41b6833e337846d6fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - http://autobuild.buildroot.org/results/30b775323b4780b35a163100097952eff232339e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2b4d843daf17932ac6bc579d6a2e783557dbf15a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman-gtk/connman-gtk.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/connman-gtk/connman-gtk.mk b/package/connman-gtk/connman-gtk.mk
index 9888fcd4a4..0ea49198e6 100644
--- a/package/connman-gtk/connman-gtk.mk
+++ b/package/connman-gtk/connman-gtk.mk
@@ -8,8 +8,10 @@ CONNMAN_GTK_VERSION = 1.1.1
 CONNMAN_GTK_SITE = https://github.com/jgke/connman-gtk/releases/download/v$(CONNMAN_GTK_VERSION)
 CONNMAN_GTK_SOURCE = connman-gtk-$(CONNMAN_GTK_VERSION).tar.bz2
 CONNMAN_GTK_INSTALL_STAGING = YES
-CONNMAN_GTK_DEPENDENCIES = host-intltool connman libglib2 libgtk3
+CONNMAN_GTK_DEPENDENCIES = host-intltool connman libglib2 libgtk3 \
+	$(TARGET_NLS_DEPENDENCIES)
 CONNMAN_GTK_LICENSE = GPL-2.0+
 CONNMAN_GTK_LICENSE_FILES = COPYING
+CONNMAN_GTK_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
