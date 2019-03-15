From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Mar 2019 08:41:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/ulogd: add --with-sqlite option
Message-ID: <20190315074142.21960-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use --with-sqlite and --without-sqlite options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ulogd/ulogd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index a2cad40677..1b86c12773 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -29,7 +29,10 @@ else
 ULOGD_CONF_OPTS += --without-pgsql
 endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
+ULOGD_CONF_OPTS += --with-sqlite
 ULOGD_DEPENDENCIES += sqlite
+else
+ULOGD_CONF_OPTS += --without-sqlite
 endif
 else
 ULOGD_CONF_OPTS += --without-mysql --without-pgsql --without-sqlite
-- 
2.14.1
