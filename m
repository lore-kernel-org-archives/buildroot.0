From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Dec 2020 10:54:09 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/netsurf: fix
 build with gcc 10
Message-ID: <20201212103041.1774A842E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8df445cfddbe2ba68d90b0efc3d655763d33b339
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/e81568c2b4f5ef5d055c9b94e624ba2d23f50d16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8137735818d19f07038ad9df1b56a5a4c97d0f52)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...internal-font-generated-source-for-GCC-10.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/netsurf/0004-framebuffer-Fix-internal-font-generated-source-for-GCC-10.patch b/package/netsurf/0004-framebuffer-Fix-internal-font-generated-source-for-GCC-10.patch
new file mode 100644
index 0000000000..da512645a5
--- /dev/null
+++ b/package/netsurf/0004-framebuffer-Fix-internal-font-generated-source-for-GCC-10.patch
@@ -0,0 +1,37 @@
+From 434f6c3fe7d1d2c6a3e6ae6338608a4a4421ab1b Mon Sep 17 00:00:00 2001
+From: Michael Drake <michael.drake@codethink.co.uk>
+Date: Fri, 13 Nov 2020 11:12:58 +0000
+Subject: framebuffer: Fix internal font generated source for GCC 10.
+
+[Retrieved (and backported) from:
+https://git.netsurf-browser.org/netsurf.git/commit/?id=434f6c3fe7d1d2c6a3e6ae6338608a4a4421ab1b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/convert_font.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/netsurf/frontends/framebuffer/convert_font.c b/netsurf/frontends/framebuffer/convert_font.c
+index 9f5734b71..d22c85920 100644
+--- a/netsurf/frontends/framebuffer/convert_font.c
++++ b/netsurf/frontends/framebuffer/convert_font.c
+@@ -290,14 +290,14 @@ static bool generate_font_header(const char *path, struct font_data *data)
+ 
+ 
+ 	for (s = 0; s < 4; s++) {
+-		fprintf(fp, "const uint8_t *%s_section_table;\n",
++		fprintf(fp, "extern const uint8_t *%s_section_table;\n",
+ 			var_lables[s]);
+-		fprintf(fp, "const uint16_t *%s_sections;\n",
++		fprintf(fp, "extern const uint16_t *%s_sections;\n",
+ 			var_lables[s]);
+ 
+ 	}
+ 
+-	fprintf(fp, "const uint8_t *font_glyph_data;\n");
++	fprintf(fp, "extern const uint8_t *font_glyph_data;\n");
+ 
+ 	fprintf(fp, "\n\n");
+ 
+-- 
+cgit v1.2.1
+
