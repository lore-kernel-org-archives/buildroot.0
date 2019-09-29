From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 28 Sep 2019 22:49:00 -0300
Subject: [Buildroot] [PATCH] package/cups-filters: disable Braille embosing
 filters
Message-ID: <20190929014900.6470-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Otherwise they are installed even though the Braille support is not
built because it requires liblouis, which is not available.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/cups-filters/cups-filters.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 30d109e56a..88b7d7dd06 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -14,6 +14,7 @@ CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
 	--disable-mutool \
 	--disable-foomatic \
+	--disable-braille \
 	--with-cups-config=$(STAGING_DIR)/usr/bin/cups-config \
 	--with-sysroot=$(STAGING_DIR) \
 	--with-pdftops=pdftops \
-- 
2.18.1
