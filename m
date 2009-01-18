From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sun, 18 Jan 2009 13:35:57 +0100
Subject: [Buildroot] [PATCH] Kconfig: remove 'default n' and 'default no'
	(see r22874)
Message-ID: <200901181335.57600.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 Config.in                  |    1 -
 package/openssl/Config.in  |    2 --
 target/u-boot/Config.in    |    2 --
 toolchain/uClibc/Config.in |    1 -
 4 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/Config.in b/Config.in
index 1479382..dab951d 100644
--- a/Config.in
+++ b/Config.in
@@ -182,7 +182,6 @@ config BR2_RECENT
 
 config BR2_CONFIG_CACHE
 	bool "Use a central configure cache file"
-	default n
 	help
 	  This determines if a central config cache is used by
 	  packages, reducing the configure time for packages as each
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 24ea915..4685014 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_OPENSSL
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
 	depends on BR2_PACKAGE_OPENSSL
-	default no
 	help
 	  Install the openssl binary to the target file system. This is a
 	  command line tool for doing various crypthographic stuff.
@@ -20,6 +19,5 @@ config BR2_PACKAGE_OPENSSL_BIN
 config BR2_PACKAGE_OPENSSL_ENGINES
 	bool "openssl additional engines"
 	depends on BR2_PACKAGE_OPENSSL
-	default no
 	help
 	  Install additional encryption engine libraries.
diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index d34355b..981b178 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -360,5 +360,3 @@ config	BR2_BOOTSOURCE
 	default y if BR2_BOOTSOURCE_FLASH
 	default y if BR2_BOOTSOURCE_SDCARD
 	default y if BR2_BOOTSOURCE_EEPROM
-	default n
-
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 4417149..422c462 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -101,7 +101,6 @@ config BR2_UCLIBC_PROGRAM_INVOCATION
 
 config BR2_UCLIBC_INSTALL_TEST_SUITE
 	bool "Compile and install uClibc tests"
-	default n
 	select BR2_PACKAGE_MAKE
 	help
 	  Enabling this option will compile and install the uClibc test suite.
-- 
1.6.1.154.g97e2f
