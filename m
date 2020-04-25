From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:34:43 +0200
Subject: [Buildroot] [git commit] package/proftpd: add mod_sftp_sql
Message-ID: <20200425202029.0E8909037F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2003a003f47de7dd6cac64d5ecfbdd29fac43112
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

update to add mod_sftp_sql for proftpd as a build option
http://www.proftpd.org/docs/contrib/mod_sftp_sql.html

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/proftpd/Config.in  | 7 +++++++
 package/proftpd/proftpd.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 4a544f0c50..4898f49dd2 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -47,6 +47,13 @@ config BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE
 
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
index 946a37d69e..e126d0e0a4 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -60,6 +60,10 @@ PROFTPD_MODULES += mod_sql_sqlite
 PROFTPD_DEPENDENCIES += sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SFTP_SQL),y)
+PROFTPD_MODULES += mod_sftp_sql
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB),y)
 PROFTPD_MODULES += mod_quotatab
 endif
