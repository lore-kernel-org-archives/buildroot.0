From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Fri,  1 May 2020 18:55:24 +0300
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: add image printing
 support
Message-ID: <20200501155524.5478-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cups can print images like jpeg/png.

In current version it's disabled, but may be needed for some customers.

This patch add cups-filters for images.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 package/cups-filters/cups-filters.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 3bb33d963c..1fba61ad15 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -11,8 +11,7 @@ CUPS_FILTERS_LICENSE_FILES = COPYING
 
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
-CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
-	--disable-mutool \
+CUPS_FILTERS_CONF_OPTS = --disable-mutool \
 	--disable-foomatic \
 	--disable-braille \
 	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
-- 
2.17.1
