From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Jul 2010 23:45:36 +0200
Subject: [Buildroot] [git commit master 1/1] php: pdo mysql extension needs
	C++ support in toolchain
Message-ID: <20100721214609.E20B682C1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=68fe213daa83dee8f4ee54e1878c2b893e81912b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/Config.ext |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 0f5b982..d95b19e 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -167,8 +167,12 @@ config BR2_PACKAGE_PHP_EXT_PDO_SQLITE_EXTERNAL
 config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	bool "PDO_MySQL"
 	depends on BR2_PACKAGE_PHP_EXT_PDO
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  PDO driver for MySQL
 
+comment "PDO_MySQL requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_PHP_EXT_PDO
+
 endmenu
-- 
1.7.1
