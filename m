From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 19:13:52 +0100
Subject: [Buildroot] [git commit] php: remove postgresql introduced uclibc
	dependency for the PostgresSQL support
Message-ID: <20150315181408.66D928073F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a92b8e287a687960dd7e5c78dcbf34006cb35ff8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 57685b2..935f966 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -148,14 +148,10 @@ comment "MySQL drivers need a toolchain w/ C++, threads"
 
 config BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL
 	bool "PostgreSQL"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_POSTGRESQL
 	help
 	  PDO driver for PostgreSQL
 
-comment "PostgreSQL driver needs an (e)glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
 	bool "SQLite3"
 	select BR2_PACKAGE_SQLITE
