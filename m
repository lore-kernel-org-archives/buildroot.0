From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 22:07:31 +0100
Subject: [Buildroot] [git commit] package/sqlcipher: enable back libressl
Message-ID: <20200213205632.A7DEB8DF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15e74f9a82dca478b345ac9ce69c448259e499da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libressl support has been fixed since version 3.4.2 and
https://github.com/sqlcipher/sqlcipher/commit/ce489ebb4788207f27b1641f8d2bfe6b65462260

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
