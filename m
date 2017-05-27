From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 May 2017 10:19:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/popt: fix libiconv dependency
Message-ID: <20170527081952.24584-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make sure that libiconv is built before popt when needed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/popt/popt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 863a47a65..3ab53880d 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -21,6 +21,7 @@ POPT_CONF_ENV = ac_cv_va_copy=yes
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 POPT_CONF_ENV += am_cv_lib_iconv=yes
 POPT_CONF_OPTS += --with-libiconv-prefix=$(STAGING_DIR)/usr
+POPT_DEPENDENCIES += libiconv
 endif
 
 $(eval $(autotools-package))
-- 
2.11.0
