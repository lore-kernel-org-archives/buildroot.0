From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 21 Aug 2018 22:41:33 +0200
Subject: [Buildroot] [PATCH/next v2 2/3] package/perl-crypt-openssl-random:
 bump version to 0.15
In-Reply-To: <20180821204134.2819-1-bernd.kuhls@t-online.de>
References: <20180821204134.2819-1-bernd.kuhls@t-online.de>
Message-ID: <20180821204134.2819-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://metacpan.org/changes/distribution/Crypt-OpenSSL-Random

Added new build dependency to host-perl-crypt-openssl-guess and force
it to search for openssl in STAGING_DIR. Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: switched to host version of perl-crypt-openssl-guess (Thomas)

 .../perl-crypt-openssl-random.hash                     |  7 +++++--
 .../perl-crypt-openssl-random.mk                       | 10 ++++++++--
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
-- 
2.18.0
