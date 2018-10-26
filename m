From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:28:31 +0200
Subject: [Buildroot] [git commit] mysql: properly order "depends on" vs. bool
Message-ID: <20181026192745.48A868283C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbf62fc5692cc04a2f721260d5e7f8a2558b4bb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes a check-package warning introduced by commit
19df27ed03b33cd86c971afb355091161972851f ("package/mariadb: add option
to disable build of embedded server")

Fixes:

package/mysql/Config.in:59: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mysql/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index f7f7f4b8eb..30a82cc91b 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -55,8 +55,8 @@ config BR2_PACKAGE_MARIADB_SERVER
 	  Install the mariadb server on the target.
 
 config BR2_PACKAGE_MARIADB_SERVER_EMBEDDED
-	depends on BR2_PACKAGE_MARIADB_SERVER
 	bool "mariadb embedded server"
+	depends on BR2_PACKAGE_MARIADB_SERVER
 	help
 	  Install the mariadb embedded server on the target.
 
