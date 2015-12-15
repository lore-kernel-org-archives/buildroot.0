From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Dec 2015 20:43:46 -0300
Subject: [Buildroot] [PATCH] librsvg: needs host-gdk-pixbuf
Message-ID: <1450223026-23191-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's required for the gdk-pixbuf-query-loaders tool, to build the svg
gdk-pixbuf module. Fixes:
http://autobuild.buildroot.net/results/603/6031dbb937dadd04b6b9d1d77fc6106728502152/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/librsvg/librsvg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 90c0a7d..042aa10 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -11,7 +11,7 @@ LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPTS = --disable-tools --enable-introspection=no
 HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
-LIBRSVG_DEPENDENCIES = cairo gdk-pixbuf libcroco libglib2 libxml2 pango \
+LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
 	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3)
 HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libglib2 host-libxml2 host-pango
 LIBRSVG_LICENSE = LGPLv2+
-- 
2.4.10
