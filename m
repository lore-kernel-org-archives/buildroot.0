From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Oct 2013 20:29:56 +0200
Subject: [Buildroot] [PATCH] sqlcipher: needs thread support
Message-ID: <1380997796-17929-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/ac4/ac482030479b8172bf45c4f850d9007ec7c95ea5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlcipher/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index af41eb2..e793019 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQLCIPHER
 	bool "sqlcipher"
 	depends on !BR2_PACKAGE_SQLITE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	help
 	  SQLCipher is an SQLite extension that provides 256 bits AES
@@ -27,3 +28,6 @@ config BR2_PACKAGE_SQLCIPHER_STAT3
 
 comment "sqlcipher conflicts with sqlite"
 	depends on BR2_PACKAGE_SQLITE
+
+comment "sqlcipher needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
