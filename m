From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2015 20:59:42 +0100
Subject: [Buildroot] [PATCH v3 6/8] collectd: remove postgresql introduced
	uclibc dependency for the PostgresSQL support
In-Reply-To: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
References: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
Message-ID: <1426017584-6096-6-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 --> v3:
  - added (thanks to Baruch Siach for the hint)
---
 package/collectd/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 94c4acd..c65fc65 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -314,12 +314,8 @@ config BR2_PACKAGE_COLLECTD_PING
 	help
 	  Mesures network latency using ICMP "echo requests".
 
-comment "postgresql needs a toolchain w/ glibc"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	bool "postgresql"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  Connects to and executes SQL statements on a PostgreSQL
-- 
2.1.4
