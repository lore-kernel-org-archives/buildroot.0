From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 20:15:58 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/perl-crypt-openssl-rsa: bump
 version to 0.30
In-Reply-To: <20180819181558.15338-1-bernd.kuhls@t-online.de>
References: <20180819181558.15338-1-bernd.kuhls@t-online.de>
Message-ID: <20180819181558.15338-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://metacpan.org/changes/distribution/Crypt-OpenSSL-RSA

Added new build dependency to perl-crypt-openssl-guess and force it to
search for openssl in STAGING_DIR. Added license hash. Updated _SITE
according to scancpan.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-crypt-openssl-rsa/Config.in             |  1 +
 .../perl-crypt-openssl-rsa.hash                      |  7 +++++--
 .../perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk | 12 +++++++++---
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
index 1fa1fd9881..4d33284f0a 100644
--- a/package/perl-crypt-openssl-rsa/Config.in
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	bool "perl-crypt-openssl-rsa"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_GUESS
 	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
 	help
 	  RSA encoding and decoding, using the openSSL libraries
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
index 6e060ce672..0d101d7bb8 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    86217a5036fc63779c30420b5fd84129 Crypt-OpenSSL-RSA-0.28.tar.gz
-sha256 5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be Crypt-OpenSSL-RSA-0.28.tar.gz
+md5    10bca2fc6d0ba1aa329f227424ae87d5 Crypt-OpenSSL-RSA-0.30.tar.gz
+sha256 23e13531397af102db4fd24bcf70137add7c85c23cca697c43aa71c2959a29ac Crypt-OpenSSL-RSA-0.30.tar.gz
+
+# computed by scancpan
+sha256 8a693ad3f52daeeb5ac5deceb1e1109c9c87095ed5ba6506d6d5c106e4066f5a LICENSE
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index b853d9953e..118ee66a5e 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -4,11 +4,17 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_RSA_VERSION = 0.28
+PERL_CRYPT_OPENSSL_RSA_VERSION = 0.30
 PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSION).tar.gz
-PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERLER
-PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = perl-crypt-openssl-random
+PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
+PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = \
+	perl-crypt-openssl-guess \
+	perl-crypt-openssl-random
 PERL_CRYPT_OPENSSL_RSA_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RSA_LICENSE_FILES = LICENSE
 
+# Try as hard as possible to remedy to the brain-damage their build-system
+# suffers from: don't search for openssl, they pick the host-system one.
+PERL_CRYPT_OPENSSL_RSA_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
+
 $(eval $(perl-package))
-- 
2.18.0
