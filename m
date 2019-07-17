From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 17 Jul 2019 19:02:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/connman-gtk: fix build with NLS
Message-ID: <20190717170251.28034-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/30b775323b4780b35a163100097952eff232339e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
