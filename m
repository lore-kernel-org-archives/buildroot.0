From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 19:13:46 +0100
Subject: [Buildroot] [git commit] collectd: remove postgresql introduced
	uclibc dependency for the PostgresSQL support
Message-ID: <20150315181408.5E5FD8073F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a09ed7b758c6d7dc184448bfba8f4d045cb24746
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
