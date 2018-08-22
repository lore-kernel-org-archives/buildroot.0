From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 15:53:10 +0200
Subject: [Buildroot] [git commit branch/next]
 package/perl-crypt-openssl-random: bump version to 0.15
Message-ID: <20180823093249.5A5278E2BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a061f62c4f7b6926685bb26508d07011ee4e9090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://metacpan.org/changes/distribution/Crypt-OpenSSL-Random

Added new build dependency to host-perl-crypt-openssl-guess and force
it to search for openssl in STAGING_DIR. Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../perl-crypt-openssl-random/perl-crypt-openssl-random.hash   |  7 +++++--
 package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk | 10 ++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
index caacdc9015..57677e3445 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    5d71337503e0356ce1ce1481504e5885 Crypt-OpenSSL-Random-0.11.tar.gz
-sha256 bb8c81c6a39b9b13a22d818ee9a746242f136f0fadceb6b9776ae615e7524c7a Crypt-OpenSSL-Random-0.11.tar.gz
+md5    bcde8d5a822c91376deda3c4f0c75fbe Crypt-OpenSSL-Random-0.15.tar.gz
+sha256 f0876faa1ba3111e39b86aa730c603211eff2905e460c72a57b61e8cf475cef4 Crypt-OpenSSL-Random-0.15.tar.gz
+
+# computed by scancpan
+sha256 fdaba2134145d3e252c5930180b2bcb13b5367ad5a8713d6868f014cd25c496f LICENSE
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
index de029e9af0..1e1d7c1112 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -4,11 +4,17 @@
 #
 ################################################################################
 
-PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.11
+PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.15
 PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
-PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = openssl
+PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = \
+	host-perl-crypt-openssl-guess \
+	openssl
 PERL_CRYPT_OPENSSL_RANDOM_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RANDOM_LICENSE_FILES = LICENSE
 
+# Try as hard as possible to remedy to the brain-damage their build-system
+# suffers from: don't search for openssl, they pick the host-system one.
+PERL_CRYPT_OPENSSL_RANDOM_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
+
 $(eval $(perl-package))
