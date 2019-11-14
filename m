From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Nov 2019 20:13:18 +0100
Subject: [Buildroot] [PATCH 2/5] package/gdk-pixbuf: add gio to
 Requires.private
In-Reply-To: <20191114191321.11789-1-fontaine.fabrice@gmail.com>
References: <20191114191321.11789-1-fontaine.fabrice@gmail.com>
Message-ID: <20191114191321.11789-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....0.pc.in-add-gio-to-Requires.private.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/gdk-pixbuf/0001-gdk-pixbuf-2.0.pc.in-add-gio-to-Requires.private.patch

diff --git a/package/gdk-pixbuf/0001-gdk-pixbuf-2.0.pc.in-add-gio-to-Requires.private.patch b/package/gdk-pixbuf/0001-gdk-pixbuf-2.0.pc.in-add-gio-to-Requires.private.patch
new file mode 100644
index 0000000000..b9505cc5ef
--- /dev/null
+++ b/package/gdk-pixbuf/0001-gdk-pixbuf-2.0.pc.in-add-gio-to-Requires.private.patch
@@ -0,0 +1,32 @@
+From d7f003e47a1c4a531e30e0633c7f6d3b11ef6e2f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 14 Nov 2019 09:52:11 +0100
+Subject: [PATCH] gdk-pixbuf-2.0.pc.in: add gio to Requires.private
+
+Fix static linking with spice
+
+Fixes:
+ - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: Not upstreamable (upstream switched to meson)]
+---
+ gdk-pixbuf-2.0.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdk-pixbuf-2.0.pc.in b/gdk-pixbuf-2.0.pc.in
+index 7addefcbd..ff262bc68 100644
+--- a/gdk-pixbuf-2.0.pc.in
++++ b/gdk-pixbuf-2.0.pc.in
+@@ -12,7 +12,7 @@ Name: GdkPixbuf
+ Description: Image loading and scaling
+ Version: @VERSION@
+ Requires: gobject-2.0
+-Requires.private: gmodule-no-export-2.0 @PNG_DEP_CFLAGS_PACKAGES@
++Requires.private: gmodule-no-export-2.0 gio-2.0 @PNG_DEP_CFLAGS_PACKAGES@
+ Libs: -L${libdir} -lgdk_pixbuf- at GDK_PIXBUF_API_VERSION@
+ Libs.private: @GDK_PIXBUF_EXTRA_LIBS@
+ Cflags: -I${includedir}/gdk-pixbuf- at GDK_PIXBUF_API_VERSION@ @GDK_PIXBUF_EXTRA_CFLAGS@
+-- 
+2.23.0
+
-- 
2.23.0
