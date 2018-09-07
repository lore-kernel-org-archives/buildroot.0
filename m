From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:17:00 -0000
Subject: [Buildroot] [git commit] package/perl-crypt-openssl-rsa: bump
 version to 0.30
Message-ID: <20180907111556.9F08080FBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0bddd57fdde0e0e002087057ee6a6f68d40f640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://metacpan.org/changes/distribution/Crypt-OpenSSL-RSA

Added new build dependency to host-perl-crypt-openssl-guess and force
it to search for openssl in STAGING_DIR. Added license hash. Updated
_SITE according to scancpan.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash |  7 +++++--
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk   | 12 +++++++++---
 2 files changed, 14 insertions(+), 5 deletions(-)

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
index b853d9953e..790af760c7 100644
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
+	host-perl-crypt-openssl-guess \
+	perl-crypt-openssl-random
 PERL_CRYPT_OPENSSL_RSA_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RSA_LICENSE_FILES = LICENSE
 
+# Try as hard as possible to remedy to the brain-damage their build-system
+# suffers from: don't search for openssl, they pick the host-system one.
+PERL_CRYPT_OPENSSL_RSA_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
+
 $(eval $(perl-package))
