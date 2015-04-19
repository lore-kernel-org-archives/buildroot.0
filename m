From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:45 +0200
Subject: [Buildroot] [git commit] package/perl-crypt-openssl-rsa: new package
Message-ID: <20150419114640.DD2E981940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0384795af3be2cdc3f96b016bd2fd5f80780e8d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/perl-crypt-openssl-rsa/Config.in           |   11 +++++++++++
 .../perl-crypt-openssl-rsa.hash                    |    3 +++
 .../perl-crypt-openssl-rsa.mk                      |   14 ++++++++++++++
 4 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 30585a6..8e04222 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -503,6 +503,7 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-crypt-openssl-random/Config.in"
+	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-sha1/Config.in"
diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
new file mode 100644
index 0000000..1fa1fd9
--- /dev/null
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
+	bool "perl-crypt-openssl-rsa"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
+	help
+	  RSA encoding and decoding, using the openSSL libraries
+
+	  https://metacpan.org/release/Crypt-OpenSSL-RSA
+
+comment "perl-crypt-openssl-rsa needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
new file mode 100644
index 0000000..6e060ce
--- /dev/null
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    86217a5036fc63779c30420b5fd84129 Crypt-OpenSSL-RSA-0.28.tar.gz
+sha256 5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be Crypt-OpenSSL-RSA-0.28.tar.gz
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
new file mode 100644
index 0000000..30d7303
--- /dev/null
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-crypt-openssl-rsa
+#
+################################################################################
+
+PERL_CRYPT_OPENSSL_RSA_VERSION = 0.28
+PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSION).tar.gz
+PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERLER
+PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = perl perl-crypt-openssl-random
+PERL_CRYPT_OPENSSL_RSA_LICENSE = Artistic or GPLv1+
+PERL_CRYPT_OPENSSL_RSA_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
