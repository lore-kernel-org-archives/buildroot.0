From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri,  4 Oct 2019 23:42:29 -0300
Subject: [Buildroot] [PATCH 1/2] package/cups-filters: drop pre-configure
 hook
In-Reply-To: <20191005024230.25287-1-unixmania@gmail.com>
References: <20191005024230.25287-1-unixmania@gmail.com>
Message-ID: <20191005024230.25287-2-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Version 1.25.6 contains the config.rpath and ABOUT-NLS, so it wouldn't
be necessary to fake them even if we still used autoreconf.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups-filters/cups-filters.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 88b7d7dd06..ffd55fa95d 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -20,14 +20,6 @@ CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
 	--with-pdftops=pdftops \
 	--with-jpeg
 
-# After 0002-filter-texttotext.c-link-with-libiconv-if-needed.patch autoreconf
-# needs config.rpath and ABOUT-NLS, which are not in v1.25.4 yet. Fake them.
-define CUPS_FILTERS_ADD_MISSING_FILE
-	touch $(@D)/config.rpath $(@D)/ABOUT-NLS
-endef
-
-CUPS_FILTERS_PRE_CONFIGURE_HOOKS = CUPS_FILTERS_ADD_MISSING_FILE
-
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 CUPS_FILTERS_CONF_OPTS += --with-png
 CUPS_FILTERS_DEPENDENCIES += libpng
-- 
2.18.1
