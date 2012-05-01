From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 16:45:42 +0200
Subject: [Buildroot] [git commit] mysql_client: security bump to version
	5.1.62
Message-ID: <20120501145311.96A9796C3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58f7784feebdd8ea21ec33374c560ae2d08eb1ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2012-0583, CVE-2012-1688, CVE-2012-1690, CVE-2012-1696,
CVE-2012-1697, CVE-2012-1703.

Switched to skysql mirror since Oracle no longer maintains the 5.1
branch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ch => mysql_client-5.1.62-ac_cache_check.patch} |    0
 ...l_client-5.1.62-configure-ps-cache-check.patch} |    0
 ...sql_client-5.1.62-use-new-readline-iface.patch} |    0
 package/mysql_client/mysql_client.mk               |    5 +++--
 4 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mysql_client/mysql_client-5.1.61-ac_cache_check.patch b/package/mysql_client/mysql_client-5.1.62-ac_cache_check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.61-ac_cache_check.patch
rename to package/mysql_client/mysql_client-5.1.62-ac_cache_check.patch
diff --git a/package/mysql_client/mysql_client-5.1.61-configure-ps-cache-check.patch b/package/mysql_client/mysql_client-5.1.62-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.61-configure-ps-cache-check.patch
rename to package/mysql_client/mysql_client-5.1.62-configure-ps-cache-check.patch
diff --git a/package/mysql_client/mysql_client-5.1.61-use-new-readline-iface.patch b/package/mysql_client/mysql_client-5.1.62-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql_client/mysql_client-5.1.61-use-new-readline-iface.patch
rename to package/mysql_client/mysql_client-5.1.62-use-new-readline-iface.patch
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 0803d10..a1640c3 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -3,9 +3,10 @@
 # MySQL 5.1 Client
 #
 #############################################################
-MYSQL_CLIENT_VERSION = 5.1.61
+
+MYSQL_CLIENT_VERSION = 5.1.62
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
-MYSQL_CLIENT_SITE = http://downloads.mysql.com/archives/mysql-5.1/
+MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-5.1
 MYSQL_CLIENT_INSTALL_STAGING = YES
 MYSQL_CLIENT_DEPENDENCIES = readline ncurses
 MYSQL_CLIENT_AUTORECONF=YES
