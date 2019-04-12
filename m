From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 12 Apr 2019 22:59:29 +0200
Subject: [Buildroot] [PATCH 2/3] package/pure-ftpd: add optional postgresql
 dependency
In-Reply-To: <20190412205930.10268-1-fontaine.fabrice@gmail.com>
References: <20190412205930.10268-1-fontaine.fabrice@gmail.com>
Message-ID: <20190412205930.10268-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pure-ftpd/pure-ftpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index aed528b981..a9268b4446 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -47,6 +47,13 @@ else
 PURE_FTPD_CONF_OPTS += --without-tls
 endif
 
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+PURE_FTPD_CONF_OPTS += --with-pgsql=$(STAGING_DIR)/usr
+PURE_FTPD_DEPENDENCIES += postgresql
+else
+PURE_FTPD_CONF_OPTS += --without-pgsql
+endif
+
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 PURE_FTPD_CONF_ENV += ax_cv_check_cflags___fPIE=no ax_cv_check_ldflags___fPIE=no
 endif
-- 
2.14.1
