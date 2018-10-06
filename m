From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sat,  6 Oct 2018 22:02:45 +0200
Subject: [Buildroot] [PATCH 1/1] cups-filters: add autoreconf
Message-ID: <20181006200245.8380-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because we are patching Makefile.am, Makefile.am is newer than Makefile.in

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 This fix is for the 2018.08.x and 2018.05.x branches
 package/cups-filters/cups-filters.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 131e58246e..3c5e13da89 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -8,7 +8,8 @@ CUPS_FILTERS_VERSION = 1.20.3
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-
+# 0001-Replace-relative-linking-with-absolute-linking.patch
+CUPS_FILTERS_AUTORECONF = YES
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
 CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
-- 
2.17.1
