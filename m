From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:17:47 +0200
Subject: [Buildroot] [git commit] package/popt: fix libiconv dependency
Message-ID: <20170527151753.35D11828DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da5816561b4a660e1562a7cea5b079d776e206a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure that libiconv is built before popt when needed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/popt/popt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 863a47a..3ab5388 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -21,6 +21,7 @@ POPT_CONF_ENV = ac_cv_va_copy=yes
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 POPT_CONF_ENV += am_cv_lib_iconv=yes
 POPT_CONF_OPTS += --with-libiconv-prefix=$(STAGING_DIR)/usr
+POPT_DEPENDENCIES += libiconv
 endif
 
 $(eval $(autotools-package))
