From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Oct 2018 10:32:00 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] cups-filters: add
 autoreconf
Message-ID: <20181008083248.B7FF98E1BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=542da6ccff77b6cffea42584586b3f5d0dfa7935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Because we are patching Makefile.am, Makefile.am is newer than Makefile.in

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
