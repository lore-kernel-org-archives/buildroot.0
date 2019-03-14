From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Mar 2019 22:20:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/ulogd: use --without-mysql
Message-ID: <20190314212059.20817-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace --with-mysql=no by --without-mysql

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ulogd/ulogd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 55bbec489d..8fecc0ed38 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -20,7 +20,7 @@ ifeq ($(BR2_PACKAGE_MYSQL),y)
 ULOGD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
 ULOGD_DEPENDENCIES += mysql
 else
-ULOGD_CONF_OPTS += --with-mysql=no
+ULOGD_CONF_OPTS += --without-mysql
 endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 ULOGD_CONF_OPTS += --with-pgsql
@@ -32,7 +32,7 @@ ifeq ($(BR2_PACKAGE_SQLITE),y)
 ULOGD_DEPENDENCIES += sqlite
 endif
 else
-ULOGD_CONF_OPTS += --with-mysql=no --without-pgsql --without-sqlite
+ULOGD_CONF_OPTS += --without-mysql --without-pgsql --without-sqlite
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
-- 
2.14.1
