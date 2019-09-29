From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Sep 2019 09:12:24 +0200
Subject: [Buildroot] [git commit] package/cups-filters: disable Braille
 embosing filters
Message-ID: <20190929070848.B8B9182A19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3da92264c6dd693022d06fd2500878f7f5d492c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise they are installed even though the Braille support is not
built because it requires liblouis, which is not available.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
