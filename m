From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:05:59 +0100
Subject: [Buildroot] [git commit] rsyslog: fix indentation
Message-ID: <20150114211411.D23D480D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b9fecfdaf0367c616e77fb3c05186fc33fcbeb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/rsyslog.mk |   30 +++++++++++++++---------------
 1 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 39d5637..b13baec 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -21,38 +21,38 @@ RSYSLOG_AUTORECONF = YES
 
 # Build after BusyBox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	RSYSLOG_DEPENDENCIES += busybox
+RSYSLOG_DEPENDENCIES += busybox
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEE),y)
-	RSYSLOG_DEPENDENCIES += libee
+RSYSLOG_DEPENDENCIES += libee
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-	RSYSLOG_DEPENDENCIES += libgcrypt
-	RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-	RSYSLOG_CONF_OPTS += --enable-libgcrypt=yes
+RSYSLOG_DEPENDENCIES += libgcrypt
+RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+RSYSLOG_CONF_OPTS += --enable-libgcrypt=yes
 else
-	RSYSLOG_CONF_OPTS += --enable-libgcrypt=no
+RSYSLOG_CONF_OPTS += --enable-libgcrypt=no
 endif
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-	RSYSLOG_DEPENDENCIES += mysql
-	RSYSLOG_CONF_OPTS += --enable-mysql
-	RSYSLOG_CONF_ENV += ac_cv_prog_MYSQL_CONFIG=$(STAGING_DIR)/usr/bin/mysql_config
+RSYSLOG_DEPENDENCIES += mysql
+RSYSLOG_CONF_OPTS += --enable-mysql
+RSYSLOG_CONF_ENV += ac_cv_prog_MYSQL_CONFIG=$(STAGING_DIR)/usr/bin/mysql_config
 endif
 
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
-	RSYSLOG_DEPENDENCIES += postgresql
-	RSYSLOG_CONF_OPTS += --enable-pgsql
-	RSYSLOG_CONF_ENV += ac_cv_prog_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
+RSYSLOG_DEPENDENCIES += postgresql
+RSYSLOG_CONF_OPTS += --enable-pgsql
+RSYSLOG_CONF_ENV += ac_cv_prog_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-	RSYSLOG_DEPENDENCIES += util-linux
-	RSYSLOG_CONF_OPTS += --enable-uuid
+RSYSLOG_DEPENDENCIES += util-linux
+RSYSLOG_CONF_OPTS += --enable-uuid
 else
-	RSYSLOG_CONF_OPTS += --disable-uuid
+RSYSLOG_CONF_OPTS += --disable-uuid
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSV
