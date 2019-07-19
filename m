From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat, 20 Jul 2019 01:06:46 +0300
Subject: [Buildroot] [PATCH 1/1] package/cups-filters: fix build with
 missing iconv
Message-ID: <20190719220646.4462-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link with libiconv if BR2_PACKAGE_LIBICONV was selected.

Fixes:
	https://bugs.busybox.net/show_bug.cgi?id=12031

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/cups-filters/cups-filters.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 214647a90e..26a94507f3 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -71,4 +71,8 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-poppler
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+CUPS_FILTERS_CONF_ENV += LIBS=-liconv
+endif
+
 $(eval $(autotools-package))
-- 
2.22.0
