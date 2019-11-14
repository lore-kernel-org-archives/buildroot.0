From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Nov 2019 20:13:17 +0100
Subject: [Buildroot] [PATCH 1/5] package/spice: add optional gdk-pixbuf
 dependency
Message-ID: <20191114191321.11789-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This dependency has been added in version 0.14.1 with
https://gitlab.freedesktop.org/spice/spice-common/commit/d58a5b6a5a25134396661e1d805dfc567181e3af

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/spice/spice.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 16e57441a8..f5801ce0ff 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -13,6 +13,7 @@ SPICE_INSTALL_STAGING = YES
 SPICE_DEPENDENCIES = \
 	host-pkgconf \
 	jpeg \
+	$(if $(BR2_PACKAGE_GDK_PIXBUF),gdk-pixbuf) \
 	libglib2 \
 	openssl \
 	pixman \
-- 
2.23.0
