From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jun 2010 23:15:29 +0200
Subject: [Buildroot] [git commit master] php: add sqlite3 dependency when
	using external
Message-ID: <20100606213748.DB0988B8A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d9c2b636746d96e40cce1111211f9f6da477af28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1945

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    5 +++--
 package/php/php.mk |    1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7c42459..f26f67f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,8 +7,8 @@
 	New packages: cgilua, copas, coxpcall, luafilesystem,
 	luasocket, rings, wsapi, xavante
 
-	Updated/fixed packages: cdrkit, libidn, netperf, qt, tn5250,
-	usbutils
+	Updated/fixed packages: cdrkit, libidn, netperf, php, qt,
+	tn5250, usbutils
 
 	Removed packages: modutils
 
@@ -20,6 +20,7 @@
 	#1897: Bump libusb to 1.0.7
 	#1903: Bump tn5250 to 0.17.4 and migrate to autotargets
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
+	#1945: PHP: add sqlite3 dependency when using external lib
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/php/php.mk b/package/php/php.mk
index c5f9c14..962547f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -151,6 +151,7 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE_EXTERNAL),y)
 	PHP_CONF_OPT += --with-pdo-sqlite=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += sqlite
 else
 	PHP_CONF_OPT += --with-pdo-sqlite
 endif
-- 
1.6.3.3
