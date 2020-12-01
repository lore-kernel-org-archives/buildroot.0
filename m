From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 Dec 2020 23:13:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/netsurf: fix build with gcc 10
In-Reply-To: <20201201221300.995927-1-fontaine.fabrice@gmail.com>
References: <20201201221300.995927-1-fontaine.fabrice@gmail.com>
Message-ID: <20201201221300.995927-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/e81568c2b4f5ef5d055c9b94e624ba2d23f50d16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nal-font-generated-source-for-GCC-10.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/netsurf/0004-framebuffer-Fix-internal-font-generated-source-for-GCC-10.patch

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
-- 
2.29.2
