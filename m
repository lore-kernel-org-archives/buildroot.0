From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:37:11 +0100
Subject: [Buildroot] [git commit] package/ulogd: use --without-mysql
Message-ID: <20190314213419.1D3638ED40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f2b71b1205294d304a682a3eca55e7ff63d2d72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace --with-mysql=no by --without-mysql

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
