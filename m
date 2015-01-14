From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:07:14 +0100
Subject: [Buildroot] [git commit] rsyslog: add 'else' clause to mysql and
	postgresql support
Message-ID: <20150114211411.E4E9280D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f902e743e04e3ee0b91a0400fc6f5a0a276af38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Having 'else' clauses handling the absence of mysql and postgresql
support to explicitly disable such features helps to avoid
misdetection of system-installed packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsyslog/rsyslog.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index fe28d2f..1e0953f 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -40,12 +40,16 @@ ifeq ($(BR2_PACKAGE_MYSQL),y)
 RSYSLOG_DEPENDENCIES += mysql
 RSYSLOG_CONF_OPTS += --enable-mysql
 RSYSLOG_CONF_ENV += ac_cv_prog_MYSQL_CONFIG=$(STAGING_DIR)/usr/bin/mysql_config
+else
+RSYSLOG_CONF_OPTS += --disable-mysql
 endif
 
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 RSYSLOG_DEPENDENCIES += postgresql
 RSYSLOG_CONF_OPTS += --enable-pgsql
 RSYSLOG_CONF_ENV += ac_cv_prog_PG_CONFIG=$(STAGING_DIR)/usr/bin/pg_config
+else
+RSYSLOG_CONF_OPTS += --disable-pgsql
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
