From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 22:06:16 +0100
Subject: [Buildroot] [git commit] package/librsvg: add libcroco to
 Requires.private
Message-ID: <20191225205733.752F68E443@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=062423d51ad8251584e1b85a118d9c5abae8280a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix a static build failure with imagemagick

Fixes:
 - http://autobuild.buildroot.org/results/42f4b4881569779162d3efe4628b934f965913b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...vg.pc.in-add-libcroco-to-Requires.Private.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/librsvg/0001-librsvg.pc.in-add-libcroco-to-Requires.Private.patch b/package/librsvg/0001-librsvg.pc.in-add-libcroco-to-Requires.Private.patch
new file mode 100644
index 0000000000..0eea5b995b
--- /dev/null
+++ b/package/librsvg/0001-librsvg.pc.in-add-libcroco-to-Requires.Private.patch
@@ -0,0 +1,35 @@
+From 322b415f92d4dcd36824eef83bd617bac6e5c8c7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 24 Dec 2019 16:38:35 +0100
+Subject: [PATCH] librsvg.pc.in: add libcroco to Requires.private
+
+libcroco is a mandatory dependency since version 2.35.0 so add it to
+Requires.Private to fix a static build failure with imagemagick
+
+This patch is not upstreamable as librsvg no longer depends on libcroco
+since version 2.47.1. It now does all CSS processing using Rust crates
+from Mozilla Servo.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/42f4b4881569779162d3efe4628b934f965913b9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ librsvg.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/librsvg.pc.in b/librsvg.pc.in
+index a451de05..4b09984a 100644
+--- a/librsvg.pc.in
++++ b/librsvg.pc.in
+@@ -10,6 +10,6 @@ Name: librsvg
+ Description: library that renders svg files
+ Version: @VERSION@
+ Requires: glib-2.0 gio-2.0 gdk-pixbuf-2.0 cairo
+-Requires.private:
++Requires.private: libcroco-0.6
+ Libs: -L${libdir} -lrsvg- at RSVG_API_MAJOR_VERSION@ -lm
+ Cflags: -I${includedir}/librsvg- at RSVG_API_VERSION@
+-- 
+2.24.0
+
