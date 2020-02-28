From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri, 28 Feb 2020 13:47:17 -0600
Subject: [Buildroot] [PATCH v1 1/1] package/proftpd: add mod_sftp_sql
Message-ID: <20200228194717.21758-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

update to add mod_sftp_sql for proftpd as a build option
http://www.proftpd.org/docs/contrib/mod_sftp_sql.html

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/proftpd/Config.in  | 7 +++++++
 package/proftpd/proftpd.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index edec37c8dd..b996f697a9 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -41,6 +41,13 @@ config BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE
 
 endif
 
+config BR2_PACKAGE_PROFTPD_MOD_SFTP_SQL
+	bool "mod_sftp_sql support"
+	select BR2_PACKAGE_PROFTPD_MOD_SQL
+	select BR2_PACKAGE_PROFTPD_MOD_SFTP
+	help
+	  Compile ProFTPD with mod_sftp_sql support
+
 config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
 	bool "mod_quotatab support"
 	help
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 02dd0e825e..6c4f590d06 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -53,6 +53,10 @@ PROFTPD_MODULES += mod_sql_sqlite
 PROFTPD_DEPENDENCIES += sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SFTP_SQL),y)
+PROFTPD_MODULES += mod_sftp_sql
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB),y)
 PROFTPD_MODULES += mod_quotatab
 endif
-- 
2.17.1
