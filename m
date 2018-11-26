From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 26 Nov 2018 08:56:41 -0600
Subject: [Buildroot] [PATCH v1 1/1] package/proftpd: add mod_sql_sqlite
Message-ID: <20181126145641.3606-1-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable mod_sql_sqlite as a compile time option

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/proftpd/Config.in  | 9 +++++++++
 package/proftpd/proftpd.mk | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index b615a5ff4c..6ddb50e4c8 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -31,6 +31,15 @@ config BR2_PACKAGE_PROFTPD_MOD_SQL
 	help
 	  Compile ProFTPD with mode_sql support.
 
+if BR2_PACKAGE_PROFTPD_MOD_SQL
+
+config BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE
+	bool "mod_sql_sqlite support"
+	help
+	  Compile ProFTPD with mode_sql_sqlite support.
+
+endif
+
 config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB
 	bool "mod_quotatab support"
 	help
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 8f3ff5088e..878dfd7460 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -46,6 +46,10 @@ ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SQL),y)
 PROFTPD_MODULES += mod_sql
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_MOD_SQL_SQLITE),y)
+PROFTPD_MODULES += mod_sql_sqlite
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_QUOTATAB),y)
 PROFTPD_MODULES += mod_quotatab
 endif
-- 
2.18.0
