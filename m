From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Feb 2020 21:09:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlcipher: enable back libressl
Message-ID: <20200213200915.2238881-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libressl support has been fixed since version 3.4.2 and
https://github.com/sqlcipher/sqlcipher/commit/ce489ebb4788207f27b1641f8d2bfe6b65462260

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlcipher/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index b26bc7709f..332754b15a 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_SQLCIPHER
 	depends on !BR2_PACKAGE_SQLITE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  SQLCipher is an SQLite extension that provides 256 bits AES
 	  encryption of database files. Note that it is a fork of
-- 
2.24.1
