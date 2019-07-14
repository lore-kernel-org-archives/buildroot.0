From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Jul 2019 10:30:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgtk2: fix build with NLS
Message-ID: <20190714083019.6238-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/20644475a745c04fec4a87c639bd13e4f333805a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgtk2/libgtk2.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 8f60573a5e..710e6e47db 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -21,7 +21,10 @@ LIBGTK2_CONF_ENV = \
 
 LIBGTK2_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 
-LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk gdk-pixbuf
+LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk \
+	gdk-pixbuf $(TARGET_NLS_DEPENDENCIES)
+
+LIBGTK2_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 
 # Xorg dependencies
 LIBGTK2_CONF_OPTS += \
-- 
2.20.1
