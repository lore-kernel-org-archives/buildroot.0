From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:58 +0200
Subject: [Buildroot] [PATCH 15/19] cairo: PDF support is needed when SVG
	support is enabled
In-Reply-To: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e014e3da09e99222a1ff4ebb9c3f3433e8de65be.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As soon as PostScript, PNG or SVG support is enabled, PDF support is
required for Cairo to build properly. Otherwise, you get build
failures such as:

.libs/cairo-type3-glyph-surface.o: In function `_cairo_type3_glyph_surface_set_stream':
/home/thomas/local/buildroot-dl/cairo-1.8.10/src/cairo-type3-glyph-surface.c:337: undefined reference to `_cairo_pdf_operators_set_stream'
/home/thomas/local/buildroot-dl/cairo-1.8.10/src/cairo-type3-glyph-surface.c:337: undefined reference to `_cairo_pdf_operators_set_stream'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 752f615..19c4723 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -30,5 +30,6 @@ config BR2_PACKAGE_CAIRO_PNG
 config BR2_PACKAGE_CAIRO_SVG
 	bool "svg support"
 	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_CAIRO_PDF
 
 endif
-- 
1.7.0.4
